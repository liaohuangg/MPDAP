from __future__ import annotations

from typing import Dict, Tuple, List, Optional
from pathlib import Path
from copy import deepcopy
import math
import os

import gurobipy as gp
from gurobipy import GRB

from tool import (
    load_emib_placement_json,
    EMIBNode,
    generate_placement_json_with_EMIB,
)
from visualize_emib_layout import draw_from_solution
from ilp_method_EMIB_chiplet import (
    ILPModelContext,
    ILPPlacementResult,
    add_absolute_value_constraint_big_m,
    log_objective_breakdown,
    solve_placement_ilp_from_model,
)
from ilp_method_EMIB_chiplet import build_placement_ilp_model

try:
    from ilp_model_analyzer import MemoryTracker, print_model_report
except ImportError:
    from ilp_method_EMIB_chiplet import MemoryTracker, print_model_report


def _resolve_output_base(project_root: Path) -> Path:
    base_env = os.getenv("EMIB_OUTPUT_BASE")
    if base_env:
        base_path = Path(base_env)
        if not base_path.is_absolute():
            base_path = project_root / base_path
        return base_path
    return project_root / "output_gurobi_EMIB_chiplet"


def build_emib_node_dict(
    edge_map: Dict[Tuple[str, str], dict],
    name_to_idx: Dict[str, int],
) -> Dict[Tuple[int, int], EMIBNode]:
    """
    Build EMIBNode dict from JSON connection info.
    key: (i, j) chiplet index pair, i < j
    value: EMIBNode from JSON; width=2*EMIB_bump_width, height=EMIB_length
    """
    emib_node_dict: Dict[Tuple[int, int], EMIBNode] = {}
    for (a, b), edge in edge_map.items():
        if a not in name_to_idx or b not in name_to_idx:
            continue
        i, j = name_to_idx[a], name_to_idx[b]
        if i == j:
            continue
        if i > j:
            i, j = j, i
        bump_width = float(edge.get("EMIB_bump_width", 0) or 0)
        emib_length = float(edge.get("EMIB_length", 0) or 0)
        emib_node_dict[(i, j)] = EMIBNode(
            node1=edge.get("node1", a),
            node2=edge.get("node2", b),
            wireCount=int(edge.get("wireCount", 0) or 0),
            EMIBType=str(edge.get("EMIBType", "") or ""),
            EMIB_length=emib_length,
            EMIB_bump_width=bump_width,
            EMIB_max_width=float(edge.get("EMIB_max_width", 0) or 0),
            width=2.0 * bump_width,
            height=emib_length,
        )
    return emib_node_dict


def _get_var_value(model: gp.Model, var_name: str) -> Optional[float]:
    v = model.getVarByName(var_name)
    if v is None:
        return None
    try:
        return float(v.X)
    except Exception:
        return None


def _compute_objective_terms_from_model(
    ctx: ILPModelContext,
) -> Tuple[float, Optional[float], Optional[float]]:
    """
    Compute and return key objective terms (aligned with ilp_method_EMIB_chiplet.py):
    - wirelength: interfaceC uses dx_abs_{i}_{j}+dy_abs_{i}_{j}; EMIB uses dx_abs_i+dy_abs_i+dx_abs_j+dy_abs_j
    - t: bbox_area_proxy_t
    - aspect_ratio_penalty: value of aspect_ratio_penalty variable (None if not enabled)
    """
    model = ctx.model
    wirelength_val = 0.0

    # interfaceC: chiplet to chiplet
    all_connected = getattr(ctx, "all_connected_pairs", {}) or {}
    for (i, j), edge in all_connected.items():
        if getattr(edge, "EMIBType", "") != "interfaceC":
            continue
        dx = _get_var_value(model, f"dx_abs_{i}_{j}") or _get_var_value(model, f"dx_abs_{j}_{i}")
        dy = _get_var_value(model, f"dy_abs_{i}_{j}") or _get_var_value(model, f"dy_abs_{j}_{i}")
        if dx is not None and dy is not None:
            wirelength_val += getattr(edge, "wireCount", 1) * (dx + dy)

    # EMIB（interfaceB/interfaceA）：chiplet→EMIB→chiplet
    emib_connected = getattr(ctx, "EMIB_connected_pairs", {}) or {}
    for (i, j), edge in emib_connected.items():
        dx_i = _get_var_value(model, f"dx_abs_i_{i}_{j}")
        dy_i = _get_var_value(model, f"dy_abs_i_{i}_{j}")
        dx_j = _get_var_value(model, f"dx_abs_j_{i}_{j}")
        dy_j = _get_var_value(model, f"dy_abs_j_{i}_{j}")
        if dx_i is not None and dy_i is not None and dx_j is not None and dy_j is not None:
            wirelength_val += getattr(edge, "wireCount", 1) * (dx_i + dy_i + dx_j + dy_j)

    t_val = _get_var_value(model, "bbox_area_proxy_t")
    aspect_val = _get_var_value(model, "aspect_ratio_penalty")
    return wirelength_val, t_val, aspect_val


