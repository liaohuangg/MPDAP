#!/usr/bin/env python3
"""Calculate total power consumption and power density for chiplet systems."""

import json
import os
from pathlib import Path

def calculate_chiplet_metrics(json_file):
    """Calculate total power, area, and power density from a chiplet JSON file."""
    try:
        with open(json_file, 'r') as f:
            data = json.load(f)

        chiplets = data.get('chiplets', [])

        total_power = 0  # W
        total_area = 0   # mm²

        for chiplet in chiplets:
            power = chiplet.get('power', 0)
            width = chiplet.get('width', 0)
            height = chiplet.get('height', 0)

            total_power += power
            total_area += width * height

        # Calculate power density (W/mm²)
        power_density = total_power / total_area if total_area > 0 else 0

        return {
            'total_power': round(total_power, 2),
            'total_area': round(total_area, 2),
            'power_density': round(power_density, 4)
        }
    except Exception as e:
        print(f"Error processing {json_file}: {e}")
        return None

# Get all JSON files from test_input directory
test_input_dir = '/root/placement/MPDAP/benchmark/test_input/'
json_files = sorted(Path(test_input_dir).glob('*.json'))

# Calculate metrics for each chiplet system
results = {}
for json_file in json_files:
    if json_file.name == 'EMIB.json':  # Skip EMIB configuration file
        continue

    metrics = calculate_chiplet_metrics(str(json_file))
    if metrics:
        system_name = json_file.stem
        results[system_name] = metrics

# Print results
print("\nChiplet System Power and Area Analysis")
print("=" * 80)
print(f"{'System Name':<20} {'Total Power (W)':<20} {'Total Area (mm²)':<20} {'Power Density (W/mm²)':<20}")
print("-" * 80)

for system_name in sorted(results.keys()):
    metrics = results[system_name]
    print(f"{system_name:<20} {metrics['total_power']:<20} {metrics['total_area']:<20} {metrics['power_density']:<20}")

# Generate LaTeX table
print("\n\nLaTeX Table Code:")
print("=" * 80)

latex_lines = []
latex_lines.append(r"\newcolumntype{Y}{>{\centering\arraybackslash}X}")
latex_lines.append("")
latex_lines.append(r"\begin{table}[t]")
latex_lines.append(r"\centering")
latex_lines.append(r"\caption{\textcolor{blue}{Chiplet System Power Consumption and Power Density}}")
latex_lines.append(r"\label{tab:chiplet_power}")
latex_lines.append("")
latex_lines.append(r"\setlength{\tabcolsep}{6pt}")
latex_lines.append("")
latex_lines.append(r"\begin{tabularx}{\linewidth}{")
latex_lines.append(r"    >{\centering\arraybackslash}p{2.0cm}")
latex_lines.append(r"    Y Y Y")
latex_lines.append(r"}")
latex_lines.append(r"\toprule")
latex_lines.append(r"\textbf{\textcolor{blue}{System Name}}")
latex_lines.append(r"& \textbf{\textcolor{blue}{Total Power (W)}}")
latex_lines.append(r"& \textbf{\textcolor{blue}{Total Area (mm\textsuperscript{2})}}")
latex_lines.append(r"& \textbf{\textcolor{blue}{Power Density (W/mm\textsuperscript{2})}}")
latex_lines.append(r"\\")
latex_lines.append(r"\midrule")
latex_lines.append("")
latex_lines.append(r"\renewcommand{\arraystretch}{1.5}")
latex_lines.append("")

# Add data rows
for system_name in sorted(results.keys()):
    metrics = results[system_name]
    system_display = system_name.replace("_", r"\_")
    latex_lines.append(rf"\textcolor{{blue}}{{{system_display}}}")
    latex_lines.append(rf"& \textcolor{{blue}}{{{metrics['total_power']}}}")
    latex_lines.append(rf"& \textcolor{{blue}}{{{metrics['total_area']}}}")
    latex_lines.append(rf"& \textcolor{{blue}}{{{metrics['power_density']}}}")
    latex_lines.append(r"\\")
    latex_lines.append(r"\addlinespace[2pt]")
    latex_lines.append("")

latex_lines.append(r"\bottomrule")
latex_lines.append(r"\end{tabularx}")
latex_lines.append("")
latex_lines.append(r"\vspace{1mm}")
latex_lines.append(r"\parbox{\linewidth}{")
latex_lines.append(r"\scriptsize")
latex_lines.append(r"\centering")
latex_lines.append(r"\textcolor{blue}{")
latex_lines.append(r"Total Power is the sum of all chiplet power consumption in watts (W).")
latex_lines.append(r"Total Area is the sum of all chiplet areas in square millimeters (mm\textsuperscript{2}).")
latex_lines.append(r"Power Density is calculated as Total Power divided by Total Area.")
latex_lines.append(r"}")
latex_lines.append(r"}")
latex_lines.append(r"\end{table}")

latex_output = "\n".join(latex_lines)
print(latex_output)

# Write to chiplet.txt
with open('/root/placement/MPDAP/tests/chiplet.txt', 'w') as f:
    f.write(latex_output)

print("\n✅ Results written to /root/placement/MPDAP/tests/chiplet.txt")
