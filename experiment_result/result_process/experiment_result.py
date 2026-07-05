# Structured data: case_name -> method -> {maxT, BA, WL, AR, Time} (temperature in Celsius)
data = {
    'acend910': {'btree': {'maxT': 67.19, 'BA': 1257.0, 'WL': 24239.47, 'AR': 0.716, 'SAR': 0.3966, 'Time': 4.73}, 'omp': {'maxT': 66.18, 'BA': 1157.72, 'WL': 23277.6, 'AR': 1.174, 'SAR': 0.174, 'Time': 9.04}, 'pmp': {'maxT': 66.8, 'BA': 1282.16, 'WL': 24964.25, 'AR': 1.195, 'SAR': 0.195, 'Time': 2.82}, 'pmd': {'maxT': 66.18, 'BA': 1157.72, 'WL': 23277.6, 'AR': 1.174, 'SAR': 0.174, 'Time': 9.0}, 'pca': {'maxT': 66.8, 'BA': 1282.16, 'WL': 24964.25, 'AR': 1.195, 'SAR': 0.195, 'Time': 2.83}, 'RL': {'maxT': 66.02, 'BA': 1282.71, 'WL': 24324.94, 'AR': 1.06, 'SAR': 0.06, 'Time': 3600}},
    'cpu-dram': {'btree': {'maxT': 107.2, 'BA': 1119.63, 'WL': 54492.72, 'AR': 1.594, 'SAR': 0.594, 'Time': 14.67}, 'omp': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.63, 'AR': 0.529, 'SAR': 0.8904, 'Time': 36.43}, 'pmp': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.48, 'AR': 1.0, 'SAR': 0.0, 'Time': 78.21}, 'pmd': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.58, 'AR': 1.0, 'SAR': 0.0, 'Time': 30.32}, 'pca': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.53, 'AR': 1.889, 'SAR': 0.889, 'Time': 66.65}, 'RL': {'maxT': 100.1, 'BA': 1070.0, 'WL': 54739.5, 'AR': 1.495, 'SAR': 0.495, 'Time': 3600}},
    'hp11_m': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'AR': None, 'SAR': None, 'Time': 3600}, 'omp': {'maxT': 92.82, 'BA': 1075.33, 'WL': 91437.23, 'AR': 0.85, 'SAR': 0.1765, 'Time': 165.3}, 'pmp': {'maxT': 84.18, 'BA': 1462.04, 'WL': 99416.9, 'AR': 1.223, 'SAR': 0.223, 'Time': 302.72}, 'pmd': {'maxT': 84.39, 'BA': 1418.65, 'WL': 98276.52, 'AR': 0.669, 'SAR': 0.4948, 'Time': 302.61}, 'pca': {'maxT': 91.41, 'BA': 1627.86, 'WL': 97170.41, 'AR': 0.826, 'SAR': 0.2107, 'Time': 302.63}},
    'hp6_m': {'btree': {'maxT': 85.74, 'BA': 596.7, 'WL': 10291.63, 'AR': 0.547, 'SAR': 0.8282, 'Time': 10.96}, 'omp': {'maxT': 87.46, 'BA': 471.81, 'WL': 10325.19, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.47}, 'pmp': {'maxT': 86.47, 'BA': 471.81, 'WL': 9850.71, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.38}, 'pmd': {'maxT': 87.46, 'BA': 471.81, 'WL': 10325.19, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.47}, 'pca': {'maxT': 86.47, 'BA': 471.81, 'WL': 9850.71, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.42}, 'RL': {'maxT': 78.58, 'BA': 787.05, 'WL': 14353.76, 'AR': 0.371, 'SAR': 1.6954, 'Time': 3600}},
    'hp8_m': {'btree': {'maxT': 96.49, 'BA': 2528.77, 'WL': 53830.7, 'AR': 0.779, 'SAR': 0.2837, 'Time': 10.64}, 'omp': {'maxT': 87.53, 'BA': 720.83, 'WL': 43325.89, 'AR': 0.411, 'SAR': 1.4331, 'Time': 14.28}, 'pmp': {'maxT': 82.97, 'BA': 712.5, 'WL': 44477.37, 'AR': 2.219, 'SAR': 1.219, 'Time': 21.05}, 'pmd': {'maxT': 83.57, 'BA': 712.5, 'WL': 44088.95, 'AR': 0.451, 'SAR': 1.2173, 'Time': 19.33}, 'pca': {'maxT': 86.79, 'BA': 820.46, 'WL': 43647.63, 'AR': 0.468, 'SAR': 1.1368, 'Time': 17.43}},
    'multigpu': {'btree': {'maxT': 84.0, 'BA': 1255.98, 'WL': 54874.77, 'AR': 0.536, 'SAR': 0.8657, 'Time': 8.13}, 'omp': {'maxT': 83.56, 'BA': 1381.38, 'WL': 54064.65, 'AR': 1.043, 'SAR': 0.043, 'Time': 3.57}, 'pmp': {'maxT': 82.01, 'BA': 1364.8, 'WL': 55238.75, 'AR': 0.812, 'SAR': 0.2315, 'Time': 4.9}, 'pmd': {'maxT': 108.06, 'BA': 19881.0, 'WL': 108413.62, 'AR': 1.0, 'SAR': 0.0, 'Time': 1.61}, 'pca': {'maxT': 84.03, 'BA': 1255.98, 'WL': 53270.88, 'AR': 1.865, 'SAR': 0.865, 'Time': 4.38}, 'RL': {'maxT': 86.41, 'BA': 1663.48, 'WL': 57735.0, 'AR': 0.796, 'SAR': 0.2563, 'Time': 3600}},
    'syn1': {'btree': {'maxT': 85.12, 'BA': 1480.0, 'WL': 55408.79, 'AR': 1.081, 'SAR': 0.081, 'Time': 18.37}, 'omp': {'maxT': 83.43, 'BA': 930.0, 'WL': 46641.86, 'AR': 1.033, 'SAR': 0.033, 'Time': 301.96}, 'pmp': {'maxT': 84.09, 'BA': 957.0, 'WL': 48502.02, 'AR': 0.879, 'SAR': 0.1377, 'Time': 301.95}, 'pmd': {'maxT': 84.06, 'BA': 989.93, 'WL': 48812.69, 'AR': 1.1, 'SAR': 0.1, 'Time': 297.66}, 'pca': {'maxT': 83.39, 'BA': 960.0, 'WL': 51260.74, 'AR': 1.067, 'SAR': 0.067, 'Time': 302.14}},
    'syn5': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'AR': None, 'SAR': None, 'Time': 3600}, 'omp': {'maxT': 82.17, 'BA': 756.0, 'WL': 66232.59, 'AR': 0.964, 'SAR': 0.0373, 'Time': 302.56}, 'pmp': {'maxT': 80.93, 'BA': 769.5, 'WL': 69496.09, 'AR': 0.947, 'SAR': 0.056, 'Time': 302.71}, 'pmd': {'maxT': 80.58, 'BA': 696.0, 'WL': 69760.47, 'AR': 0.828, 'SAR': 0.2077, 'Time': 302.64}, 'pca': {'maxT': 81.95, 'BA': 756.0, 'WL': 70443.13, 'AR': 0.964, 'SAR': 0.0373, 'Time': 302.63}},
    'sys_micro150': {'btree': {'maxT': 103.06, 'BA': 1119.63, 'WL': 54299.35, 'AR': 1.59, 'SAR': 0.59, 'Time': 14.52}, 'omp': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.63, 'AR': 0.529, 'SAR': 0.8904, 'Time': 36.27}, 'pmp': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.48, 'AR': 1.0, 'SAR': 0.0, 'Time': 78.0}, 'pmd': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.58, 'AR': 1.0, 'SAR': 0.0, 'Time': 30.8}, 'pca': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.53, 'AR': 1.889, 'SAR': 0.889, 'Time': 66.33}, 'RL': {'maxT': 104.83, 'BA': 977.5, 'WL': 55311.38, 'AR': 0.846, 'SAR': 0.182, 'Time': 3600}},
}

