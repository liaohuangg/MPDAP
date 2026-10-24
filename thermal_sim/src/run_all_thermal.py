"""Regenerate every HotSpot config from thermal_pkg sizing and rerun the sims.

The group list mirrors thermal_sim/thermal_pkg.txt: the experiment layouts
(bt_tree / RL / the four gurobi sweeps) and the parameter sweep.  For each
layout this script

    1. runs gen_flp_trace.py into config_sum/<group>/<name>_config,
    2. runs test_thermal.py in that directory (HotSpot only, --no-plot),
    3. draws the layer-2 heatmap with generate_grid_heatmaps_with_bridge.py
       (EMIB silicon bridges overlaid from the placement JSON).

The package geometry is chosen by --package_mode:
  layout (default): the TIM / substrate / C4-underfill layers are a square
      whose side is this layout's own bounding-box longest edge, the layout
      centred in it;
  case: every layout of a case uses that case's largest bounding-box edge
      (one package per case, the old behaviour).
The heat spreader is 2x that edge and the heat sink 2x the spreader.
Ambient (45 C) and the 64x64 grid come from template_config.
The convective resistance follows the TAP-2.5D rule, per layout/case:
r_convec = 0.1 * 0.06^2 / s_sink^2 (i.e. 1/(h*A_sink) with h fixed).
Jobs run in parallel because HotSpot is single-threaded.

Results go to config_sum for --package_mode layout (config_sum_same_pkg for
case, where the earlier same-package runs already live).

Usage:
    python3 src/run_all_thermal.py               # all groups
    python3 src/run_all_thermal.py --groups output_bt_tree output_rl
    python3 src/run_all_thermal.py --jobs 8
    python3 src/run_all_thermal.py --package_mode case
"""

import argparse
import datetime
import os
import re
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed

SRC_DIR = os.path.dirname(os.path.abspath(__file__))
THERMAL_DIR = os.path.dirname(SRC_DIR)
MPDAP_DIR = os.path.dirname(THERMAL_DIR)
CONFIG_SUM_DIR = os.path.join(THERMAL_DIR, "config_sum")
# 每种封装口径写到各自的根目录，避免把两种口径的结果混在一起。
CONFIG_ROOT_BY_MODE = {
    "layout": CONFIG_SUM_DIR,
    "case": os.path.join(THERMAL_DIR, "config_sum_same_pkg"),
}
PACKAGE_MODE_DEFAULT = "layout"

GEN = os.path.join(SRC_DIR, "gen_flp_trace.py")
RUN = os.path.join(SRC_DIR, "test_thermal.py")
PLOT = os.path.join(SRC_DIR, "generate_grid_heatmaps_with_bridge.py")
PLOT_SUFFIX = "_layer2_grid_thermal_with_bridge"

# Excluded by thermal_pkg.txt: not engineering-feasible.
EXCLUDE_FILES = {
    ("output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0", "multigpu.json"),
}
# Whole parameter sweeps that are not feasible.
EXCLUDE_PAR_DIRS = {"output_gurobi_EMIB_chiplet_5_6_01_24",
                    "output_gurobi_EMIB_chiplet_5_6_01_25"}


def _experiment_placement_dirs():
    """(group_name, placement_dir) for every gurobi result directory."""
    root = os.path.join(MPDAP_DIR, "experiment_result")
    out = []
    # "exp_" mirrors the existing config_sum naming; the bare directory names
    # would otherwise clash with the parameter sweep's identically named dirs.
    for name in sorted(os.listdir(root)):
        p = os.path.join(root, name, "placement")
        if os.path.isdir(p):
            out.append(("exp_" + name, p))
    return out


def _parameter_placement_dirs():
    # The "par_" prefix keeps these apart from the experiment sweeps, which
    # reuse the same output_gurobi_EMIB_chiplet_5_6_01_<NN> directory names
    # (e.g. _17 exists in both result trees); config_sum uses the same prefix.
    root = os.path.join(MPDAP_DIR, "parameter_result")
    out = []
    for name in sorted(os.listdir(root)):
        if name in EXCLUDE_PAR_DIRS:
            continue
        p = os.path.join(root, name, "placement")
        if os.path.isdir(p):
            out.append(("par_" + name, p))
    return out


def collect_jobs(selected_groups=None):
    """Build the job list: (group, layout_json, config_name, placement_dir)."""
    jobs = []

    # bt_tree / RL: layouts live directly under <group>/<case>/*.json.  The
    # config keeps the old `<case>_seed<NN>` stem so the plotting code and the
    # existing directory layout stay readable.
    #
    # thermal_pkg.txt sizing rule: bt_tree contributes only the lowest-cost
    # solution of a case and RL only the highest-reward one; their other seeds
    # are not evaluated and must not size the package.
    for group, pattern, picker in (
            ("output_bt_tree", r"_cost_([0-9.]+)\.json$", min),
            ("output_rl", r"_reward_([0-9.]+)\.json$", max)):
        root = os.path.join(MPDAP_DIR, "experiment_result", group)
        if not os.path.isdir(root):
            continue
        for case in sorted(os.listdir(root)):
            case_dir = os.path.join(root, case)
            if not os.path.isdir(case_dir):
                continue
            candidates = []
            for fname in sorted(os.listdir(case_dir)):
                if not (fname.startswith("solution_") and fname.endswith(".json")):
                    continue
                m = re.search(pattern, fname)
                if m:
                    candidates.append((float(m.group(1)), fname))
            if not candidates:
                continue
            fname = picker(candidates)[1]
            m = re.search(r"_seed(\d+)_", fname)
            stem = f"{case}_seed{m.group(1)}" if m else f"{case}_{os.path.splitext(fname)[0]}"
            jobs.append((group, os.path.join(case_dir, fname), stem, case_dir))

    for group, placement in _experiment_placement_dirs() + _parameter_placement_dirs():
        for fname in sorted(os.listdir(placement)):
            if not fname.endswith(".json"):
                continue
            base_group = group.split("_", 1)[1] if group.startswith(("exp_", "par_")) else group
            if (base_group, fname) in EXCLUDE_FILES:
                continue
            jobs.append((group, os.path.join(placement, fname),
                         os.path.splitext(fname)[0], placement))

    if selected_groups:
        wanted = set(selected_groups)
        jobs = [j for j in jobs if j[0] in wanted]
    return jobs


