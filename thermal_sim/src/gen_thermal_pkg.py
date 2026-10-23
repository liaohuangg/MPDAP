#!/usr/bin/env python3
"""Regenerate thermal_sim/thermal_pkg.txt from the selected result layouts.

Sizing rule (2026-10-23) -- the package is sized by the *evaluated* layouts:
  * bt_tree: per case, the single solution with the smallest cost
    (`solution_*_cost_<c>.json`, smallest c) -- the one written into
    experiment_result/output_bt_tree/placement_results.json;
  * RL:      per case, the single solution with the largest reward
    (`solution_*_reward_<r>.json`, largest r) -- likewise;
  * the four gurobi experiment sweeps: every layout in placement/;
  * the parameter sweeps: every layout in placement/.
The non-selected bt_tree/RL seeds are not evaluated and do not count.
Excluded (not engineering-feasible / preview input):
  output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement/multigpu.json,
  experiment_result/result_process,
  parameter_result/output_gurobi_EMIB_chiplet_5_6_01_24, ..._25.

interposer_size = longest side of the layout bounding box (mm).  The per-case
maximum over all sources is the package edge used by the `case` package mode
(gen_flp_trace.py --package_mode case, CASE_MAX_INTERPOSER_MM), i.e. every
layout of a case is centred in one square of that size before HotSpot runs.

Usage:
    python3 src/gen_thermal_pkg.py            # rewrite thermal_pkg.txt
    python3 src/gen_thermal_pkg.py --check    # compare with the file, no write
"""

import argparse
import datetime
import glob
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
THERMAL_DIR = os.path.dirname(HERE)
MPDAP_DIR = os.path.dirname(THERMAL_DIR)
EXP_DIR = os.path.join(MPDAP_DIR, "experiment_result")
PAR_DIR = os.path.join(MPDAP_DIR, "parameter_result")
OUT_PATH = os.path.join(THERMAL_DIR, "thermal_pkg.txt")

CASES = ["ascend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu",
         "syn1", "syn5"]
GUROBI_DIRS = ["output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0",
               "output_gurobi_EMIB_chiplet_5_6_01_17",
               "output_gurobi_EMIB_chiplet_5_6_01_17_md0_ca1",
               "output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0"]
EXCLUDE_GUROBI_FILES = {("output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0",
                         "multigpu.json")}
EXCLUDE_PAR_DIRS = {"output_gurobi_EMIB_chiplet_5_6_01_24",
                    "output_gurobi_EMIB_chiplet_5_6_01_25"}
SPREADER_SCALE = 2.0
SINK_SCALE = 4.0          # relative to the interposer edge
R_CONVEC_REF = 0.1 * 0.06 * 0.06


