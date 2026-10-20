"""Regenerate every HotSpot config from thermal_pkg sizing and rerun the sims.

The group list mirrors thermal_sim/thermal_pkg.txt: the experiment layouts
(bt_tree / RL / the four gurobi sweeps) and the parameter sweep.  For each
layout this script

    1. runs gen_flp_trace.py into config_sum/<group>/<name>_config,
    2. runs test_thermal.py in that directory (HotSpot + layer-2 PNG).

The package size (TIM / substrate / C4 / heat spreader / heat sink) comes from
CASE_MAX_INTERPOSER_MM in gen_flp_trace.py, which is kept in sync with
thermal_pkg.txt.  Jobs run in parallel because HotSpot is single-threaded.

Usage:
    python3 src/run_all_thermal.py               # all groups
    python3 src/run_all_thermal.py --groups output_bt_tree output_rl
    python3 src/run_all_thermal.py --jobs 8
"""

import argparse
import os
import re
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed

SRC_DIR = os.path.dirname(os.path.abspath(__file__))
THERMAL_DIR = os.path.dirname(SRC_DIR)
MPDAP_DIR = os.path.dirname(THERMAL_DIR)
CONFIG_SUM_DIR = os.path.join(THERMAL_DIR, "config_sum")

GEN = os.path.join(SRC_DIR, "gen_flp_trace.py")
RUN = os.path.join(SRC_DIR, "test_thermal.py")

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
    for group in ("output_bt_tree", "output_rl"):
        root = os.path.join(MPDAP_DIR, "experiment_result", group)
        if not os.path.isdir(root):
            continue
        for case in sorted(os.listdir(root)):
            case_dir = os.path.join(root, case)
            if not os.path.isdir(case_dir):
                continue
            for fname in sorted(os.listdir(case_dir)):
                if not (fname.startswith("solution_") and fname.endswith(".json")):
                    continue
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


def run_job(job, log_root, plot_only=False):
    group, layout_json, name, placement_dir = job
    dst = os.path.join(CONFIG_SUM_DIR, f"config_{group}", f"{name}_config")
    log_path = os.path.join(log_root, f"{group}__{name}.log")

    os.makedirs(dst, exist_ok=True)
    env = dict(os.environ, MPLBACKEND="Agg")
    with open(log_path, "w", encoding="utf-8") as log:
        if not plot_only:
            gen = subprocess.run(
                [sys.executable, GEN, "--json_path", layout_json,
                 "--config_dir", dst, "--name", name],
                cwd=SRC_DIR, env=env, stdout=log, stderr=subprocess.STDOUT)
            if gen.returncode != 0:
                return job, "gen failed", log_path
        sim_cmd = [sys.executable, RUN, "--config_dir", dst,
                   "--placement_dir", placement_dir, "--layout_json", layout_json]
        if plot_only:
            sim_cmd.append("--plot-only")
        sim = subprocess.run(sim_cmd, cwd=SRC_DIR, env=env,
                             stdout=log, stderr=subprocess.STDOUT)
        if sim.returncode != 0:
            return job, "sim failed", log_path
    grid = os.path.join(dst, "output", f"{name}.grid.steady")
    if not os.path.exists(grid):
        return job, "no grid.steady", log_path
    return job, "ok", log_path


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--groups", nargs="*", default=None,
                    help="only run groups whose config_* directory matches these names")
    ap.add_argument("--jobs", type=int, default=8, help="parallel HotSpot runs")
    ap.add_argument("--plot-only", action="store_true",
                    help="reuse existing .grid.steady files and only redraw the PNGs")
    args = ap.parse_args()

    jobs = collect_jobs(args.groups)
    if not jobs:
        print("no jobs matched")
        return 1
    print(f"{len(jobs)} thermal runs, {args.jobs} in parallel")
    log_root = os.path.join(THERMAL_DIR, "logs_thermal_20261020")
    os.makedirs(log_root, exist_ok=True)

    failures = []
    done = 0
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        futures = [pool.submit(run_job, j, log_root, args.plot_only)
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
