# Structured data: case_name -> method -> {maxT, BA, WL, AR, Time} (temperature in Celsius)
data = {
    'acend910': {'btree': {'maxT': 67.19, 'BA': 1257.0, 'WL': 24239.47, 'AR': 0.716, 'SAR': 0.3966, 'Time': 4.73}, 'omp': {'maxT': 66.18, 'BA': 1157.72, 'WL': 23498.84, 'AR': 1.174, 'SAR': 0.174, 'Time': 8.99}, 'pmp': {'maxT': 66.8, 'BA': 1282.16, 'WL': 24964.25, 'AR': 1.195, 'SAR': 0.195, 'Time': 2.82}, 'pmd': {'maxT': 66.18, 'BA': 1157.72, 'WL': 23277.6, 'AR': 1.174, 'SAR': 0.174, 'Time': 9.0}, 'pca': {'maxT': 66.8, 'BA': 1282.16, 'WL': 24964.25, 'AR': 1.195, 'SAR': 0.195, 'Time': 2.83}, 'RL': {'maxT': 66.02, 'BA': 1282.71, 'WL': 24324.94, 'AR': 1.06, 'SAR': 0.06, 'Time': 3600}},
    'cpu-dram': {'btree': {'maxT': 107.2, 'BA': 1119.63, 'WL': 54492.72, 'AR': 1.594, 'SAR': 0.594, 'Time': 14.67}, 'omp': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.63, 'AR': 1.889, 'SAR': 0.889, 'Time': 35.88}, 'pmp': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.48, 'AR': 1.0, 'SAR': 0.0, 'Time': 78.21}, 'pmd': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.58, 'AR': 1.0, 'SAR': 0.0, 'Time': 30.32}, 'pca': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.53, 'AR': 1.889, 'SAR': 0.889, 'Time': 66.65}, 'RL': {'maxT': 100.1, 'BA': 1070.0, 'WL': 54739.5, 'AR': 1.495, 'SAR': 0.495, 'Time': 3600}},
    'hp11_m': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'AR': None, 'SAR': None, 'Time': 3600}, 'omp': {'maxT': 92.82, 'BA': 1075.33, 'WL': 91045.65, 'AR': 0.85, 'SAR': 0.1765, 'Time': 162.12}, 'pmp': {'maxT': 84.18, 'BA': 1462.04, 'WL': 99416.9, 'AR': 1.223, 'SAR': 0.223, 'Time': 302.72}, 'pmd': {'maxT': 84.39, 'BA': 1418.65, 'WL': 98276.52, 'AR': 0.669, 'SAR': 0.4948, 'Time': 302.61}, 'pca': {'maxT': 91.41, 'BA': 1627.86, 'WL': 97170.41, 'AR': 0.826, 'SAR': 0.2107, 'Time': 302.63}},
    'hp6_m': {'btree': {'maxT': 85.74, 'BA': 596.7, 'WL': 10291.63, 'AR': 0.547, 'SAR': 0.8282, 'Time': 10.96}, 'omp': {'maxT': 87.46, 'BA': 471.81, 'WL': 10325.31, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.48}, 'pmp': {'maxT': 86.47, 'BA': 471.81, 'WL': 9850.71, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.38}, 'pmd': {'maxT': 87.46, 'BA': 471.81, 'WL': 10325.19, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.47}, 'pca': {'maxT': 86.47, 'BA': 471.81, 'WL': 9850.71, 'AR': 2.314, 'SAR': 1.314, 'Time': 1.42}, 'RL': {'maxT': 78.58, 'BA': 787.05, 'WL': 14353.76, 'AR': 0.371, 'SAR': 1.6954, 'Time': 3600}},
    'hp8_m': {'btree': {'maxT': 96.49, 'BA': 2528.77, 'WL': 53830.7, 'AR': 0.779, 'SAR': 0.2837, 'Time': 10.64}, 'omp': {'maxT': 87.53, 'BA': 720.83, 'WL': 43228.95, 'AR': 0.411, 'SAR': 1.4331, 'Time': 13.89}, 'pmp': {'maxT': 82.97, 'BA': 712.5, 'WL': 44477.37, 'AR': 2.219, 'SAR': 1.219, 'Time': 21.05}, 'pmd': {'maxT': 83.57, 'BA': 712.5, 'WL': 44088.95, 'AR': 0.451, 'SAR': 1.2173, 'Time': 19.33}, 'pca': {'maxT': 86.79, 'BA': 820.46, 'WL': 43647.63, 'AR': 0.468, 'SAR': 1.1368, 'Time': 17.43}},
    'multigpu': {'btree': {'maxT': 84.0, 'BA': 1255.98, 'WL': 54874.77, 'AR': 0.536, 'SAR': 0.8657, 'Time': 8.13}, 'omp': {'maxT': 83.58, 'BA': 1381.38, 'WL': 54064.82, 'AR': 0.959, 'SAR': 0.0428, 'Time': 3.31}, 'pmp': {'maxT': 82.01, 'BA': 1364.8, 'WL': 55238.75, 'AR': 0.812, 'SAR': 0.2315, 'Time': 4.9}, 'pmd': {'maxT': 108.06, 'BA': 19881.0, 'WL': 108413.62, 'AR': 1.0, 'SAR': 0.0, 'Time': 1.61}, 'pca': {'maxT': 84.03, 'BA': 1255.98, 'WL': 53270.88, 'AR': 1.865, 'SAR': 0.865, 'Time': 4.38}, 'RL': {'maxT': 86.41, 'BA': 1663.48, 'WL': 57735.0, 'AR': 0.796, 'SAR': 0.2563, 'Time': 3600}},
    'syn1': {'btree': {'maxT': 85.12, 'BA': 1480.0, 'WL': 55408.79, 'AR': 1.081, 'SAR': 0.081, 'Time': 18.37}, 'omp': {'maxT': 85.42, 'BA': 850.0, 'WL': 47180.81, 'AR': 1.36, 'SAR': 0.36, 'Time': 301.83}, 'pmp': {'maxT': 84.09, 'BA': 957.0, 'WL': 48502.02, 'AR': 0.879, 'SAR': 0.1377, 'Time': 301.95}, 'pmd': {'maxT': 84.06, 'BA': 989.93, 'WL': 48812.69, 'AR': 1.1, 'SAR': 0.1, 'Time': 297.66}, 'pca': {'maxT': 83.39, 'BA': 960.0, 'WL': 51260.74, 'AR': 1.067, 'SAR': 0.067, 'Time': 302.14}},
    'syn5': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'AR': None, 'SAR': None, 'Time': 3600}, 'omp': {'maxT': 80.59, 'BA': 696.0, 'WL': 69609.06, 'AR': 1.208, 'SAR': 0.208, 'Time': 302.98}, 'pmp': {'maxT': 80.93, 'BA': 769.5, 'WL': 69496.09, 'AR': 0.947, 'SAR': 0.056, 'Time': 302.71}, 'pmd': {'maxT': 80.58, 'BA': 696.0, 'WL': 69760.47, 'AR': 0.828, 'SAR': 0.2077, 'Time': 302.64}, 'pca': {'maxT': 81.95, 'BA': 756.0, 'WL': 70443.13, 'AR': 0.964, 'SAR': 0.0373, 'Time': 302.63}},
    'sys_micro150': {'btree': {'maxT': 103.06, 'BA': 1119.63, 'WL': 54299.35, 'AR': 1.59, 'SAR': 0.59, 'Time': 14.52}, 'omp': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.63, 'AR': 1.889, 'SAR': 0.889, 'Time': 36.12}, 'pmp': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.48, 'AR': 1.0, 'SAR': 0.0, 'Time': 78.0}, 'pmd': {'maxT': 96.02, 'BA': 707.72, 'WL': 54712.58, 'AR': 1.0, 'SAR': 0.0, 'Time': 30.8}, 'pca': {'maxT': 106.0, 'BA': 612.0, 'WL': 52215.53, 'AR': 1.889, 'SAR': 0.889, 'Time': 66.33}, 'RL': {'maxT': 104.83, 'BA': 977.5, 'WL': 55311.38, 'AR': 0.846, 'SAR': 0.182, 'Time': 3600}},
}

