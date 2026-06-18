"""
RL环境模块 - 芯片布局强化学习环境

提供标准的 Gym 风格接口，用于 PPO/DQN 等 RL 算法训练
"""

from __future__ import annotations

import configparser
import importlib.machinery
import math
import sys
import types
from decimal import Decimal
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any, Union
from dataclasses import dataclass
from copy import deepcopy

import numpy as np
import json
import random

try:
    from .chiplet_model import (
        Chiplet,
        LayoutProblem,
        has_overlap,
        get_adjacency_info,
        load_problem_from_json,
    )
    from .unit import (
        calculate_wirelength,
        calculate_manhattan_wirelength,
        calculate_iccad23_wirelength,
        calculate_layout_utilization,
        visualize_layout_with_bridges,
    )
except ImportError:
    from chiplet_model import (
        Chiplet,
        LayoutProblem,
        has_overlap,
        get_adjacency_info,
        load_problem_from_json,
    )
    from unit import (
        calculate_wirelength,
        calculate_manhattan_wirelength,
        calculate_iccad23_wirelength,
        calculate_layout_utilization,
        visualize_layout_with_bridges,
    )

TEMP_LIMIT = 80.0
RL_DIR = Path(__file__).resolve().parent
LOCAL_THERMAL_ROOT = RL_DIR


def _temperature_penalty(temp: float, temp_limit: float = TEMP_LIMIT) -> float:
    """RLPlanner reward_cal.py temperature penalty."""
    return math.pow(max(temp - temp_limit, 0.0), 1.3) / (1.0 + math.exp(temp_limit - temp))


def _install_fasttm_interp2d_compat(compute_temp_module: Any) -> None:
    """Patch fastTM for SciPy versions where interp2d was removed."""
    try:
        from scipy.interpolate import RegularGridInterpolator
    except Exception:
        return

    def interp2d_compat(x, y, z):
        x = np.asarray(x, dtype=float)
        y = np.asarray(y, dtype=float)
        z = np.asarray(z, dtype=float)
        interpolator = RegularGridInterpolator(
            (y, x),
            z,
            bounds_error=False,
            fill_value=None,
        )

        def evaluate(xq, yq):
            x_arr = np.atleast_1d(np.asarray(xq, dtype=float))
            y_arr = np.atleast_1d(np.asarray(yq, dtype=float))
            points = np.array([[yy, xx] for yy in y_arr for xx in x_arr])
            values = interpolator(points).reshape(len(y_arr), len(x_arr))
            if values.size == 1:
                return np.array([float(values.ravel()[0])])
            return values

        return evaluate

    compute_temp_module.interpolate.interp2d = interp2d_compat


def _ensure_trailing_slash(path: Path) -> str:
    return str(path) + "/"


def _weighted_manhattan_router(system: Any) -> Tuple[float, float]:
    """Runnable replacement for fastTM/routing.solve_Cplex."""
    total = 0.0
    wire_count = 0.0
    for i in range(system.chiplet_count):
        for j in range(system.chiplet_count):
            wires = float(system.connection_matrix[i][j])
            if i == j or wires <= 0:
                continue
            distance = abs(system.x[i] - system.x[j]) + abs(system.y[i] - system.y[j])
            total += wires * distance
            wire_count += wires
    avg = total / wire_count if wire_count > 0.0 else 0.0
    return total, avg


def _load_rlplanner_reward_cal(rlplanner_root: Path = LOCAL_THERMAL_ROOT) -> Optional[Any]:
    """Load local RL/reward_cal.py and patch local fastTM compatibility."""
    fasttm_dir = rlplanner_root / "fastTM"
    reward_cal_path = rlplanner_root / "reward_cal.py"
    if not reward_cal_path.exists() or not fasttm_dir.exists():
        return None

    # reward_cal.py imports compute_temp/routing as top-level modules.
    for path in (fasttm_dir, rlplanner_root):
        path_text = str(path)
        if path_text not in sys.path:
            sys.path.insert(0, path_text)

    if "pandas" not in sys.modules:
        pandas_stub = types.ModuleType("pandas")
        pandas_stub.__spec__ = importlib.machinery.ModuleSpec("pandas", loader=None)
        sys.modules["pandas"] = pandas_stub

    for module_name, expected_parent in (
        ("compute_temp", fasttm_dir),
        ("routing", fasttm_dir),
        ("reward_cal", rlplanner_root),
    ):
        loaded = sys.modules.get(module_name)
        loaded_file = Path(getattr(loaded, "__file__", "")).resolve() if loaded is not None and getattr(loaded, "__file__", None) else None
        if loaded_file is not None and expected_parent.resolve() not in loaded_file.parents:
            sys.modules.pop(module_name, None)

    try:
        import compute_temp
        import reward_cal
        import routing
    except Exception:
        return None

    routing.solve_Cplex = _weighted_manhattan_router
    _install_fasttm_interp2d_compat(compute_temp)
    return reward_cal


def _add_connection_from_json(problem: LayoutProblem, conn: Any) -> None:
    """Add one connection from either legacy list format or dict format."""
    if isinstance(conn, dict):
        chip_id1 = conn.get("node1") or conn.get("source") or conn.get("from")
        chip_id2 = conn.get("node2") or conn.get("target") or conn.get("to")
        if chip_id1 is None or chip_id2 is None:
            raise KeyError("Connection dict must contain node1/node2 fields")

        weight = float(conn.get("weight", 1.0))
        problem.add_connection(chip_id1, chip_id2, weight=weight)

        edge_data = problem.connection_graph[chip_id1][chip_id2]
        for key in ("wireCount", "EMIBType", "EMIB_length", "EMIB_max_width", "EMIB_bump_width"):
            if key in conn:
                edge_data[key] = conn[key]
        if hasattr(problem, "all_connections"):
            problem.all_connections.append(dict(conn))
        return

    if len(conn) == 2:
        problem.add_connection(conn[0], conn[1])
    elif len(conn) >= 3:
        problem.add_connection(conn[0], conn[1], float(conn[2]))
    else:
        raise ValueError("Each connection must contain at least two chiplet ids")


@dataclass
class ChipletState:
    """布局状态快照"""
    layout: Dict[str, Chiplet]  # 当前布局
    placed: List[str]  # 已放置的芯片ID列表
    remaining: List[str]  # 未放置的芯片ID列表
    current_step: int = 0  # 当前步骤（固定顺序时）
    
    def copy(self) -> ChipletState:
        """深拷贝状态"""
        return ChipletState(
            layout={k: deepcopy(v) for k, v in self.layout.items()},
            placed=self.placed.copy(),
            remaining=self.remaining.copy(),
            current_step=self.current_step
        )


