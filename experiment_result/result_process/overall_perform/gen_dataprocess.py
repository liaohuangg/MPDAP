#!/usr/bin/env python3
"""BT / RLP means and BA changes, for dataprocess.log.

The report that experiment_result.py prints covers only the four Gurobi
variants (OM, PM, PMd, PCA); BT and RLP are used there only to define the
case sets.  This script loads the two baselines from their own summaries and
adds

  * the mean of every metric over the three case sets for all six methods,
  * the BA change between methods, computed from those means,
  * the per-case BA changes relative to OM,
  * the count of cases above / equal to / below OM.

One convention only: inside a case set, each method is first averaged over
the cases it has in that set, and the change is

    (mean X / mean Y - 1) * 100

so negative means X is lower.  The two means can rest on different case
subsets -- on the "all" set BT has 7 cases while OM has 8 -- which is the
same convention the avg.txt table uses.  The cases behind every mean and
the resulting n are printed next to it.

BT and RLP records carry a `case` field; the four sweeps carry `file`.

Usage:
    python3 gen_dataprocess.py          # print the report
"""

import json
import os
import re
from decimal import Decimal, ROUND_HALF_UP

HERE = os.path.dirname(os.path.abspath(__file__))
RESULT_DIR = os.path.dirname(os.path.dirname(HERE))
PARAM_DIR = os.path.join(os.path.dirname(RESULT_DIR), "parameter_result")

SOURCES = (
    ("BT", "output_bt_tree/placement_results.json"),
    ("RLP", "output_rl/placement_results.json"),
    ("OM", "output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0/placement_results.json"),
    ("PM", "output_gurobi_EMIB_chiplet_5_6_01_17/placement_results.json"),
    ("PmdM", "output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement_results.json"),
    ("PcaM", "output_gurobi_EMIB_chiplet_5_6_01_17_md0_ca1/placement_results.json"),
)

METHODS = tuple(label for label, _path in SOURCES)

CASE_ORDER = ["ascend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m",
              "multigpu", "syn1", "syn5"]

# (record key, label, unit, decimals)
METRICS = (
    ("area", "BA", "mm^2", 2),
    ("wirelength", "WL", "mm", 2),
    ("SAR", "SAR", "", 3),
    ("max_temperature", "MaxT", "degC", 2),
)

# Ordered pairs quoted in the bounding-box-area paragraph.
PAIRS = (
    ("OM", "BT"),
    ("OM", "RLP"),
    ("PM", "BT"),
    ("PM", "RLP"),
    ("PM", "OM"),
    ("PmdM", "PM"),
    ("PcaM", "PM"),
)


def round_half_up(value, digits):
    quantum = Decimal(1).scaleb(-digits)
    return Decimal(str(value)).quantize(quantum, rounding=ROUND_HALF_UP)


def fmt(value, digits=2):
    if value is None:
        return "-"
    return f"{round_half_up(value, digits):.{digits}f}"


def pct(value, digits=2):
    """Signed percentage, e.g. -25.94%."""
    if value is None:
        return "-"
    return f"{round_half_up(value, digits):+.{digits}f}%"


def case_of(record):
    if record.get("case"):
        return record["case"]
    return os.path.splitext(record["file"])[0]


def load_data():
    """method -> case -> {metric key: value}."""
    data = {}
    for label, rel_path in SOURCES:
        path = os.path.join(RESULT_DIR, rel_path)
        data[label] = {}
        with open(path, "r", encoding="utf-8") as f:
            for record in json.load(f):
                data[label][case_of(record)] = {
                    key: record.get(key) for key, _lab, _unit, _dig in METRICS
                }
    return data


def sort_cases(cases):
    order = {case: i for i, case in enumerate(CASE_ORDER)}
    return sorted(set(cases), key=lambda c: (order.get(c, len(order)), c))


def case_sets(data):
    return [
        ("all", sort_cases(data["OM"])),
        ("BT", sort_cases(data["BT"])),
        ("RLP", sort_cases(data["RLP"])),
    ]


