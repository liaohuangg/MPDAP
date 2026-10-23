#!/usr/bin/env python3
"""Rewrite the BT column of allcasetime.txt with the selected solution's runtime.

BT should report the runtime of the layout the method actually returns, that is
the seed with the best cost among the five.  placement_results.json names that
seed for every solved case (its "file" field); the per-seed runtime lives in
placement_results_5seed.json, keyed by the same file name.  All other columns of
the table are left exactly as they are, and cases without a selected solution
keep the 3600 s timeout entry.

Usage:
    python3 gen_allcasetime.py            # rewrite the table
    python3 gen_allcasetime.py --dry-run  # print only
"""

import argparse
import json
import os
import re
from decimal import Decimal, ROUND_HALF_UP

HERE = os.path.dirname(os.path.abspath(__file__))
EXP_DIR = os.path.dirname(os.path.dirname(HERE))
BT_DIR = os.path.join(EXP_DIR, "output_bt_tree")
SELECTED = os.path.join(BT_DIR, "placement_results.json")
PER_SEED = os.path.join(BT_DIR, "placement_results_5seed.json")
TABLE = os.path.join(HERE, "allcasetime.txt")

GREEN = r"\textcolor{ForestGreen}{%s}"
NEW_NOTE = ("Note: BT is the runtime of the selected solution, i.e. the seed with the "
            "lowest cost among the five runs; 3600 s indicates a timeout; RLP reaches "
            "the 3600 s time limit in all cases.")
NOTE_RE = re.compile(r"Note: [^\n]*?all cases\.")


def cost_of(file_name):
    """The cost is embedded in the solution file name."""
    match = re.search(r"_cost_([0-9.]+)\.json$", file_name)
    if not match:
        raise ValueError("no cost in %s" % file_name)
    return Decimal(match.group(1))


def case_to_tex(case):
    return case.replace("_", r"\_").replace("-", r"\text{-}")


def tex_to_case(field):
    """Turn the first cell of a table row back into a case name."""
    name = field.strip()
    if name.startswith("$") and name.endswith("$"):
        name = name[1:-1]
    return name.replace(r"\text{-}", "-").replace(r"\_", "_")


def selected_runtimes():
    """case -> (second, selected file, its cost), reading both JSON files."""
    with open(PER_SEED, "r", encoding="utf-8") as f:
        per_seed = json.load(f)
    by_file = {rec["file"]: rec for rec in per_seed}
    best = {}
    for rec in per_seed:
        case = rec["folder"].split("/")[-1]
        cost = cost_of(rec["file"])
        if case not in best or cost < best[case][0]:
            best[case] = (cost, rec["file"])

    with open(SELECTED, "r", encoding="utf-8") as f:
        selected = json.load(f)
    runtimes = {}
    for rec in selected:
        case = rec["case"]
        file_name = rec["file"]
        if file_name not in by_file:
            raise KeyError("%s: selected %s has no per-seed record" % (case, file_name))
        if cost_of(file_name) > best[case][0]:
            print("warning: %s selected %s is not the cheapest seed"
                  % (case, file_name))
        runtimes[case] = by_file[file_name]["total_time"]
    return runtimes


def format_seconds(seconds):
    value = Decimal(str(seconds)).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)
    return str(value)


def rewrite(text, runtimes):
    lines = []
    for line in text.splitlines():
        stripped = line.strip()
        if stripped.startswith("$") and stripped.endswith(r"\\") and " & " in stripped:
            fields = stripped[:-2].rstrip().split(" & ")
            case = tex_to_case(fields[0])
            if case in runtimes:
                fields[1] = GREEN % format_seconds(runtimes[case])
                line = " & ".join(fields) + r" \\"
        lines.append(line)
    body = "\n".join(lines)

    body, replaced = NOTE_RE.subn(NEW_NOTE, body)
    if replaced != 1:
        raise RuntimeError("expected one table note, found %d" % replaced)
    return body + "\n"


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    runtimes = selected_runtimes()
    with open(TABLE, "r", encoding="utf-8") as f:
        text = f.read()
    table = rewrite(text, runtimes)

    for case in sorted(runtimes):
        print("%-12s %8s s" % (case, format_seconds(runtimes[case])))

    if args.dry_run:
        print(table)
        return
    with open(TABLE, "w", encoding="utf-8") as f:
        f.write(table)
    print("wrote %s" % TABLE)


if __name__ == "__main__":
    main()