class ChipletPlacementEnv:
    """
    芯片布局强化学习环境 - 连接约束驱动版本
    
    核心思想：
    1. 按照固定顺序（例如DFS）放置芯片
    2. 第一个芯片可以放在任何位置
    3. 后续芯片必须与已放置的邻接芯片在物理上相邻（边接触 + 重叠 >= min_overlap）
    4. 所有非邻接芯片间必须不重叠
    5. 只有满足约束的位置才是有效动作
    
    动作空间：(网格x, 网格y, 旋转)，但只有有效位置可以选择
    状态空间：当前布局编码 + 当前芯片的有效位置掩码
    """
    
    def __init__(
        self,
        problem: LayoutProblem,
        placement_order: Optional[List[str]] = None,  # 固定的放置顺序
        grid_resolution: Optional[Union[int, str]] = None,
        max_width: Optional[float] = None,
        max_height: Optional[float] = None,
        min_overlap: float = 1.0,
        # 奖励权重
        adjacency_reward: float = 100.0,  # 满足相邻约束的奖励
        placement_reward: float = 50.0,
        compact: float = 30.0,# 利用率奖励权重
        min_wirelength_reward_scale: float = 0.0,  # 最短线长奖励权重，负数越短越好
        extra_adjacency_reward: float = 10.0,
        # 终局奖励参数（用于混合即时+终局策略）
        terminal_util_reward_scale: float = 100.0,  # episode 结束时按最终利用率给的奖励权重
        terminal_wirelength_reward_scale: float = 0.0,  # episode 结束时线长惩罚权重
        terminal_rlplanner_cost_scale: float = 0.0,  # -(ICCAD23 avg_wirelength + reward_cal.py temp_penalty)
        temp_limit: float = TEMP_LIMIT,
        thermal_intp_size: Optional[float] = None,
        rlplanner_root: Optional[str] = None,
        rlplanner_table_dir: Optional[str] = None,
        max_auto_grid_resolution: int = 400,
        exact_action_slots: int = 50000,
        # lenbase 估计参数：用于终局线长奖励系数计算（lenbase / lentotal）
        lenbase_samples: int = 1000,
        lenbase_seed: Optional[int] = None,
    ):
        """
        初始化环境
        
        Args:
            problem: LayoutProblem 对象
            placement_order: 放置顺序（DFS生成）
            grid_resolution: 网格分辨率；None 或 "auto" 时按用例尺寸自动估计
            max_width/max_height: 边界框尺寸
            min_overlap: 相邻最小重叠长度
            adjacency_reward: 满足相邻约束的奖励
            placement_reward: 成功放置奖励
            compact: 利用率奖励权重
        """
        self.problem = problem
        self.min_overlap = min_overlap
        
        # 奖励权重
        self.adjacency_reward = adjacency_reward
        self.placement_reward = placement_reward
        self.compact = compact
        self.min_wirelength_reward_scale = min_wirelength_reward_scale
        self.extra_adjacency_reward = extra_adjacency_reward
        self.terminal_util_reward_scale = terminal_util_reward_scale
        self.terminal_wirelength_reward_scale = terminal_wirelength_reward_scale
        self.terminal_rlplanner_cost_scale = terminal_rlplanner_cost_scale
        self.temp_limit = temp_limit
        self.rlplanner_root = Path(rlplanner_root).resolve() if rlplanner_root is not None else LOCAL_THERMAL_ROOT
        self.rlplanner_table_dir = Path(rlplanner_table_dir).resolve() if rlplanner_table_dir is not None else None
        self.max_auto_grid_resolution = int(max_auto_grid_resolution)
        self.exact_action_slots = int(exact_action_slots)
        self._action_position_overrides: Dict[int, Tuple[float, float, int]] = {}
        self._last_thermal_layout_info: Dict[str, Any] = {}
        self.grid_auto_info: Dict[str, Any] = {}
        # lenbase 估计配置
        self.lenbase_samples = lenbase_samples
        self.lenbase_seed = lenbase_seed
        self.lenbase: float = 0.0
        
        # 初始化芯片
        self.chiplets: Dict[str, Chiplet] = {
            chip_id: deepcopy(chiplet) 
            for chip_id, chiplet in problem.chiplets.items()
        }
        
        # 放置顺序
        if placement_order is None:
            self.placement_order = creat_order_dfs(problem)
        else:
            for chip_id in placement_order:
                if chip_id not in self.chiplets:
                    raise ValueError(f"芯片 {chip_id} 不存在")
            self.placement_order = placement_order
        
        self.num_chiplets = len(self.placement_order)
        
        # 计算边界框
        if max_width is None or max_height is None:
            widths = [c.width for c in self.chiplets.values()]
            heights = [c.height for c in self.chiplets.values()]
            total_area = sum(w * h for w, h in zip(widths, heights))
            
            if max_width is None:
                max_width = int(np.sqrt(total_area * 2))
            if max_height is None:
                max_height = int(np.sqrt(total_area * 2))
        
        self.max_width = float(max_width)
        self.max_height = float(max_height)
        inferred_intp_size = self._infer_rlplanner_intp_size()
        self.thermal_intp_size = (
            float(thermal_intp_size)
            if thermal_intp_size is not None
            else float(inferred_intp_size if inferred_intp_size is not None else self.max_width)
        )
        self.INTP_SIZE = self.thermal_intp_size
        self.vec_system = [self._make_rlplanner_system()]
        self.vec_path = [_ensure_trailing_slash(self._thermal_table_dir()) if self._thermal_table_dir() is not None else ""]
        
        # 动作空间
        grid_resolution = self._resolve_grid_resolution(grid_resolution)
        self.grid_resolution = grid_resolution
        self.grid_size_x = grid_resolution
        self.grid_size_y = grid_resolution
        self.num_rotations = 2
        
        self.base_action_dim = (
            self.grid_size_x * 
            self.grid_size_y * 
            self.num_rotations
        )
        self.action_dim = self.base_action_dim + max(0, self.exact_action_slots)
        
        # 观察维度（需要与get_observation()一致）
        # 观察包含：已放置数(1) + 所有芯片的bbox(4*n) + 当前利用率(1) + 当前线长(1) + 有效动作数(1) + 当前步骤(1)
        # 为简化起见，使用固定维度
        self.observation_dim = 10
        
        # 网格步长
        self.step_x = self.max_width / self.grid_resolution
        self.step_y = self.max_height / self.grid_resolution
        
        # 初始化状态
        self.state: ChipletState = self._init_state()

        # 估计 lenbase（平均合法布局线长），可能较耗时但只在环境初始化时运行一次
        try:
            self.lenbase = self._estimate_lenbase(self.lenbase_samples, self.lenbase_seed)
        except Exception:
            # 任何异常都退回为1.0，避免后续除零
            self.lenbase = 1.0
    
    def _init_state(self) -> ChipletState:
        """初始化状态"""
        return ChipletState(
            layout={},
            placed=[],
            remaining=self.placement_order.copy(),
            current_step=0
        )

    def _resolve_grid_resolution(self, grid_resolution: Optional[Union[int, str]]) -> int:
        """Infer a practical grid resolution when not explicitly configured."""
        if grid_resolution is not None and str(grid_resolution).lower() != "auto":
            resolved = int(grid_resolution)
            if resolved <= 0:
                raise ValueError("grid_resolution must be positive")
            geometry_step = self._infer_geometry_grid_step()
            self.geometry_grid_step = geometry_step
            self.grid_auto_info = {
                "mode": "manual",
                "grid_resolution": resolved,
                "step": max(self.max_width, self.max_height) / resolved,
                "geometry_step": geometry_step,
            }
            return resolved

        step = self._infer_geometry_grid_step()
        self.geometry_grid_step = step
        exact_resolution = int(round(max(self.max_width, self.max_height) / step))
        if exact_resolution <= self.max_auto_grid_resolution:
            self.grid_auto_info = {
                "mode": "geometry_exact",
                "geometry_step": step,
                "step": step,
                "exact_resolution": exact_resolution,
                "grid_resolution": exact_resolution,
            }
            return exact_resolution

        # Exact geometry can be too expensive for very fine decimal benchmarks.
        # Fall back to the configured cap and expose the mismatch explicitly.
        capped = max(1, self.max_auto_grid_resolution)
        self.grid_auto_info = {
            "mode": "capped",
            "geometry_step": step,
            "exact_resolution": exact_resolution,
            "step": max(self.max_width, self.max_height) / capped,
            "grid_resolution": capped,
            "warning": "exact geometry grid exceeds max_auto_grid_resolution",
        }
        return capped

    def _infer_geometry_grid_step(self) -> float:
        """Return the decimal GCD of chip sizes and canvas size."""
        values: List[float] = [self.max_width, self.max_height]
        for chip in self.chiplets.values():
            values.extend([float(chip.width), float(chip.height)])
        if self.min_overlap > 0.0:
            values.append(float(self.min_overlap))

        decimals = [Decimal(str(value)).normalize() for value in values if value and value > 0.0]
        if not decimals:
            return 1.0

        places = max(max(0, -decimal.as_tuple().exponent) for decimal in decimals)
        scale = 10 ** places
        ints = [int(decimal * scale) for decimal in decimals]

        divisor = 0
        for value in ints:
            divisor = math.gcd(divisor, abs(value))
        if divisor <= 0:
            return 1.0
        return float(Decimal(divisor) / Decimal(scale))

    def _snap_to_geometry_grid(self, value: float, upper_bound: float) -> List[float]:
        """Return nearby coordinates aligned to the exact benchmark geometry grid."""
        step = float(getattr(self, "geometry_grid_step", 0.0) or 0.0)
        value = float(value)
        upper_bound = float(upper_bound)
        if step <= 0.0:
            return [min(max(value, 0.0), upper_bound)]

        scaled = value / step
        candidates = {math.floor(scaled), round(scaled), math.ceil(scaled)}
        snapped: List[float] = []
        for idx in candidates:
            coord = float(Decimal(int(idx)) * Decimal(str(step)))
            if -1e-9 <= coord <= upper_bound + 1e-9:
                snapped.append(min(max(coord, 0.0), upper_bound))
        return snapped

    def _first_chip_positions(self, chip_id: str) -> List[Tuple[float, float, int]]:
        """Place the first chip on exact geometry-grid coordinates near canvas center."""
        chiplet_template = self.chiplets[chip_id]
        valid_positions: List[Tuple[float, float, int]] = []
        seen = set()

        for rotation in range(self.num_rotations):
            if rotation == 0:
                w = chiplet_template.width
                h = chiplet_template.height
            else:
                w = chiplet_template.height
                h = chiplet_template.width

            upper_x = self.max_width - w
            upper_y = self.max_height - h
            if upper_x < -1e-9 or upper_y < -1e-9:
                continue

            center_x = upper_x / 2.0
            center_y = upper_y / 2.0
            x_candidates = self._snap_to_geometry_grid(center_x, upper_x)
            y_candidates = self._snap_to_geometry_grid(center_y, upper_y)

            for x in x_candidates:
                for y in y_candidates:
                    key = (self._coord_key(x), self._coord_key(y), rotation)
                    if key not in seen:
                        seen.add(key)
                        valid_positions.append((x, y, rotation))

        return valid_positions
    
    def reset(self) -> np.ndarray:
        """重置环境"""
        self.state = self._init_state()
        return self.get_observation()
    
    def _get_current_chip_id(self) -> Optional[str]:
        """获取当前要放置的芯片ID"""
        if self.state.current_step < len(self.placement_order):
            return self.placement_order[self.state.current_step]
        return None
    
    def _get_adjacent_neighbors(self, chip_id: str) -> List[str]:
        """
        获取芯片的邻接邻域（在连接图中相邻且已放置的芯片）
        
        Args:
            chip_id: 芯片ID
            
        Returns:
            已放置的邻接芯片ID列表
        """
        neighbors = self.problem.get_neighbors(chip_id)
        return [n for n in neighbors if n in self.state.layout]
    
    def _is_valid_placement(
        self,
        new_chiplet: Chiplet,
        chip_id: str
    ) -> Tuple[bool, str]:
        """
        检查芯片放置是否合法
        
        Rules:
        1. 不能超出边界
        2. 不能与任何已放置芯片重叠（包括邻接和非邻接芯片）
        3. 如果有邻接邻域，必须与至少一个邻接邻域相邻（边接触+充分重叠）
        
        Args:
            new_chiplet: 新芯片对象
            chip_id: 芯片ID
            
        Returns:
            (is_valid, reason)
        """
        # 1. 检查边界
        if new_chiplet.x < 0 or new_chiplet.y < 0 or \
           new_chiplet.x + new_chiplet.width > self.max_width or \
           new_chiplet.y + new_chiplet.height > self.max_height:
            return False, "out_of_bounds"
        
        # 2. 检查与已放置芯片的关系
        adjacent_neighbors = self._get_adjacent_neighbors(chip_id)
        
        for placed_chip_id, placed_chip in self.state.layout.items():
            # 首先检查是否有重叠（所有芯片都不能重叠，无论是否邻接）
            if has_overlap(new_chiplet, placed_chip):
                if placed_chip_id in adjacent_neighbors:
                    return False, f"overlap_with_neighbor_{placed_chip_id}"
                else:
                    return False, f"overlap_with_non_neighbor_{placed_chip_id}"
            
            # 对于邻接芯片，必须满足相邻约束
            if placed_chip_id in adjacent_neighbors:
                is_adjacent, overlap_len, direction = get_adjacency_info(new_chiplet, placed_chip)
                if not (is_adjacent and overlap_len >= self.min_overlap):
                    # 关键修改：与任何一个已放置的邻居不相邻都不行
                    return False, f"not_adjacent_to_neighbor_{placed_chip_id}"
        
        return True, "ok"
    
    def _get_valid_positions(self, chip_id: str) -> List[Tuple[float, float, int]]:
        """
        获取芯片的有效放置位置列表
        
        采用数学方法：
        - 第一个芯片：中心区域采样
        - 后续芯片：直接计算与已放置芯片相邻的位置（四周）
        
        Args:
            chip_id: 芯片ID
            
        Returns:
            有效位置列表 [(x_idx, y_idx, rotation), ...]
        """
        valid_positions = []
        chiplet_template = self.chiplets[chip_id]
        adjacent_neighbors = self._get_adjacent_neighbors(chip_id)
        
        # 第一个芯片：在中心区域采样
        if not self.state.layout:
            return self._first_chip_positions(chip_id)
        
        # 后续芯片：计算与邻接芯片相邻的位置
        # 关键逻辑：对每个邻接邻域分别计算候选位置，然后求交集
        
        all_neighbor_candidates = []  # 每个邻接邻域的候选位置列表
        
        for neighbor_id in adjacent_neighbors:
            placed_chip = self.state.layout[neighbor_id]
            neighbor_candidates = {}  # 当前邻域的候选位置 {(x_key, y_key): {"coords": (x, y), "rotations": set}}
            
            # 对每种旋转计算可能的边接触位置
            for rotation in range(self.num_rotations):
                if rotation == 0:
                    w = chiplet_template.width
                    h = chiplet_template.height
                else:
                    w = chiplet_template.height
                    h = chiplet_template.width
                
                # 计算理想的边接触位置（连续坐标）
                x_left_ideal = placed_chip.x - w  # 左边
                x_right_ideal = placed_chip.x + placed_chip.width  # 右边
                y_down_ideal = placed_chip.y - h  # 下边
                y_up_ideal = placed_chip.y + placed_chip.height  # 上边
                
                # 贴边坐标必须使用连续几何的精确值；不能被粗网格 floor/ceil 破坏。
                candidate_x_positions = [x_left_ideal, x_right_ideal]
                candidate_y_positions = [y_down_ideal, y_up_ideal]
                
                # 水平方向：与Y重叠区域组合
                y_overlap_positions = self._get_overlapping_y_positions(placed_chip, h)
                for x in candidate_x_positions:
                    if 0.0 <= x <= self.max_width - w:
                        for y in y_overlap_positions:
                            # 验证是否真的满足邻接约束
                            temp_chip = Chiplet(chip_id, w, h)
                            temp_chip.x = x
                            temp_chip.y = y
                            
                            if not has_overlap(temp_chip, placed_chip):
                                is_adj, overlap_len, _ = get_adjacency_info(temp_chip, placed_chip)
                                if is_adj and overlap_len >= self.min_overlap:
                                    key = self._position_key(x, y)
                                    if key not in neighbor_candidates:
                                        neighbor_candidates[key] = {"coords": (x, y), "rotations": set()}
                                    neighbor_candidates[key]["rotations"].add(rotation)
                
                # 竖直方向：与X重叠区域组合
                x_overlap_positions = self._get_overlapping_x_positions(placed_chip, w)
                for y in candidate_y_positions:
                    if 0.0 <= y <= self.max_height - h:
                        for x in x_overlap_positions:
                            temp_chip = Chiplet(chip_id, w, h)
                            temp_chip.x = x
                            temp_chip.y = y
                            
                            if not has_overlap(temp_chip, placed_chip):
                                is_adj, overlap_len, _ = get_adjacency_info(temp_chip, placed_chip)
                                if is_adj and overlap_len >= self.min_overlap:
                                    key = self._position_key(x, y)
                                    if key not in neighbor_candidates:
                                        neighbor_candidates[key] = {"coords": (x, y), "rotations": set()}
                                    neighbor_candidates[key]["rotations"].add(rotation)
            
            all_neighbor_candidates.append(neighbor_candidates)
        
        # 求交集：只保留在所有邻接邻域中都有效的位置
        if not all_neighbor_candidates:
            candidate_positions = {}
        elif len(all_neighbor_candidates) == 1:
            # 只有一个邻接邻域，直接使用
            candidate_positions = all_neighbor_candidates[0]
        else:
            # 多个邻接邻域，求交集
            candidate_positions = {
                key: {"coords": value["coords"], "rotations": set(value["rotations"])}
                for key, value in all_neighbor_candidates[0].items()
            }
            
            for neighbor_candidates in all_neighbor_candidates[1:]:
                new_candidates = {}
                for key, value in candidate_positions.items():
                    if key in neighbor_candidates:
                        # 该位置在两个邻域中都存在，取旋转的交集
                        rotation_intersection = value["rotations"] & neighbor_candidates[key]["rotations"]
                        if rotation_intersection:
                            new_candidates[key] = {
                                "coords": value["coords"],
                                "rotations": rotation_intersection,
                            }
                candidate_positions = new_candidates
        
        # 验证候选位置的合法性（检查重叠和邻接）
        for value in candidate_positions.values():
            x, y = value["coords"]
            for rotation in value["rotations"]:
                if rotation == 0:
                    w = chiplet_template.width
                    h = chiplet_template.height
                else:
                    w = chiplet_template.height
                    h = chiplet_template.width
                
                temp_chip = Chiplet(chip_id, w, h)
                temp_chip.x = x
                temp_chip.y = y
                
                # 检查是否合法
                is_valid, reason = self._is_valid_placement(temp_chip, chip_id)
                if is_valid:
                    valid_positions.append((x, y, rotation))
        
        return valid_positions
    
    def _coord_key(self, value: float) -> int:
        return int(round(float(value) * 1_000_000))

    def _position_key(self, x: float, y: float) -> Tuple[int, int]:
        return (self._coord_key(x), self._coord_key(y))

    def _dedupe_positions(self, values: List[float], upper_bound: float) -> List[float]:
        deduped: Dict[int, float] = {}
        for value in values:
            for snapped_value in self._snap_to_geometry_grid(float(value), upper_bound):
                if -1e-9 <= snapped_value <= upper_bound + 1e-9:
                    snapped_value = min(max(snapped_value, 0.0), upper_bound)
                    deduped.setdefault(self._coord_key(snapped_value), snapped_value)
        return list(deduped.values())

    def _get_overlapping_x_positions(self, placed_chip: Chiplet, new_width: float) -> List[float]:
        """
        计算与placed_chip在X方向有重叠的候选坐标。

        返回真实坐标，不强制落在粗网格上。除网格采样外，还加入边缘对齐坐标，
        避免 18.2、11.87 这类尺寸在 0.25 网格上被截断后无法形成多邻接布局。
        """
        positions: List[float] = []
        upper = self.max_width - new_width

        x_min = placed_chip.x - new_width
        x_max = placed_chip.x + placed_chip.width
        for x_idx in range(int(np.floor(x_min / self.step_x)), int(np.ceil(x_max / self.step_x)) + 1):
            x = x_idx * self.step_x
            overlap = min(x + new_width, placed_chip.x + placed_chip.width) - max(x, placed_chip.x)
            if overlap >= self.min_overlap:
                positions.append(x)

        exact_candidates = [
            placed_chip.x,
            placed_chip.x + placed_chip.width - new_width,
            placed_chip.x - new_width + self.min_overlap,
            placed_chip.x + placed_chip.width - self.min_overlap,
        ]
        for x in exact_candidates:
            overlap = min(x + new_width, placed_chip.x + placed_chip.width) - max(x, placed_chip.x)
            if overlap >= self.min_overlap:
                positions.append(x)

        return self._dedupe_positions(positions, upper)

    def _get_overlapping_y_positions(self, placed_chip: Chiplet, new_height: float) -> List[float]:
        """计算与placed_chip在Y方向有重叠的真实坐标候选。"""
        positions: List[float] = []
        upper = self.max_height - new_height

        y_min = placed_chip.y - new_height
        y_max = placed_chip.y + placed_chip.height
        for y_idx in range(int(np.floor(y_min / self.step_y)), int(np.ceil(y_max / self.step_y)) + 1):
            y = y_idx * self.step_y
            overlap = min(y + new_height, placed_chip.y + placed_chip.height) - max(y, placed_chip.y)
            if overlap >= self.min_overlap:
                positions.append(y)

        exact_candidates = [
            placed_chip.y,
            placed_chip.y + placed_chip.height - new_height,
            placed_chip.y - new_height + self.min_overlap,
            placed_chip.y + placed_chip.height - self.min_overlap,
        ]
        for y in exact_candidates:
            overlap = min(y + new_height, placed_chip.y + placed_chip.height) - max(y, placed_chip.y)
            if overlap >= self.min_overlap:
                positions.append(y)

        return self._dedupe_positions(positions, upper)

    def _get_overlapping_x_indices(self, placed_chip: Chiplet, new_width: float) -> List[int]:
        """
        计算与placed_chip在X方向有重叠的网格索引范围
        
        placed_chip: [placed_chip.x, placed_chip.x + placed_chip.width]
        new_chip: [x, x + new_width]
        需要重叠 >= min_overlap
        
        新芯片在左边（接触）时：x + new_width ≈ placed_chip.x
                    x ≈ placed_chip.x - new_width
        新芯片在右边（接触）时：x ≈ placed_chip.x + placed_chip.width
        
        要有重叠，需要：overlap = min(x+w, a_x+a_w) - max(x, a_x) >= min_overlap
        """
        indices = []
        
        # 范围：保证至少有min_overlap的重叠
        # 最左位置：x + new_width = a_x (刚好接触左边)
        x_min_left = placed_chip.x - new_width
        # 最右位置：x = a_x + a_w (刚好接触右边)
        x_max_right = placed_chip.x + placed_chip.width
        
        # 但要有充分重叠，范围应该缩小
        # 左边：x应该在 [a_x - new_width, a_x - new_width + min_overlap] (才能与A左边对齐)
        # 右边：x应该在 [a_x + a_w - min_overlap, a_x + a_w] (才能与A右边对齐)
        
        # 简化：计算所有能与A产生>=min_overlap的x范围
        # max(x, a_x) < min(x+w, a_x+a_w) && min < max
        # 即：x < a_x+a_w && x+w > a_x
        # 即：a_x - w < x < a_x + a_w
        x_min = placed_chip.x - new_width
        x_max = placed_chip.x + placed_chip.width
        
        for x_idx in range(int(np.floor(x_min / self.step_x)), int(np.ceil(x_max / self.step_x))):
            if 0 <= x_idx < self.grid_size_x:
                # 验证确实有重叠
                x = x_idx * self.step_x
                overlap = min(x + new_width, placed_chip.x + placed_chip.width) - max(x, placed_chip.x)
                if overlap >= self.min_overlap:
                    if x_idx not in indices:
                        indices.append(x_idx)
        
        return indices
    
    def _get_overlapping_y_indices(self, placed_chip: Chiplet, new_height: float) -> List[int]:
        """
        计算与placed_chip在Y方向有重叠的网格索引范围
        """
        indices = []
        
        y_min = placed_chip.y - new_height
        y_max = placed_chip.y + placed_chip.height
        
        for y_idx in range(int(np.floor(y_min / self.step_y)), int(np.ceil(y_max / self.step_y))):
            if 0 <= y_idx < self.grid_size_y:
                # 验证确实有重叠
                y = y_idx * self.step_y
                overlap = min(y + new_height, placed_chip.y + placed_chip.height) - max(y, placed_chip.y)
                if overlap >= self.min_overlap:
                    if y_idx not in indices:
                        indices.append(y_idx)
        
        return indices
    
    def get_observation(self) -> np.ndarray:
        """
        获取观察向量
        
        包含：
        1. 已放置/剩余芯片数
        2. 边界框信息
        3. 面积利用率
        4. 线长
        5. 相邻约束满足情况
        6. 当前可用位置数（作为难度指标）
        """
        features = []
        
        # 1. 基本统计
        features.append(len(self.state.placed))
        features.append(len(self.state.remaining))
        
        # 2. 边界框
        if self.state.layout:
            chiplets = list(self.state.layout.values())
            x_coords = [c.x for c in chiplets] + [c.x + c.width for c in chiplets]
            y_coords = [c.y for c in chiplets] + [c.y + c.height for c in chiplets]
            
            bbox_w = max(x_coords) - min(x_coords)
            bbox_h = max(y_coords) - min(y_coords)
            features.extend([bbox_w, bbox_h, bbox_w * bbox_h])
        else:
            features.extend([0.0, 0.0, 0.0])
        
        # 3. 面积利用率
        if self.state.layout:
            util = sum(c.width * c.height for c in self.state.layout.values())
            features.append(util / (self.max_width * self.max_height))
        else:
            features.append(0.0)
        
        # 4. 线长
        if self.state.layout and len(self.state.layout) > 1:
            wirelength = calculate_manhattan_wirelength(self.state.layout, self.problem)
            features.append(wirelength)
        else:
            features.append(0.0)
        
        # 5. 相邻约束
        satisfied_count = 0
        for chip_id1, chip_id2 in self.problem.connection_graph.edges():
            if chip_id1 in self.state.layout and chip_id2 in self.state.layout:
                is_adj, overlap, _ = get_adjacency_info(
                    self.state.layout[chip_id1],
                    self.state.layout[chip_id2]
                )
                if is_adj and overlap >= self.min_overlap:
                    satisfied_count += 1
        
        features.append(satisfied_count)
        features.append(len(self.problem.connection_graph.edges()))
        
        # 6. 当前可用位置数
        current_chip = self._get_current_chip_id()
        if current_chip:
            valid_pos_count = len(self._get_valid_positions(current_chip))
            features.append(valid_pos_count)
        else:
            features.append(0.0)
        
        return np.array(features, dtype=np.float32)


    def _estimate_lenbase(self, num_samples: int = 1000, seed: Optional[int] = None) -> float:
        """
        通过随机生成若干合法布局（不改变外部状态）来估计基准线长 lenbase。

        方法：对每个样本从空布局开始，按放置顺序对每个芯片随机选择一个合法位置。
        若某个样本在中途无合法位置则丢弃该样本。返回所有成功样本的平均总线长。
        """
        if num_samples <= 0:
            return 1.0

        if seed is not None:
            random.seed(seed)

        original_state = self.state.copy()
        lengths = []

        try:
            for _ in range(num_samples):
                # 初始化试验状态为空布局
                self.state = self._init_state()
                failed = False

                while self.state.current_step < self.num_chiplets:
                    cur = self._get_current_chip_id()
                    valid_positions = self._get_valid_positions(cur)
                    if not valid_positions:
                        failed = True
                        break

                    x, y, rotation = random.choice(valid_positions)
                    tpl = self.chiplets[cur]
                    chip = Chiplet(cur, tpl.width, tpl.height)
                    if rotation == 1:
                        chip.width, chip.height = chip.height, chip.width
                    chip.x = x
                    chip.y = y

                    is_valid, _ = self._is_valid_placement(chip, cur)
                    if not is_valid:
                        failed = True
                        break

                    self.state.layout[cur] = chip
                    self.state.placed.append(cur)
                    self.state.remaining.remove(cur)
                    self.state.current_step += 1

                if not failed:
                    # 计算该布局的总线长（欧氏中心距离，和主流程一致）
                    total_dist = 0.0
                    if len(self.state.layout) > 1:
                        for chip_id1, chip_id2 in self.problem.connection_graph.edges():
                            c1 = self.state.layout.get(chip_id1)
                            c2 = self.state.layout.get(chip_id2)
                            if c1 is None or c2 is None:
                                continue
                            cx1 = c1.x + c1.width / 2
                            cy1 = c1.y + c1.height / 2
                            cx2 = c2.x + c2.width / 2
                            cy2 = c2.y + c2.height / 2
                            dist = ((cx1 - cx2) ** 2 + (cy1 - cy2) ** 2) ** 0.5
                            total_dist += dist

                    lengths.append(total_dist)

            if lengths:
                return float(sum(lengths) / len(lengths))
            else:
                return 1.0

        finally:
            # 恢复原始状态
            self.state = original_state.copy()

    def _iter_connection_records(self) -> List[Dict[str, Any]]:
        """Return connection records with node ids and wire counts."""
        records = []
        for conn in getattr(self.problem, "all_connections", []) or []:
            if isinstance(conn, dict):
                node1 = conn.get("node1") or conn.get("source") or conn.get("from")
                node2 = conn.get("node2") or conn.get("target") or conn.get("to")
                if node1 is not None and node2 is not None:
                    records.append(
                        {
                            "node1": node1,
                            "node2": node2,
                            "wireCount": float(conn.get("wireCount", conn.get("weight", 1.0))),
                        }
                    )

        if records:
            return records

        for node1, node2, edge_data in self.problem.connection_graph.edges(data=True):
            records.append(
                {
                    "node1": node1,
                    "node2": node2,
                    "wireCount": float(edge_data.get("wireCount", edge_data.get("weight", 1.0))),
                }
            )
        return records

    def _calculate_avg_wirelength(self, layout: Dict[str, Chiplet]) -> Tuple[float, float, float, float, int]:
        """ICCAD23 wirelength split into EMIB and normal parts."""
        total_wirelength, emib_wirelength, normal_wirelength, total_wire_count = (
            calculate_iccad23_wirelength(layout, self.problem)
        )
        avg_wirelength = total_wirelength / total_wire_count if total_wire_count > 0 else 0.0
        return total_wirelength, avg_wirelength, emib_wirelength, normal_wirelength, total_wire_count

    def _chiplet_order(self) -> List[str]:
        return list(getattr(self.problem, "chiplet_order", list(self.problem.chiplets.keys())))

    def _infer_rlplanner_intp_size(self) -> Optional[float]:
        source_json_path = getattr(self.problem, "source_json_path", None)
        if not source_json_path:
            return None
        cfg_path = self.rlplanner_root / "fastTM" / "configs" / f"benchmark_{Path(source_json_path).stem}.cfg"
        if not cfg_path.exists():
            return None
        parser = configparser.ConfigParser()
        try:
            if not parser.read(cfg_path):
                return None
            return parser.getfloat("interposer", "intp_size")
        except Exception:
            return None

    def _connection_matrix(self, chiplet_order: List[str]) -> List[List[int]]:
        name_to_idx = {name: idx for idx, name in enumerate(chiplet_order)}
        matrix = [[0 for _ in chiplet_order] for _ in chiplet_order]

        records = getattr(self.problem, "all_connections", []) or []
        if records:
            for conn in records:
                if not isinstance(conn, dict):
                    continue
                node1 = conn.get("node1") or conn.get("source") or conn.get("from")
                node2 = conn.get("node2") or conn.get("target") or conn.get("to")
                if node1 not in name_to_idx or node2 not in name_to_idx:
                    continue
                wires = int(conn.get("wireCount", conn.get("weight", 1)))
                i, j = name_to_idx[node1], name_to_idx[node2]
                matrix[i][j] += wires
                matrix[j][i] += wires
            return matrix

        for node1, node2, edge_data in self.problem.connection_graph.edges(data=True):
            if node1 not in name_to_idx or node2 not in name_to_idx:
                continue
            wires = int(edge_data.get("wireCount", edge_data.get("weight", 1)))
            i, j = name_to_idx[node1], name_to_idx[node2]
            matrix[i][j] += wires
            matrix[j][i] += wires
        return matrix

    def _make_rlplanner_system(self) -> Any:
        chiplet_order = self._chiplet_order()
        widths = [float(self.problem.chiplets[chip_id].width) for chip_id in chiplet_order]
        heights = [float(self.problem.chiplets[chip_id].height) for chip_id in chiplet_order]
        powers = [float(getattr(self.problem.chiplets[chip_id], "power", 0.0) or 0.0) for chip_id in chiplet_order]
        return types.SimpleNamespace(
            chiplet_count=len(chiplet_order),
            chiplet_names=chiplet_order,
            width=widths,
            height=heights,
            power=powers,
            x=[0.0 for _ in chiplet_order],
            y=[0.0 for _ in chiplet_order],
            rotation=[0 for _ in chiplet_order],
            connection_matrix=self._connection_matrix(chiplet_order),
        )

    def _thermal_centered_layout(self, layout: Dict[str, Chiplet]) -> Tuple[Dict[str, Tuple[float, float]], Dict[str, float]]:
        """Map RL lower-left canvas coordinates to local fastTM interposer center coordinates."""
        chiplets = list(layout.values())
        if not chiplets:
            return {}, {}

        x_min = min(chip.x for chip in chiplets)
        y_min = min(chip.y for chip in chiplets)
        x_max = max(chip.x + chip.width for chip in chiplets)
        y_max = max(chip.y + chip.height for chip in chiplets)
        bbox_width = x_max - x_min
        bbox_height = y_max - y_min

        offset_x = (self.thermal_intp_size - bbox_width) / 2.0 - x_min
        offset_y = (self.thermal_intp_size - bbox_height) / 2.0 - y_min

        centers: Dict[str, Tuple[float, float]] = {}
        for chip_id, chip in layout.items():
            centers[chip_id] = (
                chip.x + offset_x + chip.width / 2.0,
                chip.y + offset_y + chip.height / 2.0,
            )

        return centers, {
            "thermal_layout_offset_x": float(offset_x),
            "thermal_layout_offset_y": float(offset_y),
            "thermal_bbox_width": float(bbox_width),
            "thermal_bbox_height": float(bbox_height),
            "thermal_bbox_min_x": float(x_min + offset_x),
            "thermal_bbox_min_y": float(y_min + offset_y),
            "thermal_bbox_max_x": float(x_max + offset_x),
            "thermal_bbox_max_y": float(y_max + offset_y),
            "thermal_intp_size": float(self.thermal_intp_size),
            "thermal_layout_fits_interposer": bool(
                bbox_width <= self.thermal_intp_size + 1e-9
                and bbox_height <= self.thermal_intp_size + 1e-9
            ),
        }

    def _sync_rlplanner_system(self, layout: Dict[str, Chiplet]) -> None:
        chiplet_order = self._chiplet_order()
        system = self.vec_system[0]
        thermal_centers, thermal_info = self._thermal_centered_layout(layout)
        self._last_thermal_layout_info = thermal_info
        system.connection_matrix = self._connection_matrix(chiplet_order)
        system.chiplet_count = len(chiplet_order)
        system.chiplet_names = chiplet_order
        system.width = []
        system.height = []
        system.power = []
        system.x = []
        system.y = []
        system.rotation = []

        for chip_id in chiplet_order:
            chip = layout[chip_id]
            system.width.append(float(chip.width))
            system.height.append(float(chip.height))
            system.power.append(float(getattr(self.problem.chiplets[chip_id], "power", getattr(chip, "power", 0.0)) or 0.0))
            # reward_cal.py expects center coordinates on the fastTM interposer.
            # RL layout stores lower-left coordinates on a larger search canvas,
            # so only translate the final bbox to the interposer center.
            center_x, center_y = thermal_centers[chip_id]
            system.x.append(float(center_x))
            system.y.append(float(center_y))
            system.rotation.append(int(getattr(chip, "rotation", 0) or 0))

    def _thermal_table_dir(self) -> Optional[Path]:
        if self.rlplanner_table_dir is not None:
            return self.rlplanner_table_dir
        source_json_path = getattr(self.problem, "source_json_path", None)
        if not source_json_path:
            return None
        case_name = Path(source_json_path).stem
        return self.rlplanner_root / "fastTM" / "outputs" / f"benchmark_{case_name}"

    def _has_rlplanner_thermal_tables(self) -> bool:
        table_dir = self._thermal_table_dir()
        if table_dir is None or not table_dir.exists():
            return False
        chiplet_count = len(self._chiplet_order())
        for idx in range(chiplet_count):
            if not (table_dir / f"Chiplet_{idx}.rself").exists():
                return False
            if not (table_dir / f"Chiplet_{idx}.rmutu").exists():
                return False
        return True

    def get_wirelength(self, env_idx: int):
        reward_cal = _load_rlplanner_reward_cal(self.rlplanner_root)
        if reward_cal is None:
            return _weighted_manhattan_router(self.vec_system[env_idx])
        return reward_cal.get_wirelength(self, env_idx)

    def get_temp(self, env_idx: int):
        reward_cal = _load_rlplanner_reward_cal(self.rlplanner_root)
        if reward_cal is None:
            return float("nan")
        return reward_cal.get_temp(self, env_idx)

    def _calculate_rlplanner_terminal_reward(self, layout: Dict[str, Chiplet]) -> Tuple[float, Dict[str, float]]:
        """Return terminal reward from local RL/reward_cal.py and local fastTM tables."""
        if any(chip_id not in layout for chip_id in self._chiplet_order()):
            return 0.0, {
                "rlplanner_total_wirelength": float("nan"),
                "rlplanner_avg_wirelength": float("nan"),
                "rlplanner_emib_wirelength": float("nan"),
                "rlplanner_normal_wirelength": float("nan"),
                "rlplanner_total_wire_count": 0,
                "rlplanner_temperature": float("nan"),
                "rlplanner_temperature_penalty": float("nan"),
                "rlplanner_cost": float("nan"),
                "rlplanner_reward_error": "incomplete_layout",
            }

        self._sync_rlplanner_system(layout)
        self.vec_path = [_ensure_trailing_slash(self._thermal_table_dir()) if self._thermal_table_dir() is not None else ""]
        thermal_layout_info = dict(getattr(self, "_last_thermal_layout_info", {}) or {})
        total_wirelength, avg_wirelength, emib_wirelength, normal_wirelength, total_wire_count = (
            self._calculate_avg_wirelength(layout)
        )
        wirelength_source = "iccad23_emib_grid_normal_manhattan"

        reward_cal = _load_rlplanner_reward_cal(self.rlplanner_root)
        if reward_cal is None:
            cost = avg_wirelength
            metrics = {
                "rlplanner_total_wirelength": total_wirelength,
                "rlplanner_avg_wirelength": avg_wirelength,
                "rlplanner_emib_wirelength": emib_wirelength,
                "rlplanner_normal_wirelength": normal_wirelength,
                "rlplanner_total_wire_count": total_wire_count,
                "rlplanner_wirelength_source": wirelength_source,
                "rlplanner_temperature": float("nan"),
                "rlplanner_temperature_penalty": 0.0,
                "rlplanner_cost": cost,
                "rlplanner_reward_error": "reward_cal_unavailable",
            }
            metrics.update(thermal_layout_info)
            return -cost, metrics

        if not self._has_rlplanner_thermal_tables():
            cost = avg_wirelength
            table_dir = self._thermal_table_dir()
            metrics = {
                "rlplanner_total_wirelength": total_wirelength,
                "rlplanner_avg_wirelength": avg_wirelength,
                "rlplanner_emib_wirelength": emib_wirelength,
                "rlplanner_normal_wirelength": normal_wirelength,
                "rlplanner_total_wire_count": total_wire_count,
                "rlplanner_wirelength_source": wirelength_source,
                "rlplanner_temperature": float("nan"),
                "rlplanner_temperature_penalty": 0.0,
                "rlplanner_cost": cost,
                "rlplanner_reward_error": f"missing_thermal_tables:{table_dir}",
            }
            metrics.update(thermal_layout_info)
            return -cost, metrics

        if not thermal_layout_info.get("thermal_layout_fits_interposer", False):
            cost = avg_wirelength
            metrics = {
                "rlplanner_total_wirelength": total_wirelength,
                "rlplanner_avg_wirelength": avg_wirelength,
                "rlplanner_emib_wirelength": emib_wirelength,
                "rlplanner_normal_wirelength": normal_wirelength,
                "rlplanner_total_wire_count": total_wire_count,
                "rlplanner_wirelength_source": wirelength_source,
                "rlplanner_temperature": float("nan"),
                "rlplanner_temperature_penalty": 0.0,
                "rlplanner_cost": cost,
                "rlplanner_reward_error": "thermal_layout_out_of_bounds",
            }
            metrics.update(thermal_layout_info)
            return -cost, metrics

        try:
            temp = reward_cal.get_temp(self, 0)
        except Exception as exc:
            cost = avg_wirelength
            metrics = {
                "rlplanner_total_wirelength": total_wirelength,
                "rlplanner_avg_wirelength": avg_wirelength,
                "rlplanner_emib_wirelength": emib_wirelength,
                "rlplanner_normal_wirelength": normal_wirelength,
                "rlplanner_total_wire_count": total_wire_count,
                "rlplanner_wirelength_source": wirelength_source,
                "rlplanner_temperature": float("nan"),
                "rlplanner_temperature_penalty": 0.0,
                "rlplanner_cost": cost,
                "rlplanner_reward_error": f"{type(exc).__name__}: {exc}",
            }
            metrics.update(thermal_layout_info)
            return -cost, metrics

        temp_penalty = _temperature_penalty(float(temp), self.temp_limit)
        cost = float(avg_wirelength) + float(temp_penalty)
        reward = -cost
        metrics = {
            "rlplanner_total_wirelength": total_wirelength,
            "rlplanner_avg_wirelength": float(avg_wirelength),
            "rlplanner_emib_wirelength": float(emib_wirelength),
            "rlplanner_normal_wirelength": float(normal_wirelength),
            "rlplanner_total_wire_count": int(total_wire_count),
            "rlplanner_wirelength_source": wirelength_source,
            "rlplanner_temperature": float(temp),
            "rlplanner_temperature_penalty": temp_penalty,
            "rlplanner_cost": cost,
        }
        metrics.update(thermal_layout_info)
        return float(reward), metrics
    
    def get_valid_actions(self) -> List[int]:
        """
        获取当前有效的动作列表（编码的有效位置）
        
        Returns:
            有效动作索引列表
        """
        if self.state.current_step >= self.num_chiplets:
            return []
        
        current_chip = self._get_current_chip_id()
        if current_chip is None:
            return []
        
        valid_positions = self._get_valid_positions(current_chip)
        self._action_position_overrides = {}
        valid_actions = []
        seen_actions = set()
        exact_slot = 0
        for x, y, rotation in valid_positions:
            grid_action = self._try_encode_grid_action(x, y, rotation)
            if grid_action is not None:
                action = grid_action
            else:
                if exact_slot >= self.exact_action_slots:
                    raise RuntimeError(
                        f"exact_action_slots={self.exact_action_slots} is too small for current valid positions"
                    )
                action = self.base_action_dim + exact_slot
                exact_slot += 1
                self._action_position_overrides[action] = (float(x), float(y), int(rotation))

            if action not in seen_actions:
                seen_actions.add(action)
                valid_actions.append(action)
        
        return valid_actions

    def _try_encode_grid_action(self, x: float, y: float, rotation: int) -> Optional[int]:
        """Return a normal grid action when the coordinate lies exactly on the coarse grid."""
        x_float = float(x) / self.step_x
        y_float = float(y) / self.step_y
        x_idx = int(round(x_float))
        y_idx = int(round(y_float))
        if (
            0 <= x_idx < self.grid_size_x
            and 0 <= y_idx < self.grid_size_y
            and abs(x_float - x_idx) < 1e-9
            and abs(y_float - y_idx) < 1e-9
        ):
            return self._encode_action(x_idx, y_idx, int(rotation))
        return None
    
    def _encode_action(self, x_idx: int, y_idx: int, rotation: int) -> int:
        """编码动作"""
        return (
            x_idx * (self.grid_size_y * self.num_rotations) +
            y_idx * self.num_rotations +
            rotation
        )
    
    def _decode_action(self, action: int) -> Tuple[int, int, int]:
        """解码动作"""
        x_idx = action // (self.grid_size_y * self.num_rotations)
        remainder = action % (self.grid_size_y * self.num_rotations)
        y_idx = remainder // self.num_rotations
        rotation = remainder % self.num_rotations
        return x_idx, y_idx, rotation

    def _decode_action_to_position(self, action: int) -> Tuple[float, float, int]:
        if action in self._action_position_overrides:
            return self._action_position_overrides[action]
        x_idx, y_idx, rotation = self._decode_action(action)
        return x_idx * self.step_x, y_idx * self.step_y, rotation
    
    def step(self, action: int) -> Tuple[np.ndarray, float, bool, Dict]:
        """
        执行动作
        
        Args:
            action: 动作索引
            
        Returns:
            (observation, reward, done, info)
        """
        if self.state.current_step >= self.num_chiplets:
            return self.get_observation(), 0.0, True, {
                "step": self.state.current_step,
                "total_steps": self.num_chiplets,
                "error": "done"
            }
        
        current_chip_id = self._get_current_chip_id()
        if current_chip_id is None:
            return self.get_observation(), 0.0, False, {
                "step": self.state.current_step,
                "total_steps": self.num_chiplets,
                "error": "no_chip"
            }
        
        # 解码动作
        x, y, rotation = self._decode_action_to_position(action)
        chiplet_template = self.chiplets[current_chip_id]
        
        # 创建新芯片
        new_chiplet = deepcopy(chiplet_template)
        if rotation == 1:
            new_chiplet.width, new_chiplet.height = new_chiplet.height, new_chiplet.width
        
        new_chiplet.x = x
        new_chiplet.y = y
        
        # 检查合法性
        is_valid, reason = self._is_valid_placement(new_chiplet, current_chip_id)
        if not is_valid:
            return self.get_observation(), 0.0, False, {
                "step": self.state.current_step,
                "total_steps": self.num_chiplets,
                "chip_id": current_chip_id,
                "error": reason
            }
        
        # 记录放置前的利用率（用于后续的利用率奖励），分母使用当前布局的包围盒面积
        if self.state.layout:
            chiplets_before = list(self.state.layout.values())
            x_coords_b = [c.x for c in chiplets_before] + [c.x + c.width for c in chiplets_before]
            y_coords_b = [c.y for c in chiplets_before] + [c.y + c.height for c in chiplets_before]
            bbox_w_b = max(x_coords_b) - min(x_coords_b)
            bbox_h_b = max(y_coords_b) - min(y_coords_b)
            bbox_area_b = bbox_w_b * bbox_h_b if bbox_w_b > 0 and bbox_h_b > 0 else 1e-9
            prev_util = sum(c.width * c.height for c in chiplets_before) / bbox_area_b
        else:
            prev_util = 0.0

        # 放置芯片
        self.state.layout[current_chip_id] = new_chiplet
        self.state.placed.append(current_chip_id)
        self.state.remaining.remove(current_chip_id)
        self.state.current_step += 1

        # 计算奖励
        reward = self.placement_reward  # 放置奖励
        #对当前放置的chiplet计算额外邻接奖励(奖励不要求connection的的芯片对) 
        neighbors = self.problem.get_neighbors(current_chip_id)
        for placed_chip_id, placed_chip in self.state.layout.items():
            if placed_chip_id != current_chip_id:  # 排除自己
                # 如果不是必须连接的邻接，但实际邻接，则给予额外奖励
                if placed_chip_id not in neighbors:
                    is_adj, overlap_len, _ = get_adjacency_info(new_chiplet, placed_chip)
                    if is_adj and overlap_len >= self.min_overlap:
                        reward += self.extra_adjacency_reward*overlap_len 
        



        # 利用率奖励：根据利用率变化（分母改为当前布局包围盒面积）
        # 先计算放置后的利用率并与放置前比较：
        if self.state.layout:
            chiplets_after = list(self.state.layout.values())
            x_coords_a = [c.x for c in chiplets_after] + [c.x + c.width for c in chiplets_after]
            y_coords_a = [c.y for c in chiplets_after] + [c.y + c.height for c in chiplets_after]
            bbox_w_a = max(x_coords_a) - min(x_coords_a)
            bbox_h_a = max(y_coords_a) - min(y_coords_a)
            bbox_area_a = bbox_w_a * bbox_h_a if bbox_w_a > 0 and bbox_h_a > 0 else 1e-9
            new_util = sum(c.width * c.height for c in chiplets_after) / bbox_area_a
        else:
            new_util = 0.0

        util_delta = new_util - prev_util
        EPS = 1e-9
        # 增加或不变给奖励，减少给轻微惩罚
        if util_delta > EPS:
            reward += self.compact * util_delta
        elif abs(util_delta) <= EPS:
            # 利用率不变也给予小额奖励，鼓励稳定放置
            reward += 0.5 * self.compact
        else:
            # 利用率下降，给予轻微惩罚（按下降幅度缩放）
            reward -= 0.05 * self.compact * abs(util_delta)

     
        
        # 检查相邻约束
        neighbors = self.problem.get_neighbors(current_chip_id)
        for neighbor_id in neighbors:
            if neighbor_id in self.state.layout:
                neighbor_chip = self.state.layout[neighbor_id]
                is_adj, overlap_len, _ = get_adjacency_info(new_chiplet, neighbor_chip)
                if is_adj and overlap_len >= self.min_overlap:
                    reward += self.adjacency_reward
                    
                #     # 边缘对齐奖励（工艺友好）
                #     # 检查左/右边缘是否对齐（X坐标）
                #     ALIGN_THRESHOLD = 0.5  # 对齐容差
                #     if abs(new_chiplet.x - neighbor_chip.x) < ALIGN_THRESHOLD or \
                #        abs((new_chiplet.x + new_chiplet.width) - (neighbor_chip.x + neighbor_chip.width)) < ALIGN_THRESHOLD:
                #         reward += 20.0  # X边缘对齐奖励
                    
                #     # 检查上/下边缘是否对齐（Y坐标）
                #     if abs(new_chiplet.y - neighbor_chip.y) < ALIGN_THRESHOLD or \
                #        abs((new_chiplet.y + new_chiplet.height) - (neighbor_chip.y + neighbor_chip.height)) < ALIGN_THRESHOLD:
                #         reward += 20.0  # Y边缘对齐奖励
                # # 注意：由于交集逻辑保证所有邻接约束满足，else分支不应触发
        
        # 检查完成
        done = self.state.current_step >= self.num_chiplets# 所有芯片已放置
        
        terminal_metrics: Dict[str, float] = {}
        if done:
            # 计算episode级指标：最终利用率与总线长（用于终局奖励/惩罚）
            total_dist = 0.0
            final_util = 0.0
            if len(self.state.layout) > 0:
                chiplets_final = list(self.state.layout.values())
                x_coords_f = [c.x for c in chiplets_final] + [c.x + c.width for c in chiplets_final]
                y_coords_f = [c.y for c in chiplets_final] + [c.y + c.height for c in chiplets_final]
                bbox_w_f = max(x_coords_f) - min(x_coords_f)
                bbox_h_f = max(y_coords_f) - min(y_coords_f)
                bbox_area_f = bbox_w_f * bbox_h_f if bbox_w_f > 0 and bbox_h_f > 0 else 1e-9
                final_util = sum(c.width * c.height for c in chiplets_final) / bbox_area_f

            if len(self.state.layout) > 1:
                for chip_id1, chip_id2 in self.problem.connection_graph.edges():
                    c1 = self.state.layout[chip_id1]
                    c2 = self.state.layout[chip_id2]
                    cx1 = c1.x + c1.width / 2
                    cy1 = c1.y + c1.height / 2
                    cx2 = c2.x + c2.width / 2
                    cy2 = c2.y + c2.height / 2
                    dist = ((cx1 - cx2) ** 2 + (cy1 - cy2) ** 2) ** 0.5
                    total_dist += dist

            # 原有的短线长即时奖励/惩罚（保持兼容）
            if self.min_wirelength_reward_scale != 0.0 and total_dist > 0.0:
                reward += -total_dist * self.min_wirelength_reward_scale

            # 终局奖励（混合策略的主奖励）：按最终利用率给正奖励，按总线长给奖励/惩罚（使用 lenbase/lentotal 比值）
            if self.terminal_util_reward_scale != 0.0:
                reward += final_util * self.terminal_util_reward_scale
            if self.terminal_wirelength_reward_scale != 0.0 and total_dist >= 0.0:
                # 使用用户要求的比值：系数 * (lenbase / lentotal)
                lentotal = total_dist if total_dist > 0.0 else 1e-9
                if hasattr(self, 'lenbase') and self.lenbase > 0.0:
                    ratio = self.lenbase / lentotal
                else:
                    ratio = 1.0 / lentotal
                reward += self.terminal_wirelength_reward_scale * ratio

            if self.terminal_rlplanner_cost_scale != 0.0:
                rlplanner_reward, terminal_metrics = self._calculate_rlplanner_terminal_reward(self.state.layout)
                reward += self.terminal_rlplanner_cost_scale * rlplanner_reward


        
        info = {
            "chip_id": current_chip_id,
            "step": self.state.current_step,
            "total_steps": self.num_chiplets,
            "valid_positions": len(self._get_valid_positions(current_chip_id) if not done else []),
            "rotation": rotation
        }
        info.update(terminal_metrics)
        
        return self.get_observation(), reward, done, info
    
    
    
    def render(self, mode: str = 'human') -> Optional[str]:
        """渲染布局"""
        try:
            import matplotlib.pyplot as plt
            import matplotlib.patches as patches
        except ImportError:
            print("matplotlib 未安装")
            return None
        
        if not self.state.layout:
            print("布局为空")
            return None
        
        fig, ax = plt.subplots(figsize=(10, 10))
        
        for chip_id, chiplet in self.state.layout.items():
            rect = patches.Rectangle(
                (chiplet.x, chiplet.y),
                chiplet.width,
                chiplet.height,
                linewidth=2,
                edgecolor='black',
                facecolor='lightblue',
                alpha=0.7
            )
            ax.add_patch(rect)
            ax.text(
                chiplet.x + chiplet.width / 2,
                chiplet.y + chiplet.height / 2,
                chip_id,
                ha='center',
                va='center',
                fontsize=10
            )
        
        ax.set_xlim(0, self.max_width)
        ax.set_ylim(0, self.max_height)
        ax.set_aspect('equal')
        ax.set_xlabel('X')
        ax.set_ylabel('Y')
        ax.set_title(f'Chiplet Layout ({len(self.state.placed)}/{self.num_chiplets})')
        ax.grid(True, alpha=0.3)
        
        if mode == 'human':
            plt.show()
        
        return None
    
    def get_layout_dict(self) -> Dict[str, Tuple[float, float]]:
        """获取布局坐标字典"""
        return {chip_id: (c.x, c.y) for chip_id, c in self.state.layout.items()}
    
    def save_layout_json(self, filepath: str) -> None:
        """保存布局为JSON"""
        data = {
            "chiplets": [
                {
                    "id": chip_id,
                    "x": float(chiplet.x),
                    "y": float(chiplet.y),
                    "width": float(chiplet.width),
                    "height": float(chiplet.height)
                }
                for chip_id, chiplet in self.state.layout.items()
            ],
            "connections": list(self.problem.connection_graph.edges())
        }
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)


