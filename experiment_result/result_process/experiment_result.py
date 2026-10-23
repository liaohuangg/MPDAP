#!/usr/bin/env python3
"""Average each metric over three case sets for the four gurobi variants.

The only inputs are the placement_results.json files that the sweeps wrote:

    OM   output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0/placement_results.json
    PM   output_gurobi_EMIB_chiplet_5_6_01_17/placement_results.json
    PMd  output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement_results.json
    PCA  output_gurobi_EMIB_chiplet_5_6_01_17_md0_ca1/placement_results.json

and, for the two restricted case sets,

    output_bt_tree/placement_results.json   the cases BT solves (7)
    output_rl/placement_results.json        the cases RLP solves (4)

For every metric the script prints one table: rows are the case sets
(all / BT / RLP), columns are the four variants, the cell is the plain mean
of that variant's per-case values inside the set.

An average always covers the cases the variant actually has inside the set --
PMd carries no multigpu record (that layout was excluded from the sweep as
not engineering-feasible), so its "all" and "BT" means rest on one case less.
The footnote under each table prints every column's n instead of hiding it.

Metrics: BA (area, mm^2), WL (wirelength, mm), SAR, MaxT (max temperature,
degC).  BA / WL / MaxT print two decimals, SAR three.  aspect_ratio,
interposer_size and avg_temperature stay in the JSONs; add them to METRICS
if a table is ever needed.  Time is not in these files and is not tabulated.

Usage:
    python3 experiment_result.py
"""

import json
import os
from decimal import Decimal, ROUND_HALF_UP

RESULT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# label -> placement_results.json that the variant's sweep wrote
SOURCES = {
    "OM": "output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0/placement_results.json",
    "PM": "output_gurobi_EMIB_chiplet_5_6_01_17/placement_results.json",
    "PMd": "output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement_results.json",
    "PCA": "output_gurobi_EMIB_chiplet_5_6_01_17_md0_ca1/placement_results.json",
}

# The two restricted case sets come from the baseline methods' summaries.
BT_SUMMARY = "output_bt_tree/placement_results.json"
RLP_SUMMARY = "output_rl/placement_results.json"

VARIANT_ORDER = ("OM", "PM", "PMd", "PCA")

CASE_ORDER = ["ascend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m",
              "multigpu", "syn1", "syn5", "syn4"]

# (record key, table label, unit, decimals)
METRICS = (
    ("area", "BA", "mm^2", 2),
    ("wirelength", "WL", "mm", 2),
    ("SAR", "SAR", "", 3),
    ("max_temperature", "MaxT", "degC", 2),
)


def round_half_up(value, digits):
    """Round on the decimal representation, not banker's rounding."""
    if value is None:
        return None
    quantum = Decimal(1).scaleb(-digits)
    return float(Decimal(str(value)).quantize(quantum, rounding=ROUND_HALF_UP))


def format_metric(value, digits):
    if value is None:
        return "-"
    return f"{round_half_up(value, digits):.{digits}f}"


def compute_sar(aspect_ratio):
    """Fallback only: SAR = max(AR, 1/AR) - 1 on the unrounded ratio.

    Identical to src/calculate_area_and_aspect_ratio.py; every record written
    by that script already carries the field, so this only covers a hand-made
    record that lost it.
    """
    if aspect_ratio is None:
        return None
    if not aspect_ratio:
        return 0.0
    return max(aspect_ratio, 1.0 / aspect_ratio) - 1.0


def load_json(rel_path):
    path = os.path.join(RESULT_DIR, rel_path)
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def case_of(record):
    """'output_bt_tree/syn1' records carry `case`; sweep records only `file`."""
    if record.get("case"):
        return record["case"]
    return os.path.splitext(record["file"])[0]


def sort_cases(cases):
    order = {case: i for i, case in enumerate(CASE_ORDER)}
    return sorted(set(cases), key=lambda c: (order.get(c, len(order)), c))


def load_data():
    """case -> variant -> {metric key: value}."""
    data = {}
    for label, rel_path in SOURCES.items():
        for record in load_json(rel_path):
            case = case_of(record)
            data.setdefault(case, {})[label] = {
                "area": record.get("area"),
                "wirelength": record.get("wirelength"),
                "SAR": (record["SAR"] if record.get("SAR") is not None
                        else compute_sar(record.get("aspect_ratio"))),
                "max_temperature": record.get("max_temperature"),
            }
    return data


def case_sets(all_cases):
    """[(name, cases, description)] for all / BT / RLP."""
    bt_cases = sort_cases(case_of(r) for r in load_json(BT_SUMMARY))
    rlp_cases = sort_cases(case_of(r) for r in load_json(RLP_SUMMARY))
    return [
        ("all", all_cases, "every case the four sweeps cover"),
        ("BT", bt_cases, "cases bt_tree solves"),
        ("RLP", rlp_cases, "cases RLP solves"),
    ]


def mean_over(data, cases, variant, key):
    """(mean, n) over the cases of `cases` where this variant has a value."""
    values = [
        data[case][variant][key]
        for case in cases
        if variant in data.get(case, {})
        and data[case][variant].get(key) is not None
    ]
    if not values:
        return None, 0
    return sum(values) / len(values), len(values)


def main():
    data = load_data()
    all_cases = sort_cases(data)
    sets = case_sets(all_cases)
    col_w = 9

    print("Case sets")
    for name, cases, note in sets:
        print(f"  {name:<4s} (n={len(cases)}): {', '.join(cases)}"
              f"  -- {note}")
    print()

    for key, label, unit, digits in METRICS:
        header = f"{label} ({unit})" if unit else label
        print(f"## {header}")
        print("| Case set | n | " + " | ".join(f"{v:>{col_w}s}" for v in VARIANT_ORDER) + " |")
        print("| -------- | - | " + " | ".join("-" * col_w for _ in VARIANT_ORDER) + " |")
        counts = []
        for name, cases, _note in sets:
            cells = []
            per_variant_n = []
            for variant in VARIANT_ORDER:
                value, n = mean_over(data, cases, variant, key)
                cells.append(f"{format_metric(value, digits):>{col_w}s}")
                per_variant_n.append(f"{variant} {n}")
            print(f"| {name:<8s} | {len(cases)} | " + " | ".join(cells) + " |")
            counts.append(f"{name}: " + ", ".join(per_variant_n))
        print()
        print("n: " + "; ".join(counts))
        print()

    # Per-case values behind the means, so a table cell can be traced back.
    print("## Per-case values")
    fields = ("area", "wirelength", "SAR", "max_temperature")
    print("| case | variant | " + " | ".join(fields) + " |")
    print("| ---- | ------- | " + " | ".join("-" * len(f) for f in fields) + " |")
    for case in all_cases:
        for variant in VARIANT_ORDER:
            row = data[case].get(variant)
            if not row:
                continue
            cells = []
            for field in fields:
                digits = (3 if field == "SAR" else 2)
                cells.append(format_metric(row[field], digits))
            print(f"| {case} | {variant} | " + " | ".join(cells) + " |")
    print()


if __name__ == "__main__":
    main()
