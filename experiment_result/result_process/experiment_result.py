"""Summary tables for the experiment results.

Every number below except Time is read, at import time, from the
placement_results.json that each method's sweep wrote (see SOURCES); a record
looks like

    {"folder": ..., "file": "ascend910.json", "wirelength": 24964.25,
     "area": 1282.16, "aspect_ratio": 1.195, "interposer_size": 39.15,
     "SAR": 0.1954, "max_temperature": 70.13, "avg_temperature": 54.37}

Precision: every metric is read as stored -- SAR included, so a method that
averaged SAR over its seeds (bt_tree / RL, see combine_bt_rl.py) keeps that
mean instead of having it re-derived from the averaged aspect ratio.  SAR
keeps 3 decimals; area, wirelength, aspect ratio, max temperature and time
keep 2.  Percentage
changes keep 2 decimals.  PRECISION, round_half_up, format_metric and
latex_cell are the single place where those rules live, so the LaTeX tables
and the markdown summary below cannot drift apart.
"""

import json
import os
from decimal import Decimal, ROUND_HALF_UP

RESULT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SOURCES = {
    "btree": "output_bt_tree/placement_results.json",
    "RL": "output_rl/placement_results.json",
    "omp": "output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0/placement_results.json",
    "pmp": "output_gurobi_EMIB_chiplet_5_6_01_17/placement_results.json",
    "pmd": "output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement_results.json",
    "pca": "output_gurobi_EMIB_chiplet_5_6_01_17_md0_ca1/placement_results.json",
}

# Wall-clock seconds per run.  placement_results.json carries no time field,
# so this is the only column still maintained by hand.  3600 marks a timeout.
TIME = {
    "ascend910": {"btree": 4.73, "omp": 9.04, "pmp": 2.82, "pmd": 9.0, "pca": 2.83, "RL": 3600},
    "cpu-dram": {"btree": 14.67, "omp": 36.43, "pmp": 78.21, "pmd": 30.32, "pca": 66.65, "RL": 3600},
    "hp11_m": {"omp": 165.3, "pmp": 302.72, "pmd": 302.61, "pca": 302.63},
    "hp6_m": {"btree": 10.96, "omp": 1.47, "pmp": 1.38, "pmd": 1.47, "pca": 1.42, "RL": 3600},
    "hp8_m": {"btree": 10.64, "omp": 14.28, "pmp": 21.05, "pmd": 19.33, "pca": 17.43},
    "multigpu": {"btree": 8.13, "omp": 3.57, "pmp": 4.9, "pmd": 1.61, "pca": 4.38, "RL": 3600},
    "syn1": {"btree": 18.37, "omp": 301.96, "pmp": 301.95, "pmd": 297.66, "pca": 302.14},
    "syn5": {"omp": 302.56, "pmp": 302.71, "pmd": 302.64, "pca": 302.63},
}

CASE_ORDER = ["ascend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5"]

# Decimals shown per metric; SAR is the only column that needs three, every
# other one keeps two.  Both the stored values and the printed cells use it.
PRECISION = {"maxT": 2, "BA": 2, "WL": 2, "AR": 2, "SAR": 3, "Time": 2}


def round_half_up(value, digits):
    """Round on the decimal representation, not banker's rounding."""
    if value is None:
        return None
    quantum = Decimal(1).scaleb(-digits)
    return float(Decimal(str(value)).quantize(quantum, rounding=ROUND_HALF_UP))


def compute_sar(aspect_ratio):
    """SAR = max(AR, 1/AR) - 1, evaluated on the 3-decimal AR.

    The three-decimal AR is what the layout JSON stores and what the tables
    have always shown; computing SAR from the unrounded ratio would shift the
    3rd/4th digit (dSAR/dAR = 1 + 1/AR^2, up to ~7x around AR = 0.4).
    """
    if aspect_ratio is None:
        return None
    aspect_ratio = round_half_up(aspect_ratio, 3)
    if not aspect_ratio:
        return 0.0
    return max(aspect_ratio, 1.0 / aspect_ratio) - 1.0


