"""
PPO训练脚本 - 芯片布局强化学习

使用Proximal Policy Optimization (PPO)算法训练芯片布局策略
"""

import torch
import torch.nn as nn
import torch.optim as optim
from torch.distributions import Categorical
import numpy as np
from typing import List, Tuple, Dict
import json
from pathlib import Path
from datetime import datetime
import argparse
import subprocess
import sys
import time
import configparser

try:
    from .env import ChipletPlacementEnv, create_env_from_json
except ImportError:
    from env import ChipletPlacementEnv, create_env_from_json
from copy import deepcopy
try:
    import matplotlib
    # 使用无界面后端，避免在服务器/无显示环境下分配位图失败
    matplotlib.use('Agg')
except ImportError:
    matplotlib = None
try:
    from .unit import visualize_layout_with_bridges
except ImportError:
    from unit import visualize_layout_with_bridges
import contextlib
import os

RL_DIR = Path(__file__).resolve().parent
LOCAL_FASTTM_DIR = RL_DIR / "fastTM"

# 设置设备
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"使用设备: {device}")


class Tee:
    """Write stdout/stderr to both console and a log file."""

    def __init__(self, *streams):
        self.streams = streams

    def write(self, data):
        for stream in self.streams:
            try:
                stream.write(data)
            except UnicodeEncodeError:
                encoding = getattr(stream, "encoding", None) or "utf-8"
                stream.write(data.encode(encoding, errors="replace").decode(encoding))
            stream.flush()

    def flush(self):
        for stream in self.streams:
            stream.flush()


def _safe_run_name(name: str) -> str:
    safe = "".join(ch if ch.isalnum() or ch in ("-", "_", ".") else "_" for ch in str(name).strip())
    return safe or datetime.now().strftime("%Y%m%d_%H%M%S")


def _run_dir_for_name(name: str) -> Path:
    return RL_DIR / "runs" / _safe_run_name(name)


def _thermal_intp_size_for_generation(json_path: str, env_kwargs: Dict) -> float:
    if env_kwargs.get("thermal_intp_size") is not None:
        return float(env_kwargs["thermal_intp_size"])
    # Match local generate_thermal_tables.py default.
    return 50.0


def _align_default_canvas_to_thermal(json_path: str, env_kwargs: Dict) -> Dict:
    """Use the fastTM interposer size as the default RL canvas size."""
    intp_size = _thermal_intp_size_for_generation(json_path, env_kwargs)
    updates = {}
    if env_kwargs.get("max_width") is None:
        env_kwargs["max_width"] = intp_size
        updates["max_width"] = intp_size
    if env_kwargs.get("max_height") is None:
        env_kwargs["max_height"] = intp_size
        updates["max_height"] = intp_size
    return {
        "thermal_intp_size": intp_size,
        "updates": updates,
    }


def _existing_fasttm_intp_size(json_path: str) -> float | None:
    cfg_path = LOCAL_FASTTM_DIR / "configs" / f"benchmark_{Path(json_path).stem}.cfg"
    if not cfg_path.exists():
        return None
    parser = configparser.ConfigParser()
    try:
        if not parser.read(cfg_path):
            return None
        return parser.getfloat("interposer", "intp_size")
    except Exception:
        return None


def _generate_thermal_tables(
    json_path: str,
    env_kwargs: Dict,
    run_dir: Path,
    force: bool = False,
) -> Dict:
    """Generate/check fastTM tables and return timing metadata."""
    thermal_log = run_dir / "thermal_tables.log"
    script = RL_DIR / "generate_thermal_tables.py"
    hotspot_bin = LOCAL_FASTTM_DIR / "util" / "hotspot"
    intp_size = _thermal_intp_size_for_generation(json_path, env_kwargs)
    existing_intp_size = _existing_fasttm_intp_size(json_path)
    force_for_size_change = (
        existing_intp_size is not None
        and abs(float(existing_intp_size) - float(intp_size)) > 1e-9
    )
    effective_force = bool(force or force_for_size_change)
    cmd = [
        sys.executable,
        str(script),
        str(Path(json_path).resolve()),
        "--intp-size",
        str(intp_size),
        "--overwrite-config",
    ]
    if effective_force:
        cmd.append("--force")

    start = time.perf_counter()
    started_at = datetime.now().isoformat(timespec="seconds")
    status = "ok"
    returncode = None

    with open(thermal_log, "w", encoding="utf-8") as log_file:
        log_file.write(f"command: {' '.join(cmd)}\n")
        log_file.write(f"cwd: {LOCAL_FASTTM_DIR}\n")
        log_file.write(f"hotspot: {hotspot_bin}\n")
        log_file.write(f"started_at: {started_at}\n\n")
        log_file.flush()
        try:
            if not hotspot_bin.exists():
                status = f"error:missing_hotspot:{hotspot_bin}"
                log_file.write(f"{status}\n")
            elif not os.access(hotspot_bin, os.X_OK):
                status = f"error:hotspot_not_executable:{hotspot_bin}"
                log_file.write(f"{status}\n")
            else:
                result = subprocess.run(
                    cmd,
                    cwd=str(LOCAL_FASTTM_DIR),
                    stdout=log_file,
                    stderr=subprocess.STDOUT,
                    text=True,
                    check=False,
                )
                returncode = result.returncode
                if result.returncode != 0:
                    status = "failed"
        except Exception as exc:
            status = f"error:{type(exc).__name__}: {exc}"
            log_file.write(f"\n{status}\n")

    elapsed = time.perf_counter() - start
    return {
        "status": status,
        "returncode": returncode,
        "seconds": elapsed,
        "started_at": started_at,
        "ended_at": datetime.now().isoformat(timespec="seconds"),
        "command": cmd,
        "cwd": str(LOCAL_FASTTM_DIR),
        "hotspot": str(hotspot_bin),
        "log": str(thermal_log),
        "intp_size": intp_size,
        "existing_intp_size": existing_intp_size,
        "force": effective_force,
        "force_requested": force,
        "force_reason": "intp_size_changed" if force_for_size_change and not force else None,
    }


