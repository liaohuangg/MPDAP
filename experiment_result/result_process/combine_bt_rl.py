#!/usr/bin/env python3
"""Average the 5-seed bt_tree / RL results per case into one table.

Sources (per-seed records, one line per seed):

    output_bt_tree/placement_results_5seed.json    30 records, 6 cases x 5
    output_rl/placement_results_5seed.json         20 records, 4 cases x 5

`output_bt_tree/summary.json` is the sweep's run log: it lists the cases and
how many seeds each produced, but carries no metrics, so it is only used to
order the cases; every number comes from the two 5-seed files.

The output holds one record per case, with the arithmetic mean over that
case's seeds of every metric: wirelength, area, aspect_ratio, interposer_size,
max_temperature, avg_temperature and SAR.  SAR is averaged seed by seed like
the rest -- it must not be recomputed from the averaged aspect ratio, because
SAR = max(AR, 1/AR) - 1 is convex and strongly curved around AR = 1: when the
seeds disagree on the aspect ratio, SAR(mean AR) understates the mean SAR
(bt_tree syn1: 0.054 vs 0.076; RL hp6_m: 1.26 vs 2.06).
Each method is written next to its own results:

    output_bt_tree/placement_results.json    6 bt_tree cases
    output_rl/placement_results.json         4 rl cases

Usage:
    python3 combine_bt_rl.py            # write both placement_results.json
    python3 combine_bt_rl.py --dry-run  # print only
"""

import argparse
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXP_DIR = os.path.dirname(HERE)                    # experiment_result/
BT_DIR = os.path.join(EXP_DIR, "output_bt_tree")
RL_DIR = os.path.join(EXP_DIR, "output_rl")

# Same rounding / SAR definition as the per-layout writeback.
SRC_DIR = os.path.join(os.path.dirname(EXP_DIR), "src")
if SRC_DIR not in sys.path:
    sys.path.insert(0, SRC_DIR)
from calculate_area_and_aspect_ratio import (  # noqa: E402
    SAR_DIGITS, compute_sar, round_half_up)

SOURCES = (("bt_tree", os.path.join(BT_DIR, "placement_results_5seed.json")),
           ("rl", os.path.join(RL_DIR, "placement_results_5seed.json")))
OUT_PATHS = {"bt_tree": os.path.join(BT_DIR, "placement_results.json"),
             "rl": os.path.join(RL_DIR, "placement_results.json")}
SUMMARY_PATH = os.path.join(BT_DIR, "summary.json")

# (key, decimals); the precision matches how the per-seed files are written.
# SAR is averaged over the seeds a few lines below, not re-derived from AR.
METRICS = (("wirelength", 2), ("area", 2), ("aspect_ratio", 3),
           ("interposer_size", 2), ("max_temperature", 2),
           ("avg_temperature", 2))


def split_folder(folder):
    """'output_bt_tree/acend910' -> ('output_bt_tree', 'acend910')."""
    head, _, tail = folder.partition("/")
    return head, tail or head


def case_order():
    """Case order from the bt sweep log, if it is around."""
    try:
        with open(SUMMARY_PATH, "r", encoding="utf-8") as f:
            summary = json.load(f)
    except (OSError, ValueError):
        return []
    return [r.get("case_name") for r in summary.get("results", [])]


def load_groups():
    """{(method, case): [records]} from the per-seed files."""
    groups = {}
    for method, path in SOURCES:
        with open(path, "r", encoding="utf-8") as f:
            records = json.load(f)
        for rec in records:
            folder, case = split_folder(rec.get("folder", ""))
            groups.setdefault((method, case), []).append(rec)
    return groups


def average(groups):
    """{method: [averaged records]} for one method's own output file."""
    order = case_order()
    cases = {case for _method, case in groups}
    # summary.json is only trustworthy as an ordering hint when it covers the
    # whole sweep; it often holds just the last run, so fall back to names.
    rank = {name: i for i, name in enumerate(order)} if cases <= set(order) else {}
    per_method = {}
    for (method, case) in sorted(
            groups, key=lambda k: (rank.get(k[1], len(rank)), k[1], k[0])):
        seed_recs = groups[(method, case)]
        rec = {"folder": f"output_{method}/{case}", "case": case,
               "seeds": len(seed_recs)}
        for key, decimals in METRICS:
            values = [float(r[key]) for r in seed_recs if key in r]
            if values:
                rec[key] = round(sum(values) / len(values), decimals)
        # SAR: mean of the per-seed values.  Deriving it from the averaged AR
        # instead is wrong whenever the seeds have different shapes -- see the
        # module docstring.
        sars = [float(r["SAR"]) for r in seed_recs if "SAR" in r]
        rec["SAR"] = (round_half_up(sum(sars) / len(sars), SAR_DIGITS) if sars
                      else compute_sar(rec.get("aspect_ratio")))
        per_method.setdefault(method, []).append(rec)
    return per_method


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    groups = load_groups()
    per_method = average(groups)

    today = [(m, c, len(v)) for (m, c), v in groups.items() if len(v) != 5]
    if today:
        print("warning: groups without exactly 5 seeds: "
              + ", ".join(f"{m}/{c}={n}" for m, c, n in sorted(today)))

    for method, records in sorted(per_method.items()):
        out_path = OUT_PATHS[method]
        if not args.dry_run:
            with open(out_path, "w", encoding="utf-8") as f:
                json.dump(records, f, indent=2, ensure_ascii=False)
                f.write("\n")
        print(f"{method}: {len(records)} averaged records"
              f"{' (dry-run)' if args.dry_run else f' -> {out_path}'}")
        for rec in records:
            print(f"  {rec['case']:12s} seeds={rec['seeds']} "
                  f"WL={rec['wirelength']} area={rec['area']} "
                  f"AR={rec['aspect_ratio']} SAR={rec['SAR']} "
                  f"maxT={rec['max_temperature']} avgT={rec['avg_temperature']}")


if __name__ == "__main__":
    main()
