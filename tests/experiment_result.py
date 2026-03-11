# Structured data: case_name -> method -> {maxT, BA, WL, AR, Time} (incl. temperature and power-aware MP)
data = {
    "acend910": {
        "btree": {
            "maxT": 67.05,
            "BA": 1257.00,
            "WL": 24239.47,
            "AR": 0.716,
            "Time": 4.73
        },
        "origin_mp": {
            "maxT": 65.90,
            "BA": 1157.72,
            "WL": 23520.27,
            "AR": 1.174,
            "Time": 11.11
        },
        "power_aware_mp": {
            "maxT": 66.92,
            "BA": 1271.70,
            "WL": 22590.96,
            "AR": 1.290,
            "Time": 16.92
        }
    },
    "cpu-dram": {
        "btree": {
            "maxT": 107.29,
            "BA": 1119.63,
            "WL": 54492.72,
            "AR": 1.594,
            "Time": 14.67
        },
        "origin_mp": {
            "maxT": 105.46,
            "BA": 612.00,
            "WL": 52215.63,
            "AR": 0.529,
            "Time": 39.41
        },
        "power_aware_mp": {
            "maxT": 94.45,
            "BA": 707.83,
            "WL": 54713.91,
            "AR": 1.000,
            "Time": 107.90
        }
    },
    "hp11_m": {
        "btree": {
            "maxT": None,  # no valid data
            "BA": None,
            "WL": None,
            "AR": None,
            "Time": 3600  # time out
        },
        "origin_mp": {
            "maxT": 91.88,
            "BA": 1075.33,
            "WL": 91397.36,
            "AR": 0.850,
            "Time": 168.25
        },
        "power_aware_mp": {
            "maxT": 88.77,
            "BA": 1976.21,
            "WL": 106353.44,
            "AR": 0.718,
            "Time": 302.61
        }
    },
    "hp6_m": {
        "btree": {
            "maxT": 85.08,
            "BA": 596.70,
            "WL": 10291.63,
            "AR": 0.547,
            "Time": 10.96
        },
        "origin_mp": {
            "maxT": 86.86,
            "BA": 471.81,
            "WL": 10325.49,
            "AR": 2.314,
            "Time": 1.78
        },
        "power_aware_mp": {
            "maxT": 86.35,
            "BA": 471.81,
            "WL": 9659.31,
            "AR": 0.432,
            "Time": 3.22
        }
    },
    "hp8_m": {
        "btree": {
            "maxT": 97.07,
            "BA": 2528.77,
            "WL": 53830.70,
            "AR": 0.779,
            "Time": 10.64
        },
        "origin_mp": {
            "maxT": 86.53,
            "BA": 720.83,
            "WL": 43367.49,
            "AR": 0.411,
            "Time": 14.13
        },
        "power_aware_mp": {
            "maxT": 82.08,
            "BA": 712.50,
            "WL": 44274.13,
            "AR": 0.451,
            "Time": 22.48
        }
    },
    "multigpu": {
        "btree": {
            "maxT": 83.94,
            "BA": 1255.98,
            "WL": 54874.77,
            "AR": 0.536,
            "Time": 8.13
        },
        "origin_mp": {
            "maxT": 82.86,
            "BA": 1381.38,
            "WL": 54064.65,
            "AR": 1.043,
            "Time": 5.45
        },
        "power_aware_mp": {
            "maxT": 81.56,
            "BA": 1362.14,
            "WL": 55238.24,
            "AR": 0.811,
            "Time": 4.98
        }
    },
    "syn1": {
        "btree": {
            "maxT": 84.52,
            "BA": 1480.00,
            "WL": 55408.79,
            "AR": 1.081,
            "Time": 18.37
        },
        "origin_mp": {
            "maxT": 84.63,
            "BA": 896.00,
            "WL": 46192.37,
            "AR": 0.875,
            "Time": 301.78
        },
        "power_aware_mp": {
            "maxT": 82.50,
            "BA": 1137.50,
            "WL": 51797.26,
            "AR": 1.077,
            "Time": 165.02
        }
    },
    "syn5": {
        "btree": {
            "maxT": None,  # no valid data
            "BA": None,
            "WL": None,
            "AR": None,
            "Time": 3600  # time out
        },
        "origin_mp": {
            "maxT": 81.23,
            "BA": 702.00,
            "WL": 70516.52,
            "AR": 0.963,
            "Time": 42.41
        },
        "power_aware_mp": {
            "maxT": 79.02,
            "BA": 895.17,
            "WL": 74620.56,
            "AR": 0.815,
            "Time": 302.47
        }
    },
    "sys_micro150": {
        "btree": {
            "maxT": 102.89,
            "BA": 1119.63,
            "WL": 54299.35,
            "AR": 1.59,
            "Time": 14.52
        },
        "origin_mp": {
            "maxT": 105.46,
            "BA": 612.00,
            "WL": 52215.63,
            "AR": 0.529,
            "Time": 39.47
        },
        "power_aware_mp": {
            "maxT": 94.45,
            "BA": 707.83,
            "WL": 54713.91,
            "AR": 1.000,
            "Time": 107.56
        }
    }
}