def run_job(job, log_root, plot_only=False, package_mode=PACKAGE_MODE_DEFAULT):
    group, layout_json, name, placement_dir = job
    config_root = CONFIG_ROOT_BY_MODE[package_mode]
    dst = os.path.join(config_root, f"config_{group}", f"{name}_config")
    log_path = os.path.join(log_root, f"{group}__{name}.log")

    os.makedirs(dst, exist_ok=True)
    os.makedirs(os.path.dirname(log_path), exist_ok=True)
    env = dict(os.environ, MPLBACKEND="Agg")
    with open(log_path, "w", encoding="utf-8") as log:
        if not plot_only:
            gen = subprocess.run(
                [sys.executable, GEN, "--json_path", layout_json,
                 "--config_dir", dst, "--name", name,
                 "--package_mode", package_mode],
                cwd=SRC_DIR, env=env, stdout=log, stderr=subprocess.STDOUT)
            if gen.returncode != 0:
                return job, "gen failed", log_path
            # HotSpot only; the map is drawn by generate_grid_heatmaps_with_bridge.py
            # below (with the EMIB bridges overlaid from the layout JSON).
            sim = subprocess.run(
                [sys.executable, RUN, "--config_dir", dst,
                 "--placement_dir", placement_dir,
                 "--layout_json", layout_json, "--no-plot"],
                cwd=SRC_DIR, env=env, stdout=log, stderr=subprocess.STDOUT)
            if sim.returncode != 0:
                return job, "sim failed", log_path
        # The plotter discovers `<case>_config` dirs, so point it at this
        # group's directory and select the one case; layout_json is passed
        # explicitly because bt_tree/RL use solution_*.json names.
        plot = subprocess.run(
            [sys.executable, PLOT, "--input_dir", os.path.dirname(dst),
             "--case", name, "--placement_json", layout_json],
            cwd=SRC_DIR, env=env, stdout=log, stderr=subprocess.STDOUT)
        if plot.returncode != 0:
            return job, "plot failed", log_path
    grid = os.path.join(dst, "output", f"{name}.grid.steady")
    if not os.path.exists(grid):
        return job, "no grid.steady", log_path
    png = os.path.join(dst, "output", f"{name}{PLOT_SUFFIX}.png")
    if not os.path.exists(png):
        return job, "no heatmap", log_path
    return job, "ok", log_path


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--groups", nargs="*", default=None,
                    help="only run groups whose config_* directory matches these names")
    ap.add_argument("--jobs", type=int, default=8, help="parallel HotSpot runs")
    ap.add_argument("--plot-only", action="store_true",
                    help="reuse existing .grid.steady files and only redraw the "
                         "with-bridge heatmaps")
    ap.add_argument("--package_mode", choices=("layout", "case"),
                    default=PACKAGE_MODE_DEFAULT,
                    help="layout = 每个布局用自己的外接框最长边（默认，写到 "
                         "config_sum）；case = 同一 case 共用最大外接边长（写到 "
                         "config_sum_same_pkg）")
    ap.add_argument("--log_root", default=None,
                    help="日志目录（默认 logs_thermal_<今天>，避免覆盖旧口径的日志）")
    args = ap.parse_args()

    jobs = collect_jobs(args.groups)
    if not jobs:
        print("no jobs matched")
        return 1
    print(f"{len(jobs)} thermal runs, {args.jobs} in parallel")
    log_root = args.log_root or os.path.join(
        THERMAL_DIR, "logs_thermal_" + datetime.date.today().strftime("%Y%m%d"))
    os.makedirs(log_root, exist_ok=True)

    failures = []
    done = 0
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        futures = [pool.submit(run_job, j, log_root, args.plot_only,
                              args.package_mode)
                   for j in jobs]
        for fut in as_completed(futures):
            job, status, log_path = fut.result()
            done += 1
            if status != "ok":
                failures.append((job, status, log_path))
                print(f"[{done}/{len(jobs)}] FAIL {job[0]}/{job[2]}: {status} -> {log_path}")
            elif done % 10 == 0 or done == len(jobs):
                print(f"[{done}/{len(jobs)}] ok")

    print(f"\nfinished: {len(jobs) - len(failures)} ok, {len(failures)} failed")
    for job, status, log_path in failures:
        print(f"  {job[0]}/{job[2]}: {status} ({log_path})")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
