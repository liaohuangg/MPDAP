#!/usr/bin/env python3
"""Rebuild parameter_result/maxt.txt from the sweep's placement_results.json.

Columns are the alpha values 0, 0.1, ..., 2.3:

  * column 0 comes from experiment_result/output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0/
  * column 0.1 / 0.2 / ... / 2.3 comes from output_gurobi_EMIB_chiplet_5_6_01_XX/
    in this directory, where the suffix XX encodes the value with the dot and
    the trailing zero dropped: 01 -> 0.1, 09 -> 0.9, 1 -> 1.0, 11 -> 1.1,
    ..., 2 -> 2.0, 23 -> 2.3.

Every cell is that case's `max_temperature` in the corresponding
placement_results.json -- nothing is typed by hand.  Usage:

    python3 build_maxt_table.py            # rewrite maxt.txt
    python3 build_maxt_table.py --dry-run  # print only
"""

import argparse
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
EXP_DIR = os.path.join(os.path.dirname(HERE), "experiment_result")

ZERO_JSON = os.path.join(
    EXP_DIR, "output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0",
    "placement_results.json")

# (column label, directory suffix) -- label order is the output column order.
COLUMNS = [("0", None)] + [(f"{i / 10:g}", None) for i in range(1, 24)]

CASES = ["acend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu",
         "syn1", "syn5"]


def suffix(label):
    """'0.1' -> '01', '1' -> '1', '1.1' -> '11', '2.3' -> '23'."""
    return label.replace(".", "")


def load(path):
    """case -> max_temperature from one placement_results.json."""
    with open(path, "r", encoding="utf-8") as f:
        records = json.load(f)
    out = {}
    for rec in records:
        case = rec.get("case") or os.path.splitext(rec.get("file", ""))[0]
        out[case] = rec.get("max_temperature")
    return out


def fmt(value):
    """106.0 -> '106', 85.48 -> '85.48' (same style the table already used)."""
    if value is None:
        raise ValueError("missing max_temperature")
    return f"{float(value):g}"


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    table = {case: [] for case in CASES}
    for idx, (label, _) in enumerate(COLUMNS):
        if idx == 0:
            path = ZERO_JSON
        else:
            path = os.path.join(
                HERE, f"output_gurobi_EMIB_chiplet_5_6_01_{suffix(label)}",
                "placement_results.json")
        if not os.path.exists(path):
            raise SystemExit(f"column {label}: missing {path}")
        values = load(path)
        for case in CASES:
            table[case].append(fmt(values.get(case)))

    lines = ["case," + ",".join(label for label, _ in COLUMNS)]
    lines += [case + "," + ",".join(table[case]) for case in CASES]
    text = "\n".join(lines) + "\n"

    if args.dry_run:
        print(text, end="")
        return
    out_path = os.path.join(HERE, "maxt.txt")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"wrote {out_path}: {len(CASES)} cases x {len(COLUMNS)} columns")


if __name__ == "__main__":
    main()