# Percentage change relative to omp; SAR uses data[case][method]["SAR"].
percentage = {'acend910': {'btree': {'maxT': 1.53, 'BA': 8.58, 'WL': 4.13, 'SAR': 127.93},
              'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pmp': {'maxT': 0.94, 'BA': 10.75, 'WL': 7.25, 'SAR': 12.07},
              'pmd': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pca': {'maxT': 0.94, 'BA': 10.75, 'WL': 7.25, 'SAR': 12.07},
              'RL': {'maxT': -0.24, 'BA': 10.8, 'WL': 4.5, 'SAR': -65.52}},
 'cpu-dram': {'btree': {'maxT': 1.13, 'BA': 82.95, 'WL': 4.36, 'SAR': -33.29},
              'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pmp': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
              'pmd': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
              'pca': {'maxT': 0.0, 'BA': 0.0, 'WL': -0.0, 'SAR': -0.16},
              'RL': {'maxT': -5.57, 'BA': 74.84, 'WL': 4.83, 'SAR': -44.41}},
 'hp11_m': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'SAR': None},
            'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
            'pmp': {'maxT': -9.31, 'BA': 35.96, 'WL': 8.73, 'SAR': 26.35},
            'pmd': {'maxT': -9.08, 'BA': 31.93, 'WL': 7.48, 'SAR': 180.34},
            'pca': {'maxT': -1.52, 'BA': 51.38, 'WL': 6.27, 'SAR': 19.38}},
 'hp6_m': {'btree': {'maxT': -1.97, 'BA': 26.47, 'WL': -0.33, 'SAR': -36.97},
           'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
           'pmp': {'maxT': -1.13, 'BA': 0.0, 'WL': -4.6, 'SAR': 0.0},
           'pmd': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
           'pca': {'maxT': -1.13, 'BA': 0.0, 'WL': -4.6, 'SAR': 0.0},
           'RL': {'maxT': -10.15, 'BA': 66.82, 'WL': 39.02, 'SAR': 29.03}},
 'hp8_m': {'btree': {'maxT': 10.24, 'BA': 250.81, 'WL': 24.25, 'SAR': -80.2},
           'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
           'pmp': {'maxT': -5.21, 'BA': -1.16, 'WL': 2.66, 'SAR': -14.94},
           'pmd': {'maxT': -4.52, 'BA': -1.16, 'WL': 1.76, 'SAR': -15.06},
           'pca': {'maxT': -0.85, 'BA': 13.82, 'WL': 0.74, 'SAR': -20.68}},
 'multigpu': {'btree': {'maxT': 0.53, 'BA': -9.08, 'WL': 1.5, 'SAR': 1913.26},
              'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pmp': {'maxT': -1.85, 'BA': -1.2, 'WL': 2.17, 'SAR': 438.37},
              'pmd': {'maxT': 29.32, 'BA': 1339.21, 'WL': 100.53, 'SAR': -100.0},
              'pca': {'maxT': 0.56, 'BA': -9.08, 'WL': -1.47, 'SAR': 1911.63},
              'RL': {'maxT': 3.41, 'BA': 20.42, 'WL': 6.79, 'SAR': 496.05}},
 'syn1': {'btree': {'maxT': 2.03, 'BA': 59.14, 'WL': 18.8, 'SAR': 145.45},
          'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
          'pmp': {'maxT': 0.79, 'BA': 2.9, 'WL': 3.99, 'SAR': 317.27},
          'pmd': {'maxT': 0.76, 'BA': 6.44, 'WL': 4.65, 'SAR': 203.03},
          'pca': {'maxT': -0.05, 'BA': 3.23, 'WL': 9.9, 'SAR': 103.03}},
 'syn5': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'SAR': None},
          'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
          'pmp': {'maxT': -1.51, 'BA': 1.79, 'WL': 4.93, 'SAR': 50.13},
          'pmd': {'maxT': -1.94, 'BA': -7.94, 'WL': 5.33, 'SAR': 456.84},
          'pca': {'maxT': -0.27, 'BA': 0.0, 'WL': 6.36, 'SAR': 0.0}},
 'sys_micro150': {'btree': {'maxT': -2.77, 'BA': 82.95, 'WL': 3.99, 'SAR': -33.74},
                  'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
                  'pmp': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
                  'pmd': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
                  'pca': {'maxT': 0.0, 'BA': 0.0, 'WL': -0.0, 'SAR': -0.16},
                  'RL': {'maxT': -1.1, 'BA': 59.72, 'WL': 5.93, 'SAR': -79.56}}}

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
            "BA": round(sum(ba_list) / len(ba_list), 2) if ba_list else None,
            "WL": round(sum(wl_list) / len(wl_list), 2) if wl_list else None,
            "|AR-1|": round(sum(ar_diff_list) / len(ar_diff_list), 4) if ar_diff_list else None,
            "Time": round(sum(time_list) / len(time_list), 2) if time_list else None,
            "maxT": round(sum(maxT_list) / len(maxT_list), 2) if maxT_list else None,
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


