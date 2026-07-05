import csv
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt


BASE_DIR = Path(__file__).resolve().parent
DATA_FILE = BASE_DIR / "cons_var.txt"
OUT_PNG = BASE_DIR / "cons_var_om_runtime.png"
OUT_PDF = BASE_DIR / "cons_var_om_runtime.pdf"


def read_tail_table(path):
    lines = path.read_text(encoding="utf-8").splitlines()
    header_index = next(
        i for i, line in enumerate(lines) if line.startswith("Test Case\tDie+Brg")
    )
    rows = list(csv.DictReader(lines[header_index:], delimiter="\t"))
    return rows


def as_float(rows, key):
    return [float(row[key]) for row in rows]


def main():
    rows = read_tail_table(DATA_FILE)
    cases = [row["Test Case"] for row in rows]
    die_brg = as_float(rows, "Die+Brg")
    cons = as_float(rows, "Cons.")
    vars_ = as_float(rows, "Vars.")
    peak_mem = as_float(rows, "Peak Mem.")
    om_time = as_float(rows, "OM Time(s)")
    x = range(len(rows))

    plt.rcParams.update(
        {
            "font.family": "DejaVu Sans",
            "font.size": 10,
            "axes.labelsize": 11,
            "axes.titlesize": 12,
            "legend.fontsize": 10,
        }
    )

    fig, axes = plt.subplots(
        2,
        1,
        figsize=(11.5, 7.2),
        sharex=True,
        gridspec_kw={"height_ratios": [1, 1.12], "hspace": 0.08},
    )

    ax_size, ax_resource = axes

    ax_size.plot(x, cons, marker="o", linewidth=2.0, label="Cons.")
    ax_size.plot(x, vars_, marker="s", linewidth=2.0, label="Vars.")
    ax_size.set_ylabel("Count")
    ax_size.grid(True, axis="y", linestyle="--", linewidth=0.6, alpha=0.45)
    ax_size.legend(loc="upper left", ncol=2, frameon=False)

    ax_resource.plot(
        x, peak_mem, marker="o", linewidth=2.0, color="#2a9d8f", label="Peak Mem."
    )
    ax_resource.plot(
        x, om_time, marker="s", linewidth=2.0, color="#e76f51", label="OM Time(s)"
    )
    ax_resource.set_ylabel("Value")
    ax_resource.set_xlabel("Test cases sorted by Die+Brg")
    ax_resource.grid(True, axis="y", linestyle="--", linewidth=0.6, alpha=0.45)
    ax_resource.legend(loc="upper left", ncol=2, frameon=False)

    ax_resource.set_xticks(list(x))
    ax_resource.set_xticklabels(
        [f"{case}\n{int(total)}" for case, total in zip(cases, die_brg)],
        rotation=35,
        ha="right",
    )

    fig.suptitle("MILP model size, memory, and OM runtime by Die+Brg", y=0.98)
    ax_resource.set_xlabel("Test case and Die+Brg")
    fig.subplots_adjust(left=0.08, right=0.98, top=0.91, bottom=0.2, hspace=0.08)
    fig.savefig(OUT_PNG, dpi=300, bbox_inches="tight")
    fig.savefig(OUT_PDF, bbox_inches="tight")
    plt.close(fig)


if __name__ == "__main__":
    main()