def _layout_metrics(env: ChipletPlacementEnv, layout: Dict) -> Dict:
    """Compute export metrics, including rlplanner temperature when possible."""
    if not layout:
        return {}
    geometry_metrics = _layout_geometry_metrics(env, layout)
    try:
        rl_reward, metrics = env._calculate_rlplanner_terminal_reward(layout)
        metrics = dict(metrics)
        metrics["rlplanner_reward"] = rl_reward
        metrics.update(geometry_metrics)
        return metrics
    except Exception as exc:
        geometry_metrics["rlplanner_reward_error"] = f"{type(exc).__name__}: {exc}"
        return geometry_metrics


def _layout_geometry_metrics(env: ChipletPlacementEnv, layout: Dict) -> Dict:
    """Compute geometry/export metrics that do not depend on fast thermal evaluation."""
    chiplets = list(layout.values())
    if not chiplets:
        return {}

    x_min = min(chip.x for chip in chiplets)
    y_min = min(chip.y for chip in chiplets)
    x_max = max(chip.x + chip.width for chip in chiplets)
    y_max = max(chip.y + chip.height for chip in chiplets)
    bbox_width = x_max - x_min
    bbox_height = y_max - y_min
    bbox_area = bbox_width * bbox_height
    chiplet_area = sum(chip.width * chip.height for chip in chiplets)
    canvas_area = float(env.max_width) * float(env.max_height)

    return {
        "chiplet_area": float(chiplet_area),
        "bbox_min_x": float(x_min),
        "bbox_min_y": float(y_min),
        "bbox_max_x": float(x_max),
        "bbox_max_y": float(y_max),
        "bbox_width": float(bbox_width),
        "bbox_height": float(bbox_height),
        "bbox_area": float(bbox_area),
        "bbox_utilization": float(chiplet_area / bbox_area) if bbox_area > 0.0 else None,
        "canvas_area": float(canvas_area),
        "canvas_utilization": float(chiplet_area / canvas_area) if canvas_area > 0.0 else None,
    }


def _metric_text(value, precision: int = 4) -> str:
    if value is None:
        return "None"
    try:
        if isinstance(value, float) and np.isnan(value):
            return "NaN"
        return f"{float(value):.{precision}f}"
    except (TypeError, ValueError):
        return str(value)


class ActorCritic(nn.Module):
    """Actor-Critic网络"""
    
    def __init__(self, obs_dim: int, action_dim: int, hidden_dim: int = 256):
        super().__init__()
        
        # 共享特征提取层
        self.feature = nn.Sequential(
            nn.Linear(obs_dim, hidden_dim),
            nn.ReLU(),
            nn.Linear(hidden_dim, hidden_dim),
            nn.ReLU(),
        )
        
        # Actor网络（策略）
        self.actor = nn.Sequential(
            nn.Linear(hidden_dim, hidden_dim),
            nn.ReLU(),
            nn.Linear(hidden_dim, action_dim),
        )
        
        # Critic网络（价值函数）
        self.critic = nn.Sequential(
            nn.Linear(hidden_dim, hidden_dim),
            nn.ReLU(),
            nn.Linear(hidden_dim, 1),
        )
    
    def forward(self, x):
        """前向传播"""
        features = self.feature(x)
        action_logits = self.actor(features)
        value = self.critic(features)
        return action_logits, value
    
    def get_action(self, obs, valid_actions):
        """
        根据观察选择动作
        
        Args:
            obs: 观察向量 (已在设备上)
            valid_actions: 有效动作列表
            
        Returns:
            action, log_prob, value
        """
        action_logits, value = self.forward(obs)
        
        # 创建动作掩码（只有有效动作可以选择）

        mask = torch.ones(action_logits.shape[-1], device=obs.device) * float('-inf')
        mask[valid_actions] = 0
        masked_logits = action_logits + mask
        
        # 采样动作
        probs = torch.softmax(masked_logits, dim=-1)
        dist = Categorical(probs)
        action = dist.sample()
        log_prob = dist.log_prob(action)
        
        return action.item(), log_prob, value