def fmt_value(value, digits=2):
    return "N/A" if value is None else f"{value:.{digits}f}"


def fmt_delta_pct(delta, pct):
    if delta is None:
        return "N/A"
    pct_text = "N/A" if pct is None else f"{pct:+.2f}%"
    return f"{delta:+.2f} ({pct_text})"


def fmt_delta(delta):
    return "N/A" if delta is None else f"{delta:+.2f}"


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
            fmt_value(row["BA"]),
            fmt_delta_pct(ba_delta, ba_pct),
            fmt_value(row["WL"]),
            fmt_delta_pct(wl_delta, wl_pct),
            fmt_value(row["SAR"], 4),
            fmt_delta_pct(sar_delta, sar_pct),
            fmt_value(row["Time"]),
            fmt_delta_pct(time_delta, time_pct),
            fmt_value(row["maxT"]),
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


btree_cases = ["acend910", "cpu-dram", "hp6_m", "hp8_m", "multigpu", "syn1", "sys_micro150"]
rl_cases = ["acend910", "cpu-dram", "hp6_m", "multigpu", "sys_micro150"]
all_9_cases = ["acend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5", "sys_micro150"]

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

omp_averages = average_metrics(all_9_cases, ["omp"] + ablation_methods)
print_markdown_table(
    "PMP/PMD/PCA vs OMP average changes",
    all_9_cases,
    omp_averages,
    ablation_methods,
    "omp",
)

