#!/usr/bin/env python3
"""把 RL 批跑的最优布局导出成 bt_tree 实验结果的格式。

输入：
  runs/<prefix>_seed<N>/best_layouts/<case>/best_layout.json   （RL 布局，chiplets 是 dict）
  runs/<prefix>_seed<N>/best_layouts/<case>/best_metrics.json  （取 reward 写进文件名）
  benchmark/test_input/<case>.json                             （power / connections / wireCount）
  benchmark/test_input/EMIB.json                               （LinearIODensity 等）

输出：
  experiment_result/output_rl_10_18/<case>/solution_1_seed<NN>_reward_<R>.json
  字段与 output_bt_tree_10_18 的 solution_*.json 完全一致：
    chiplets / connections / wirelength / area / aspect_ratio

口径（全部由 output_bt_tree_10_18 的 160 条边反推并逐条验证，零偏差）：
  - chiplets: width/height 直接取 RL 的最终尺寸（旋转已在 RL 侧体现在长宽互换上），
    rotation 恒为 0，power 取自 test_input；坐标整体平移到以 (0,0) 为左下角。
  - connections: 只输出非 interfaceC 的边（与参考一致）。
    原始尺寸：EMIB_length = wireCount / LinearIODensity        （沿共享边）
              EMIB_bump_width = LinearIODensity / AreaIODensity
              EMIB_width = 物理间隙 + 2 * EMIB_bump_width      （跨共享边，共边时间隙为 0）
              EMIB_max_width = max_Reach_length
    输出尺寸与参考 ilp/tool 口径一致，即 EMIB_width / EMIB_length 是旋转后的
    最终 x / y 向尺寸：
      竖直共边(左右相邻，不旋转): rotation=0,
          EMIB_width=跨缝宽, EMIB_length=沿边宽,
          x=边界x-EMIB_width/2, y=重叠区中点-EMIB_length/2
      水平共边(上下相邻，旋转90°): rotation=1, 长宽交换,
          EMIB_width=沿边宽, EMIB_length=跨缝宽,
          x=重叠区中点-EMIB_width/2, y=边界y-EMIB_length/2
  - wirelength: 非 C 边 = 两芯片各 16x16 网格点到 EMIB 桥中心的欧氏距离和 × wireCount/256；
                C 边 = 两芯片中心曼哈顿距离 × wireCount（与 calculate_area_and_aspect_ratio.py 一致）。
  - area/aspect_ratio: 所有 chiplet 的包围盒面积与宽高比（aspect 保留 2 位）。
"""
from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

RL_DIR = Path("/root/placement/MPDAP/baseline/RL")
BENCH = Path("/root/placement/MPDAP/benchmark/test_input")
GRID = 16

CASES = ["acend910", "cpu-dram", "hp6_m", "hp8_m", "multigpu",
         "hp11_m", "syn1", "syn5", "syn4"]


def load_emib(path: Path) -> dict:
    data = json.loads(path.read_text(encoding="utf-8"))
    return {e["name"]: e for e in data["EMIBTypes"]}


