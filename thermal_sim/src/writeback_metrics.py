"""Write thermal results and layout metrics back into the placement JSONs.

For every layout that has a HotSpot run under config_sum, this script

  1. reads the layer-2 grid temperatures from output/<name>.grid.steady
     (max and mean over the grid, in Celsius -- the same numbers the thermal
     maps are drawn from),
  2. recomputes wirelength / area / aspect_ratio with the project's own
     calculator, MPDAP/src/calculate_area_and_aspect_ratio.py,
  3. derives interposer_size = max(bbox width, bbox height) and
     SAR = max(AR, 1/AR) - 1 (both as written by bt_tree),
  4. writes those seven fields back into the placement JSON in place.

Layouts without a thermal run (the sweeps excluded by thermal_pkg.txt) are
reported and left untouched.

Usage:
    python3 src/writeback_metrics.py --dry-run
    python3 src/writeback_metrics.py
"""

import argparse
import importlib.util
import json
import os
import sys

SRC_DIR = os.path.dirname(os.path.abspath(__file__))
THERMAL_DIR = os.path.dirname(SRC_DIR)
MPDAP_DIR = os.path.dirname(THERMAL_DIR)
CONFIG_SUM_DIR = os.path.join(THERMAL_DIR, "config_sum")
BENCH_DIR = os.path.join(MPDAP_DIR, "benchmark", "test_input")
CALC_PATH = os.path.join(MPDAP_DIR, "src", "calculate_area_and_aspect_ratio.py")

sys.path.insert(0, SRC_DIR)
from export_grid_stats import read_layer_temps       # noqa: E402
from run_all_thermal import collect_jobs             # noqa: E402


def load_calculator():
    """Import calculate_area_and_aspect_ratio without its module-level mkdir.

    The script creates its own OUTPUT_DIR as a side effect of being imported;
    we only want the two pure functions.
    """
    real_makedirs = os.makedirs
    os.makedirs = lambda *a, **k: None
    try:
        spec = importlib.util.spec_from_file_location("calc_metrics", CALC_PATH)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
    finally:
        os.makedirs = real_makedirs
    return module


CALC = load_calculator()
TEST_CASES = {os.path.splitext(f)[0]
              for f in os.listdir(BENCH_DIR) if f.endswith(".json")}


def case_name(layout_json):
    """Benchmark case of a layout, for the wireCount lookup in test_input."""
    stem = os.path.splitext(os.path.basename(layout_json))[0]
    if stem in TEST_CASES:
        return stem
    parent = os.path.basename(os.path.dirname(layout_json))
    if parent in TEST_CASES:
        return parent
    return None


def bbox_size(data):
    xs = [c["x-position"] for c in data["chiplets"]]
    ys = [c["y-position"] for c in data["chiplets"]]
    x1 = max(c["x-position"] + c["width"] for c in data["chiplets"])
    y1 = max(c["y-position"] + c["height"] for c in data["chiplets"])
    return x1 - min(xs), y1 - min(ys)


