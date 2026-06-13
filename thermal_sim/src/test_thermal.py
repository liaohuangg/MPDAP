import argparse
import os
import json
import subprocess
import time

import matplotlib
matplotlib.use("Agg")
import matplotlib.patches as patches
import matplotlib.pyplot as plt
from matplotlib.patheffects import withStroke
from matplotlib.colors import ListedColormap
import numpy as np

# Reuse the FLP generation layout logic to keep chiplet and bridge translations consistent
from gen_flp_trace import load_json_layout, build_layout

def read_flp_blocks(flp_file):
    """
    Read an FLP file and return a mapping from block name to center coordinates {(x_center, y_center)}.
    FLP format: name width height x y [optional...]
    """
    blocks = {}
    if not os.path.exists(flp_file):
        return blocks
    with open(flp_file, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 5:
                name = parts[0]
                w, h, x, y = float(parts[1]), float(parts[2]), float(parts[3]), float(parts[4])
                cx, cy = x + w / 2, y + h / 2
                blocks[name] = (cx, cy)
    return blocks


def read_steady_file(steady_file, flp_file=None):
    """
    Read a HotSpot .steady file (format: name<TAB>temp, two columns).
    HotSpot grid-model output does not include coordinates, so block positions are matched from the FLP file.
    Returns: module name list, temperature list, coordinate list (x, y)
    """
    names = []
    temps = []
    coords = []
    if not os.path.exists(steady_file):
        print(f"[ERROR] {steady_file} does not exist. Check whether the HotSpot simulation completed successfully.")
        return names, temps, coords

    flp_blocks = read_flp_blocks(flp_file) if flp_file else {}

    with open(steady_file, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                name = parts[0]
                temp = float(parts[1])
                # HotSpot prefixes silicon-layer blocks with layer_0_; strip it before matching against the FLP data
                base_name = name
                for prefix in ("layer_0_", "hsp_", "hsink_"):
                    if name.startswith(prefix):
                        base_name = name[len(prefix):]
                        break
                if base_name in flp_blocks:
                    names.append(base_name)
                    temps.append(temp)
                    coords.append(flp_blocks[base_name])
                elif not flp_blocks and "layer_0_" in name:
                    base_name = name.replace("layer_0_", "")
                    names.append(base_name)
                    temps.append(temp)
                    coords.append((0.0, 0.0))

    print(f"[OK] Loaded temperature data for {len(names)} chiplet modules")
    return names, temps, coords

def read_grid_steady_layer(grid_steady_file, layer_num):
    """
    Read temperature data for the specified layer from a .grid.steady file.
    Returns: (temps_list, rows, cols) or (None, None, None)
    """
    if not os.path.exists(grid_steady_file):
        print(f"[ERROR] {grid_steady_file} does not exist")
        return None, None, None
    temps = []
    in_target = False
    with open(grid_steady_file, "r") as f:
        for line in f:
            s = line.strip()
            if s.startswith("Layer "):
                parts = s.split()
                num = int(parts[1].rstrip(":"))
                if num == layer_num:
                    in_target = True
                    continue
                elif in_target:
                    break
            elif in_target and s:
                parts = s.split()
                if len(parts) >= 2:
                    temps.append(float(parts[1]))
    if not temps:
        return None, None, None
    n = len(temps)
    grid_side = int(round(n ** 0.5))
    if grid_side * grid_side != n:
        grid_side = int(n ** 0.5)
    rows = cols = grid_side
    return temps, rows, cols


def read_flp_layout(flp_file):
    """
    Read an FLP layout and return lists of chiplet and TIM blocks (consistent with view_flp).
    Returns: chiplets [(name, w, h, x, y), ...], tims [(name, w, h, x, y), ...]
    Supports the newer naming scheme: a single uppercase letter for chiplets (A, B, C...) and T+number for TIMs (T0, T1...)
    """
    chiplets = []
    tims = []
    if not os.path.exists(flp_file):
        return chiplets, tims
    with open(flp_file, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = line.split()
            if len(parts) < 5:
                continue
            name, w, h, x, y = parts[0], float(parts[1]), float(parts[2]), float(parts[3]), float(parts[4])
            # Support two naming schemes:
            # Old scheme: chipletA, chipletB, TIM0, TIM1
            # New scheme: A, B, C (single uppercase letter), T0, T1 (T + number)
            if name.startswith("chiplet") or (len(name) == 1 and name.isupper()):
                chiplets.append((name, w, h, x, y))
            elif name.startswith("TIM") or (name.startswith("T") and len(name) > 1 and name[1:].isdigit()):
                tims.append((name, w, h, x, y))
    return chiplets, tims


def plot_grid_layer2_thermal_map(
    flp_file,
    grid_steady_file,
    output_image,
    json_basename=None,
    placement_dir=None,
    layer_num=2,
):
    """
    Read Layer 2 data from .grid.steady, draw the grid thermal map, and overlay chiplet boxes, names, and power.
    The colormap matches HotSpot's built-in `grid_thermal_map.pl` (red-yellow-green-cyan-blue, with hotter regions shown in red).
    """
    # Read power data from the ptrace file
    power_dict = {}
    ptrace_file = flp_file.replace('.flp', '.ptrace')
    if os.path.exists(ptrace_file):
        try:
            with open(ptrace_file, 'r', encoding='utf-8') as f:
                lines = f.readlines()
            if len(lines) >= 2:
                names = lines[0].strip().split()
                powers = lines[1].strip().split()
                if len(names) == len(powers):
                    for name, power_str in zip(names, powers):
                        try:
                            power_dict[name] = float(power_str)
                        except ValueError:
                            pass
        except Exception as e:
            print(f"[WARNING] Failed to read ptrace file: {e}")
    
    temps, rows, cols = read_grid_steady_layer(grid_steady_file, layer_num)
    if not temps or rows is None:
        print(f"[ERROR] Failed to read temperature data for Layer {layer_num}")
        return

    # HotSpot outputs absolute temperature in Kelvin, consistent with grid_thermal_map.pl; convert to Celsius for coloring and display
    temps = np.array(temps).reshape(rows, cols)
    # Flip vertically once so the physical "top" of the layout also appears at the top of the image
    temps = np.flipud(temps)
    temps_c = temps - 273.15
    chiplets, tims = read_flp_layout(flp_file)
    # Convert coordinates from meters to millimeters
    chiplets = [(n, w*1000, h*1000, x*1000, y*1000) for n, w, h, x, y in chiplets]
    tims = [(n, w*1000, h*1000, x*1000, y*1000) for n, w, h, x, y in tims]
    all_blocks = chiplets + tims
    total_width = total_length = 0.0
    for _, w, h, x, y in all_blocks:
        total_width = max(total_width, x + w)
        total_length = max(total_length, y + h)
    if total_width <= 0 or total_length <= 0:
        total_width = total_length = max(0.01, 0.05)

    # Build the same 21-level RGB palette used by grid_thermal_map.pl.
    # In matplotlib, vmin maps to the first color and vmax maps to the last color.
    # To ensure "hot = red, cold = blue", reverse the original (red -> blue) sequence into (blue -> red).
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
    # Reverse order: blue for lower temperatures, red for higher temperatures
    palette_rgb = list(reversed(palette_rgb))
    palette_norm = [(r / 255.0, g / 255.0, b / 255.0) for r, g, b in palette_rgb]
    cmap = ListedColormap(palette_norm, name="hotspot_grid_palette")

    fig, ax = plt.subplots(1, figsize=(10, 8))
    im = ax.imshow(
        temps_c,
        cmap=cmap,
        extent=(0, total_width, 0, total_length),
        origin="lower",
        aspect="auto",
    )
    max_c = float(np.max(temps_c))
    avg_c = float(np.mean(temps_c))
    im.set_clim(np.min(temps_c), max_c)
    cbar = fig.colorbar(im, ax=ax)
    # Keep sizing close to EMIBplot.py: axis labels 18, ticks 14
    cbar.set_label("Temperature (°C)", fontsize=18)
    cbar.ax.tick_params(labelsize=14)
    ax.set_title(
        f"Layer {layer_num} Grid Thermal Map (Max = {max_c:.2f} °C, AVG = {avg_c:.2f} °C)",
        fontsize=18,
    )
    ax.set_xlabel("X (mm)", fontsize=18)
    ax.set_ylabel("Y (mm)", fontsize=18)
    ax.tick_params(axis="both", labelsize=14)
    ax.set_xlabel("X (mm)")
    ax.set_ylabel("Y (mm)")

    # Overlay chiplet boxes, names, and power labels (facecolor='none' keeps the heatmap visible)
    for name, w, h, x, y in chiplets:
        rect = patches.Rectangle((x, y), w, h, linewidth=1.5, edgecolor="black", facecolor="none")
        ax.add_patch(rect)
        cx, cy = x + w / 2, y + h / 2
        # Place name and power together at the chiplet center using two lines, fully centered
        power = power_dict.get(name, 0.0)
        power_text = f"{power:.2f}W" if power > 0 else ""
        if power_text:
            label = f"{name}\n{power_text}"
        else:
            label = name
        ax.text(
            cx,
            cy,
            label,
            ha="center",
            va="center",
            fontsize=14,
            fontweight="bold",
            color="white",
            linespacing=1.2,
            path_effects=[withStroke(linewidth=2, foreground="black")],
        )
    # Overlay TIM boxes and names (optional, red border)
    for name, w, h, x, y in tims:
        rect = patches.Rectangle((x, y), w, h, linewidth=1, edgecolor="red", facecolor="none", alpha=0.7)
        ax.add_patch(rect)
        cx, cy = x + w / 2, y + h / 2
        ax.text(cx, cy, name, ha="center", va="center", fontsize=12, color="white",
                path_effects=[withStroke(linewidth=1, foreground="black")])

    # Overlay EMIB silicon bridges (draw only interfaceA/interfaceB, skip interfaceC, keep them on top)
    if json_basename:
        try:
            script_dir = os.path.dirname(os.path.abspath(__file__))
            # Prefer the externally provided placement_dir (corresponding to the currently processed output_gurobi_EMIB_chiplet_* directory)
            if placement_dir:
                json_dir = os.path.normpath(placement_dir)
            else:
                # Backward-compatible fallback: read JSON from output_gurobi_EMIB_chiplet_5_6_01_0/placement by default
                root_dir = os.path.normpath(os.path.join(script_dir, "..", ".."))
                json_dir = os.path.join(root_dir, "output_gurobi_EMIB_chiplet_5_6_01_0", "placement")
            json_path = os.path.join(json_dir, f"{json_basename}.json")
            if os.path.exists(json_path):
                with open(json_path, "r", encoding="utf-8") as f:
                    placement_data = json.load(f)

                # Recompute chiplet translation using gen_flp_trace logic to match the FLP translation exactly
                try:
                    orig_chiplets = load_json_layout(json_path)  # Original JSON layout (mm)
                    shifted_chiplets, _ = build_layout(orig_chiplets)  # Translated + centered layout (mm)
                    # Compute the global translation. In theory each chiplet has the same shift_x/shift_y; averaging is a more robust fallback.
                    dx_list = []
                    dy_list = []
                    orig_by_name = {c["name"]: c for c in orig_chiplets}
                    shifted_by_name = {c["name"]: c for c in shifted_chiplets}
                    for name, oc in orig_by_name.items():
                        sc = shifted_by_name.get(name)
                        if not sc:
                            continue
                        dx_list.append(sc["x"] - oc["x"])
                        dy_list.append(sc["y"] - oc["y"])
                    shift_x = sum(dx_list) / len(dx_list) if dx_list else 0.0
                    shift_y = sum(dy_list) / len(dy_list) if dy_list else 0.0
                except Exception as e:
                    print(f"[WARNING] Failed to compute chiplet translation; EMIB bridges will not be translated: {e}")
                    shift_x = shift_y = 0.0

                for conn in placement_data.get("connections", []):
                    emib_type = conn.get("EMIBType")
                    if emib_type == "interfaceC":
                        continue
                    if emib_type not in ("interfaceA", "interfaceB", None):
                        continue
                    x = conn.get("EMIB-x-position", 0.0)
                    y = conn.get("EMIB-y-position", 0.0)
                    w = conn.get("EMIB_width", 0.0)
                    h = conn.get("EMIB_length", 0.0)
                    # EMIB coordinates and dimensions in JSON are already in mm; apply the same translation as the chiplets to preserve relative positions
                    x_mm, y_mm = float(x) + shift_x, float(y) + shift_y
                    w_mm, h_mm = float(w), float(h)
                    if w_mm <= 0.0 or h_mm <= 0.0:
                        continue
                    # Use the light flesh tone RGB(251,229,214) for the bridge color
                    emib_color = (251 / 255.0, 229 / 255.0, 214 / 255.0)
                    rect = patches.Rectangle(
                        (x_mm, y_mm),
                        w_mm,
                        h_mm,
                        linewidth=1.0,
                        edgecolor="black",
                        facecolor=emib_color,
                        alpha=0.95,
                        zorder=5,  # Keep bridges on the top layer
                    )
                    ax.add_patch(rect)
            else:
                print(f"[WARNING] Placement JSON not found: {json_path}; skipping EMIB drawing")
        except Exception as e:
            print(f"[WARNING] Failed to parse/draw EMIB bridges: {e}")

    out_dir = os.path.dirname(output_image)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    plt.tight_layout()
    plt.savefig(output_image, dpi=300, bbox_inches="tight", facecolor="white")
    plt.close()
    print(f"[OK] Layer {layer_num} grid thermal map saved to: {output_image}")


def plot_thermal_map(names, temps, coords, output_image="thermal_map.png"):
    """
    Draw the thermal distribution map and save a high-resolution image (supports custom output paths).
    """
    if not temps or not coords:
        print("[ERROR] No valid temperature data available; cannot draw the thermal distribution map.")
        return
    # Convert coordinates from meters to millimeters
    x = [c[0] * 1000 for c in coords]
    y = [c[1] * 1000 for c in coords]
    temps = np.array(temps)

    plt.figure(figsize=(12, 9))
    scatter = plt.scatter(x, y, c=temps, cmap='hot', s=300, edgecolors='white', alpha=0.8)
    cbar = plt.colorbar(scatter, shrink=0.8)
    cbar.set_label('Temperature (°C)', fontsize=12, rotation=270, labelpad=25)
    cbar.ax.tick_params(labelsize=10)
    plt.title('Chiplet Thermal Distribution Map (HotSpot 3D Grid Simulation)', fontsize=16, pad=20)
    plt.xlabel('X Coordinate (mm)', fontsize=14)
    plt.ylabel('Y Coordinate (mm)', fontsize=14)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    plt.grid(True, linestyle='--', alpha=0.5, color='gray')

    out_dir = os.path.dirname(output_image)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    plt.savefig(output_image, dpi=300, bbox_inches='tight', facecolor='white')
    plt.close()
    print(f"[OK] Thermal distribution map saved to: {output_image}")

def run_hotspot_simulation(config_dir, json_basename):
    """
    Run the HotSpot thermal simulation (based on example3/run.sh).
    All configuration files are under config/{json_name}_config/:
    - example.config, example.lcf, example.materials
    - {json_name}.ptrace, {json_name}.flp, {json_name}_sub.flp
    An output subdirectory is created under config_dir, and .steady and .grid.steady are written there.
    :param config_dir: configuration directory path (e.g. config/acend910_config)
    :param json_basename: JSON base name (e.g. acend910)
    :return: (steady_file, grid_steady_file) or (None, None)
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    hotspot_bin = os.path.join(script_dir, "..", "HotSpot", "hotspot")
    config_dir = os.path.normpath(os.path.abspath(config_dir))

    example_config = os.path.join(config_dir, "example.config")
    example_lcf = os.path.join(config_dir, "example.lcf")
    example_materials = os.path.join(config_dir, "example.materials")
    ptrace_file = os.path.join(config_dir, f"{json_basename}.ptrace")

    output_dir = os.path.join(config_dir, "output")
    os.makedirs(output_dir, exist_ok=True)
    steady_file = os.path.join(output_dir, f"{json_basename}.steady")
    grid_steady_file = os.path.join(output_dir, f"{json_basename}.grid.steady")

    check_files = [hotspot_bin, example_config, example_lcf, example_materials, ptrace_file]
    for f in check_files:
        if not os.path.exists(f):
            print(f"[ERROR] Required file does not exist -> {f}")
            return None, None

    cmd = (
        f"{hotspot_bin} "
        f"-c example.config "
        f"-f {json_basename}.flp "
        f"-p {json_basename}.ptrace "
        f"-steady_file output/{json_basename}.steady "
        f"-grid_steady_file output/{json_basename}.grid.steady "
        f"-model_type grid "
        f"-detailed_3D on "
        f"-grid_layer_file example.lcf "
        f"-materials_file example.materials"
    )
    print(cmd)
    print(f"\n===== Start HotSpot thermal simulation =====")
    print(f"Config directory: {config_dir}")
    print(f"Output directory: {output_dir}")
    tmr_start = time.time()
    proc = subprocess.run(cmd, shell=True, cwd=config_dir, timeout=300)
    tmr_end = time.time()
    print(f"===== Thermal simulation completed in {round(tmr_end - tmr_start, 2)} seconds =====\n")

    if proc.returncode != 0:
        print(f"[ERROR] HotSpot execution failed (returncode={proc.returncode})")
        return None, None
    return steady_file, grid_steady_file


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Run HotSpot thermal simulation and draw chiplet thermal maps. Config files are under config/{json_name}_config/, and outputs are written to the output subdirectory.'
    )
    parser.add_argument(
        '--config_dir',
        type=str,
        required=True,
        help='Configuration directory path, e.g. config/acend910_config',
    )
    parser.add_argument(
        '--placement_dir',
        type=str,
        required=False,
        help='Placement directory containing the corresponding JSON layout, e.g. output_gurobi_EMIB_chiplet_x_x_x_x/placement',
    )
    args = parser.parse_args()

    config_dir = os.path.normpath(os.path.abspath(args.config_dir))
    placement_dir = (
        os.path.normpath(os.path.abspath(args.placement_dir))
        if args.placement_dir
        else None
    )

    # Derive the JSON base name from the directory name: acend910_config -> acend910
    dir_basename = os.path.basename(config_dir)
    if not dir_basename.endswith("_config"):
        print("[ERROR] config_dir must end with _config, e.g. acend910_config")
        exit(1)
    json_basename = dir_basename[:-7]  # Strip the "_config" suffix

    steady_file, grid_steady_file = run_hotspot_simulation(config_dir, json_basename)
    if not steady_file:
        print("[ERROR] Thermal simulation failed. Exiting.")
        exit(1)

    output_dir = os.path.join(config_dir, "output")
    flp_file = os.path.join(config_dir, f"{json_basename}.flp")

    # Layer 2 grid thermal map (including chiplet boxes, names, power, and EMIB bridges)
    layer2_image = os.path.join(output_dir, f"{json_basename}_layer2_grid_thermal.png")
    plot_grid_layer2_thermal_map(
        flp_file,
        grid_steady_file,
        layer2_image,
        json_basename=json_basename,
        placement_dir=placement_dir,
        layer_num=2,
    )
