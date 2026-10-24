#!/usr/bin/env python3
"""Write the five-seed BT / RLP table (mean +- std).

Inputs are the per-seed records of the two baselines:

    output_bt_tree/placement_results_5seed.json   6 cases x 5 seeds + syn5 x 2
    output_rl/placement_results_5seed.json        4 cases x 5 seeds

The table spans the full text width.  The first column names the method (BT or
RLP), the second the test case, the third the solve rate as solved seeds over
the five seeds run (e.g. 2/5), and the remaining five columns carry BA, WL,
SAR, MaxT and Time.  The column heads carry no unit (BA in mm^2, WL in mm,
MaxT in degC, Time in s) and every column is separated by a vertical rule, the
way the metric tables of the paper are set.

A value is the mean and the population standard deviation (ddof = 0) over the
seeds that produced a layout; syn5 is solved by BT on 2 of the 5 seeds, so its
BT value rests on those two.  RL hit the 3600 s budget in every run, so its
time is the cap with zero spread.  A method without a layout shows "--".

The table is written to btrl/btrl_mean.txt next to this script.

Usage:
    python3 gen_btrl_table.py            # write the table
    python3 gen_btrl_table.py --dry-run  # print only
"""

import argparse
import json
import os
import sys
from decimal import Decimal, ROUND_HALF_UP, getcontext

# Exact decimal arithmetic: with n = 2 the syn5 statistics land on exact ties
# (mean area 1240.875, std 81.395), and binary floats round those ties
# inconsistently from one cell to the next.
getcontext().prec = 28

HERE = os.path.dirname(os.path.abspath(__file__))
EXP_DIR = os.path.dirname(os.path.dirname(HERE))
BT_5SEED = os.path.join(EXP_DIR, "output_bt_tree", "placement_results_5seed.json")
RL_5SEED = os.path.join(EXP_DIR, "output_rl", "placement_results_5seed.json")
OUT_PATH = os.path.join(HERE, "btrl_mean.txt")

SEEDS = 5
# RL was stopped by the time budget in every run, so its runtime has no spread.
RL_TIME = 3600.0

CASE_ORDER = ["ascend910", "cpu-dram", "hp6_m", "hp8_m", "multigpu",
              "syn1", "syn5"]

# (column head, record key, decimals); the head carries no unit on purpose.
METRICS = (("BA", "area", 2),
           ("WL", "wirelength", 2),
           ("SAR", "SAR", 3),
           ("MaxT", "max_temperature", 2),
           ("Time", "total_time", 2))


def round_half_up(value, digits):
    quantum = Decimal(1).scaleb(-digits)
    return Decimal(str(value)).quantize(quantum, rounding=ROUND_HALF_UP)


def group_by_case(path):
    with open(path, "r", encoding="utf-8") as f:
        records = json.load(f)
    groups = {}
    for rec in records:
        case = rec["folder"].split("/")[-1]
        groups.setdefault(case, []).append(rec)
    return groups


def mean_std(values):
    numbers = [Decimal(str(value)) for value in values]
    n = Decimal(len(numbers))
    mean = sum(numbers) / n
    variance = sum((value - mean) ** 2 for value in numbers) / n
    return mean, variance.sqrt()


def green(text):
    return r"\textcolor{ForestGreen}{%s}" % text


def case_label(case):
    """The names are set in math mode; "-" would come out as a minus sign."""
    return case.replace("_", r"\_").replace("-", r"\text{-}")


def mean_value(records, key, digits):
    values = [float(rec[key]) for rec in records if rec.get(key) is not None]
    if not values:
        return "--"
    mean, std = mean_std(values)
    return r"%s$\pm$%s" % (round_half_up(mean, digits),
                           round_half_up(std, digits))


def time_value(records, is_cap):
    # RL was stopped by the budget on every run; its records carry no time.
    if is_cap:
        return r"%s$\pm$%s" % (round_half_up(RL_TIME, 2), round_half_up(0.0, 2))
    return mean_value(records, "total_time", 2)