pmp_averages = average_metrics(all_9_cases, ["pmp", "pmd", "pca"])
print_markdown_table(
    "PMD/PCA vs PMP average changes",
    all_9_cases,
    pmp_averages,
    ["pmd", "pca"],
    "pmp",
)



## OMP/PMP/PMD/PCA vs BTREE average changes
# Cases: acend910, cpu-dram, hp6_m, hp8_m, multigpu, syn1, sys_micro150
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |       Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | ----------------- | -------- | ----------- |
# | OMP    |  840.82 |   -496.00 (-37.10%) | 40295.21 |  -3624.43 (-8.25%) |  0.6826 | +0.16 (+31.29%) |    57.57 | +45.86 (+391.37%) |    88.59 |       -1.23 |
# | PMP    |  886.24 |   -450.57 (-33.70%) | 41779.72 |  -2139.91 (-4.87%) |  0.4425 | -0.08 (-14.89%) |    69.76 | +58.04 (+495.35%) |    84.91 |       -4.92 |
# | PMD    | 3518.34 | +2181.53 (+163.19%) | 49191.89 | +5272.25 (+12.00%) |  0.4008 | -0.12 (-22.91%) |    55.74 | +44.02 (+375.73%) |    88.77 |       -1.06 |
# | PCA    |  859.20 |   -477.61 (-35.73%) | 41060.75 |  -2858.88 (-6.51%) |  0.7651 | +0.25 (+47.17%) |    65.88 | +54.17 (+462.28%) |    88.50 |       -1.33 |