def identify_edge(a: dict, b: dict):
    """判断两颗相邻 die 的共享边。

    返回 (kind, boundary, mid, gap)：
      kind='vertical'  表示左右相邻，boundary 是共享的 x，mid 是 y 重叠区中点；
      kind='horizontal'表示上下相邻，boundary 是共享的 y，mid 是 x 重叠区中点。
    共边时间隙 gap=0；留缝时 gap>0，boundary 取两条对边之间的中点。
    """
    eps = 1e-6
    ax0, ay0 = a["x-position"], a["y-position"]
    ax1, ay1 = ax0 + a["width"], ay0 + a["height"]
    bx0, by0 = b["x-position"], b["y-position"]
    bx1, by1 = bx0 + b["width"], by0 + b["height"]

    ox = min(ax1, bx1) - max(ax0, bx0)
    oy = min(ay1, by1) - max(ay0, by0)

    if oy > eps:
        for left, right in ((ax1, bx0), (bx1, ax0)):
            if abs(left - right) < eps:
                return "vertical", left, (max(ay0, by0) + min(ay1, by1)) / 2, 0.0
    if ox > eps:
        for lo, hi in ((ay1, by0), (by1, ay0)):
            if abs(lo - hi) < eps:
                return "horizontal", lo, (max(ax0, bx0) + min(ax1, bx1)) / 2, 0.0

    # 兜底：两 die 之间留了缝。按分离轴选朝向，取对边中点作为桥中心。
    if oy > eps and (bx0 - ax1 > 0 or ax0 - bx1 > 0):
        left, right = (ax1, bx0) if bx0 > ax1 else (bx1, ax0)
        return "vertical", (left + right) / 2, (max(ay0, by0) + min(ay1, by1)) / 2, abs(right - left)
    if ox > eps and (by0 - ay1 > 0 or ay0 - by1 > 0):
        lo, hi = (ay1, by0) if by0 > ay1 else (by1, ay0)
        return "horizontal", (lo + hi) / 2, (max(ax0, bx0) + min(ax1, bx1)) / 2, abs(hi - lo)
    raise ValueError(
        f"无法判定 {a['name']}-{b['name']} 的邻接关系：dx_overlap={ox}, dy_overlap={oy}"
    )