# Get data for a case and method
def get_case_data(case_name, method):
    """
    Get data for given case and method.
    :param case_name: case name (e.g. "cpu-dram")
    :param method: method name ("btree" / "origin_mp" / "power_aware_mp")
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
    :param methods: method list (default: btree, origin_mp, power_aware_mp)
    :param timeout: time value treated as timeout (default 3600); timeout cases excluded from BA/WL/AR/Time
    :return: dict[method_name, dict] with "BA", "WL", "|AR-1|", "Time", "maxT" and "cases_ba_wl_ar_time", "cases_maxT"
    """
    exclude_cases_temp = set(exclude_cases_temp or [])
    data_source = data_source or data
    methods = methods or ["btree", "origin_mp", "power_aware_mp"]

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

# power_aware_mp vs origin_mp averages on specified cases (commented out)
# print("\n--- Specified cases: power_aware_mp vs origin_mp ---")
# print("Cases:", specified_cases)
# for method in ["power_aware_mp", "origin_mp"]:
#     stats = avg_specified[method]
#     print(f"\n{method}:")
#     print("  BA:", stats["BA"], "| WL:", stats["WL"], "| |AR-1|:", stats["|AR-1|"], "| Time:", stats["Time"], "| maxT:", stats["maxT"])

# power_aware_mp vs origin_mp averages over all 9 cases
all_9_cases = ["acend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5", "sys_micro150"]
filtered_all9 = {k: v for k, v in data.items() if k in set(all_9_cases)}
avg_all9 = compute_averages(exclude_cases_temp=[], data_source=filtered_all9)
print("\n--- 9 cases: power_aware_mp vs origin_mp averages ---")
print("Cases:", all_9_cases)
for method in ["power_aware_mp", "origin_mp"]:
    stats = avg_all9[method]
    print(f"\n{method}:")
    print("  BA:", stats["BA"], "| WL:", stats["WL"], "| |AR-1|:", stats["|AR-1|"], "| Time:", stats["Time"], "| maxT:", stats["maxT"])

# power_aware_mp % change vs btree / origin_mp (negative=better, positive=worse; lower is better for all metrics)
def pct_change(new_val, old_val):
    if old_val is None or old_val == 0:
        return None
    return round((new_val - old_val) / old_val * 100, 2)

pa = avg_specified["power_aware_mp"]
bt = avg_specified["btree"]
om = avg_specified["origin_mp"]
metrics = ["BA", "WL", "|AR-1|", "Time", "maxT"]
print("\n--- power_aware_mp relative change (%) ---")
print("(negative=improvement, positive=worse)")
print("         vs btree    vs origin_mp")
for m in metrics:
    vs_bt = pct_change(pa[m], bt[m]) if pa[m] is not None and bt[m] is not None else "N/A"
    vs_om = pct_change(pa[m], om[m]) if pa[m] is not None and om[m] is not None else "N/A"
    print(f"  {m:8} {vs_bt:>8}%   {vs_om:>8}%")

# power_aware_mp % change on cpu-dram, syn1 vs btree/origin_mp
focus_cases = ["cpu-dram", "syn1"]
metric_keys = [("BA", "BA"), ("WL", "WL"), ("|AR-1|", "AR"), ("Time", "Time"), ("maxT", "maxT")]
print("\n--- power_aware_mp on cpu-dram, syn1: relative change (%) ---")
print("(negative=improvement, positive=worse)")
for case_name in focus_cases:
    pa_row = data.get(case_name, {}).get("power_aware_mp", {})
    bt_row = data.get(case_name, {}).get("btree", {})
    om_row = data.get(case_name, {}).get("origin_mp", {})
    print(f"\n{case_name}:")
    print("         vs btree    vs origin_mp")
    for disp, key in metric_keys:
        pa_val = abs(pa_row.get(key) - 1) if key == "AR" and pa_row.get(key) is not None else pa_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        vs_bt = pct_change(pa_val, bt_val) if pa_val is not None and bt_val is not None else "N/A"
        vs_om = pct_change(pa_val, om_val) if pa_val is not None and om_val is not None else "N/A"
        print(f"  {disp:8} {str(vs_bt):>8}%   {str(vs_om):>8}%")