# Percentage change relative to omp; SAR uses data[case][method]["SAR"].
percentage = {'acend910': {'btree': {'maxT': 1.53, 'BA': 8.58, 'WL': 3.15, 'SAR': 127.93},
              'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pmp': {'maxT': 0.94, 'BA': 10.75, 'WL': 6.24, 'SAR': 12.07},
              'pmd': {'maxT': 0.0, 'BA': 0.0, 'WL': -0.94, 'SAR': 0.0},
              'pca': {'maxT': 0.94, 'BA': 10.75, 'WL': 6.24, 'SAR': 12.07},
              'RL': {'maxT': -0.24, 'BA': 10.8, 'WL': 3.52, 'SAR': -65.52}},
 'cpu-dram': {'btree': {'maxT': 1.13, 'BA': 82.95, 'WL': 4.36, 'SAR': -33.18},
              'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pmp': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
              'pmd': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
              'pca': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'RL': {'maxT': -5.57, 'BA': 74.84, 'WL': 4.83, 'SAR': -44.32}},
 'hp11_m': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'SAR': None},
            'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
            'pmp': {'maxT': -9.31, 'BA': 35.96, 'WL': 9.19, 'SAR': 26.35},
            'pmd': {'maxT': -9.08, 'BA': 31.93, 'WL': 7.94, 'SAR': 180.34},
            'pca': {'maxT': -1.52, 'BA': 51.38, 'WL': 6.73, 'SAR': 19.38}},
 'hp6_m': {'btree': {'maxT': -1.97, 'BA': 26.47, 'WL': -0.33, 'SAR': -36.97},
           'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
           'pmp': {'maxT': -1.13, 'BA': 0.0, 'WL': -4.6, 'SAR': 0.0},
           'pmd': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
           'pca': {'maxT': -1.13, 'BA': 0.0, 'WL': -4.6, 'SAR': 0.0},
           'RL': {'maxT': -10.15, 'BA': 66.82, 'WL': 39.02, 'SAR': 29.03}},
 'hp8_m': {'btree': {'maxT': 10.24, 'BA': 250.81, 'WL': 24.52, 'SAR': -80.2},
           'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
           'pmp': {'maxT': -5.21, 'BA': -1.16, 'WL': 2.89, 'SAR': -14.94},
           'pmd': {'maxT': -4.52, 'BA': -1.16, 'WL': 1.99, 'SAR': -15.06},
           'pca': {'maxT': -0.85, 'BA': 13.82, 'WL': 0.97, 'SAR': -20.68}},
 'multigpu': {'btree': {'maxT': 0.5, 'BA': -9.08, 'WL': 1.5, 'SAR': 1922.66},
              'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
              'pmp': {'maxT': -1.88, 'BA': -1.2, 'WL': 2.17, 'SAR': 440.89},
              'pmd': {'maxT': 29.29, 'BA': 1339.21, 'WL': 100.53, 'SAR': -100.0},
              'pca': {'maxT': 0.54, 'BA': -9.08, 'WL': -1.47, 'SAR': 1921.03},
              'RL': {'maxT': 3.39, 'BA': 20.42, 'WL': 6.79, 'SAR': 498.83}},
 'syn1': {'btree': {'maxT': -0.35, 'BA': 74.12, 'WL': 17.44, 'SAR': -77.5},
          'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
          'pmp': {'maxT': -1.56, 'BA': 12.59, 'WL': 2.8, 'SAR': -61.75},
          'pmd': {'maxT': -1.59, 'BA': 16.46, 'WL': 3.46, 'SAR': -72.22},
          'pca': {'maxT': -2.38, 'BA': 12.94, 'WL': 8.65, 'SAR': -81.39}},
 'syn5': {'btree': {'maxT': None, 'BA': None, 'WL': None, 'SAR': None},
          'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
          'pmp': {'maxT': 0.42, 'BA': 10.56, 'WL': -0.16, 'SAR': -73.08},
          'pmd': {'maxT': -0.01, 'BA': 0.0, 'WL': 0.22, 'SAR': -0.14},
          'pca': {'maxT': 1.69, 'BA': 8.62, 'WL': 1.2, 'SAR': -82.07}},
 'sys_micro150': {'btree': {'maxT': -2.77, 'BA': 82.95, 'WL': 3.99, 'SAR': -33.63},
                  'omp': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
                  'pmp': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
                  'pmd': {'maxT': -9.42, 'BA': 15.64, 'WL': 4.78, 'SAR': -100.0},
                  'pca': {'maxT': 0.0, 'BA': 0.0, 'WL': 0.0, 'SAR': 0.0},
                  'RL': {'maxT': -1.1, 'BA': 59.72, 'WL': 5.93, 'SAR': -79.53}}}

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

