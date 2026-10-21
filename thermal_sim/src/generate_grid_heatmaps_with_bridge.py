import argparse
import json
import os
from typing import Optional

import matplotlib
matplotlib.use("Agg")
import matplotlib.patches as patches
import matplotlib.pyplot as plt
import numpy as np

from generate_grid_heatmaps_no_bridge import (
    DEFAULT_INPUT_DIR,
    hotspot_grid_cmap,
    read_flp_layout,
    read_grid_steady_layer,
    read_power,
)
from gen_flp_trace import (
    CASE_MAX_INTERPOSER_MM,
    build_layout,
    load_json_layout,
    package_square_side_mm,
    resolve_case_key,
    round_to_grid_mm,
)
# 芯粒名称/功耗标签的避让和硅桥朝向的判断与 test_thermal 共用一套，避免两边
# 各写一份、逐渐走样。
from test_thermal import _emib_rect, _place_chip_labels


DEFAULT_SUFFIX = "_layer2_grid_thermal_with_bridge"
EMIB_COLOR = (251 / 255.0, 229 / 255.0, 214 / 255.0)


def candidate_placement_dirs(input_dir: str, explicit_placement_dir: Optional[str] = None):
    if explicit_placement_dir:
        yield os.path.abspath(explicit_placement_dir)
        return

    input_dir = os.path.abspath(input_dir)
    input_name = os.path.basename(input_dir.rstrip(os.sep))
    # config_exp_output_xxx / config_output_xxx -> 结果目录名 output_xxx
    if input_name.startswith("config_exp_"):
        output_name = input_name[len("config_exp_"):]
    elif input_name.startswith("config_"):
        output_name = input_name[len("config_"):]
    else:
        output_name = input_name
    repo_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))

    candidates = [
        os.path.join(repo_root, output_name, "placement"),
        os.path.join(repo_root, "experiment_result", output_name, "placement"),
        os.path.join(repo_root, "parameter_result", output_name, "placement"),
        os.path.join(repo_root, "experiment_ablation", output_name, "placement"),
        os.path.join(os.path.dirname(input_dir), output_name, "placement"),
        os.path.join(input_dir, "placement"),
    ]
    seen = set()
    for path in candidates:
        norm = os.path.normpath(path)
        if norm not in seen:
            seen.add(norm)
            yield norm


def find_placement_json(input_dir: str, case_name: str, explicit_placement_dir: Optional[str] = None):
    for placement_dir in candidate_placement_dirs(input_dir, explicit_placement_dir):
        json_path = os.path.join(placement_dir, f"{case_name}.json")
        if os.path.exists(json_path):
            return json_path
    return None


def compute_json_to_flp_shift(json_path: str):
    """
    Recompute the same chiplet translation used by gen_flp_trace when FLP files were created.
    JSON and returned shift are in millimeters.
    """
    orig_chiplets = load_json_layout(json_path)
    shifted_chiplets, layout_side = build_layout(orig_chiplets)
    orig_by_name = {c["name"]: c for c in orig_chiplets}
    shifted_by_name = {c["name"]: c for c in shifted_chiplets}

    dx_list = []
    dy_list = []
    for name, orig in orig_by_name.items():
        shifted = shifted_by_name.get(name)
        if not shifted:
            continue
        dx_list.append(shifted["x"] - orig["x"])
        dy_list.append(shifted["y"] - orig["y"])

    shift_x = sum(dx_list) / len(dx_list) if dx_list else 0.0
    shift_y = sum(dy_list) / len(dy_list) if dy_list else 0.0

    # build_layout 只是把布局居中到它自己的外接方框；gen_flp_trace 还会把
    # 整个布局再平移到封装方块的中心。封装边长取该 case 所有布局的最大外接边，
    # 硅桥必须叠加同一段偏移，否则会整体偏到芯片左下方。
    case_key = resolve_case_key(
        os.path.splitext(os.path.basename(json_path))[0], json_path)
    case_side = CASE_MAX_INTERPOSER_MM.get(case_key)
    package_side = (round_to_grid_mm(case_side) if case_side is not None
                    else package_square_side_mm(layout_side))
    center_offset = round_to_grid_mm((package_side - layout_side) / 2.0)
    shift_x += center_offset
    shift_y += center_offset
    return shift_x, shift_y