# Average % change of power_aware_mp vs origin_mp over 9 cases (negative=power_aware_mp better)
all_cases = ["acend910", "cpu-dram", "hp11_m", "hp6_m", "hp8_m", "multigpu", "syn1", "syn5", "sys_micro150"]
pct_list = {m: [] for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
metric_keys = [("BA", "BA"), ("WL", "WL"), ("|AR-1|", "AR"), ("Time", "Time"), ("maxT", "maxT")]
for case_name in all_cases:
    pa_row = data.get(case_name, {}).get("power_aware_mp", {})
    om_row = data.get(case_name, {}).get("origin_mp", {})
    for disp, key in metric_keys:
        pa_val = abs(pa_row.get(key) - 1) if key == "AR" and pa_row.get(key) is not None else pa_row.get(key)
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        p = pct_change(pa_val, om_val)
        if p is not None:
            pct_list[disp].append(p)
print("\n--- power_aware_mp vs origin_mp average % change (9 cases) ---")
print("(negative=power_aware_mp better, positive=worse)")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    lst = pct_list[m]
    avg_pct = round(sum(lst) / len(lst), 2) if lst else "N/A"
    print(f"  {m:8} avg: {avg_pct}%")
    
# Specified cases: origin_mp vs btree
print("\n--- Specified cases: origin_mp vs btree ---")
print("Cases:", specified_cases)

# 1. Average comparison
print("\n[1] Average comparison")
print("         btree        origin_mp")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    bt_val = bt[m] if bt[m] is not None else "N/A"
    om_val = om[m] if om[m] is not None else "N/A"
    print(f"  {m:8} {str(bt_val):>10}   {str(om_val):>10}")

# 2. origin_mp vs btree average % change (negative=origin_mp better)
pct_om_vs_bt = {m: [] for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
metric_keys = [("BA", "BA"), ("WL", "WL"), ("|AR-1|", "AR"), ("Time", "Time"), ("maxT", "maxT")]
for case_name in specified_cases:
    om_row = data.get(case_name, {}).get("origin_mp", {})
    bt_row = data.get(case_name, {}).get("btree", {})
    for disp, key in metric_keys:
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        p = pct_change(om_val, bt_val)
        if p is not None:
            pct_om_vs_bt[disp].append(p)
print("\n[2] origin_mp vs btree average % change")
print("(negative=origin_mp better, positive=worse)")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    lst = pct_om_vs_bt[m]
    avg_pct = round(sum(lst) / len(lst), 2) if lst else "N/A"
    print(f"  {m:8} avg: {avg_pct}%")

# 3. Per-case win/loss (better/worse/tie)
better = {m: 0 for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
worse = {m: 0 for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
tie = {m: 0 for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]}
for case_name in specified_cases:
    om_row = data.get(case_name, {}).get("origin_mp", {})
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
print("\n[3] origin_mp vs btree per-case: better / worse / tie")
print("(better=origin_mp smaller, worse=origin_mp larger, tie=equal or missing)")
print("         better worse  tie")
for m in ["BA", "WL", "|AR-1|", "Time", "maxT"]:
    print(f"  {m:8} {better[m]:4}  {worse[m]:4}  {tie[m]:4}")   

# cpu-dram, syn1: origin_mp vs btree values and %
focus_cases_om_bt = ["cpu-dram", "syn1"]
print("\n--- cpu-dram, syn1: origin_mp vs btree values and (%) ---")
print("(negative%=origin_mp better, positive%=worse)")
for case_name in focus_cases_om_bt:
    bt_row = data.get(case_name, {}).get("btree", {})
    om_row = data.get(case_name, {}).get("origin_mp", {})
    print(f"\n【{case_name}】")
    for method in ["btree", "origin_mp"]:
        row = bt_row if method == "btree" else om_row
        stats_str = "  BA: " + str(row.get("BA")) + " | WL: " + str(row.get("WL")) + " | AR: " + str(row.get("AR")) + " | Time: " + str(row.get("Time")) + " | maxT: " + str(row.get("maxT"))
        print(f"  {method}: {stats_str}")
    print("  origin_mp vs btree (%):")
    for disp, key in metric_keys:
        om_val = abs(om_row.get(key) - 1) if key == "AR" and om_row.get(key) is not None else om_row.get(key)
        bt_val = abs(bt_row.get(key) - 1) if key == "AR" and bt_row.get(key) is not None else bt_row.get(key)
        pct = pct_change(om_val, bt_val)
        pct_str = f"{pct}%" if pct is not None else "N/A"
        better_or_worse = "better" if pct is not None and pct < 0 else ("worse" if pct is not None and pct > 0 else "tie")
        print(f"    {disp:8} {pct_str:>8}  ({better_or_worse})")