class PPOTrainer:
    """PPO训练器"""
    
    def __init__(
        self,
        env: ChipletPlacementEnv,
        lr: float = 1e-4,
        gamma: float = 0.99,
        epsilon: float = 0.2,
        value_coef: float = 0.5,
        entropy_coef: float = 0.6,
        max_grad_norm: float = 0.5,
        hidden_dim: int = 256,
        load_optimizer: bool = True
    ):
        """
        初始化PPO训练器
        
        Args:
            env: 环境
            lr: 学习率
            gamma: 折扣因子
            epsilon: PPO裁剪参数
            value_coef: 价值损失系数
            entropy_coef: 熵奖励系数
            max_grad_norm: 梯度裁剪
            hidden_dim: 隐藏层维度
        """
        self.env = env
        self.gamma = gamma
        self.epsilon = epsilon
        self.value_coef = value_coef
        self.entropy_coef = entropy_coef
        self.max_grad_norm = max_grad_norm
        
        # 创建网络并移到GPU
        self.model = ActorCritic(env.observation_dim, env.action_dim, hidden_dim).to(device)
        self.optimizer = optim.Adam(self.model.parameters(), lr=lr)
        
        # 经验缓冲
        self.reset_buffer()
    
    def reset_buffer(self):
        """重置经验缓冲"""
        self.observations = []
        self.actions = []
        self.log_probs = []
        self.values = []
        self.rewards = []
        self.dones = []
    
    def collect_episode(self) -> Tuple[float, bool, Dict]:
        """
        收集一个episode的数据
        
        Returns:
            (total_reward, success)
        """
        obs = self.env.reset()
        done = False
        total_reward = 0.0
        step_count = 0
        max_steps = self.env.num_chiplets * 10  # 防止无限循环
        
        while not done and step_count < max_steps:
            step_count += 1
            
            # 获取有效动作
            valid_actions = self.env.get_valid_actions()
            
            if not valid_actions:
                # 无有效动作，episode失败
                return total_reward, False, {}
            
            # 选择动作
            obs_tensor = torch.FloatTensor(obs).unsqueeze(0).to(device)
            with torch.no_grad():
                action, log_prob, value = self.model.get_action(obs_tensor, valid_actions)
            
            # 执行动作
            next_obs, reward, done, info = self.env.step(action)
            
            # 存储经验（至少需要1个样本）
            self.observations.append(obs)
            self.actions.append(action)
            self.log_probs.append(log_prob)
            self.values.append(value)
            self.rewards.append(reward)
            self.dones.append(done)
            
            obs = next_obs
            total_reward += reward
        
        # 返回布局快照用于保存/分析
        layout_snapshot = deepcopy(self.env.state.layout)
        return total_reward, done, layout_snapshot
    
    def compute_returns(self) -> torch.Tensor:
        """计算折扣回报"""
        returns = []
        R = 0
        
        for reward, done in zip(reversed(self.rewards), reversed(self.dones)):
            if done:
                R = 0
            R = reward + self.gamma * R
            returns.insert(0, R)
        
        return torch.FloatTensor(returns)
    
    def update(self, epochs: int = 6):
        """
        PPO更新
        
        Args:
            epochs: 更新轮数
        """
        # 需要至少1个样本才能更新
        if len(self.observations) == 0:
            return {}
        
        # 如果只有1个样本，跳过标准化（会导致std=0）
        if len(self.observations) == 1:
            self.reset_buffer()
            return {}
        
        # 转换为tensor并移到GPU
        obs_tensor = torch.FloatTensor(np.array(self.observations)).to(device)
        actions_tensor = torch.LongTensor(self.actions).to(device)
        old_log_probs = torch.stack(self.log_probs).to(device)
        old_values = torch.cat(self.values).to(device)
        
        # 计算回报和优势
        returns = self.compute_returns().to(device)
        advantages = returns - old_values.detach()
        
        # 裁剪advantages防止极端值
        advantages = torch.clamp(advantages, -10.0, 10.0)
        
        # 数值稳定的标准化（避免除以0）
        adv_mean = advantages.mean()
        adv_std = advantages.std()
        if adv_std > 1e-8:  # 避免除以接近0的数
            advantages = (advantages - adv_mean) / (adv_std + 1e-8)
        else:
            advantages = advantages - adv_mean  # 至少中心化
        
        # 再次裁剪标准化后的advantages
        advantages = torch.clamp(advantages, -5.0, 5.0)
        
        # 多轮更新
        total_loss = 0
        total_actor_loss = 0
        total_critic_loss = 0
        total_entropy = 0
        total_kl = 0
        
        for epoch in range(epochs):
            # 前向传播
            action_logits, values = self.model(obs_tensor)
            
            # 计算当前策略的log概率
            probs = torch.softmax(action_logits, dim=-1)
            
            # 检查并修复NaN
            if torch.isnan(probs).any():
                print(f"警告: 检测到NaN概率，使用均匀分布代替")
                probs = torch.ones_like(probs) / probs.shape[-1]
            
            dist = Categorical(probs)
            log_probs = dist.log_prob(actions_tensor)
            entropy = dist.entropy().mean()
            
            # 计算KL散度（检测策略变化）
            with torch.no_grad():
                kl_div = (old_log_probs - log_probs).mean()
                total_kl += kl_div.item()
            
            # 如果KL散度过大，提前停止更新
            if epoch > 0 and kl_div > 0.015:  # KL阈值
                break
            
            # PPO损失
            ratio = torch.exp(log_probs - old_log_probs.detach())
            surr1 = ratio * advantages
            surr2 = torch.clamp(ratio, 1 - self.epsilon, 1 + self.epsilon) * advantages
            actor_loss = -torch.min(surr1, surr2).mean()
            
            # 价值损失
            critic_loss = nn.MSELoss()(values.squeeze(-1), returns)
            
            # 总损失
            loss = actor_loss + self.value_coef * critic_loss - self.entropy_coef * entropy
            
            # 反向传播
            self.optimizer.zero_grad()
            loss.backward()
            nn.utils.clip_grad_norm_(self.model.parameters(), self.max_grad_norm)
            self.optimizer.step()
            
            total_loss += loss.item()
            total_actor_loss += actor_loss.item()
            total_critic_loss += critic_loss.item()
            total_entropy += entropy.item()
        
        # 清空缓冲
        self.reset_buffer()
        
        actual_epochs = epoch + 1 if 'epoch' in locals() else epochs
        
        return {
            'loss': total_loss / actual_epochs,
            'actor_loss': total_actor_loss / actual_epochs,
            'critic_loss': total_critic_loss / actual_epochs,
            'entropy': total_entropy / actual_epochs,
            'kl_div': total_kl / actual_epochs,
        }
    
    def save(self, path: str):
        """保存模型和环境配置"""
        torch.save({
            'model_state_dict': self.model.state_dict(),
            'optimizer_state_dict': self.optimizer.state_dict(),
            'env_config': {
                'grid_resolution': self.env.grid_resolution,
                'max_width': self.env.max_width,
                'max_height': self.env.max_height,
                'min_overlap': self.env.min_overlap,
                'observation_dim': self.env.observation_dim,
                'action_dim': self.env.action_dim,
                'terminal_rlplanner_cost_scale': self.env.terminal_rlplanner_cost_scale,
                'thermal_intp_size': self.env.thermal_intp_size,
                'rlplanner_root': str(self.env.rlplanner_root),
                'rlplanner_table_dir': str(self.env.rlplanner_table_dir) if self.env.rlplanner_table_dir is not None else None,
                'exact_action_slots': self.env.exact_action_slots,
            }
        }, path)
        print(f"模型已保存到 {path}")


    def load(self, path: str, load_optimizer: bool = False):
         checkpoint = torch.load(path)
         self.model.load_state_dict(checkpoint['model_state_dict'])
         if load_optimizer and 'optimizer_state_dict' in checkpoint:
          self.optimizer.load_state_dict(checkpoint['optimizer_state_dict'])
         else:
        # 重新初始化optimizer，确保使用当前trainer.lr（可自适配）
          self.optimizer = optim.Adam(self.model.parameters(), lr=self.optimizer.param_groups[0]['lr'])
       
         print(f"模型已从 {path} 加载")    
    
 