# ## OMP/PMP/PMD/PCA vs RL average changes
# Cases: acend910, cpu-dram, hp6_m, multigpu, sys_micro150
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |        Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | ------------------ | -------- | ----------- |
# | OMP    |  846.98 |   -309.17 (-26.74%) | 38419.74 |  -2873.18 (-6.96%) |  0.6624 | +0.12 (+23.17%) |    17.36 | -3582.64 (-99.52%) |    89.84 |       +2.65 |
# | PMP    |  906.84 |   -249.31 (-21.56%) | 39895.73 |  -1397.18 (-3.38%) |  0.3481 | -0.19 (-35.27%) |    33.06 | -3566.94 (-99.08%) |    85.46 |       -1.72 |
# | PMD    | 4585.19 | +3429.05 (+296.59%) | 50288.31 | +8995.40 (+21.78%) |  0.2976 | -0.24 (-44.66%) |    14.64 | -3585.36 (-99.59%) |    90.75 |       +3.56 |
# | PCA    |  846.79 |   -309.36 (-26.76%) | 38503.38 |  -2789.54 (-6.76%) |  0.8304 | +0.29 (+54.42%) |    28.32 | -3571.68 (-99.21%) |    89.86 |       +2.67 |

# ## PMP/PMD/PCA vs OMP average changes
# Cases: acend910, cpu-dram, hp11_m, hp6_m, hp8_m, multigpu, syn1, syn5, sys_micro150
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |      Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | ---------------- | -------- | ----------- |
# | PMP    |  937.25 |     +79.80 (+9.31%) | 51263.45 |  +2403.86 (+4.92%) |  0.3751 | -0.18 (-32.36%) |   121.53 | +24.76 (+25.59%) |    84.39 |       -3.96 |
# | PMD    | 2971.45 | +2114.00 (+246.54%) | 56931.13 | +8071.55 (+16.52%) |  0.3898 | -0.16 (-29.73%) |   110.60 | +13.84 (+14.30%) |    87.37 |       -0.98 |
# | PCA    |  933.14 |     +75.69 (+8.83%) | 50559.87 |  +1700.28 (+3.48%) |  0.6226 | +0.07 (+12.26%) |   118.49 | +21.73 (+22.46%) |    88.09 |       -0.26 |

# ## PMD/PCA vs PMP average changes
# Cases: acend910, cpu-dram, hp11_m, hp6_m, hp8_m, multigpu, syn1, syn5, sys_micro150
# | Method |  BA avg |           BA change |   WL avg |          WL change | SAR avg |      SAR change | Time avg |     Time change | maxT avg | maxT change |
# | ------ | ------- | ------------------- | -------- | ------------------ | ------- | --------------- | -------- | --------------- | -------- | ----------- |
# | PMD    | 2971.45 | +2034.20 (+217.04%) | 56931.13 | +5667.68 (+11.06%) |  0.3898 |  +0.01 (+3.90%) |   110.60 | -10.92 (-8.99%) |    87.37 |       +2.98 |
# | PCA    |  933.14 |      -4.11 (-0.44%) | 50559.87 |   -703.58 (-1.37%) |  0.6226 | +0.25 (+65.98%) |   118.49 |  -3.03 (-2.50%) |    88.09 |       +3.71 |