def mean_over(data, method, cases, key):
    """(mean, n) over the cases of `cases` where the method has a value."""
    values = [data[method][case][key] for case in cases
              if case in data[method] and data[method][case].get(key) is not None]
    if not values:
        return None, 0
    return sum(values) / len(values), len(values)


def change_from_means(data, x, y, cases, key="area"):
    """(change %, mean X, n X, mean Y, n Y) with each mean on its own cases."""
    mx, nx = mean_over(data, x, cases, key)
    my, ny = mean_over(data, y, cases, key)
    if mx is None or my is None:
        return None, mx, nx, my, ny
    return (mx / my - 1) * 100, mx, nx, my, ny


def load_sweep(filename, delimiter):
    """beta4 columns and case -> values for one parameter_result file."""
    path = os.path.join(PARAM_DIR, filename)
    with open(path, "r", encoding="utf-8") as f:
        rows = [line.rstrip("\n") for line in f if line.strip()]
    betas = rows[0].split(delimiter)[1:]
    sweep = {}
    for line in rows[1:]:
        parts = line.split(delimiter)
        sweep[parts[0].strip()] = [float(x.replace(",", "")) for x in parts[1:]]
    return betas, sweep


def load_runtime():
    """case -> [BT, RLP, OM, PM, PmdM, PcaM] from the runtime table."""
    path = os.path.join(RESULT_DIR, "result_process", "time", "allcasetime.txt")
    rows = {}
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            text = line.strip()
            if not (text.startswith("$") and text.endswith(r"\\") and " & " in text):
                continue
            fields = text[:-2].strip().split(" & ")
            case = (fields[0].strip("$")
                    .replace(r"\_", "_").replace(r"\text{-}", "-"))
            rows[case] = [float(re.search(r"[0-9]+(?:\.[0-9]+)?", cell).group())
                          for cell in fields[1:]]
    return rows


def header(title):
    print()
    print("=" * 78)
    print(title)
    print("=" * 78)