# Configurable: bbox relax factor (W, H multiplied by this on retry)
DEFAULT_BBOX_RELAX_FACTOR = 1.5


def _compute_initial_bbox(nodes: List) -> Tuple[float, float]:
    """Compute initial chip bbox W, H (same logic as ilp_method_EMIB_chiplet.py)."""
    total_area = 0.0
    for node in nodes:
        w = float(node.dimensions.get("x", 0.0))
        h = float(node.dimensions.get("y", 0.0))
        total_area += w * h
    estimated_side = math.ceil(math.sqrt(total_area * 2))
    W = estimated_side * 3
    H = estimated_side * 3
    return W, H


def _run_three_phase_solve(
    ctx: ILPModelContext,
    nodes: List,
    total_time_limit: int = 3600,
) -> ILPPlacementResult:
    """Three-phase solve with a shared total time budget."""
    import time as _time

    deadline = _time.monotonic() + total_time_limit

    def _remaining_time_limit() -> int:
        return max(0, math.floor(deadline - _time.monotonic()))

    result = _solve_once_with_gap(ctx=ctx, nodes=nodes, gap=0.0, time_limit=min(300, _remaining_time_limit()))
    #result = _solve_once_with_gap(ctx=ctx, nodes=nodes, gap=0.8, time_limit=3600)
    remaining = _remaining_time_limit()
    if result.status == "NoSolution" and remaining > 0:
        print(f"[EMIB] Phase 1 no feasible solution, switching to phase 2 MIPGap=0.3.")
        result = _solve_once_with_gap(ctx=ctx, nodes=nodes, gap=0.3, time_limit=min(300, remaining))
    remaining = _remaining_time_limit()
    if result.status == "NoSolution" and remaining > 0:
        print(f"[EMIB] Phase 2 no feasible solution, switching to phase 3 MIPGap=0.8.")
        result = _solve_once_with_gap(ctx=ctx, nodes=nodes, gap=0.8, time_limit=remaining)
    return result


