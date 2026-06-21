#!/usr/bin/env python3
"""Generate LaTeX tables for experiment comparison with O-MILP as baseline."""

import sys
import io

# Redirect stdout temporarily to suppress experiment_result.py output
old_stdout = sys.stdout
sys.stdout = io.StringIO()

sys.path.insert(0, '/root/placement/MPDAP/tests')
from experiment_result import data

# Restore stdout
sys.stdout = old_stdout

def pct_change(new_val, old_val):
    """Calculate percentage change from old_val to new_val."""
    if old_val is None or old_val == 0:
        return None
    return round((new_val - old_val) / old_val * 100, 2)

def get_ar_metric(ar_value):
    """Convert AR to |AR-1| metric."""
    if ar_value is None:
        return None
    return abs(ar_value - 1)

def generate_latex_table(metric_name, metric_key, is_ar=False):
    """Generate LaTeX table for a specific metric."""

    # Get all cases and methods
    cases = sorted(data.keys())
    methods = ["btree", "RL", "power_aware_mp"]  # Methods to compare (excluding origin_mp as baseline)

    latex_lines = []

    # Table header
    latex_lines.append(r"\newcolumntype{Y}{>{\centering\arraybackslash}X}")
    latex_lines.append("")
    latex_lines.append(r"\begin{table}[t]")
    latex_lines.append(r"\centering")

    if metric_key == "BA":
        caption = r"Block Area Comparison"
        unit = r"($\mathrm{mm}^2$)"
    elif metric_key == "WL":
        caption = r"Wire Length Comparison"
        unit = r"(m)"
    elif metric_key == "AR":
        caption = r"Aspect Ratio Comparison"
        unit = r"($|$AR$-1|$)"
    else:  # maxT
        caption = r"Maximum Temperature Comparison"
        unit = r"(°C)"

    latex_lines.append(rf"\caption{{\textcolor{{blue}}{{{caption} of BT-tree, Power-Aware MP, RLPlanner and O-MILP}}}}")
    latex_lines.append(rf"\label{{tab:comp_{metric_key.replace('|', 'abs').lower()}_all}}")
    latex_lines.append("")
    latex_lines.append(r"\setlength{\tabcolsep}{4pt}")
    latex_lines.append("")
    latex_lines.append(r"\begin{tabularx}{\linewidth}{")
    latex_lines.append(r"    >{\centering\arraybackslash}p{1.65cm}")
    latex_lines.append(r"    Y Y Y Y")
    latex_lines.append(r"}")
    latex_lines.append(r"\toprule")
    latex_lines.append(rf"\multirow{{2}}{{*}}{{\textbf{{\textcolor{{blue}}{{Test Case}}}}}}")
    latex_lines.append(rf"& \multicolumn{{4}}{{c}}{{\textbf{{\textcolor{{blue}}{{{metric_name}, {metric_key} {unit}}}}}}}")
    latex_lines.append(r"\\")
    latex_lines.append(r"\cmidrule(lr){2-5}")
    latex_lines.append(r"& \textbf{\textcolor{blue}{BT-tree}}")
    latex_lines.append(r"& \textbf{\textcolor{blue}{RLPlanner}}")
    latex_lines.append(r"& \textbf{\textcolor{blue}{O-MILP}}")
    latex_lines.append(r"& \textbf{\textcolor{blue}{Power-Aware MP}}")
    latex_lines.append(r"\\")
    latex_lines.append(r"\midrule")
    latex_lines.append("")
    latex_lines.append(r"\renewcommand{\arraystretch}{1.9}")
    latex_lines.append("")

    # Data rows
    for case in cases:
        case_info = data[case]
        origin_mp_row = case_info.get("origin_mp")

        if origin_mp_row is None:
            continue

        # Get baseline value (O-MILP / origin_mp)
        if is_ar:
            baseline_val = get_ar_metric(origin_mp_row.get(metric_key))
        else:
            baseline_val = origin_mp_row.get(metric_key)

        if baseline_val is None:
            continue

        # Format case name
        case_name = case.replace("_", r"\_")
        latex_lines.append(rf"\textcolor{{blue}}{{${case_name}$}}")

        # Add values for BT-tree and RL
        for method in ["btree", "RL"]:
            method_row = case_info.get(method)

            if method_row is None:
                latex_lines.append(r"& \textcolor{blue}{--}")
            else:
                if is_ar:
                    method_val = get_ar_metric(method_row.get(metric_key))
                else:
                    method_val = method_row.get(metric_key)

                if method_val is None:
                    latex_lines.append(r"& \textcolor{blue}{--}")
                else:
                    pct = pct_change(method_val, baseline_val)
                    if pct is None:
                        latex_lines.append(r"& \textcolor{blue}{--}")
                    else:
                        pct_str = f"+{pct}\\%" if pct > 0 else f"{pct}\\%"
                        latex_lines.append(rf"& \textcolor{{blue}}{{\parbox{{\linewidth}}{{\centering {method_val:.2f}\\[-1pt]\scriptsize ({pct_str})}}}}")

        # Add baseline (O-MILP) value - this is the reference column
        latex_lines.append(rf"& \textcolor{{blue}}{{\parbox{{\linewidth}}{{\centering {baseline_val:.2f}\\[-1pt]\scriptsize (ref.)}}}}")

        # Add values for Power-Aware MP
        method_row = case_info.get("power_aware_mp")
        if method_row is None:
            latex_lines.append(r"& \textcolor{blue}{--}")
        else:
            if is_ar:
                method_val = get_ar_metric(method_row.get(metric_key))
            else:
                method_val = method_row.get(metric_key)

            if method_val is None:
                latex_lines.append(r"& \textcolor{blue}{--}")
            else:
                pct = pct_change(method_val, baseline_val)
                if pct is None:
                    latex_lines.append(r"& \textcolor{blue}{--}")
                else:
                    pct_str = f"+{pct}\\%" if pct > 0 else f"{pct}\\%"
                    latex_lines.append(rf"& \textcolor{{blue}}{{\parbox{{\linewidth}}{{\centering {method_val:.2f}\\[-1pt]\scriptsize ({pct_str})}}}}")
        latex_lines.append(r"\\")
        latex_lines.append(r"\addlinespace[2pt]")
        latex_lines.append("")

    # Table footer
    latex_lines.append(r"\bottomrule")
    latex_lines.append(r"\end{tabularx}")
    latex_lines.append("")
    latex_lines.append(r"\vspace{1mm}")
    latex_lines.append(r"\parbox{\linewidth}{")
    latex_lines.append(r"\scriptsize")
    latex_lines.append(r"\centering")
    latex_lines.append(r"\textcolor{blue}{")
    latex_lines.append(r"Values in parentheses denote the relative change compared with the proposed O-MILP method.")
    latex_lines.append(r"Positive values indicate larger values than O-MILP, while negative values indicate smaller values.")
    latex_lines.append(r"``ref.'' denotes the proposed O-MILP baseline, and ``--'' indicates unavailable data.")
    latex_lines.append(r"}")
    latex_lines.append(r"}")
    latex_lines.append(r"\end{table}")
    latex_lines.append("")

    return "\n".join(latex_lines)

# Generate all tables
output = ""

# BA table
output += "% ============ Block Area (BA) Table ============\n"
output += generate_latex_table("Block Area Comparison", "BA", is_ar=False)
output += "\n\n"

# WL table
output += "% ============ Wire Length (WL) Table ============\n"
output += generate_latex_table("Wire Length Comparison", "WL", is_ar=False)
output += "\n\n"

# |AR-1| table
output += "% ============ Aspect Ratio (|AR-1|) Table ============\n"
output += generate_latex_table("Aspect Ratio Comparison", "AR", is_ar=True)
output += "\n\n"

# maxT table
output += "% ============ Maximum Temperature (maxT) Table ============\n"
output += generate_latex_table("Maximum Temperature Comparison", "maxT", is_ar=False)

print(output)
