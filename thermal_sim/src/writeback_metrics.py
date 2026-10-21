"""Write thermal results and layout metrics back into the placement JSONs.

For every layout that has a HotSpot run under config_sum, this script

  1. reads the layer-2 grid temperatures from output/<name>.grid.steady
     (max and mean over the grid, in Celsius -- the same numbers the thermal
     maps are drawn from),
  2. recomputes wirelength / area / aspect_ratio with the project's own
     calculator, MPDAP/src/calculate_area_and_aspect_ratio.py,
  3. derives interposer_size = max(bbox width, bbox height) and
     SAR = max(AR, 1/AR) - 1 (both as written by bt_tree),
  4. writes those seven fields back into the placement JSON in place,
  5. refreshes the per-group <group>/placement_results.json summary with one
     record per case (same seven fields).

Layouts without a thermal run (the sweeps excluded by thermal_pkg.txt) are
reported and left untouched; their summary records simply omit the two
temperature fields.

Usage:
    python3 src/writeback_metrics.py --dry-run
    python3 src/writeback_metrics.py
    python3 src/writeback_metrics.py --summaries-only
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


METRIC_KEYS = ("wirelength", "area", "aspect_ratio", "interposer_size", "SAR",
               "max_temperature", "avg_temperature")


def layout_groups():
    """(group dir, [(folder, filename, path)]) for both result trees.

    The gurobi sweeps keep their layouts in <group>/placement/*.json; bt_tree
    and RL keep one directory per case holding solution_*.json.
    """
    out = []
    for tree in ("experiment_result", "parameter_result"):
        root = os.path.join(MPDAP_DIR, tree)
        if not os.path.isdir(root):
            continue
        for group in sorted(os.listdir(root)):
            gdir = os.path.join(root, group)
            if not os.path.isdir(gdir):
                continue
            placement = os.path.join(gdir, "placement")
            if os.path.isdir(placement):
                layouts = [(group, f, os.path.join(placement, f))
                           for f in sorted(os.listdir(placement))
                           if f.endswith(".json")]
            else:
                layouts = []
                for case in sorted(os.listdir(gdir)):
                    cdir = os.path.join(gdir, case)
                    if not os.path.isdir(cdir):
                        continue
                    for f in sorted(os.listdir(cdir)):
                        if f.startswith("solution_") and f.endswith(".json"):
                            layouts.append((f"{group}/{case}", f,
                                            os.path.join(cdir, f)))
            if layouts:
                out.append((gdir, layouts))
    return out


def write_group_summaries(dry_run):
    """One record per case in <group>/placement_results.json."""
    written = []
    for gdir, layouts in layout_groups():
        records = []
        for folder, fname, path in layouts:
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)
            record = {"folder": folder, "file": fname}
            for key in METRIC_KEYS:
                if key in data:
                    record[key] = data[key]
            records.append(record)
        out_path = os.path.join(gdir, "placement_results.json")
        if not dry_run:
            with open(out_path, "w", encoding="utf-8") as f:
                json.dump(records, f, indent=2, ensure_ascii=False)
                f.write("\n")
        written.append((out_path, records))
    return written


def compute_metrics(layout_json):
    """Recompute the five non-thermal fields in place in the loaded dict.

    Returns (data, old values), or None when the layout cannot be tied to a
    benchmark case (the wireCount lookup needs one).
    """
    case = case_name(layout_json)
    if case is None:
        return None
    with open(layout_json, "r", encoding="utf-8") as f:
        data = json.load(f)

    old = {k: data.get(k) for k in METRIC_KEYS[:5]}
    data["file_name"] = f"{case}.json"     # wireCount lookup only, not saved
    wirelength = CALC.calculate_total_wirelength(data)
    area, aspect_ratio = CALC.calculate_area_and_aspect_ratio(data)
    width, height = bbox_size(data)
    data.pop("file_name", None)

    data["wirelength"] = round(wirelength, 2)
    data["area"] = round(area, 2)
    data["aspect_ratio"] = round(aspect_ratio, 3)
    data["interposer_size"] = round(max(width, height), 2)
    data["SAR"] = round(max(aspect_ratio, 1.0 / aspect_ratio) - 1.0
                        if aspect_ratio else 0.0, 4)
    return data, old


def report_drift(layout_json, data, old):
    """[(path, [(key, stored, recomputed, relative diff)])] for the summary."""
    drifts = []
    for key, stored in old.items():
        if stored is None:
            continue
        rel = abs(float(stored) - float(data[key])) / max(1e-9, abs(float(data[key])))
        drifts.append((key, stored, data[key], rel))
    return [(layout_json, drifts)] if drifts else []


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true",
                    help="compute and print, do not touch the JSON files")
    ap.add_argument("--summaries-only", action="store_true",
                    help="only refresh <group>/placement_results.json")
    args = ap.parse_args()

    if args.summaries_only:
        written = write_group_summaries(args.dry_run)
        print(f"summaries: {len(written)} placement_results.json"
              f"{' (dry-run)' if args.dry_run else ''}")
        return 0

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

        result = compute_metrics(layout_json)
        if result is None:
            missing_case.append(layout_json)
            continue
        data, old = result

        temps = [t - 273.15 for t in read_layer_temps(grid, 2)]
        data["max_temperature"] = round(max(temps), 2)
        data["avg_temperature"] = round(sum(temps) / len(temps), 2)
        changed.extend(report_drift(layout_json, data, old))

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
        # No thermal run for these sweeps, but their layout metrics should
        # still follow the same calculator as everything else.
        print(f"\nlayout JSONs with no thermal run ({len(spare)}, "
              f"metrics refreshed, no temperature fields):")
        for path in spare:
            result = compute_metrics(path)
            rel = os.path.relpath(path, MPDAP_DIR)
            if result is None:
                print(f"  {rel}: skipped, unknown benchmark case")
                continue
            data, old = result
            changed.extend(report_drift(path, data, old))
            if not args.dry_run:
                with open(path, "w", encoding="utf-8") as f:
                    json.dump(data, f, indent=2, ensure_ascii=False)
                    f.write("\n")
            print(f"  {rel}")

    summaries = write_group_summaries(args.dry_run)
    n_no_temp = sum(1 for _, recs in summaries for r in recs
                    if "max_temperature" not in r)
    print(f"\nsummaries: {len(summaries)} placement_results.json"
          f"{' (dry-run)' if args.dry_run else ''}, "
          f"{sum(len(r) for _, r in summaries)} records, "
          f"{n_no_temp} without temperature (no thermal run)")
    return 1 if (missing_grid or missing_case) else 0


if __name__ == "__main__":
    raise SystemExit(main())