def method_rows(method, groups):
    """One row per case the method solves; the method name spans the block.

    A case that no seed solves (RLP on hp8_m, syn1, syn5) gets no row at all:
    a row of dashes carries no information.
    """
    cases = [case for case in CASE_ORDER if groups.get(case)]
    rows = []
    for index, case in enumerate(cases):
        method_cell = (r"\multirow{%d}{*}{\textbf{%s}}" % (len(cases), method)
                       if index == 0 else "")
        records = groups[case]
        # Solve rate as solved seeds / seeds run, e.g. 2/5 for BT on syn5.
        cells = [green(r"%d/%d" % (len(records), SEEDS))]
        for _head, key, digits in METRICS:
            if key == "total_time":
                value = time_value(records, method != "BT")
            else:
                value = mean_value(records, key, digits)
            cells.append(green(value))
        rows.append("    " + method_cell + " & $" + case_label(case) + "$ & "
                    + " & ".join(cells) + r" \\")
        rows.append(r"    \addlinespace[2pt]")
    return rows


def build_table(bt, rl):
    header = ("    \\textbf{Method} & \\textbf{Test Case} & \\textbf{SR} & "
              + " & ".join(r"\textbf{%s}" % head for head, _key, _digits in METRICS)
              + r" \\")
    lines = [
        r"% Statistics of the two baselines over the five seeds that were run.",
        r"% Columns: the method (BT or RLP), the test case, the solve rate (solved",
        r"% seeds / 5), then BA / WL / SAR / MaxT / Time.  The heads carry no unit;",
        r"% the units are stated once in the note under the table.  Every column is",
        r"% separated by a vertical rule, as in the metric tables of the paper.",
        r"% Each value is the mean and the population standard deviation over the",
        r"% seeds that produced a layout -- for BT on $syn5$ only 2 of the 5 seeds",
        r"% solve the case, so that cell rests on $n=2$ and the caption avoids",
        r"% calling every cell a five-seed average.  RL was stopped at the 3600 s",
        r"% budget in every run, so its time is the cap with zero spread.",
        r"% A case no seed solves is left out of the table.  The means are averages",
        r"% over the solved seeds, so they differ from the single selected layout that",
        r"% the per-case metric tables report.",
        r"\begin{table*}[!t]",
        r"  \centering",
        r"  \caption{solve rate and mean $\pm \sigma$ of BT and RLP over solved seeds}",
        r"  \label{tab:btrl_std}",
        r"  \setlength{\tabcolsep}{3pt}",
        r"  \renewcommand{\arraystretch}{1.2}",
        r"  \footnotesize",
        r"  \begin{tabular}{",
        # c, not p: the method cell is empty on the rows the \multirow spans,
        # and an empty p-column cell raises an "underfull \hbox in alignment".
        r"      c| % Method",
        r"      >{\centering\arraybackslash}p{2.0cm}| % Test Case",
        r"      >{\centering\arraybackslash}p{1.2cm}| % SR",
        r"      >{\centering\arraybackslash}p{2.5cm}| % BA",
        r"      >{\centering\arraybackslash}p{2.8cm}| % WL",
        r"      >{\centering\arraybackslash}p{2.3cm}| % SAR",
        r"      >{\centering\arraybackslash}p{2.0cm}| % MaxT",
        r"      >{\centering\arraybackslash}p{2.2cm}  % Runtime",
        r"  }",
        r"    \toprule",
        header,
        r"    \midrule",
    ]
    lines += method_rows("BT", bt)
    lines.append(r"    \midrule")
    lines += method_rows("RLP", rl)
    lines[-1] = r"    \bottomrule"
    lines += [
        r"  \end{tabular}",
        r" \end{table*}",
        "",
    ]
    return "\n".join(lines)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    bt = group_by_case(BT_5SEED)
    rl = group_by_case(RL_5SEED)
    table = build_table(bt, rl)

    for case in CASE_ORDER:
        solved = len(bt.get(case, []))
        if solved != SEEDS:
            # diagnostics go to stderr so --dry-run stdout is the table itself
            print(f"note: BT {case} solved {solved}/{SEEDS} seeds", file=sys.stderr)

    if args.dry_run:
        sys.stdout.write(table)
        return
    with open(OUT_PATH, "w", encoding="utf-8") as f:
        f.write(table)
    print(f"wrote {OUT_PATH}")


if __name__ == "__main__":
    main()