def iter_emib_bridges(json_path: str):
    with open(json_path, "r", encoding="utf-8") as f:
        placement_data = json.load(f)

    for conn in placement_data.get("connections", []):
        emib_type = conn.get("EMIBType")
        if emib_type == "interfaceC":
            continue
        if emib_type not in ("interfaceA", "interfaceB", None):
            continue

        x = float(conn.get("EMIB-x-position", 0.0) or 0.0)
        y = float(conn.get("EMIB-y-position", 0.0) or 0.0)
        w = float(conn.get("EMIB_width", 0.0) or 0.0)
        h = float(conn.get("EMIB_length", 0.0) or 0.0)
        if w <= 0.0 or h <= 0.0:
            continue
        yield (x, y, w, h, emib_type,
               conn.get("node1"), conn.get("node2"), conn.get("EMIB_bump_width"))


def draw_emib_bridges(ax, placement_json: Optional[str], chip_rects=None):
    """画 EMIB 硅桥，返回它们的 (x, y, w, h) 列表（数据坐标，供标签避让用）。

    chip_rects 是 FLP 坐标（mm）下的 {name: (x, y, w, h)}，用来按共享边决定
    硅桥横放还是竖放；RL / bt_tree 的结果文件里 EMIB_width/EMIB_length 是
    未旋转的，exp / parameter 的已含旋转，交给 _emib_rect 统一判断。
    """
    if not placement_json:
        return []

    try:
        shift_x, shift_y = compute_json_to_flp_shift(placement_json)
    except Exception as e:
        print(f"[WARNING] Failed to compute chiplet translation for {placement_json}: {e}")
        shift_x = shift_y = 0.0

    rects = []
    try:
        for (x, y, w, h, _, node1, node2, bump) in iter_emib_bridges(placement_json):
            if chip_rects:
                x, y, w, h = _emib_rect(x + shift_x, y + shift_y, w, h,
                                        node1, node2, chip_rects, bump)
            else:
                x, y = x + shift_x, y + shift_y
            rect = patches.Rectangle(
                (x, y),
                w,
                h,
                linewidth=1.0,
                edgecolor="black",
                facecolor=EMIB_COLOR,
                alpha=0.95,
                zorder=5,
            )
            ax.add_patch(rect)
            rects.append((x, y, w, h))
    except Exception as e:
        print(f"[WARNING] Failed to parse/draw EMIB bridges from {placement_json}: {e}")
        return []
    return rects


def plot_heatmap(flp_file, grid_steady_file, output_image, layer_num, placement_json=None):
    temps_k = read_grid_steady_layer(grid_steady_file, layer_num)
    temps_c = np.flipud(temps_k) - 273.15
    chiplets, all_blocks = read_flp_layout(flp_file)
    power = read_power(flp_file.replace(".flp", ".ptrace"))

    total_width = max((x + w for _, w, _, x, _ in all_blocks), default=1.0)
    total_height = max((y + h for _, _, h, _, y in all_blocks), default=1.0)

    fig, ax = plt.subplots(1, figsize=(11.5, 9.2))
    im = ax.imshow(
        temps_c,
        cmap=hotspot_grid_cmap(),
        extent=(0, total_width, 0, total_height),
        origin="lower",
        aspect="auto",
    )
    im.set_clim(float(np.min(temps_c)), float(np.max(temps_c)))

    cbar = fig.colorbar(im, ax=ax)
    cbar.set_label("Temperature (°C)", fontsize=24)
    cbar.ax.tick_params(labelsize=22)

    max_c = float(np.max(temps_c))
    avg_c = float(np.mean(temps_c))
    ax.set_title(
        f"MaxT = {max_c:.2f} °C, AvgT = {avg_c:.2f} °C",
        fontsize=24,
        pad=16,
    )
    ax.set_xlabel("X (mm)", fontsize=24)
    ax.set_ylabel("Y (mm)", fontsize=24)
    ax.tick_params(axis="both", labelsize=22)

    chip_rects = {n: (x, y, w, h) for n, w, h, x, y in chiplets}
    bridge_rects = draw_emib_bridges(ax, placement_json, chip_rects)
    if placement_json and not bridge_rects:
        print(f"[WARNING] No EMIB bridges drawn for {placement_json}")

    for chiplet in chiplets:
        _, w, h, x, y = chiplet
        rect = patches.Rectangle(
            (x, y),
            w,
            h,
            linewidth=2.2,
            edgecolor="black",
            facecolor="none",
            zorder=6,
        )
        ax.add_patch(rect)

    # 先把版面定下来（tight_layout 会改变坐标轴像素尺寸），再按最终尺寸
    # 摆放名称/功耗标签：两者是分开的 text，名称始终留在芯粒内，功耗行
    # 挂在名称正下方，并按 17x7 锚点 x 9 种对齐做多轮坐标下降，尽量不与
    # 其他标签、EMIB 硅桥重叠。标签 zorder=20，压在芯粒与硅桥之上。
    plt.tight_layout()
    _place_chip_labels(
        ax,
        fig,
        chiplets,
        power,
        bridge_rects,
        fontsize=18,
        power_fmt="{:.0f}W",
        stroke=3,
        # 名称/功耗离硅桥至少留 0.15mm，避免描边和抗锯齿在视觉上压到桥上
        bridge_clear=0.15,
    )

    os.makedirs(os.path.dirname(output_image), exist_ok=True)
    plt.savefig(output_image, dpi=300, bbox_inches="tight", facecolor="white")
    plt.close(fig)