def export_case(case: str, seed: int, prefix: str, out_dir: Path, emib: dict) -> dict | None:
    bdir = RL_DIR / "runs" / f"{prefix}_seed{seed}" / "best_layouts" / case
    layout_path = bdir / "best_layout.json"
    if not layout_path.is_file():
        return None

    layout = json.loads(layout_path.read_text(encoding="utf-8"))["chiplets"]
    metrics_path = bdir / "best_metrics.json"
    metrics = json.loads(metrics_path.read_text(encoding="utf-8")) if metrics_path.is_file() else {}

    bench = json.loads((BENCH / f"{case}.json").read_text(encoding="utf-8"))
    power = {c["name"]: float(c.get("power", 0.0) or 0.0) for c in bench["chiplets"]}

    min_x = min(c["x"] for c in layout.values())
    min_y = min(c["y"] for c in layout.values())

    chiplets = []
    for c in bench["chiplets"]:
        name = c["name"]
        g = layout[name]
        chiplets.append({
            "name": name,
            "x-position": round(g["x"] - min_x, 6),
            "y-position": round(g["y"] - min_y, 6),
            "width": g["width"],
            "height": g["height"],
            "rotation": 0,
            "power": power.get(name, 0.0),
        })
    placed = {c["name"]: c for c in chiplets}

    # --- connections 与 EMIB 位置 ---
    connections = []
    bridge_centers = {}
    for conn in bench["connections"]:
        n1, n2 = conn["node1"], conn["node2"]
        etype = conn.get("EMIBType", "interfaceB")
        if etype == "interfaceC":
            continue
        iface = emib[etype]
        wire_count = float(conn.get("wireCount", 1))

        emib_length = wire_count / iface["LinearIODensity"]  # along shared edge
        emib_bump_width = iface["LinearIODensity"] / iface["AreaIODensity"]
        kind, boundary, mid, gap = identify_edge(placed[n1], placed[n2])
        emib_width = gap + 2.0 * emib_bump_width  # across shared edge

        if kind == "vertical":
            # Left-right neighbours, vertical shared edge: bridge is not rotated.
            cx, cy = boundary, mid
            x_bl = cx - emib_width / 2.0
            y_bl = cy - emib_length / 2.0
            rotation = 0
            out_width, out_length = emib_width, emib_length
        else:
            # Up-down neighbours, horizontal shared edge: bridge rotated 90°,
            # so the exported width/length are swapped (final x/y extents).
            cx, cy = mid, boundary
            x_bl = cx - emib_length / 2.0
            y_bl = cy - emib_width / 2.0
            rotation = 1
            out_width, out_length = emib_length, emib_width

        bridge_centers[(n1, n2)] = (cx, cy)
        bridge_centers[(n2, n1)] = (cx, cy)
        connections.append({
            "node1": n1,
            "node2": n2,
            "EMIBType": etype,
            "EMIB_length": round(out_length, 4),
            "EMIB_max_width": iface["max_Reach_length"],
            "EMIB_width": round(out_width, 4),
            "EMIB_bump_width": round(emib_bump_width, 4),
            "EMIB-x-position": round(x_bl, 6),
            "EMIB-y-position": round(y_bl, 6),
            "EMIB-rotation": rotation,
        })

    # --- wirelength（与 calculate_area_and_aspect_ratio.py 同口径）---
    def grid_points(c):
        x0, y0, w, h = c["x-position"], c["y-position"], c["width"], c["height"]
        return [(x0 + w * (i + 0.5) / GRID, y0 + h * (j + 0.5) / GRID)
                for i in range(GRID) for j in range(GRID)]

    def centers(c):
        return (c["x-position"] + c["width"] / 2.0,
                c["y-position"] + c["height"] / 2.0)

    wirelength = 0.0
    for conn in bench["connections"]:
        n1, n2 = conn["node1"], conn["node2"]
        wire_count = float(conn.get("wireCount", 1))
        if conn.get("EMIBType") == "interfaceC":
            x1, y1 = centers(placed[n1])
            x2, y2 = centers(placed[n2])
            wirelength += (abs(x1 - x2) + abs(y1 - y2)) * wire_count
            continue
        cx, cy = bridge_centers[(n1, n2)]
        lines_per_point = wire_count / 256.0
        for name in (n1, n2):
            for x, y in grid_points(placed[name]):
                wirelength += math.hypot(x - cx, y - cy) * lines_per_point

    # --- area / aspect_ratio ---
    max_x = max(c["x-position"] + c["width"] for c in chiplets)
    max_y = max(c["y-position"] + c["height"] for c in chiplets)
    area = max_x * max_y
    aspect = max_x / max_y if max_y else 0.0

    reward = metrics.get("reward")
    tag = f"reward_{reward:.4f}" if isinstance(reward, (int, float)) else f"ep_{metrics.get('episode', 'na')}"
    out = {
        "chiplets": chiplets,
        "connections": connections,
        "wirelength": wirelength,
        "area": area,
        "aspect_ratio": round(aspect, 2),
    }
    case_dir = out_dir / case
    case_dir.mkdir(parents=True, exist_ok=True)
    out_path = case_dir / f"solution_1_seed{seed:02d}_{tag}.json"
    out_path.write_text(json.dumps(out, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")

    return {
        "case": case, "seed": seed, "file": str(out_path),
        "wirelength": wirelength, "area": area, "aspect_ratio": round(aspect, 2),
        "reward": reward,
        "rl_metrics_wirelength": metrics.get("wirelength"),
    }


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--prefix", default="rl_5x9_20261016_162549")
    ap.add_argument("--out", default="/root/placement/MPDAP/experiment_result/output_rl_10_18")
    args = ap.parse_args()

    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)
    emib = load_emib(BENCH / "EMIB.json")

    results, missing = [], {}
    for case in CASES:
        case_results = []
        for seed in range(5):
            r = export_case(case, seed, args.prefix, out_dir, emib)
            if r is None:
                missing.setdefault(case, []).append(seed)
            else:
                case_results.append(r)
                results.append(r)
        print(f"{case:10s} 导出 {len(case_results)}/5")

    summary = {
        "source_prefix": args.prefix,
        "format": "bt_tree-compatible (output_bt_tree_10_18)",
        "cases_with_results": sorted({r["case"] for r in results}),
        "cases_without_results": sorted(missing),
        "total_solutions": len(results),
        "results": results,
        "missing_seeds": missing,
    }
    (out_dir / "summary.json").write_text(
        json.dumps(summary, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"\n共导出 {len(results)} 个解，写入 {out_dir}")
    if missing:
        print("无解的 case（RL 全程 0% 成功率，未生成文件）：")
        for case, seeds in missing.items():
            print(f"  {case}: seed {seeds}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