# Averages over specified cases
specified_cases = ['acend910', 'cpu-dram', 'hp6_m', 'hp8_m', 'multigpu', 'syn1', 'sys_micro150']
filtered_data = {k: v for k, v in data.items() if k in set(specified_cases)}
avg_specified = compute_averages(exclude_cases_temp=[], data_source=filtered_data)
print("\n--- Specified cases averages ---")
print("Cases:", specified_cases)
for method, stats in avg_specified.items():
    print(f"\n{method}:")
    print("  BA:", stats["BA"], "| WL:", stats["WL"], "| |AR-1|:", stats["|AR-1|"], "| Time:", stats["Time"], "| maxT:", stats["maxT"])

# pmp vs omp averages on specified cases (commented out)
# print("\n--- Specified cases: pmp vs omp ---")
# print("Cases:", specified_cases)
# for method in ["pmp", "omp"]:
#     stats = avg_specified[method]
#     print(f"\n{method}:")
#     print("  BA:", stats["BA"], "| WL:", stats["WL"], "| |AR-1|:", stats["|AR-1|"], "| Time:", stats["Time"], "| maxT:", stats["maxT"])

# pmp vs omp averages over all 9 cases
all_9_cases = ["acend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5", "sys_micro150"]
filtered_all9 = {k: v for k, v in data.items() if k in set(all_9_cases)}
avg_all9 = compute_averages(exclude_cases_temp=[], data_source=filtered_all9)
print("\n--- 9 cases: pmp vs omp averages ---")
print("Cases:", all_9_cases)
for method in ["pmp", "omp"]:
    stats = avg_all9[method]
    print(f"\n{method}:")
    print("  BA:", stats["BA"], "| WL:", stats["WL"], "| |AR-1|:", stats["|AR-1|"], "| Time:", stats["Time"], "| maxT:", stats["maxT"])