def main():
    data = load_data()
    sets = case_sets(data)

    header("Baseline (BT / RLP) means and BA changes")
    print("Companion to the experiment_result.py report above; same JSONs.")
    print("Convention: inside a case set, each method is first averaged over")
    print("the cases it has in that set, then the change is mean X / mean Y.")
    print("Percentages are signed: negative means the first method is lower.")

    print()
    print("Case sets")
    for name, cases in sets:
        print(f"  {name:<4s} (n={len(cases)}): {', '.join(cases)}")

    # ---- means per case set, all six methods --------------------------------
    header("Mean values per case set (each method over its cases in the set)")
    for key, label, unit, digits in METRICS:
        head = f"{label} ({unit})" if unit else label
        print(f"\n## {head}")
        print("| Case set | n | " + " | ".join(f"{m:>10s}" for m in METHODS) + " |")
        print("| -------- | - | " + " | ".join("-" * 10 for _ in METHODS) + " |")
        for name, cases in sets:
            cells = []
            for method in METHODS:
                value, n = mean_over(data, method, cases, key)
                cells.append(f"{fmt(value, digits)} (n={n})")
            print(f"| {name:<8s} | {len(cases)} | " + " | ".join(f"{c:>10s}" for c in cells) + " |")

    # ---- change from those means, every metric ------------------------------
    for key, label, unit, digits in METRICS:
        head = f"{label} ({unit})" if unit else label
        header(f"{label} change computed from the method means within each case set")
        print(f"Metric: {head}.  X/Y-1 from the means above, each mean taken")
        print("over the cases the method has inside that case set.")
        print("| Case set | Comparison | n(X) | mean X | n(Y) | mean Y | X/Y-1 |")
        print("| -------- | ---------- | ---- | ------ | ---- | ------ | ----- |")
        for name, cases in sets:
            for x, y in PAIRS:
                change, mx, nx, my, ny = change_from_means(data, x, y, cases, key)
                if change is None:
                    continue
                print(f"| {name:<8s} | {x:>5s}/{y:<4s} | {nx:>4d} | {mx:9.{digits}f} | "
                      f"{ny:>4d} | {my:9.{digits}f} | {pct(change):>7s} |")

    # ---- MaxT absolute difference (degC) ------------------------------------
    header("MaxT mean difference in degC (mean X - mean Y)")
    print("Absolute counterpart of the relative table above; the means are")
    print("the MaxT means over each method's cases in the set.")
    print("| Case set | Comparison | n(X) | mean X | n(Y) | mean Y | X-Y (degC) |")
    print("| -------- | ---------- | ---- | ------ | ---- | ------ | ---------- |")
    for name, cases in sets:
        for x, y in PAIRS:
            mx, nx = mean_over(data, x, cases, "max_temperature")
            my, ny = mean_over(data, y, cases, "max_temperature")
            if mx is None or my is None:
                continue
            print(f"| {name:<8s} | {x:>5s}/{y:<4s} | {nx:>4d} | {mx:9.2f} | "
                  f"{ny:>4d} | {my:9.2f} | {mx - my:+9.2f} |")

    # ---- counts against OM --------------------------------------------------
    header("Count of cases with BA above / equal to / below OM")
    print("| Method | larger | equal | smaller | larger cases | smaller cases |")
    print("| ------ | ------ | ----- | ------- | ------------ | ------------- |")
    for method in METHODS:
        if method == "OM":
            continue
        larger, equal, smaller = [], [], []
        for case, row in data[method].items():
            if case not in data["OM"]:
                continue
            a, b = row.get("area"), data["OM"][case].get("area")
            if a is None or b is None:
                continue
            if a > b + 1e-9:
                larger.append(case)
            elif a < b - 1e-9:
                smaller.append(case)
            else:
                equal.append(case)
        print(f"| {method:<6s} | {len(larger):>6d} | {len(equal):>5d} | {len(smaller):>7d} | "
              f"{', '.join(larger) or '-':<12s} | {', '.join(smaller) or '-':<13s} |")

    # ---- per-case values ----------------------------------------------------
    header("Per-case values, all six methods")
    for key, label, unit, digits in METRICS:
        head = f"{label} ({unit})" if unit else label
        print(f"\n## {head}")
        print("| case | " + " | ".join(f"{m:>9s}" for m in METHODS) + " |")
        print("| ---- | " + " | ".join("-" * 9 for _ in METHODS) + " |")
        for case in CASE_ORDER:
            cells = []
            for method in METHODS:
                row = data[method].get(case)
                cells.append(fmt(row.get(key), digits) if row else "-")
            print(f"| {case:<11s} | " + " | ".join(f"{c:>9s}" for c in cells) + " |")

    header("Per-case BA change relative to OM (%)")
    print("| case | " + " | ".join(f"{m:>9s}" for m in METHODS if m != "OM") + " |")
    print("| ---- | " + " | ".join("-" * 9 for m in METHODS if m != "OM") + " |")
    for case in CASE_ORDER:
        base = data["OM"].get(case, {}).get("area")
        cells = []
        for method in METHODS:
            if method == "OM":
                continue
            value = data[method].get(case, {}).get("area")
            cells.append(pct((value / base - 1) * 100) if value is not None and base else "-")
        print(f"| {case:<11s} | " + " | ".join(f"{c:>9s}" for c in cells) + " |")

    # ---- beta4 sweep (parameter_result) -------------------------------------
    header("beta4 weight sweep (parameter_result)")
    sweeps = (
        ("BA", "area.txt", "\t", 2),
        ("WL", "wirelength.txt", "\t", 2),
        ("SAR", "sar.txt", "\t", 4),
        ("MaxT", "maxt.txt", ",", 2),
    )
    print("Columns are beta4 = 0, 0.1, ..., 2.3.  Every case in CASE_ORDER is")
    print("listed; the extra sys_micro150 row in three of the files duplicates")
    print("cpu-dram and is skipped.")
    for label, filename, delimiter, digits in sweeps:
        betas, sweep = load_sweep(filename, delimiter)
        print(f"\n## {label}  (beta4 = {betas[0]} .. {betas[-1]}, {len(betas)} columns)")
        print("| case | at 0 | at 2.3 | change | shape |")
        print("| ---- | ---- | ------ | ------ | ----- |")
        for case in CASE_ORDER:
            values = sweep.get(case)
            if not values:
                continue
            first, last = values[0], values[-1]
            rising = all(b >= a - 1e-9 for a, b in zip(values, values[1:]))
            falling = all(b <= a + 1e-9 for a, b in zip(values, values[1:]))
            if max(values) - min(values) < 1e-12:
                shape = "constant"
            elif rising:
                shape = "non-decreasing"
            elif falling:
                shape = "non-increasing"
            else:
                shape = "mixed"
            change = last - first
            print(f"| {case:<11s} | {fmt(first, digits):>9s} | {fmt(last, digits):>9s} | "
                  f"{change:+.{digits}f} | {shape} |")

    # ---- runtime (result_process/time/allcasetime.txt) ----------------------
    header("Runtime (result_process/time/allcasetime.txt)")
    print("Seconds; 3600 marks the timeout.  BT is the runtime of the selected")
    print("solution (the cheapest of its five seeds).")
    print("Columns: BT, RLP, OM, PM, PmdM, PcaM.")
    runtime = load_runtime()

    def mean_time(index, cases):
        return sum(runtime[c][index] for c in cases) / len(cases)

    cases = list(runtime)  # the runtime table has more cases than CASE_ORDER
    bt_solved = [c for c in cases if runtime[c][0] < 3600]
    bt_timeout = [c for c in cases if runtime[c][0] >= 3600]
    print(f"\nBT solves {len(bt_solved)}: {', '.join(bt_solved)}")
    print(f"BT times out on {len(bt_timeout)}: {', '.join(bt_timeout)}")
    print(f"  BT mean over its solved cases: {mean_time(0, bt_solved):.2f} s")
    without_syn5 = [c for c in bt_solved if c != "syn5"]
    print(f"  BT mean without syn5: {mean_time(0, without_syn5):.2f} s")
    print(f"  OM mean on the same {len(bt_solved)} cases: "
          f"{mean_time(2, bt_solved):.2f} s "
          f"({mean_time(2, bt_solved) / mean_time(0, bt_solved):.2f}x BT)")
    winners = [f"{c}:{'BT' if runtime[c][0] < runtime[c][2] else 'OM'}"
               for c in bt_solved]
    print("  faster method per case: " + ", ".join(winners))

    common = [c for c in cases
              if all(runtime[c][i] < 3600 for i in (3, 4, 5))]
    print(f"\nPM, PmdM and PcaM all solve {len(common)} cases: "
          f"{', '.join(common)}")
    for index, name in ((2, "OM"), (3, "PM"), (4, "PmdM"), (5, "PcaM")):
        print(f"  {name:<5s} mean over those cases: {mean_time(index, common):.2f} s")

    stage1 = [c for c in cases if runtime[c][2] < 300]
    stage2 = [c for c in cases if 300 <= runtime[c][2] < 600]  # 300 s + 300 s
    stage3 = [c for c in cases if 600 <= runtime[c][2] < 3600]
    timed_out = [c for c in cases if runtime[c][2] >= 3600]
    print(f"\nOM stage 1 (<300 s, {len(stage1)}): {', '.join(stage1)}")
    print(f"OM stage 2 ({len(stage2)}): {', '.join(stage2)}")
    print(f"OM stage 3 ({len(stage3)}): {', '.join(stage3)}")
    print(f"OM timeout ({len(timed_out)}): {', '.join(timed_out)}")

    print()
    print("Notes")
    print("  * Every change above is mean X / mean Y - 1, with the two means")
    print("    taken over the cases each method has inside the case set.")
    print("  * PmdM has a multigpu record (area 19881.00) but no temperature")
    print("    fields; its MaxT mean therefore rests on 7 cases, not 8.")
    print("  * Percentages are BA only; WL, SAR and MaxT appear as raw means.")
    print()


if __name__ == "__main__":
    main()