def unheated_layouts(covered):
    """Layout JSONs under the two result trees that have no thermal run."""
    out = []
    for tree in ("experiment_result", "parameter_result"):
        for dirpath, _, filenames in os.walk(os.path.join(MPDAP_DIR, tree)):
            for fname in filenames:
                if not fname.endswith(".json"):
                    continue
                path = os.path.join(dirpath, fname)
                if os.path.realpath(path) in covered:
                    continue
                try:
                    with open(path, "r", encoding="utf-8") as f:
                        data = json.load(f)
                except (OSError, ValueError):
                    continue
                if isinstance(data, dict) and "chiplets" in data:
                    out.append(path)
    return sorted(out)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true",
                    help="compute and print, do not touch the JSON files")
    args = ap.parse_args()

    jobs = collect_jobs()
    print(f"{len(jobs)} layouts with a thermal run")

    missing_grid, missing_case, written = [], [], []
    changed = []
    for group, layout_json, name, _placement_dir in jobs:
        grid = os.path.join(CONFIG_SUM_DIR, f"config_{group}",
                            f"{name}_config", "output", f"{name}.grid.steady")
        if not os.path.exists(grid):
            missing_grid.append((layout_json, grid))
            continue
        case = case_name(layout_json)
        if case is None:
            missing_case.append(layout_json)
            continue

        temps = [t - 273.15 for t in read_layer_temps(grid, 2)]
        max_t = max(temps)
        avg_t = sum(temps) / len(temps)

        with open(layout_json, "r", encoding="utf-8") as f:
            data = json.load(f)

        data["file_name"] = f"{case}.json"     # wireCount lookup only, not saved
        old = {k: data.get(k) for k in ("wirelength", "area", "aspect_ratio",
                                        "interposer_size", "SAR")}
        wirelength = CALC.calculate_total_wirelength(data)
        area, aspect_ratio = CALC.calculate_area_and_aspect_ratio(data)
        width, height = bbox_size(data)
        interposer_size = max(width, height)
        sar = max(aspect_ratio, 1.0 / aspect_ratio) - 1.0 if aspect_ratio else 0.0
        data.pop("file_name", None)

        data["wirelength"] = round(wirelength, 2)
        data["area"] = round(area, 2)
        data["aspect_ratio"] = round(aspect_ratio, 3)
        data["interposer_size"] = round(interposer_size, 2)
        data["SAR"] = round(sar, 4)
        data["max_temperature"] = round(max_t, 2)
        data["avg_temperature"] = round(avg_t, 2)
        drifts = []
        for k in old:
            if old[k] is None:
                continue
            rel = abs(float(old[k]) - float(data[k])) / max(1e-9, abs(float(data[k])))
            drifts.append((k, old[k], data[k], rel))
        if drifts:
            changed.append((layout_json, drifts))

        if not args.dry_run:
            with open(layout_json, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
                f.write("\n")
        written.append((layout_json, data))

    print(f"written: {len(written)}"
          f"{' (dry-run)' if args.dry_run else ''}")
    if changed:
        # Largest stored-vs-recomputed deviation per metric.  The stored
        # bt_tree/RL numbers were rounded to two decimals, so a few 1e-3
        # relative drifts are expected; anything above ~0.5% would mean the
        # recomputation disagrees with how the file was produced.
        worst = {}
        for layout_json, drifts in changed:
            for k, a, b, rel in drifts:
                if rel > worst.get(k, (0.0,))[0]:
                    worst[k] = (rel, layout_json, a, b)
        print("\nstored vs recomputed, largest relative deviation:")
        for k, (rel, layout_json, a, b) in sorted(worst.items()):
            print(f"  {k:16s} {rel * 100:7.3f}%  ({a} -> {b})  "
                  f"{os.path.relpath(layout_json, MPDAP_DIR)}")
        big = [(json_path, [(k, a, b) for k, a, b, rel in drifts
                            if k in ("wirelength", "area") and rel > 0.005])
               for json_path, drifts in changed]
        big = [(p, d) for p, d in big if d]
        print(f"wirelength/area differing by >0.5%: {len(big)} files")
        for json_path, d in big[:10]:
            print(f"  {os.path.relpath(json_path, MPDAP_DIR)}: "
                  + ", ".join(f"{k}: {a} -> {b}" for k, a, b in d))
    if missing_grid:
        print(f"\nno thermal grid, left untouched ({len(missing_grid)}):")
        for layout_json, grid in missing_grid:
            print(f"  {os.path.relpath(layout_json, MPDAP_DIR)}")
    if missing_case:
        print(f"\ncannot map to a benchmark case ({len(missing_case)}):")
        for layout_json in missing_case:
            print(f"  {os.path.relpath(layout_json, MPDAP_DIR)}")
    covered = {os.path.realpath(j[1]) for j in jobs}
    spare = unheated_layouts(covered)
    if spare:
        print(f"\nlayout JSONs with no thermal run, left untouched ({len(spare)}):")
        for path in spare:
            print(f"  {os.path.relpath(path, MPDAP_DIR)}")
    return 1 if (missing_grid or missing_case) else 0


if __name__ == "__main__":
    raise SystemExit(main())