def load_data():
    """case_name -> method -> {maxT, BA, WL, AR, SAR, Time}."""
    loaded = {}
    for method, rel_path in SOURCES.items():
        with open(os.path.join(RESULT_DIR, rel_path), "r", encoding="utf-8") as f:
            records = json.load(f)
        for rec in records:
            case = rec.get("case") or os.path.splitext(rec["file"])[0]
            raw = {
                "maxT": rec.get("max_temperature"),
                "BA": rec.get("area"),
                "WL": rec.get("wirelength"),
                "AR": rec.get("aspect_ratio"),
                # Read the stored SAR: for bt_tree / RL it is already the mean
                # of the per-seed values, and re-deriving it from the averaged
                # AR would understate it (SAR is convex around AR = 1).
                "SAR": (rec["SAR"] if rec.get("SAR") is not None
                        else compute_sar(rec.get("aspect_ratio"))),
                "Time": TIME.get(case, {}).get(method),
            }
            loaded.setdefault(case, {})[method] = {
                key: round_half_up(value, PRECISION[key]) for key, value in raw.items()
            }
    order = {case: i for i, case in enumerate(CASE_ORDER)}
    return {case: loaded[case]
            for case in sorted(loaded, key=lambda c: (order.get(c, len(order)), c))}


data = load_data()

# Percentage change relative to omp; SAR uses data[case][method]["SAR"].
percentage = {}
for _case, _case_info in data.items():
    _base = _case_info.get("omp") or {}
    percentage[_case] = {}
    for _method, _row in _case_info.items():
        percentage[_case][_method] = {}
        for _key in ("maxT", "BA", "WL", "SAR"):
            _new, _old = _row.get(_key), _base.get(_key)
            if _new is None or _old is None or _old == 0:
                percentage[_case][_method][_key] = None
            else:
                percentage[_case][_method][_key] = round_half_up((_new - _old) / _old * 100, 2)

# Get data for a case and method
def get_case_data(case_name, method):
    """
    Get data for given case and method.
    :param case_name: case name (e.g. "cpu-dram")
    :param method: method name ("btree" / "omp" / "pmp")
    :return: data dict for that method, or None
    """
    case_info = data.get(case_name)
    if not case_info:
        return None
    return case_info.get(method)


def compute_averages(exclude_cases_temp=None, data_source=None, methods=None, timeout=3600):
    """
    Compute per-method averages for BA, WL, |AR-1|, Time, maxT.

    :param exclude_cases_temp: case names to exclude from maxT (e.g. hp11_m, syn5 for btree)
    :param data_source: data dict (default: global data)
    :param methods: method list (default: btree, omp, pmp)
    :param timeout: time value treated as timeout (default 3600); timeout cases excluded from BA/WL/AR/Time
    :return: dict[method_name, dict] with "BA", "WL", "|AR-1|", "Time", "maxT" and "cases_ba_wl_ar_time", "cases_maxT"
    """
    exclude_cases_temp = set(exclude_cases_temp or [])
    data_source = data_source or data
    methods = methods or ["btree", "omp", "pmp"]

    result = {}
    for method in methods:
        ba_list, wl_list, ar_diff_list, time_list, maxT_list = [], [], [], [], []
        cases_ba_wl_ar_time, cases_maxT = set(), set()
        for case_name, case_info in data_source.items():
            row = case_info.get(method)
            if not row:
                continue
            t = row.get("Time")
            if t is not None and t == timeout:
                continue
            ba = row.get("BA")
            wl = row.get("WL")
            ar = row.get("AR")
            maxT = row.get("maxT")
            if ba is not None:
                ba_list.append(ba)
            if wl is not None:
                wl_list.append(wl)
            if ar is not None:
                ar_diff_list.append(abs(ar - 1))
            if t is not None:
                time_list.append(t)
            if maxT is not None and case_name not in exclude_cases_temp:
                maxT_list.append(maxT)
                cases_maxT.add(case_name)
            if ba is not None or wl is not None or ar is not None or t is not None:
                cases_ba_wl_ar_time.add(case_name)

        result[method] = {
            "BA": round_half_up(sum(ba_list) / len(ba_list), 2) if ba_list else None,
            "WL": round_half_up(sum(wl_list) / len(wl_list), 2) if wl_list else None,
            "|AR-1|": round_half_up(sum(ar_diff_list) / len(ar_diff_list), 4) if ar_diff_list else None,
            "Time": round_half_up(sum(time_list) / len(time_list), 2) if time_list else None,
            "maxT": round_half_up(sum(maxT_list) / len(maxT_list), 2) if maxT_list else None,
            "cases_ba_wl_ar_time": sorted(cases_ba_wl_ar_time),
            "cases_maxT": sorted(cases_maxT),
        }
    return result