def train(
    json_path: str,
    num_episodes: int = 1000,
    save_interval: int = 100,
    log_interval: int = 10,
    trainer: PPOTrainer = None,
    name: str = None,
    generate_thermal_tables: bool = True,
    force_thermal_tables: bool = False,
    **env_kwargs
):
    """Run one named training job and export logs/artifacts under runs/<name>."""
    json_path = str(json_path)
    if name is None:
        case_name = Path(json_path).stem
        name = f"{case_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    run_dir = _run_dir_for_name(name)
    run_dir.mkdir(parents=True, exist_ok=True)
    (run_dir / "checkpoints").mkdir(parents=True, exist_ok=True)
    (run_dir / "results" / "top_layouts").mkdir(parents=True, exist_ok=True)
    canvas_defaults = _align_default_canvas_to_thermal(json_path, env_kwargs)

    config = {
        "name": name,
        "run_dir": str(run_dir),
        "json_path": str(Path(json_path).resolve()),
        "num_episodes": num_episodes,
        "save_interval": save_interval,
        "log_interval": log_interval,
        "generate_thermal_tables": generate_thermal_tables,
        "force_thermal_tables": force_thermal_tables,
        "env_kwargs": env_kwargs,
        "canvas_defaults": canvas_defaults,
        "started_at": datetime.now().isoformat(timespec="seconds"),
    }
    with open(run_dir / "config.json", "w", encoding="utf-8") as f:
        json.dump(config, f, indent=2, ensure_ascii=False, default=str)

    timing = {
        "name": name,
        "run_dir": str(run_dir),
        "started_at": config["started_at"],
        "thermal_tables": None,
        "rl_solve": None,
        "best_layout": None,
        "total_seconds": None,
    }

    total_start = time.perf_counter()
    train_log = run_dir / "train.log"
    with open(train_log, "w", encoding="utf-8") as log_file:
        tee_out = Tee(sys.stdout, log_file)
        tee_err = Tee(sys.stderr, log_file)
        with contextlib.redirect_stdout(tee_out), contextlib.redirect_stderr(tee_err):
            print(f"Run name: {name}")
            print(f"Run directory: {run_dir}")
            print(f"Training log: {train_log}")
            if canvas_defaults["updates"]:
                print(
                    "Default RL canvas aligned to fastTM interposer: "
                    f"{env_kwargs['max_width']} x {env_kwargs['max_height']}"
                )

            if generate_thermal_tables:
                print("\n生成/检查 fastTM 热阻表...")
                thermal_info = _generate_thermal_tables(
                    json_path=json_path,
                    env_kwargs=env_kwargs,
                    run_dir=run_dir,
                    force=force_thermal_tables,
                )
                timing["thermal_tables"] = thermal_info
                print(f"  热阻表阶段状态: {thermal_info['status']}")
                print(f"  热阻表阶段耗时: {thermal_info['seconds']:.3f}s")
                print(f"  热阻表日志: {thermal_info['log']}")
                if thermal_info["status"] != "ok":
                    print("  警告：热阻表阶段失败，训练会继续；终局热 reward 可能退化或记录 reward_error。")
            else:
                timing["thermal_tables"] = {
                    "status": "skipped",
                    "seconds": 0.0,
                    "force": force_thermal_tables,
                }

            rl_start = time.perf_counter()
            rl_started_at = datetime.now().isoformat(timespec="seconds")
            pre_rl_seconds = time.perf_counter() - total_start
            trainer_result = _train_impl(
                json_path=json_path,
                num_episodes=num_episodes,
                save_interval=save_interval,
                log_interval=log_interval,
                trainer=trainer,
                run_dir=run_dir,
                pre_rl_seconds=pre_rl_seconds,
                run_started_at=config["started_at"],
                **env_kwargs,
            )
            rl_seconds = time.perf_counter() - rl_start
            timing["rl_solve"] = {
                "seconds": rl_seconds,
                "started_at": rl_started_at,
                "ended_at": datetime.now().isoformat(timespec="seconds"),
            }
            timing["best_layout"] = getattr(trainer_result, "best_layout_info", None)
            timing["total_seconds"] = time.perf_counter() - total_start
            timing["ended_at"] = datetime.now().isoformat(timespec="seconds")
            print("\n运行时间统计:")
            print(f"  热阻表: {timing['thermal_tables']['seconds']:.3f}s")
            print(f"  RL求解: {timing['rl_solve']['seconds']:.3f}s")
            print(f"  总时间: {timing['total_seconds']:.3f}s")
            if timing["best_layout"] is not None:
                best_timing = timing["best_layout"].get("timing", {})
                print(f"  best layout发现时间: {best_timing.get('found_at')}")
                print(f"  best layout累计RL时间: {_metric_text(best_timing.get('rl_elapsed_seconds'), 3)}s")
                print(f"  best layout累计总时间: {_metric_text(best_timing.get('total_elapsed_seconds'), 3)}s")

    with open(run_dir / "timing.json", "w", encoding="utf-8") as f:
        json.dump(timing, f, indent=2, ensure_ascii=False, default=str)

    trainer_result.run_dir = run_dir
    return trainer_result