# pmp % change vs btree / omp (negative=better, positive=worse; lower is better for all metrics)
def pct_change(new_val, old_val):
    if old_val is None or old_val == 0:
        return None
    return round((new_val - old_val) / old_val * 100, 2)

pa = avg_specified["pmp"]
bt = avg_specified["btree"]
om = avg_specified["omp"]
metrics = ["BA", "WL", "|AR-1|", "Time", "maxT"]
print("\n--- pmp relative change (%) ---")
print("(negative=improvement, positive=worse)")
print("         vs btree    vs omp")
for m in metrics:
    vs_bt = pct_change(pa[m], bt[m]) if pa[m] is not None and bt[m] is not None else "N/A"
    vs_om = pct_change(pa[m], om[m]) if pa[m] is not None and om[m] is not None else "N/A"
    print(f"  {m:8} {vs_bt:>8}%   {vs_om:>8}%")

# pmp % change on cpu-dram, syn1 vs btree/omp
focus_cases = ["cpu-dram", "syn1"]
metric_keys = [("BA", "BA"), ("WL", "WL"), ("|AR-1|", "AR"), ("Time", "Time"), ("maxT", "maxT")]
print("\n--- pmp on cpu-dram, syn1: relative change (%) ---")
print("(negative=improvement, positive=worse)")
for case_name in focus_cases:
    pa_row = data.get(case_name, {}).get("pmp", {})
    bt_row = data.get(case_name, {}).get("btree", {})
    om_row = data.get(case_name, {}).get("omp", {})
    print(f"\n{case_name}:")
    print("         vs btree    vs omp")
    for disp, key in metric_keys:
        pa_val = abs(pa_row.get(key) - 1) if key == "AR" and pa_row.get(key) is not None else pa_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        vs_bt = pct_change(pa_val, bt_val) if pa_val is not None and bt_val is not None else "N/A"
        vs_om = pct_change(pa_val, om_val) if pa_val is not None and om_val is not None else "N/A"
        print(f"  {disp:8} {str(vs_bt):>8}%   {str(vs_om):>8}%")