# Single solve (fixed time limit), allow feasible (non-optimal) solution
def _solve_once_with_gap(
    *,
    ctx: ILPModelContext,
    nodes: List,
    gap: float,
    time_limit: int = 60,
    mip_focus: int = 3,
    heuristics: float = 0.5,
    enable_model_analysis: bool = True,
) -> ILPPlacementResult:
    """
    Single solve (time_limit seconds), allow feasible (non-optimal) solution.
    - Feasible: status="Optimal" or "Feasible", objective_value = ObjVal
    - Infeasible: status="NoSolution", objective_value = inf

    Parameters
    ----------
    enable_model_analysis : bool
        Enable detailed ILP model and memory analysis output (default: True)
    """
    import time as _time

    model = ctx.model
    model.Params.TimeLimit = time_limit
    model.Params.MIPGap = gap
    model.Params.MIPFocus = mip_focus
    model.Params.Heuristics = heuristics
    model.Params.LogToConsole = True

    # Initialize memory tracker for analysis
    memory_tracker = MemoryTracker() if enable_model_analysis else None
    if memory_tracker:
        memory_tracker.start()

    start = _time.time()
    if memory_tracker:
        memory_tracker.start_sampling()
    try:
        if memory_tracker and memory_tracker.available:
            def memory_sampling_callback(model, where):
                memory_tracker.record_peak_throttled()
            model.optimize(memory_sampling_callback)
        else:
            model.optimize()
    finally:
        if memory_tracker:
            memory_tracker.stop_sampling()
    solve_time = _time.time() - start

    # Track final memory
    if memory_tracker:
        memory_tracker.finish()

    status = model.Status
    sol_count = int(getattr(model, "SolCount", 0))

    # Print model analysis after every solve attempt, including infeasible and
    # time-limit runs with no incumbent. Memory values cover model.optimize().
    if enable_model_analysis and memory_tracker:
        print("\n")
        print_model_report(
            model,
            model_name=f"Chiplet Placement ILP (After Optimize, Gap={gap})",
            memory_tracker=memory_tracker,
        )

    # Feasible solution (optimal / suboptimal / time limit with solution)
    if sol_count > 0 and status in (GRB.OPTIMAL, GRB.SUBOPTIMAL, GRB.TIME_LIMIT):
        layout: Dict[str, Tuple[float, float]] = {}
        rotations: Dict[str, bool] = {}
        cx_grid_val: Dict[str, float] = {}
        cy_grid_val: Dict[str, float] = {}
        for k, node in enumerate(nodes):
            x_val = float(ctx.x_grid_var[k].X) if ctx.x_grid_var.get(k) is not None else 0.0
            y_val = float(ctx.y_grid_var[k].X) if ctx.y_grid_var.get(k) is not None else 0.0
            r_val = float(ctx.r[k].X) if ctx.r.get(k) is not None else 0.0
            layout[node.name] = (x_val, y_val)
            rotations[node.name] = bool(r_val > 0.5)
            cx_grid_val[node.name] = float(ctx.cx_grid_var[k].X) if ctx.cx_grid_var.get(k) is not None else 0.0
            cy_grid_val[node.name] = float(ctx.cy_grid_var[k].X) if ctx.cy_grid_var.get(k) is not None else 0.0

        try:
            bw_val = float(ctx.bbox_w.X) if ctx.bbox_w is not None else 0.0
            bh_val = float(ctx.bbox_h.X) if ctx.bbox_h is not None else 0.0
        except Exception:
            bw_val, bh_val = 0.0, 0.0

        status_str = "Optimal" if status == GRB.OPTIMAL else "Feasible"
        obj_val = float(model.ObjVal)
        print(
            f"[EMIB] Solve done: MIPGap={gap}, status={status_str}, Obj={obj_val:.6f}, time={solve_time:.2f}s, SolCount={sol_count}"
        )

        log_objective_breakdown(ctx, model)

        aspect_ratio_val = 0.0
        try:
            aspect_var = model.getVarByName("aspect_ratio_penalty")
            if aspect_var is not None:
                aspect_ratio_val = float(aspect_var.X)
        except Exception:
            aspect_ratio_val = 0.0

        emib_placements = None
        emib_connected = getattr(ctx, "EMIB_connected_pairs", None)
        if emib_connected and getattr(ctx, "EMIB_x_grid_var", None):
            def _r3(v):
                return round(float(v or 0), 3)
            emib_placements = []
            for (i, j), _ in emib_connected.items():
                ex = float(ctx.EMIB_x_grid_var[(i, j)].X) if (i, j) in ctx.EMIB_x_grid_var else 0.0
                ey = float(ctx.EMIB_y_grid_var[(i, j)].X) if (i, j) in ctx.EMIB_y_grid_var else 0.0
                ew = float(ctx.EMIB_w_var[(i, j)].X) if (i, j) in ctx.EMIB_w_var else 0.0
                eh = float(ctx.EMIB_h_var[(i, j)].X) if (i, j) in ctx.EMIB_h_var else 0.0
                er = bool(ctx.r_EMIB[(i, j)].X > 0.5) if (i, j) in ctx.r_EMIB else False
                na = nodes[i].name if i < len(nodes) else str(i)
                nb = nodes[j].name if j < len(nodes) else str(j)
                emib_placements.append({
                    "node1": na, "node2": nb,
                    "EMIB-x-position": _r3(ex), "EMIB-y-position": _r3(ey),
                    "EMIB_width": _r3(ew), "EMIB_length": _r3(eh),
                    "EMIB-rotation": 1 if er else 0,
                })

        return ILPPlacementResult(
            layout=layout,
            rotations=rotations,
            objective_value=obj_val,
            status=status_str,
            solve_time=solve_time,
            bounding_box=(bw_val, bh_val),
            cx_grid_var=cx_grid_val,
            cy_grid_var=cy_grid_val,
            emib_placements=emib_placements,
            aspect_ratio_penalty=aspect_ratio_val,
        )

    # No feasible solution
    print(f"[EMIB] No feasible solution: MIPGap={gap}, status={status}, time={solve_time:.2f}s, SolCount={sol_count}")
    empty_layout = {node.name: (0.0, 0.0) for node in nodes}
    empty_rot = {node.name: False for node in nodes}
    return ILPPlacementResult(
        layout=empty_layout,
        rotations=empty_rot,
        objective_value=float("inf"),
        status="NoSolution",
        solve_time=solve_time,
        bounding_box=(0.0, 0.0),
        cx_grid_var={node.name: 0.0 for node in nodes},
        cy_grid_var={node.name: 0.0 for node in nodes},
        emib_placements=None,
        aspect_ratio_penalty=None,
    )