# 便捷函数
def create_env_from_json(json_path: str, **kwargs) -> ChipletPlacementEnv:
    """
    从 JSON 文件创建环境（兼容chiplets和dies格式）
    
    Args:
        json_path: JSON 文件路径
        **kwargs: 其他环境参数
        
    Returns:
        ChipletPlacementEnv 实例
    """
    # 手动加载JSON，兼容两种格式
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    problem = LayoutProblem()
    problem.source_json_path = str(Path(json_path).resolve())
    problem.chiplet_order = []
    
    # 支持'chiplets'或'dies'字段
    chiplets_data = data.get('chiplets', data.get('dies', []))
    if not chiplets_data:
        raise KeyError("JSON文件必须包含 'chiplets' 或 'dies' 字段")
    
    for chiplet_data in chiplets_data:
        name = chiplet_data.get('name') or chiplet_data.get('id')
        width = chiplet_data.get('width', 10)
        height = chiplet_data.get('height', 10)
        power = chiplet_data.get('power', 0.0)
        problem.add_chiplet(Chiplet(name, width, height, power=power))
        problem.chiplet_order.append(name)
    
    # 添加连接
    connections = data.get('connections', [])
    for conn in connections:
        _add_connection_from_json(problem, conn)
    
    return ChipletPlacementEnv(problem, **kwargs)