def pct_change(new_val, old_val):
    if old_val is None or old_val == 0:
        return None
    return (new_val - old_val) / old_val * 100


def average_metrics(cases, methods):
    averages = {}
    for method in methods:
        averages[method] = {}
        for metric in ["BA", "WL", "SAR", "Time", "maxT"]:
            values = []
            for case_name in cases:
                row = data.get(case_name, {}).get(method)
                if row is None:
                    continue
                value = row.get(metric)
                if value is not None:
                    values.append(value)
            averages[method][metric] = sum(values) / len(values) if values else None
    return averages


def format_metric(metric, value, na="N/A"):
    """One metric at its table precision; an exact zero is printed as 0."""
    if value is None:
        return na
    if value == 0:
        return "0"
    digits = PRECISION[metric]
    return f"{round_half_up(value, digits):.{digits}f}"


def format_pct(pct):
    """Percentage change, two decimals, never a signed zero."""
    if pct is None:
        return "N/A"
    pct = round_half_up(pct, 2)
    return "0.00%" if pct == 0 else f"{pct:+.2f}%"


def seed_range_pct(values):
    """Min and max of the seeds as percentage deviations from their mean.

    Returns (min_pct, max_pct); (None, None) when there are no values or the
    mean is zero.  Used by the bt_tree / RL seed-variation table.
    """
    values = [v for v in values if v is not None]
    if not values:
        return None, None
    mean = sum(values) / len(values)
    if mean == 0:
        return None, None
    return pct_change(min(values), mean), pct_change(max(values), mean)


def format_seed_range(values):
    """LaTeX cell [min deviation, max deviation], e.g. [-6.14\\%, +10.92\\%]."""
    lo, hi = seed_range_pct(values)
    if lo is None:
        return "--"
    return "[{}, {}]".format(
        format_pct(lo).replace("%", r"\%"),
        format_pct(hi).replace("%", r"\%"),
    )


def seed_span_pct(values):
    """Seed range as a percentage of the mean: (max - min) / mean * 100.

    Returns None when there are no values or the mean is zero.  The compact
    single-number counterpart of seed_range_pct, used by the seed table.
    """
    values = [v for v in values if v is not None]
    if not values:
        return None
    mean = sum(values) / len(values)
    if mean == 0:
        return None
    return (max(values) - min(values)) / mean * 100


def format_seed_span(values, digits=1):
    """LaTeX cell for the relative seed span, e.g. 11.6 (unit in the header)."""
    span = seed_span_pct(values)
    if span is None:
        return "-"
    return f"{round_half_up(span, digits):.{digits}f}"


def latex_cell(metric, value, pct=None, reference=False):
    """A LaTeX table cell: the value, then its change vs the row's reference."""
    if value is None:
        return "-"
    text = format_metric(metric, value).replace("%", r"\%")
    if reference:
        return f"{text} (ref.)"
    if pct is None:
        return text
    escaped = format_pct(pct).replace("%", r"\%")
    return f"{text} ({escaped})"


def fmt_delta_pct(delta, pct):
    if delta is None:
        return "N/A"
    delta = round_half_up(delta, 2)
    delta_text = "0.00" if delta == 0 else f"{delta:+.2f}"
    return f"{delta_text} ({format_pct(pct)})"