def search_multiple_solutions(
    num_solutions: int = 3,
    min_shared_length: float = 0.5,
    input_json_path: Optional[str] = None,
    nodes: Optional[List] = None,
    edges: Optional[List[Tuple[int, int]]] = None,
    fixed_chiplet_idx: Optional[int] = None,
    min_pair_dist_diff: Optional[float] = None,  # Min distance-diff threshold between chiplet pairs
    time_limit: int = 600,  # Solve time limit (seconds), default 10 min
    output_dir: Optional[str] = None,  # Output dir for .lp files
    image_output_dir: Optional[str] = None,  # Image output dir
    placement_output_path: Optional[str] = None,  # Full path for placement JSON
    bbox_relax_factor: float = DEFAULT_BBOX_RELAX_FACTOR,  # Bbox relax factor on retry (W, H multiplied)
) -> List[ILPPlacementResult]:
    """
    Search for multiple solutions.
    Flow: 1) Solve ILP with preset bbox; 2) If no solution, relax bbox by bbox_relax_factor and retry;
    3) If still no solution, print failure and exit.

    Parameters:
        num_solutions: Number of solutions to search
        min_shared_length: Min shared edge length between adjacent chiplets
        input_json_path: Optional, load input from JSON
        nodes: Optional chiplet list (ignored if input_json_path given)
        edges: Optional connection list (ignored if input_json_path given)
        fixed_chiplet_idx: Fixed chiplet index
        min_pair_dist_diff: Min distance-diff threshold between chiplet pairs
        output_dir: Output dir for .lp files
        image_output_dir: Image output dir
        placement_output_path: Placement JSON output path
        bbox_relax_factor: Bbox relax factor on first failure (W, H multiplied)
    """
    if input_json_path is None:
        raise ValueError("EMIB search requires input_json_path to load JSON")

    nodes, edges, edge_map, name_to_idx = load_emib_placement_json(input_json_path)

    
    # Preprocess edges: cap EMIB_max_width by min chiplet width/height
    # min_width = float("inf")
    # min_height = float("inf")
    # for i, node in enumerate(nodes):
    #     min_width = min(float(node.dimensions.get("x", 0.0)), min_width)
    #     min_height = min(float(node.dimensions.get("y", 0.0)), min_height)
    # # edges 为键值对列表（字典），可原地修改
    # for edge in edges:
    #     edge["EMIB_max_width"] = min(edge["EMIB_max_width"], min_width, min_height)
    # print("预处理完成，EMIB_max_width更新为最小值:", min_width, min_height)

    # Compact solve: EMIB_max_width can be set to 0.0 to ignore spacing
    # for edge in edges:
    #     edge["EMIB_max_width"] = 0.0
    # # 输出硅桥互联信息（edge_map 中每条连接）
    # print("[EMIB] 硅桥互联信息：")
    # for (a, b), e in sorted(edge_map.items()):
    #     print(f"  ({a}, {b}): node1={e.get('node1')}, node2={e.get('node2')}, "
    #           f"wireCount={e.get('wireCount')}, EMIBType={e.get('EMIBType')}, "
    #           f"EMIB_length={e.get('EMIB_length')}, EMIB_max_width={e.get('EMIB_max_width')}, "
    #           f"EMIB_bump_width={e.get('EMIB_bump_width')}, EMIB_width={e.get('EMIB_width')}")

    solutions = []
    
    # Default min_pair_dist_diff to 1.0 if None
    if min_pair_dist_diff is None:
        min_pair_dist_diff = 1.0

    # edges 已是 6 元组：(node1, node2, wireCount, EMIBType, EMIB_length, EMIB_max_width)
    # print(f"\n[EMIB] 求解：{len(edges)} 条连接")

    # 1. Build EMIBNode dict from JSON: key=(i,j), value=EMIBNode
    emib_node_dict = build_emib_node_dict(edge_map, name_to_idx)
    # print(f"[EMIB] EMIBNode 字典：{len(emib_node_dict)} 条互联")

    # 2. Initial bbox size
    W_initial, H_initial = _compute_initial_bbox(nodes)
    # print(f"[EMIB] 初始边界框 W={W_initial:.2f}, H={H_initial:.2f}")

    # 3. First ILP solve (with EMIBNode dict)
    ctx = build_placement_ilp_model(
        nodes=nodes,
        emib_nodes=emib_node_dict,
        W=W_initial,
        H=H_initial,
        fixed_chiplet_idx=fixed_chiplet_idx,
        min_shared_length=min_shared_length,
    )
    project_root = Path(__file__).parent.parent
    output_base = _resolve_output_base(project_root)
    if output_dir is None:
        output_dir_path = output_base
    else:
        output_dir_path = Path(output_dir)
        if not output_dir_path.is_absolute():
            output_dir_path = project_root / output_dir_path
    output_dir_path.mkdir(parents=True, exist_ok=True)
    lp_file = output_dir_path / "constraints_gurobi.lp"
    ctx.model.write(str(lp_file))

    result = _run_three_phase_solve(ctx=ctx, nodes=nodes)

    # 3. On first failure, relax bbox and retry (commented out)
    # if result.status == "NoSolution":
    #     W_relaxed = W_initial * bbox_relax_factor
    #     H_relaxed = H_initial * bbox_relax_factor
    #     print(f"[EMIB] 第一次搜索无合法解，放宽边界框：W={W_relaxed:.2f}, H={H_relaxed:.2f} (因子={bbox_relax_factor})")
    #     ctx = build_placement_ilp_model(
    #         nodes=nodes,
    #         emib_nodes=emib_node_dict,
    #         W=W_relaxed,
    #         H=H_relaxed,
    #         fixed_chiplet_idx=fixed_chiplet_idx,
    #         min_shared_length=min_shared_length,
    #     )
    #     ctx.model.write(str(lp_file))
    #     result = _run_three_phase_solve(ctx=ctx, nodes=nodes)

    # 4. If still no solution, print and exit
    if result.status == "NoSolution":
        print("[EMIB] Search failed, no feasible solution")
        return solutions

    if result.status in ("Optimal", "Feasible"):
        print(f"[EMIB] Solve succeeded ({result.status})")
        has_emib_vars = getattr(ctx, "EMIB_x_grid_var", None) is not None

        # 1. Generate placement JSON (extract bridge positions from ILP result)
        if has_emib_vars:
            try:
                if placement_output_path is not None:
                    placement_path = Path(placement_output_path)
                    if not placement_path.is_absolute():
                        placement_path = project_root / placement_path
                    placement_path.parent.mkdir(parents=True, exist_ok=True)
                else:
                    input_stem = Path(input_json_path).stem
                    placement_dir = output_base / "placement"
                    placement_dir.mkdir(parents=True, exist_ok=True)
                    placement_path = placement_dir / f"{input_stem}.json"
                generate_placement_json_with_EMIB(
                    result=result,
                    post=None,
                    nodes=nodes,
                    edge_map=edge_map,
                    output_path=str(placement_path),
                    ctx=ctx,
                )
                print(f"[EMIB] placement JSON saved: {placement_path}")
            except Exception as e:
                print(f"[EMIB] Warning: failed to generate placement JSON: {e}")
                import traceback
                traceback.print_exc()

        # 2. Save layout figure (extract bridge positions from ctx)
        if has_emib_vars:
            try:
                if image_output_dir is not None:
                    image_output_dir_path = Path(image_output_dir)
                    if not image_output_dir_path.is_absolute():
                        image_output_dir_path = project_root / image_output_dir_path
                elif output_dir is not None:
                    image_output_dir_path = output_dir_path / "fig"
                else:
                    image_output_dir_path = output_base / "fig"

                image_output_dir_path.mkdir(parents=True, exist_ok=True)
                image_path = image_output_dir_path / "solution_1_layout_gurobi.png"

                draw_from_solution(
                    result=result,
                    post=None,
                    nodes=nodes,
                    edge_map=edge_map,
                    save_path=str(image_path),
                    show=False,
                    ctx=ctx,
                )
                print(f"[EMIB] Layout figure saved: {image_path}")
            except Exception as e:
                print(f"[EMIB] Warning: failed to save layout figure: {e}")
                import traceback
                traceback.print_exc()

        solutions.append(result)

    return solutions
