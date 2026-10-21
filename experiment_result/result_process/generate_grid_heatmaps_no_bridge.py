import argparse
import os

import matplotlib
matplotlib.use("Agg")
import matplotlib.patches as patches
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from matplotlib.patheffects import withStroke
from matplotlib.transforms import Bbox
import numpy as np


DEFAULT_INPUT_DIR = (
    "/root/placement/MPDAP/thermal_sim/config_sum/"
    "config_output_gurobi_EMIB_chiplet_5_6_01_1"
)


def read_grid_steady_layer(grid_steady_file, layer_num):
    temps = []
    in_target = False
    with open(grid_steady_file, "r", encoding="utf-8") as f:
        for line in f:
            s = line.strip()
            if s.startswith("Layer "):
                num = int(s.split()[1].rstrip(":"))
                if num == layer_num:
                    in_target = True
                    continue
                if in_target:
                    break
            elif in_target and s:
                parts = s.split()
                if len(parts) >= 2:
                    temps.append(float(parts[1]))

    if not temps:
        raise ValueError(f"Layer {layer_num} data not found in {grid_steady_file}")

    n = len(temps)
    side = int(round(n ** 0.5))
    if side * side != n:
        raise ValueError(f"Grid is not square: {grid_steady_file} has {n} cells")
    return np.array(temps).reshape(side, side)