def bbox_edge(path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
    xs = [c["x-position"] for c in data["chiplets"]]
    ys = [c["y-position"] for c in data["chiplets"]]
    w = max(c["x-position"] + c["width"] for c in data["chiplets"]) - min(xs)
    h = max(c["y-position"] + c["height"] for c in data["chiplets"]) - min(ys)
    return round(max(w, h), 2)


def pick_best(case_dir, pattern, how):
    if not os.path.isdir(case_dir):
        return None
    vals = []
    for fname in os.listdir(case_dir):
        m = re.search(pattern, fname)
        if m:
            vals.append((float(m.group(1)), os.path.join(case_dir, fname)))
    if not vals:
        return None
    return (min(vals) if how == "min" else max(vals))[1]


def collect():
    """{source: [(case, label, edge, path)]} for every counted layout."""
    sources = {"bt_tree": [], "rl": [], "gurobi": [], "parameter": []}

    # Sizing follows the *evaluation set*: bt_tree and RL contribute only the
    # solution written into placement_results.json (lowest cost / highest
    # reward); their other seeds are not evaluated and do not size the package.
    for case in CASES:
        p = pick_best(os.path.join(EXP_DIR, "output_bt_tree", case),
                      r"_cost_([0-9.]+)\.json$", "min")
        if p:
            sources["bt_tree"].append((case, os.path.relpath(p, MPDAP_DIR),
                                       bbox_edge(p), p))
        p = pick_best(os.path.join(EXP_DIR, "output_rl", case),
                      r"_reward_([0-9.]+)\.json$", "max")
        if p:
            sources["rl"].append((case, os.path.relpath(p, MPDAP_DIR),
                                  bbox_edge(p), p))

    for name in GUROBI_DIRS:
        placement = os.path.join(EXP_DIR, name, "placement")
        for fname in sorted(os.listdir(placement)):
            if not fname.endswith(".json") or (name, fname) in EXCLUDE_GUROBI_FILES:
                continue
            p = os.path.join(placement, fname)
            rel = os.path.relpath(p, MPDAP_DIR)
            sources["gurobi"].append((os.path.splitext(fname)[0], rel,
                                      bbox_edge(p), p))

    for d in sorted(glob.glob(os.path.join(PAR_DIR, "output_gurobi_*"))):
        if os.path.basename(d) in EXCLUDE_PAR_DIRS:
            continue
        placement = os.path.join(d, "placement")
        if not os.path.isdir(placement):
            continue
        for fname in sorted(os.listdir(placement)):
            if not fname.endswith(".json"):
                continue
            p = os.path.join(placement, fname)
            rel = os.path.relpath(p, MPDAP_DIR)
            sources["parameter"].append((os.path.splitext(fname)[0], rel,
                                         bbox_edge(p), p))
    return sources


def per_case(entries):
    out = {}
    for case, _rel, edge, _p in entries:
        out.setdefault(case, []).append(edge)
    return out


def render(sources):
    today = datetime.date.today().isoformat()
    lines = []
    add = lines.append
    add("# thermal_pkg.txt")
    add(f"# Generated: {today}")
    add("# interposer_size = longest side of the layout bounding box (mm)")
    add("")
    add("# Sizing rule (2026-10-23): the package edge of a case is the largest")
    add("# bounding-box longest side over the layouts that are evaluated:")
    add("#   bt_tree   = the lowest-cost solution of the case (one layout);")
    add("#   RL        = the highest-reward solution of the case (one layout);")
    add("#   gurobi    = every layout of the four experiment sweeps;")
    add("#   parameter = every layout of the parameter sweeps.")
    add("# bt_tree/RL's other seeds are not evaluated and do not size the package.")
    add("")
    add("# layer sizes used by the HotSpot simulation")
    add("# interposer (TIM / Substrate / C4-underfill) = a square, the layout centred")
    add("#   inside it. HotSpot requires every layer in the .lcf to have the same")
    add("#   width/height, so the chip layer's floorplan is this size too, with TIM")
    add("#   filler blocks in the margin.")
    add("# two sizing modes (gen_flp_trace.py --package_mode / run_all_thermal.py):")
    add("#   layout (default) = this layout's own bounding-box longest side;")
    add("#   case             = the case's largest bounding-box longest side across")
    add("#                      all of its layouts (the tables below).")
    add("# units: mm")
    add("")
    add("# heat sink & heat spreader")
    add("# heat spreader = 2 x interposer edge")
    add("# heat sink      = 2 x heat spreader edge  (= 4 x interposer)")
    add("# units: mm (the *_m columns are the values written into example.config, in meters)")
    add("")
    add("# convective resistance (TAP-2.5D rule):")
    add("# r_convec = 1 / (h * A_sink) = 0.1 * 0.06^2 / s_sink^2  (K/W),")
    add("# 0.1 K/W and 0.06 m being the HotSpot template defaults for (r_convec, s_sink).")
    add("")
    add("# Exclusion scope")
    add("# Excluded layouts are not engineering-feasible; the preview input directory is not a result layout.")
    add("[Scope]")
    add("experiment_result: exclude file experiment_result/output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement/multigpu.json  # not engineering-feasible")
    add("                   exclude directory experiment_result/result_process  # preview input, not a result layout")
    add("parameter_result : exclude directories parameter_result/output_gurobi_EMIB_chiplet_5_6_01_24 and ..._25  # not engineering-feasible")
    add("")

    for key, title in (("bt_tree", "experiment_result: output_bt_tree"),
                       ("rl", "experiment_result: output_rl"),
                       ("gurobi", "experiment_result: gurobi sweeps"),
                       ("parameter", "parameter_result")):
        grouped = per_case(sources[key])
        add(f"[{title}]")
        add("case              n       min       max")
        add("----------------------------------------")
        for case in CASES:
            vals = grouped.get(case, [])
            if vals:
                add(f"{case:<12s}{len(vals):8d}{min(vals):10.2f}{max(vals):10.2f}")
            else:
                add(f"{case:<12s}{0:8d}{'-':>10s}{'-':>10s}")
        add("")

    add("[File composition per case]")
    add("case           bt_tree   rl  gurobi experiment parameter")
    add("--------------------------------------------------------------")
    counts = {k: per_case(sources[k]) for k in sources}
    for case in CASES:
        b = len(counts["bt_tree"].get(case, []))
        r = len(counts["rl"].get(case, []))
        g = len(counts["gurobi"].get(case, []))
        p = len(counts["parameter"].get(case, []))
        add(f"{case:<12s}{b:8d}{r:5d}{g:8d}{b + r + g:11d}{p:10d}")
    add("")

    combined = {}
    for case in CASES:
        vals = (counts["bt_tree"].get(case, []) + counts["rl"].get(case, [])
                + counts["gurobi"].get(case, []) + counts["parameter"].get(case, []))
        combined[case] = max(vals) if vals else None

    add("[Combined maximum and thermal config]")
    add("case            max_inter   spreader   spreader_m       sink     sink_m    r_convec")
    add("---------------------------------------------------------------------------------")
    for case in CASES:
        edge = combined[case]
        if edge is None:
            add(f"{case:<12s}{'-':>10s}{'-':>10s}{'-':>12s}{'-':>10s}{'-':>11s}{'-':>12s}")
            continue
        spreader = edge * SPREADER_SCALE
        sink = edge * SINK_SCALE
        r_convec = R_CONVEC_REF / (sink / 1000.0) ** 2
        add(f"{case:<12s}{edge:10.2f}{spreader:10.2f}{spreader / 1000.0:12.6f}"
            f"{sink:10.2f}{sink / 1000.0:11.6f}{r_convec:12.9f}")
    add("")

    add("[Source file of max interposer per case]")
    all_entries = []
    for key in sources:
        all_entries.extend(sources[key])
    for case in CASES:
        entries = [e for e in all_entries if e[0] == case]
        if not entries:
            add(f"{case:<12s}{'-':>6s}  -")
            continue
        best = max(entries, key=lambda e: e[2])
        ties = [e for e in entries if abs(e[2] - best[2]) < 1e-9]
        suffix = f" (tie: {len(ties)} files)" if len(ties) > 1 else ""
        add(f"{case:<12s}{best[2]:6.2f}  {best[1]}{suffix}")
    add("")
    return "\n".join(lines)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--check", action="store_true", help="compare only")
    args = ap.parse_args()
    text = render(collect())
    if args.check:
        old = open(OUT_PATH, encoding="utf-8").read()
        print("identical" if old == text else "differs")
        return 0 if old == text else 1
    with open(OUT_PATH, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"wrote {OUT_PATH}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