def _train_impl(
    json_path: str,
    num_episodes: int = 1000,
    save_interval: int = 100,
    log_interval: int = 10,
    trainer: PPOTrainer = None,
    run_dir: Path = Path("."),
    pre_rl_seconds: float = 0.0,
    run_started_at: str = None,
    **env_kwargs
):
    """
    训练函数
    
    Args:
        json_path: 输入JSON路径
        num_episodes: 训练episode数
        save_interval: 保存间隔
        log_interval: 日志间隔
        trainer: 预训练的trainer（可选，用于迁移学习）
        **env_kwargs: 环境参数
    """
    print("=" * 70)
    print("PPO训练 - 芯片布局优化")
    print("=" * 70)
    
    # 如果没有提供trainer，创建新的
    if trainer is None:
        # 创建环境
        env = create_env_from_json(json_path, **env_kwargs)
        print(f"\n环境信息:")
        print(f"  芯片数量: {env.num_chiplets}")
        print(f"  放置顺序: {env.placement_order}")
        print(f"  观察维度: {env.observation_dim}")
        print(f"  动作维度: {env.action_dim}")
        
        # 创建训练器
        trainer = PPOTrainer(env)
    else:
        # 使用提供的trainer，显示其环境信息
        env = trainer.env
        print(f"\n环境信息 (迁移学习):")
        print(f"  芯片数量: {env.num_chiplets}")
        print(f"  放置顺序: {env.placement_order}")
        print(f"  观察维度: {env.observation_dim}")
        print(f"  动作维度: {env.action_dim}")
    
    # 训练统计
    episode_rewards = []
    success_count = 0
    best_avg_reward = float('-inf')
    best_model_path = None
    patience_counter = 0
    max_patience = 20  # 连续5次保存间隔性能下降就警告
    
    print(f"\n开始训练...")
    print("-" * 70)
    
    # 准备保存 top-10 布局目录
    # 准备保存当前最优布局目录（只保留一个best）
    top_dir = run_dir / "results" / "top_layouts"
    top_dir.mkdir(parents=True, exist_ok=True)
    checkpoint_dir = run_dir / "checkpoints"
    checkpoint_dir.mkdir(parents=True, exist_ok=True)
    progress_path = run_dir / "progress.jsonl"
    best_layout_info: Dict = None  # 存储 dict: {'reward','episode','json','img'}
    train_loop_start = time.perf_counter()
    last_log_time = train_loop_start

    for episode in range(1, num_episodes + 1):
        # 收集经验（现在返回布局快照）
        reward, success, layout = trainer.collect_episode()
        episode_rewards.append(reward)
        export_metrics = _layout_metrics(env, layout) if layout else {}

        if success:
            success_count += 1

        # 更新策略
        metrics = trainer.update(epochs=4)
        
        # 日志
        if episode % log_interval == 0:
            now = time.perf_counter()
            elapsed_seconds = now - train_loop_start
            interval_seconds = now - last_log_time
            last_log_time = now
            avg_reward = np.mean(episode_rewards[-log_interval:])
            success_rate = success_count / episode
            
            print(f"Episode {episode}/{num_episodes}")
            print(f"  平均奖励: {avg_reward:.2f}")
            print(f"  成功率: {success_rate*100:.1f}%")
            print(f"  累计RL时间: {elapsed_seconds:.2f}s")
            print(f"  本区间时间: {interval_seconds:.2f}s")
            if metrics:
                print(f"  损失: {metrics['loss']:.4f}")
                print(f"  熵: {metrics['entropy']:.4f}")
                print(f"  KL散度: {metrics.get('kl_div', 0.0):.6f}")

            progress_record = {
                "episode": episode,
                "num_episodes": num_episodes,
                "elapsed_seconds": elapsed_seconds,
                "interval_seconds": interval_seconds,
                "avg_reward": float(avg_reward),
                "success_rate": float(success_rate),
                "latest_reward": float(reward),
                "success_count": success_count,
                "metrics": metrics,
                "layout_metrics": export_metrics,
            }
            with open(progress_path, "a", encoding="utf-8") as pf:
                pf.write(json.dumps(progress_record, ensure_ascii=False, default=str) + "\n")
            
            # 检测性能下降
            if episode > log_interval * 2:
                prev_avg = np.mean(episode_rewards[-log_interval*2:-log_interval])
                if avg_reward < prev_avg * 0.8:  # 下降超过20%
                    print(f"  WARNING: 性能下降 {prev_avg:.1f} -> {avg_reward:.1f}")
        
        if layout:
            # 检查并保存当前最优布局（只保留一个best，发现更好则覆盖旧文件）
            if layout:
                try:
                    # 如果当前没有best，或本次reward更优，则保存并替换
                    if best_layout_info is None or reward > best_layout_info['reward']:
                        # 删除旧的best文件
                        if best_layout_info is not None:
                            try:
                                Path(best_layout_info['json']).unlink()
                            except Exception:
                                pass
                            try:
                                Path(best_layout_info['metrics_json']).unlink()
                            except Exception:
                                pass
                            try:
                                Path(best_layout_info['img']).unlink()
                            except Exception:
                                pass

                        json_name = f"layout_best_ep{episode}_r{reward:.2f}.json"
                        metrics_name = f"layout_best_ep{episode}_r{reward:.2f}.metrics.json"
                        img_name = f"layout_best_ep{episode}_r{reward:.2f}.png"
                        json_path = top_dir / json_name
                        metrics_path = top_dir / metrics_name
                        img_path = top_dir / img_name
                        found_at = datetime.now().isoformat(timespec="seconds")
                        best_found_rl_seconds = time.perf_counter() - train_loop_start
                        best_found_total_seconds = pre_rl_seconds + best_found_rl_seconds
                        best_timing = {
                            "run_started_at": run_started_at,
                            "found_at": found_at,
                            "episode": episode,
                            "rl_elapsed_seconds": best_found_rl_seconds,
                            "total_elapsed_seconds": best_found_total_seconds,
                            "pre_rl_seconds": pre_rl_seconds,
                        }

                        # 布局 JSON 只保存布局信息；指标单独写 metrics JSON。
                        chiplet_data = {
                            chip_id: {
                                "x": float(chip.x),
                                "y": float(chip.y),
                                "width": float(chip.width),
                                "height": float(chip.height)
                            }
                            for chip_id, chip in layout.items()
                        }
                        layout_data = {"chiplets": chiplet_data}
                        metrics_data = {
                            "episode": episode,
                            "reward": float(reward),
                            "success": bool(success),
                            "wirelength": export_metrics.get("rlplanner_total_wirelength"),
                            "avg_wirelength": export_metrics.get("rlplanner_avg_wirelength"),
                            "emib_wirelength": export_metrics.get("rlplanner_emib_wirelength"),
                            "normal_wirelength": export_metrics.get("rlplanner_normal_wirelength"),
                            "total_wire_count": export_metrics.get("rlplanner_total_wire_count"),
                            "wirelength_source": export_metrics.get("rlplanner_wirelength_source"),
                            "temperature": export_metrics.get("rlplanner_temperature"),
                            "thermal_error": export_metrics.get("rlplanner_reward_error"),
                            "bounding_rect_area": export_metrics.get("bbox_area"),
                            "runtime": {
                                "run_started_at": run_started_at,
                                "best_found_at": found_at,
                                "rl_elapsed_seconds": best_found_rl_seconds,
                                "total_elapsed_seconds": best_found_total_seconds,
                                "pre_rl_seconds": pre_rl_seconds,
                            },
                        }
                        with open(json_path, 'w', encoding='utf-8') as jf:
                            json.dump(layout_data, jf, indent=2, ensure_ascii=False)
                        with open(metrics_path, 'w', encoding='utf-8') as mf:
                            json.dump(metrics_data, mf, indent=2, ensure_ascii=False, default=str)

                        # 保存图片（静默）
                        try:
                            with open(os.devnull, 'w') as devnull:
                                with contextlib.redirect_stdout(devnull), contextlib.redirect_stderr(devnull):
                                    visualize_layout_with_bridges(
                                        layout,
                                        env.problem,
                                        output_file=str(img_path),
                                        show_bridges=True,
                                        show_coordinates=True
                                    )
                        except Exception:
                            pass

                        best_layout_info = {
                            'reward': reward,
                            'episode': episode,
                            'json': str(json_path),
                            'metrics_json': str(metrics_path),
                            'img': str(img_path),
                            'metrics': export_metrics,
                            'timing': best_timing,
                        }
                        best_event = {
                            "event": "best_layout",
                            "episode": episode,
                            "num_episodes": num_episodes,
                            "reward": float(reward),
                            "success": bool(success),
                            "json": str(json_path),
                            "metrics_json": str(metrics_path),
                            "img": str(img_path),
                            "timing": best_timing,
                            "layout_metrics": export_metrics,
                        }
                        with open(progress_path, "a", encoding="utf-8") as pf:
                            pf.write(json.dumps(best_event, ensure_ascii=False, default=str) + "\n")
                        print("BEST_LAYOUT")
                        print(f"  episode: {episode}/{num_episodes}")
                        print(f"  reward: {reward:.2f}")
                        print(f"  found_at: {found_at}")
                        print(f"  累计RL时间: {best_found_rl_seconds:.3f}s")
                        print(f"  累计总时间: {best_found_total_seconds:.3f}s")
                        print(f"  温度: {_metric_text(export_metrics.get('rlplanner_temperature'))}")
                        print(f"  总线长: {_metric_text(export_metrics.get('rlplanner_total_wirelength'))}")
                        print(f"  平均线长: {_metric_text(export_metrics.get('rlplanner_avg_wirelength'))}")
                        print(f"  EMIB线长: {_metric_text(export_metrics.get('rlplanner_emib_wirelength'))}")
                        print(f"  普通线长: {_metric_text(export_metrics.get('rlplanner_normal_wirelength'))}")
                        print(f"  芯片总面积: {_metric_text(export_metrics.get('chiplet_area'))}")
                        print(f"  bbox面积: {_metric_text(export_metrics.get('bbox_area'))}")
                        print(f"  bbox利用率: {_metric_text(export_metrics.get('bbox_utilization'))}")
                        if export_metrics.get("rlplanner_reward_error"):
                            print(f"  热评估错误: {export_metrics.get('rlplanner_reward_error')}")
                        print(f"  json: {json_path}")
                except Exception:
                    pass

        # 保存模型
        if episode % save_interval == 0:
            checkpoint_path = checkpoint_dir / f"ppo_episode_{episode}.pt"
            trainer.save(checkpoint_path)
            
            # 检查是否是最佳模型
            recent_avg = np.mean(episode_rewards[-save_interval:])
            if recent_avg > best_avg_reward:
                best_avg_reward = recent_avg
                best_model_path = checkpoint_path
                patience_counter = 0
                print(f"  NEW_BEST_MODEL 平均奖励: {recent_avg:.2f}")
            else:
                patience_counter += 1
                if patience_counter >= max_patience:
                    print(f"  WARNING: 连续{max_patience}次保存未改进，考虑提前停止")
    
    # 保存最终模型
    final_model_path = checkpoint_dir / "ppo_model.pt"
    trainer.save(final_model_path)
    
    # 如果有更好的模型，复制为最佳模型
    if best_model_path and Path(best_model_path) != final_model_path:
        import shutil
        shutil.copy(best_model_path, checkpoint_dir / "ppo_best.pt")
        print(f"\nBEST_MODEL saved: {best_model_path}")
        print(f"  最佳平均奖励: {best_avg_reward:.2f}")
    
    print("\n" + "=" * 70)
    print("训练完成！")
    print(f"  总episodes: {num_episodes}")
    print(f"  最终成功率: {success_count/num_episodes*100:.1f}%")
    print(f"  平均奖励: {np.mean(episode_rewards[-100:]):.2f}")
    print("=" * 70)
    if best_layout_info is not None:
        with open(run_dir / "best_summary.json", "w", encoding="utf-8") as f:
            json.dump(best_layout_info, f, indent=2, ensure_ascii=False, default=str)
        metrics = best_layout_info.get("metrics", {})
        timing = best_layout_info.get("timing", {})
        if timing:
            print(f"  最佳布局发现时间: {timing.get('found_at')}")
            print(f"  最佳布局累计RL时间: {_metric_text(timing.get('rl_elapsed_seconds'), 3)}s")
            print(f"  最佳布局累计总时间: {_metric_text(timing.get('total_elapsed_seconds'), 3)}s")
        if metrics:
            print(f"  最佳温度: {metrics.get('rlplanner_temperature', float('nan'))}")
            print(f"  最佳总线长: {metrics.get('rlplanner_total_wirelength', float('nan'))}")
            print(f"  最佳平均线长: {metrics.get('rlplanner_avg_wirelength', float('nan'))}")
            print(f"  最佳EMIB线长: {metrics.get('rlplanner_emib_wirelength', float('nan'))}")
            print(f"  最佳普通线长: {metrics.get('rlplanner_normal_wirelength', float('nan'))}")
    
    trainer.best_layout_info = best_layout_info
    return trainer


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="PPO训练 - 芯片布局优化")
    parser.add_argument("--name", type=str, default=None, help="本次训练名称；输出到 runs/<name>")
    parser.add_argument("--json", dest="json_path", type=str, default=str(RL_DIR / "examples" / "multigpu.json"))
    parser.add_argument("--num_episodes", type=int, default=10000)
    parser.add_argument("--save_interval", type=int, default=1000)
    parser.add_argument("--log_interval", type=int, default=100)
    parser.add_argument("--grid_resolution", type=str, default="auto", help="数字或 auto")
    parser.add_argument("--max_width", type=float, default=None)
    parser.add_argument("--max_height", type=float, default=None)
    parser.add_argument(
        "--thermal_intp_size",
        type=float,
        default=None,
        help="fastTM interposer size in mm; layouts larger than this skip thermal evaluation",
    )
    parser.add_argument("--min_overlap", type=float, default=0.5)
    parser.add_argument("--exact_action_slots", type=int, default=50000, help="off-grid 精确坐标的动态动作槽数量")
    parser.add_argument("--force_thermal_tables", action="store_true", help="强制重算 fastTM 热阻表")
    parser.add_argument("--skip_thermal_tables", action="store_true", help="跳过训练前热阻表生成/检查阶段")
    args = parser.parse_args()

    grid_resolution = args.grid_resolution
    if grid_resolution is not None and str(grid_resolution).lower() != "auto":
        grid_resolution = int(grid_resolution)

    trained_model = train(
        json_path=args.json_path,
        name=args.name,
        num_episodes=args.num_episodes,
        save_interval=args.save_interval,
        log_interval=args.log_interval,
        generate_thermal_tables=not args.skip_thermal_tables,
        force_thermal_tables=args.force_thermal_tables,
        grid_resolution=grid_resolution,
        max_width=args.max_width,
        max_height=args.max_height,
        thermal_intp_size=args.thermal_intp_size,
        min_overlap=args.min_overlap,
        exact_action_slots=args.exact_action_slots,
        placement_reward=1,  # 放置奖励
        adjacency_reward=20,   # 邻接奖励
        compact = 10,
        min_wirelength_reward_scale =0,
        extra_adjacency_reward=5,
        terminal_util_reward_scale=30 ,
        terminal_wirelength_reward_scale=0,
        terminal_rlplanner_cost_scale=1.0,
        lenbase_samples=0,
    )
    
    print(f"\nModel saved to {trained_model.run_dir / 'checkpoints' / 'ppo_model.pt'}")