def discover_jobs(input_dir, suffix, placement_dir=None, cases=None,
                  placement_json=None):
    """(flp, grid.steady, png, placement JSON) for every config under input_dir.

    `placement_json`, when given, is used for every job instead of looking for
    `<case_name>.json`; bt_tree / RL layouts are named solution_*.json, so
    their caller has to pass the file explicitly.
    """
    jobs = []
    for name in sorted(os.listdir(input_dir)):
        config_dir = os.path.join(input_dir, name)
        if not name.endswith("_config") or not os.path.isdir(config_dir):
            continue
        case_name = name[:-7]
        if cases and case_name not in cases:
            continue
        flp_file = os.path.join(config_dir, f"{case_name}.flp")
        output_dir = os.path.join(config_dir, "output")
        grid_steady_file = os.path.join(output_dir, f"{case_name}.grid.steady")
        if not os.path.exists(flp_file) or not os.path.exists(grid_steady_file):
            continue
        output_image = os.path.join(output_dir, f"{case_name}{suffix}.png")
        if placement_json:
            job_placement_json = os.path.abspath(placement_json)
        else:
            job_placement_json = find_placement_json(
                input_dir, case_name, placement_dir)
        jobs.append((flp_file, grid_steady_file, output_image,
                     job_placement_json))
    return jobs


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Generate Layer 2 grid thermal maps from existing .grid.steady files "
            "and draw EMIB silicon bridges from placement JSON files."
        )
    )
    parser.add_argument("--input_dir", default=DEFAULT_INPUT_DIR)
    parser.add_argument("--placement_dir", default=None)
    parser.add_argument("--layer", type=int, default=2)
    parser.add_argument("--suffix", default=DEFAULT_SUFFIX)
    parser.add_argument("--case", action="append", default=None,
                        help="只画指定 case（可重复或逗号分隔），默认画全部")
    parser.add_argument("--placement_json", default=None,
                        help="直接指定布局 JSON（bt_tree/RL 的 solution_*.json 用），"
                             "优先于按 <case>.json 查找")
    args = parser.parse_args()

    cases = None
    if args.case:
        cases = {c.strip() for item in args.case for c in item.split(",") if c.strip()}

    input_dir = os.path.abspath(args.input_dir)
    jobs = discover_jobs(input_dir, args.suffix, args.placement_dir, cases,
                         args.placement_json)
    if not jobs:
        raise SystemExit(f"No *_config/output/*.grid.steady jobs found under {args.input_dir}")

    for flp_file, grid_steady_file, output_image, placement_json in jobs:
        if placement_json is None:
            case_name = os.path.basename(flp_file).replace(".flp", "")
            print(f"[WARNING] Placement JSON not found for {case_name}; drawing heatmap without EMIB bridges")
        plot_heatmap(flp_file, grid_steady_file, output_image, args.layer, placement_json)
        print(f"[OK] {output_image}")


if __name__ == "__main__":
    main()