def creat_order_dfs(problem: LayoutProblem) -> List[str]:
    """
    基于深度优先搜索生成芯片放置顺序
    
    Args:
        problem: LayoutProblem 对象
        
    Returns:
        芯片ID列表，表示放置顺序
    """
    from collections import deque
    
    visited = set()
    order = []
    
    def dfs(chip_id: str):
        visited.add(chip_id)
        order.append(chip_id)
        
        for neighbor in problem.connection_graph.neighbors(chip_id):
            if neighbor not in visited:
                dfs(neighbor)
    
    # 从第一个芯片开始DFS
    start_chip = list(problem.chiplets.keys())[0]
    dfs(start_chip)
    
    # 添加未访问的芯片（孤立芯片）
    for chip_id in problem.chiplets.keys():
        if chip_id not in visited:
            order.append(chip_id)
    
    return order



def creat_order_bfs(problem: LayoutProblem) -> List[str]:
    """
    基于广度优先搜索生成芯片放置顺序
    
    Args:
        problem: LayoutProblem 对象
        
    Returns:
        芯片ID列表，表示放置顺序
    """
    from collections import deque
    
    visited = set()
    order = []
    queue = deque()
    
    # 从第一个芯片开始BFS
    start_chip = list(problem.chiplets.keys())[0]
    queue.append(start_chip)
    visited.add(start_chip)
    
    while queue:
        chip_id = queue.popleft()
        order.append(chip_id)
        
        for neighbor in problem.connection_graph.neighbors(chip_id):
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
    
    # 添加未访问的芯片（孤立芯片）
    for chip_id in problem.chiplets.keys():
        if chip_id not in visited:
            order.append(chip_id)
    
    return order