# Average % change of pmp vs omp over 9 cases (negative=pmp better)
all_cases = ["acend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5", "sys_micro150"]
pct_list = {m: [] for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
metric_keys = [("BA", "BA"), ("WL", "WL"), ("|AR-1|", "AR"), ("Time", "Time"), ("maxT", "maxT")]
for case_name in all_cases:
    pa_row = data.get(case_name, {}).get("pmp", {})
    om_row = data.get(case_name, {}).get("omp", {})
    for disp, key in metric_keys:
        pa_val = abs(pa_row.get(key) - 1) if key == "AR" and pa_row.get(key) is not None else pa_row.get(key)
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        p = pct_change(pa_val, om_val)
        if p is not None:
            pct_list[disp].append(p)
print("\n--- pmp vs omp average % change (9 cases) ---")
print("(negative=pmp better, positive=worse)")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    lst = pct_list[m]
    avg_pct = round(sum(lst) / len(lst), 2) if lst else "N/A"
    print(f"  {m:8} avg: {avg_pct}%")
    
# Specified cases: omp vs btree
print("\n--- Specified cases: omp vs btree ---")
print("Cases:", specified_cases)

# 1. Average comparison
print("\n[1] Average comparison")
print("         btree        omp")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    bt_val = bt[m] if bt[m] is not None else "N/A"
    om_val = om[m] if om[m] is not None else "N/A"
    print(f"  {m:8} {str(bt_val):>10}   {str(om_val):>10}")

# 2. omp vs btree average % change (negative=omp better)
pct_om_vs_bt = {m: [] for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
metric_keys = [("BA", "BA"), ("WL", "WL"), ("|AR-1|", "AR"), ("Time", "Time"), ("maxT", "maxT")]
for case_name in specified_cases:
    om_row = data.get(case_name, {}).get("omp", {})
    bt_row = data.get(case_name, {}).get("btree", {})
    for disp, key in metric_keys:
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        p = pct_change(om_val, bt_val)
        if p is not None:
            pct_om_vs_bt[disp].append(p)
print("\n[2] omp vs btree average % change")
print("(negative=omp better, positive=worse)")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    lst = pct_om_vs_bt[m]
    avg_pct = round(sum(lst) / len(lst), 2) if lst else "N/A"
    print(f"  {m:8} avg: {avg_pct}%")

# 3. Per-case win/loss (better/worse/tie)
better = {m: 0 for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
worse = {m: 0 for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
tie = {m: 0 for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
for case_name in specified_cases:
    om_row = data.get(case_name, {}).get("omp", {})
    bt_row = data.get(case_name, {}).get("btree", {})
    for disp, key in metric_keys:
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        if om_val is None or bt_val is None:
            tie[disp] += 1
        elif om_val < bt_val:
            better[disp] += 1
        elif om_val > bt_val:
            worse[disp] += 1
        else:
            tie[disp] += 1
print("\n[3] omp vs btree per-case: better / worse / tie")
print("(better=omp smaller, worse=omp larger, tie=equal or missing)")
print("         better worse  tie")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    print(f"  {m:8} {better[m]:4}  {worse[m]:4}  {tie[m]:4}")   

# cpu-dram, syn1: omp vs btree values and %
focus_cases_om_bt = ["cpu-dram", "syn1"]
print("\n--- cpu-dram, syn1: omp vs btree values and (%) ---")
print("(negative%=omp better, positive%=worse)")
for case_name in focus_cases_om_bt:
    bt_row = data.get(case_name, {}).get("btree", {})
    om_row = data.get(case_name, {}).get("omp", {})
    print(f"\n【{case_name}】")
    for method in ["btree", "omp"]:
        row = bt_row if method == "btree" else om_row
        stats_str = "  BA: " + str(row.get("BA")) + " | WL: " + str(row.get("WL")) + " | AR: " + str(row.get("AR")) + " | Time: " + str(row.get("Time")) + " | maxT: " + str(row.get("maxT"))
        print(f"  {method}: {stats_str}")
    print("  omp vs btree (%):")
    for disp, key in metric_keys:
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        pct = pct_change(om_val, bt_val)
        pct_str = f"{pct}%" if pct is not None else "N/A"
        better_or_worse = "better" if pct is not None and pct < 0 else ("worse" if pct is not None and pct > 0 else "tie")
        print(f"    {disp:8} {pct_str:>8}  ({better_or_worse})")