def fmt_delta(delta):
    if delta is None:
        return "N/A"
    delta = round_half_up(delta, 2)
    return "0.00" if delta == 0 else f"{delta:+.2f}"


def metric_change(target_avg, baseline_avg, metric):
    target = target_avg.get(metric)
    baseline = baseline_avg.get(metric)
    if target is None or baseline is None:
        return None, None
    delta = target - baseline
    pct = pct_change(target, baseline)
    return delta, pct


def print_markdown_table(title, cases, averages, targets, baseline):
    print(f"\n## {title}")
    print("Cases:", ", ".join(cases))

    headers = [
        "Method",
        "BA avg",
        "BA change",
        "WL avg",
        "WL change",
        "SAR avg",
        "SAR change",
        "Time avg",
        "Time change",
        "maxT avg",
        "maxT change",
    ]
    rows = []
    base_avg = averages[baseline]
    for method in targets:
        row = averages[method]
        ba_delta, ba_pct = metric_change(row, base_avg, "BA")
        wl_delta, wl_pct = metric_change(row, base_avg, "WL")
        sar_delta, sar_pct = metric_change(row, base_avg, "SAR")
        time_delta, time_pct = metric_change(row, base_avg, "Time")
        maxt_delta, _ = metric_change(row, base_avg, "maxT")
        rows.append([
            method.upper(),
            format_metric("BA", row["BA"]),
            fmt_delta_pct(ba_delta, ba_pct),
            format_metric("WL", row["WL"]),
            fmt_delta_pct(wl_delta, wl_pct),
            format_metric("SAR", row["SAR"]),
            fmt_delta_pct(sar_delta, sar_pct),
            format_metric("Time", row["Time"]),
            fmt_delta_pct(time_delta, time_pct),
            format_metric("maxT", row["maxT"]),
            fmt_delta(maxt_delta),
        ])

    widths = [
        max(len(str(item)) for item in column)
        for column in zip(headers, *rows)
    ]

    def format_row(values):
        cells = []
        for index, value in enumerate(values):
            text = str(value)
            if index == 0:
                cells.append(text.ljust(widths[index]))
            else:
                cells.append(text.rjust(widths[index]))
        return "| " + " | ".join(cells) + " |"

    separator = "| " + " | ".join("-" * width for width in widths) + " |"
    print(format_row(headers))
    print(separator)
    for row in rows:
        print(format_row(row))


btree_cases = ["ascend910", "cpu-dram", "hp6_m", "hp8_m", "multigpu", "syn1"]
rl_cases = ["ascend910", "cpu-dram", "hp6_m", "multigpu"]
all_cases = ["ascend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5"]

target_methods = ["omp", "pmp", "pmd", "pca"]
ablation_methods = ["pmp", "pmd", "pca"]

btree_averages = average_metrics(btree_cases, ["btree"] + target_methods)
print_markdown_table(
    "OMP/PMP/PMD/PCA vs BTREE average changes",
    btree_cases,
    btree_averages,
    target_methods,
    "btree",
)

rl_averages = average_metrics(rl_cases, ["RL"] + target_methods)
print_markdown_table(
    "OMP/PMP/PMD/PCA vs RL average changes",
    rl_cases,
    rl_averages,
    target_methods,
    "RL",
)

omp_averages = average_metrics(all_cases, ["omp"] + ablation_methods)
print_markdown_table(
    "PMP/PMD/PCA vs OMP average changes",
    all_cases,
    omp_averages,
    ablation_methods,
    "omp",
)

pmp_averages = average_metrics(all_cases, ["pmp", "pmd", "pca"])
print_markdown_table(
    "PMD/PCA vs PMP average changes",
    all_cases,
    pmp_averages,
    ["pmd", "pca"],
    "pmp",
)