if __name__ == "__main__":
    # 测试环境
    print("=" * 70)
    print("测试 ChipletPlacementEnv - 连接约束驱动版本（细粒度网格）")
    print("=" * 70)
    
    # 创建简单测试用例
    # problem = LayoutProblem()
    # problem.add_chiplet(Chiplet("A", 10, 20))
    # problem.add_chiplet(Chiplet("B", 15, 25))
    # problem.add_chiplet(Chiplet("C", 12, 18))
    # problem.add_chiplet(Chiplet("D", 14, 22))
    
    # problem.add_connection("A", "B")
    # problem.add_connection("B", "C")
    # problem.add_connection("C", "D")
    
    # 从JSON加载问题（支持'chiplets'格式）
    import json
    json_file = Path(__file__).resolve().parent / "examples" / "cpu-dram.json"
    with open(json_file, 'r') as f:
        data = json.load(f)
    
    problem = LayoutProblem()
    problem.source_json_path = str(Path(json_file).resolve())
    problem.chiplet_order = []
    
    # 支持'chiplets'或'dies'字段
    chiplets_data = data.get('chiplets', data.get('dies', []))
    for chiplet_data in chiplets_data:
        name = chiplet_data.get('name') or chiplet_data.get('id')
        width = chiplet_data.get('width', 10)
        height = chiplet_data.get('height', 10)
        power = chiplet_data.get('power', 0.0)
        problem.add_chiplet(Chiplet(name, width, height, power=power))
        problem.chiplet_order.append(name)
    
    # 添加连接
    connections = data.get('connections', [])
    for conn in connections:
        _add_connection_from_json(problem, conn)
    
    placement_order = creat_order_bfs(problem)
    
    # 创建环境 - 使用很细的网格（50×50）和较小的min_overlap
    env = ChipletPlacementEnv(
        problem,
        placement_order=placement_order,
        grid_resolution=50,  # 增加到50×50
        max_width=100,
        max_height=100,
        min_overlap=0.5,  # 减小重叠要求
        lenbase_samples=0,
    )
    
    print(f"\n环境参数:")
    print(f"  芯片数量: {env.num_chiplets}")
    print(f"  放置顺序: {env.placement_order}")
    print(f"  动作空间维度: {env.action_dim}")
    print(f"  网格步长: ({env.step_x:.2f}, {env.step_y:.2f})")
    print(f"  边界框: {env.max_width} × {env.max_height}")
    print(f"  连接关系: {list(problem.connection_graph.edges())}")
    
    # 重置并开始
    obs = env.reset()
    print(f"\n初始状态观察维度: {obs.shape}")
    
    # 执行一个完整episode
    print(f"\n开始放置:")
    print("-" * 70)
    
    total_reward = 0.0
    step_count = 0
    
    while True:
        step_count += 1
        current_chip = env._get_current_chip_id()
        valid_actions = env.get_valid_actions()
        
        print(f"\n  步骤 {step_count}:")
        print(f"    放置芯片: {current_chip}")
        print(f"    有效位置数: {len(valid_actions)}")
        
        if not valid_actions:
            print(f"    ✗ ERROR: 无有效动作可选!")
            break
        
        # 随机选择一个有效动作
        import random
        action = random.choice(valid_actions)

        #todo
        #action=RL_agent.select_action(obs,valid_actions)

        obs, reward, done, info = env.step(action)
        total_reward += reward
        
        print(f"    本步奖励: {reward:.2f}")
        print(f"    累计奖励: {total_reward:.2f}")
        print(f"    进度: {info['step']}/{info['total_steps']}")
        
        if done:
            print(f"\n✓ 完成！总奖励: {total_reward:.2f}")
            
            # 显示最终布局
            print(f"\n最终布局:")
            layout = env.get_layout_dict()
            for chip_id, (x, y) in layout.items():
                chip = env.state.layout[chip_id]
                print(f"  {chip_id}: ({x:.2f}, {y:.2f}) size=({chip.width:.1f}×{chip.height:.1f})")
            break

    print("\n可视化布局和硅桥")
    print("-" * 70)
    # 传递Chiplet对象而非坐标字典
    visualize_layout_with_bridges(
        env.state.layout,  # 使用Chiplet对象字典
        problem, 
        output_file='output/layout_with_bridges.png',
        show_bridges=True,
        show_coordinates=True
    )
    
