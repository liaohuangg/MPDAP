import argparse
import json
import os
from typing import List


def read_layer_temps(grid_file: str, layer_num: int) -> List[float]:
    """
    Read temperatures (K) for a given layer from a HotSpot .grid.steady file.
    Returns all grid temperatures on that layer.
    """
    temps: List[float] = []
    in_target = False

    with open(grid_file, "r") as f:
        for line in f:
            s = line.strip()
            if not s:
                continue

            if s.startswith("Layer "):
                parts = s.split()
                if len(parts) < 2:
                    continue
                try:
                    num = int(parts[1].rstrip(":"))
                except ValueError:
                    continue

                if num == layer_num:
                    # TODO: add English comment
                    in_target = True
                    continue
                elif in_target:
                    # TODO: add English comment
                    break

            elif in_target:
                # TODO: add English comment
                parts = s.split()
                if len(parts) >= 2:
                    try:
                        temps.append(float(parts[1]))
                    except ValueError:
                        continue

    return temps


def collect_stats(config_sum_dir: str, layer: int) -> dict:
    """
    Recursively search all *.grid.steady under config_sum and
    collect max and average temperature for the given layer per file.
    """
    results = []

    for dirpath, _, filenames in os.walk(config_sum_dir):
        for filename in filenames:
            if not filename.endswith(".grid.steady"):
                continue

            grid_path = os.path.join(dirpath, filename)

            # Example path: .../config_sum/config_5_6_01_05/acend910_config/output/acend910.grid.steady
            chip_name = filename.replace(".grid.steady", "")
            # chip-specific config dir (contains output/)
            chip_config_dir = os.path.dirname(os.path.dirname(grid_path))
            # top-level config directory (e.g. config_5_6_01_05)
            config_dir = os.path.dirname(chip_config_dir)
            config_name = os.path.basename(config_dir)

            temps = read_layer_temps(grid_path, layer)
            if not temps:
                continue

            # Convert K to Celsius
            temps_c = [t - 273.15 for t in temps]

            max_temp = max(temps_c)
            avg_temp = sum(temps_c) / len(temps_c)

            results.append(
                {
                    "config_name": config_name,  # TODO: add English comment
                    "chip_name": chip_name,  # TODO: add English comment
                    "layer": layer,
                    "max_temp_C": max_temp,
                    "avg_temp_C": avg_temp,
                    "num_points": len(temps_c),
                    "grid_file": os.path.relpath(grid_path, config_sum_dir),
                }
            )

    return {
        "config_sum_dir": os.path.abspath(config_sum_dir),
        "layer": layer,
        "unit": "°C",
        "results": results,
    }


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Recursively scan all *.grid.steady files under config_sum,"
            "extract temperatures (K) for the given layer, compute max and average, and export as JSON."
        )
    )
    parser.add_argument(
        "--config_sum_dir",
        type=str,
        default=os.path.join("..", "config_sum"),
        help="Root config_sum directory (default: ../config_sum)",
    )
    parser.add_argument(
        "--layer",
        type=int,
        default=2,
        help="Layer index to analyze (default: 2)",
    )
    parser.add_argument(
        "--output",
        type=str,
        default="grid_layer_stats.json",
        help="Output JSON path (default: grid_layer_stats.json in current working directory)",
    )

    args = parser.parse_args()
    config_sum_dir = os.path.abspath(args.config_sum_dir)

    if not os.path.isdir(config_sum_dir):
        raise SystemExit(f"config_sum_dir does not exist or is not a directory: {config_sum_dir}")

    data = collect_stats(config_sum_dir, args.layer)

    out_path = os.path.abspath(args.output)
    out_dir = os.path.dirname(out_path)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)

    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print("DEBUG")


if __name__ == "__main__":
    main()