#
# ## OMP/PMP/PMD/PCA vs BTREE average changes
# Cases: ascend910, cpu-dram, hp6_m, hp8_m, multigpu, syn1
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |       Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | ----------------- | -------- | ----------- |
# | OMP    |  878.96 |   -514.50 (-36.92%) | 38308.47 | -4692.05 (-10.91%) |   0.648 | +0.18 (+38.97%) |    61.13 | +49.88 (+443.33%) |    90.01 |       +2.93 |
# | PMP    |  916.00 |   -477.46 (-34.26%) | 39624.26 |  -3376.25 (-7.85%) |   0.516 | +0.05 (+10.76%) |    68.38 | +57.13 (+507.87%) |    86.27 |       -0.80 |
# | PMD    | 3986.78 | +2593.33 (+186.11%) | 48271.77 | +5271.25 (+12.26%) |   0.468 |   0.00 (+0.29%) |    59.90 | +48.65 (+432.43%) |    87.07 |        0.00 |
# | PCA    |  900.40 |   -493.05 (-35.38%) | 39201.62 |  -3798.89 (-8.83%) |   0.745 | +0.28 (+59.71%) |    65.81 | +54.56 (+484.96%) |    88.85 |       +1.78 |
#
# ## OMP/PMP/PMD/PCA vs RL average changes
# Cases: ascend910, cpu-dram, hp6_m, multigpu
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |        Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | ------------------ | -------- | ----------- |
# | OMP    |  905.73 |   -336.64 (-27.10%) | 34970.77 | -4355.11 (-11.07%) |   0.605 | +0.14 (+30.65%) |    12.63 | -3587.37 (-99.65%) |    90.66 |       +6.04 |
# | PMP    |  956.62 |   -285.75 (-23.00%) | 36191.55 |  -3134.33 (-7.97%) |   0.435 |  -0.03 (-6.04%) |    21.83 | -3578.17 (-99.39%) |    86.19 |       +1.58 |
# | PMD    | 5554.56 | +4312.19 (+347.09%) | 49182.25 | +9856.36 (+25.06%) |   0.372 | -0.09 (-19.70%) |    10.60 | -3589.40 (-99.71%) |    87.60 |       +2.98 |
# | PCA    |  905.49 |   -336.88 (-27.12%) | 35075.34 | -4250.54 (-10.81%) |   0.816 | +0.35 (+76.09%) |    18.82 | -3581.18 (-99.48%) |    89.28 |       +4.66 |
#
# ## PMP/PMD/PCA vs OMP average changes
# Cases: ascend910, cpu-dram, hp11_m, hp6_m, hp8_m, multigpu, syn1, syn5
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |      Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | ---------------- | -------- | ----------- |
# | PMP    |  965.94 |     +77.81 (+8.76%) | 50832.32 |  +2392.24 (+4.94%) |   0.422 | -0.09 (-17.63%) |   126.97 | +22.64 (+21.70%) |    85.87 |       -5.10 |
# | PMD    | 3254.42 | +2366.28 (+266.43%) | 57208.45 | +8768.37 (+18.10%) |   0.439 | -0.07 (-14.44%) |   120.58 | +16.25 (+15.58%) |    86.23 |       -4.74 |
# | PCA    |  973.28 |     +85.15 (+9.59%) | 50352.91 |  +1912.83 (+3.95%) |   0.589 | +0.08 (+15.00%) |   125.01 | +20.69 (+19.83%) |    89.02 |       -1.95 |
#
# ## PMD/PCA vs PMP average changes
# Cases: ascend910, cpu-dram, hp11_m, hp6_m, hp8_m, multigpu, syn1, syn5
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |    Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | -------------- | -------- | ----------- |
# | PMD    | 3254.42 | +2288.48 (+236.92%) | 57208.45 | +6376.13 (+12.54%) |   0.439 |  +0.02 (+3.88%) |   120.58 | -6.39 (-5.03%) |    86.23 |       +0.36 |
# | PCA    |  973.28 |      +7.34 (+0.76%) | 50352.91 |   -479.41 (-0.94%) |   0.589 | +0.17 (+39.62%) |   125.01 | -1.95 (-1.54%) |    89.02 |       +3.15 |
