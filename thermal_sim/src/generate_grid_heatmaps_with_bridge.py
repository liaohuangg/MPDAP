import argparse
import json
import os
from typing import Optional

import matplotlib
matplotlib.use("Agg")
import matplotlib.patches as patches
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patheffects import withStroke

from generate_grid_heatmaps_no_bridge import (
    DEFAULT_INPUT_DIR,
    hotspot_grid_cmap,
    read_flp_layout,
    read_grid_steady_layer,
    read_power,
    resolve_label_overlaps,
)
from gen_flp_trace import build_layout, load_json_layout


DEFAULT_SUFFIX = "_layer2_grid_thermal_with_bridge"
EMIB_COLOR = (251 / 255.0, 229 / 255.0, 214 / 255.0)


def candidate_placement_dirs(input_dir: str, explicit_placement_dir: Optional[str] = None):
    if explicit_placement_dir:
        yield os.path.abspath(explicit_placement_dir)
        return

    input_dir = os.path.abspath(input_dir)
    input_name = os.path.basename(input_dir.rstrip(os.sep))
    output_name = input_name[len("config_"):] if input_name.startswith("config_") else input_name
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
    shifted_chiplets, _ = build_layout(orig_chiplets)
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
        yield x, y, w, h, emib_type


def draw_emib_bridges(ax, placement_json: Optional[str]) -> int:
    if not placement_json:
        return 0

    try:
        shift_x, shift_y = compute_json_to_flp_shift(placement_json)
    except Exception as e:
        print(f"[WARNING] Failed to compute chiplet translation for {placement_json}: {e}")
        shift_x = shift_y = 0.0

    count = 0
    try:
        for x, y, w, h, _ in iter_emib_bridges(placement_json):
            rect = patches.Rectangle(
                (x + shift_x, y + shift_y),
                w,
                h,
                linewidth=1.0,
                edgecolor="black",
                facecolor=EMIB_COLOR,
                alpha=0.95,
                zorder=5,
            )
            ax.add_patch(rect)
            count += 1
    except Exception as e:
        print(f"[WARNING] Failed to parse/draw EMIB bridges from {placement_json}: {e}")
        return 0
    return count


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

    bridge_count = draw_emib_bridges(ax, placement_json)
    if placement_json and bridge_count == 0:
        print(f"[WARNING] No EMIB bridges drawn for {placement_json}")

    labels = []
    for chiplet in chiplets:
        name, w, h, x, y = chiplet
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
        p = power.get(name, 0.0)
        label = f"{name}\n{p:.2f}W" if p > 0 else name
        text = ax.text(
            x + w / 2,
            y + h / 2,
            label,
            ha="center",
            va="center",
            fontsize=18,
            fontweight="bold",
            color="white",
            linespacing=1.15,
            zorder=7,
            path_effects=[withStroke(linewidth=3, foreground="black")],
        )
        labels.append({"text": text, "chiplet": chiplet})

    resolve_label_overlaps(fig, ax, labels)

    os.makedirs(os.path.dirname(output_image), exist_ok=True)
    plt.tight_layout()
    plt.savefig(output_image, dpi=300, bbox_inches="tight", facecolor="white")
    plt.close(fig)


def discover_jobs(input_dir, suffix, placement_dir=None):
    jobs = []
    for name in sorted(os.listdir(input_dir)):
        config_dir = os.path.join(input_dir, name)
        if not name.endswith("_config") or not os.path.isdir(config_dir):
            continue
        case_name = name[:-7]
        flp_file = os.path.join(config_dir, f"{case_name}.flp")
        output_dir = os.path.join(config_dir, "output")
        grid_steady_file = os.path.join(output_dir, f"{case_name}.grid.steady")
        if not os.path.exists(flp_file) or not os.path.exists(grid_steady_file):
            continue
        output_image = os.path.join(output_dir, f"{case_name}{suffix}.png")
        placement_json = find_placement_json(input_dir, case_name, placement_dir)
        jobs.append((flp_file, grid_steady_file, output_image, placement_json))
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
    args = parser.parse_args()

    input_dir = os.path.abspath(args.input_dir)
    jobs = discover_jobs(input_dir, args.suffix, args.placement_dir)
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