def read_flp_layout(flp_file):
    chiplets = []
    all_blocks = []
    with open(flp_file, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = line.split()
            if len(parts) < 5:
                continue
            name = parts[0]
            w, h, x, y = map(float, parts[1:5])
            block = (name, w * 1000, h * 1000, x * 1000, y * 1000)
            all_blocks.append(block)
            if name.startswith("chiplet") or (len(name) == 1 and name.isupper()):
                chiplets.append(block)
    return chiplets, all_blocks


def read_power(ptrace_file):
    if not os.path.exists(ptrace_file):
        return {}

    with open(ptrace_file, "r", encoding="utf-8") as f:
        lines = [line.strip().split() for line in f if line.strip()]
    if len(lines) < 2 or len(lines[0]) != len(lines[1]):
        return {}

    power = {}
    for name, value in zip(lines[0], lines[1]):
        try:
            power[name] = float(value)
        except ValueError:
            continue
    return power


def hotspot_grid_cmap():
    palette_rgb = [
        (255, 0, 0),
        (255, 51, 0),
        (255, 102, 0),
        (255, 153, 0),
        (255, 204, 0),
        (255, 255, 0),
        (204, 255, 0),
        (153, 255, 0),
        (102, 255, 0),
        (51, 255, 0),
        (0, 255, 0),
        (0, 255, 51),
        (0, 255, 102),
        (0, 255, 153),
        (0, 255, 204),
        (0, 255, 255),
        (0, 204, 255),
        (0, 153, 255),
        (0, 102, 255),
        (0, 51, 255),
        (0, 0, 255),
    ]
    palette_rgb = list(reversed(palette_rgb))
    return ListedColormap(
        [(r / 255.0, g / 255.0, b / 255.0) for r, g, b in palette_rgb],
        name="hotspot_grid_palette",
    )


def bbox_overlap_area(a, b):
    x0 = max(a.x0, b.x0)
    y0 = max(a.y0, b.y0)
    x1 = min(a.x1, b.x1)
    y1 = min(a.y1, b.y1)
    if x1 <= x0 or y1 <= y0:
        return 0.0
    return (x1 - x0) * (y1 - y0)


def bbox_outside_area(inner, outer):
    outside = 0.0
    if inner.x0 < outer.x0:
        outside += (outer.x0 - inner.x0) * inner.height
    if inner.x1 > outer.x1:
        outside += (inner.x1 - outer.x1) * inner.height
    if inner.y0 < outer.y0:
        outside += (outer.y0 - inner.y0) * inner.width
    if inner.y1 > outer.y1:
        outside += (inner.y1 - outer.y1) * inner.width
    return outside


def chiplet_display_bbox(ax, chiplet):
    _, w, h, x, y = chiplet
    p0 = ax.transData.transform((x, y))
    p1 = ax.transData.transform((x + w, y + h))
    x0, x1 = sorted((p0[0], p1[0]))
    y0, y1 = sorted((p0[1], p1[1]))
    return type("DisplayBBox", (), {
        "x0": x0,
        "x1": x1,
        "y0": y0,
        "y1": y1,
        "width": x1 - x0,
        "height": y1 - y0,
    })()


def label_candidates(chiplet):
    _, w, h, x, y = chiplet
    fractions = [
        (0.50, 0.50),
        (0.50, 0.65),
        (0.50, 0.35),
        (0.35, 0.50),
        (0.65, 0.50),
        (0.35, 0.65),
        (0.65, 0.65),
        (0.35, 0.35),
        (0.65, 0.35),
        (0.50, 0.78),
        (0.50, 0.22),
        (0.22, 0.50),
        (0.78, 0.50),
        (0.22, 0.78),
        (0.78, 0.78),
        (0.22, 0.22),
        (0.78, 0.22),
    ]
    return [(x + w * fx, y + h * fy, abs(fx - 0.5) + abs(fy - 0.5)) for fx, fy in fractions]


def resolve_label_overlaps(fig, ax, labels):
    if len(labels) < 2:
        return

    for _ in range(4):
        fig.canvas.draw()
        renderer = fig.canvas.get_renderer()
        boxes = [item["text"].get_window_extent(renderer).expanded(1.04, 1.08) for item in labels]
        overlap_pairs = [
            (i, j, bbox_overlap_area(boxes[i], boxes[j]))
            for i in range(len(boxes))
            for j in range(i + 1, len(boxes))
            if bbox_overlap_area(boxes[i], boxes[j]) > 0.0
        ]
        if not overlap_pairs:
            return

        moved = False
        overlap_pairs.sort(key=lambda item: item[2], reverse=True)
        for i, j, _ in overlap_pairs:
            for idx in (j, i):
                text = labels[idx]["text"]
                chiplet = labels[idx]["chiplet"]
                chip_bbox = chiplet_display_bbox(ax, chiplet)
                other_boxes = [box for k, box in enumerate(boxes) if k != idx]

                best_pos = text.get_position()
                best_score = None
                for cand_x, cand_y, center_penalty in label_candidates(chiplet):
                    text.set_position((cand_x, cand_y))
                    fig.canvas.draw()
                    cand_box = text.get_window_extent(fig.canvas.get_renderer()).expanded(1.04, 1.08)
                    overlap = sum(bbox_overlap_area(cand_box, box) for box in other_boxes)
                    outside = bbox_outside_area(cand_box, chip_bbox)
                    score = overlap * 1000.0 + outside * 20.0 + center_penalty
                    if best_score is None or score < best_score:
                        best_score = score
                        best_pos = (cand_x, cand_y)

                text.set_position(best_pos)
                fig.canvas.draw()
                new_box = text.get_window_extent(fig.canvas.get_renderer()).expanded(1.04, 1.08)
                new_overlap = sum(bbox_overlap_area(new_box, box) for box in other_boxes)
                if new_overlap == 0.0:
                    moved = True
                    break

            if moved:
                break

        if not moved:
            return


def save_square(fig, output_image, dpi=300):
    """把 figure 存成严格 1:1 的 PNG。

    先量出实内容（坐标轴 + colorbar + 标题）的 tight 边界，再把短的一边对称
    补白到与长边等长：既不裁内容，输出像素宽高也完全相等。
    """
    fig.canvas.draw()
    tight = fig.get_tightbbox(fig.canvas.get_renderer())
    side = max(tight.width, tight.height)
    cx = (tight.x0 + tight.x1) / 2.0
    cy = (tight.y0 + tight.y1) / 2.0
    square = Bbox.from_extents(cx - side / 2.0, cy - side / 2.0,
                               cx + side / 2.0, cy + side / 2.0)
    fig.savefig(output_image, dpi=dpi, bbox_inches=square, facecolor="white")


def plot_heatmap(flp_file, grid_steady_file, output_image, layer_num):
    temps_k = read_grid_steady_layer(grid_steady_file, layer_num)
    temps_c = np.flipud(temps_k) - 273.15
    chiplets, all_blocks = read_flp_layout(flp_file)
    power = read_power(flp_file.replace(".flp", ".ptrace"))

    total_width = max((x + w for _, w, _, x, _ in all_blocks), default=1.0)
    total_height = max((y + h for _, _, h, _, y in all_blocks), default=1.0)

    # 正方形出图：画布 1:1，坐标框再锁成正方形；aspect="auto" 让温度矩阵
    # 铺满正方框，不因物理宽高比留白。
    fig, ax = plt.subplots(1, figsize=(10.5, 10.5))
    im = ax.imshow(
        temps_c,
        cmap=hotspot_grid_cmap(),
        extent=(0, total_width, 0, total_height),
        origin="lower",
        aspect="auto",
    )
    ax.set_box_aspect(1)
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
            path_effects=[withStroke(linewidth=3, foreground="black")],
        )
        labels.append({"text": text, "chiplet": chiplet})

    resolve_label_overlaps(fig, ax, labels)

    os.makedirs(os.path.dirname(output_image), exist_ok=True)
    plt.tight_layout()
    save_square(fig, output_image)
    plt.close(fig)


def discover_jobs(input_dir, suffix):
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
        jobs.append((flp_file, grid_steady_file, output_image))
    return jobs


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Generate Layer 2 grid thermal maps from existing .grid.steady files "
            "without running HotSpot or drawing EMIB silicon bridges."
        )
    )
    parser.add_argument("--input_dir", default=DEFAULT_INPUT_DIR)
    parser.add_argument("--layer", type=int, default=2)
    parser.add_argument("--suffix", default="_layer2_grid_thermal_no_bridge")
    args = parser.parse_args()

    jobs = discover_jobs(os.path.abspath(args.input_dir), args.suffix)
    if not jobs:
        raise SystemExit(f"No *_config/output/*.grid.steady jobs found under {args.input_dir}")

    for flp_file, grid_steady_file, output_image in jobs:
        plot_heatmap(flp_file, grid_steady_file, output_image, args.layer)
        print(f"[OK] {output_image}")


if __name__ == "__main__":
    main()
