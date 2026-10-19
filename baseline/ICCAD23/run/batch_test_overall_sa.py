"""Batch test script for Overall SA.

For every benchmark case, run Overall SA once per seed in `SEEDS`. There is no
iteration cap: a run ends when the annealing is over (the best cost has not
improved for CONVERGENCE_PATIENCE iterations -- see below) or,
failing that, at TIME_LIMIT seconds of annealing wall clock. Every solution is written to disk
(JSON + image) as soon as its run finishes, and `log.json` / `log.txt` are
refreshed after each run, so a crash cannot lose completed runs.

Must be run from this directory (`ICCAD23/run/`), which is what the relative
paths below assume:

    python batch_test_overall_sa.py            # all cases except EXCLUDED_CASES
    python batch_test_overall_sa.py syn1 syn2  # selected cases
"""

import sys
import os
import time
import json
import random
from datetime import datetime

# Add `src` directory to import path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from unit import (load_problem_from_json, save_layout_image, save_result,
                  save_convergence_curve)
from input_ECG import ECGManager
from BtTree import BinaryTree
from OverallSA import overall_sa, format_layer_timing
from bridge_legality import check_problem_layout as check_bridge_layout


# ---- Run configuration ----
SEEDS = [0, 1, 2, 3, 4]   # one SA run per seed, per case (fixed-list mode)

# Seed sweep mode (`--sweep`). Instead of a fixed seed list, a case is run with
# seed = 0, 1, 2, ... and the seed is raised until the case has collected
# SEED_SWEEP_TARGET solutions, or its own SEED_SWEEP_TIME_LIMIT seconds are
# gone -- whichever comes first. Both budgets are PER CASE, not per batch.
#
# What counts is solutions, not attempts: a seed whose layer-1 base derivation
# finds no legal layout logs a failed run and the sweep simply moves to the next
# seed. That is the point -- on cpu-dram most seeds cannot build at all, so a
# fixed seed list mostly measures the build failure rate, while the sweep keeps
# paying for seeds until it has the number of solutions actually wanted.
#
# What it does NOT do is make the solutions comparable across bases: raising
# BASE_DERIVATION_RUNS reshuffles the tree topology (see BtTree.py), so two
# bases are two different search spaces, and a sweep at each does not isolate
# the effect of the base.
#
# `SEED_SWEEP_START` is where the raising begins. It is for resuming a sweep
# whose earlier seeds are already on disk: a resumed run counts only the
# solutions IT produces, so to end up with N solutions in the directory, set
# the target to what is still missing rather than to N.
SEED_SWEEP = False
SEED_SWEEP_TARGET = 5
SEED_SWEEP_TIME_LIMIT = 3600
SEED_SWEEP_START = 0

# Seconds the case has ALREADY spent before this invocation (`--sweep-spent=SEC`).
#
# The time budget belongs to the case, not to the process. A sweep that is
# resumed at seed 5 is not a fresh hour -- the seeds before it were paid for out
# of the same hour, and a failed seed costs real time too (cpu-dram at base 50:
# 32-35 s each). Restarting the clock at 0 on resume would quietly hand the case
# 3600 s per invocation, so the elapsed time is carried in and subtracted:
# the run stops when `spent_before + spent_now` reaches SEED_SWEEP_TIME_LIMIT.
#
# Left at None it is detected from the case's own log.json (`sweep_elapsed_seconds`,
# which is cumulative across resumes) whenever the sweep is a resume
# (`SEED_SWEEP_START > 0`) and that file exists; `--sweep-spent=0` disables the
# carry-over and gives the invocation a fresh clock.
SEED_SWEEP_SPENT = None

# Wall-clock budget for the whole batch, across all cases (`--total-limit=SEC`,
# 0 = none). It is enforced by trimming: a case is given at most the budget left
# when it starts, so a case cannot run past the batch deadline, and cases that
# would start after it is spent are skipped rather than run. Note what this
# means for a multi-case run -- one slow case can spend the entire budget and
# the rest never start, which is the intended reading of "the batch gets an
# hour" but not the same as "each case gets an hour".
BATCH_TIME_LIMIT = 3600
# No iteration cap: annealing ends when it is over, not when a guessed iteration
# count runs out. The run has exactly two stopping conditions --
#   1. convergence: the best cost has not improved for CONVERGENCE_PATIENCE
#      consecutive iterations; the run ends there.
#   2. TIME_LIMIT seconds of annealing wall clock, for the case where a run
#      keeps finding improvements.
# This is the stagnation-count rule the pipeline used before the sliding-window
# band test. `no_improve_count` is reset on every new best, so a run always gets
# the full patience window after its last improvement.
# `best_hold_fraction` (share of the run spent sitting on the best cost) and
# `last_improve_at` are reported alongside as evidence.
MAX_ITERATIONS = None            # None = unbounded (see above)
CONVERGENCE_PATIENCE = 10000     # iterations without a best-cost improvement = converged
# Wall-clock cap of a single SA run (seconds). The second stopping condition:
# with no iteration cap, this is what bounds a run that never freezes. Measured
# annealing cost is ~0.5 ms/iteration, and a normal freeze lands at 15k-30k
# iterations (~10-15 s), so this is a safety net, not the usual exit.
TIME_LIMIT = 3600
# Off: no convergence_*.png per run. This also stops the trace from being
# collected (`trace = None`), so it saves the per-iteration RAM as well.
SAVE_CONVERGENCE_CURVE = False

# Files in benchmark/test_input that end with `.json` but are not solver cases.
EXCLUDED_CASES = {
    'EMIB': 'EMIB type config, no "chiplets" key (load_problem_from_json raises KeyError)',
    'sys_micro150': 'excluded on request',
    'cpu-dram copy': 'stale pre-upgrade archive of cpu-dram.json',
    'acend910_old': 'stale pre-upgrade archive of acend910.json',
}


def ensure_dir(path):
    """Ensure directory exists."""
    os.makedirs(path, exist_ok=True)


def build_run_timing(bt_tree, sa_seconds, sa_stats, total_seconds,
                     tree_build_seconds=None):
    """Assemble the per-layer time split of one run into a single record.

    The pipeline is three SAs stacked on one wall clock, each with a different
    objective:
        layer 1  legality only        Pc / Pl        (base derivation)
        layer 2  shape + similarity   Px / Py / Ps   (group construction)
        layer 3  real quality         A / WL / R     (main SA)

    Layers 1 and 2 are build-time; their seconds are kept on the tree (and stay
    there even when the build dies half way), so a failed run still reports what
    it burned. `tree_build_seconds` is the caller's own clock around the whole
    build, which additionally covers the ECG grouping and the BT assembly.
    """
    build = bt_tree.get_build_timing() if bt_tree is not None else {}
    layer1 = build.get('layer1_seconds', 0.0)
    layer2 = build.get('layer2_seconds', 0.0)
    sa_stats = sa_stats or {}
    return {
        'layer1_legality_s': layer1,
        'layer2_similarity_s': layer2,
        'layer3_quality_s': sa_seconds,
        'layer1_plus_layer2_s': layer1 + layer2,
        'tree_build_s': tree_build_seconds,
        'total_s': total_seconds,
        'layer3_iterations': sa_stats.get('iterations'),
        'layer3_converged': sa_stats.get('converged'),
        'layer3_stop_reason': sa_stats.get('stop_reason'),
        'layer3_seconds_to_best': sa_stats.get('best_found_time'),
        'layer1_stats': build.get('layer1_stats', {}),
        'layer2_stats': build.get('layer2_stats', {}),
        'layer3_stats': sa_stats,
    }


def save_solution(layout, problem, cost, solution_idx, output_dir,
                  seed, total_time, max_iterations, hit_time_limit, trace=None,
                  timing=None):
    """Save one solution (JSON + image + optional convergence curve) and return log metadata.

    `solution_idx` is the run number (1-based, i.e. seed order), so file names
    are stable and never need rewriting when a later run produces a better cost.
    Every file name carries the seed as `_seedNN` (zero padded), so solutions
    from different seeds can live in the same directory side by side.
    `total_time` is the whole wall clock of the run that produced this solution
    (BT tree construction + annealing).
    `trace` is the `(time, current_cost, best_cost)` record from `overall_sa`;
    when given, the cost convergence curve is written next to the image.
    `timing` is the per-layer time split of this run, stored in the log entry.
    """
    tag = f"seed{seed:02d}"

    # Save JSON (full schema via `save_result`)
    json_path = os.path.join(
        output_dir, f"solution_{solution_idx}_{tag}_cost_{cost:.6f}.json")
    save_result(layout, json_path, problem)

    # Check the physical EMIB bridges. The search itself optimises A/WL/R and
    # never looks at the bridge rectangles, so this is where a finished layout
    # is verified against the real per-edge geometry: every bridge must fit on
    # its shared edge and no two bridges may overlap. It does not change the
    # solution -- only the log records what was found.
    bridge_report = check_bridge_layout(layout, problem)
    if bridge_report["legal"]:
        print(f"  ✓ Bridges legal ({bridge_report['bridge_count']} bridge(s))")
    else:
        print(f"  ⚠ Bridges ILLEGAL: {bridge_report['overlap_pairs']} "
              f"overlap pair(s), area {bridge_report['overlap_area']:.4f} "
              f"-- {bridge_report['errors'][0]}")

    # Save image
    img_path = os.path.join(
        output_dir, f"solution_{solution_idx}_{tag}_cost_{cost:.6f}.png")
    save_layout_image(layout, problem, img_path, show_bridges=True, show_coordinates=False)

    # Save the cost convergence curve of this run
    curve_path = None
    if SAVE_CONVERGENCE_CURVE and trace:
        curve_path = os.path.join(
            output_dir, f"convergence_{solution_idx}_{tag}.png")
        save_convergence_curve(
            trace, curve_path,
            title=f"cost vs annealing time (run {solution_idx}, seed {seed})")

    # Compute utilization
    chip_area = sum(chip.width * chip.height for chip in problem.chiplets.values())
    max_x = max(chip.x + chip.width for chip in layout.values())
    max_y = max(chip.y + chip.height for chip in layout.values())
    layout_area = max_x * max_y if max_x > 0 and max_y > 0 else 1.0
    utilization = (chip_area / layout_area) * 100

    return {
        'solution_idx': solution_idx,
        'seed': seed,
        'cost': cost,
        'utilization': utilization,
        'total_time': total_time,
        'max_iterations': max_iterations,
        'hit_time_limit': hit_time_limit,
        'json_file': os.path.basename(json_path),
        'image_file': os.path.basename(img_path),
        'convergence_file': os.path.basename(curve_path) if curve_path else None,
        # Physical EMIB bridge verdict (see bridge_legality.py): the same
        # geometry and bridge-overlap rule the RL baseline is checked with.
        'bridge_legal': bridge_report["legal"],
        'bridge_count': bridge_report["bridge_count"],
        'bridge_overlap_pairs': bridge_report["overlap_pairs"],
        'bridge_overlap_area': bridge_report["overlap_area"],
        'bridge_errors': bridge_report["errors"],
        'timing': timing or {},
    }


def run_case_all_seeds(json_path, case_name, output_dir,
                       seeds=SEEDS,
                       max_iterations=MAX_ITERATIONS,
                       time_limit=TIME_LIMIT,
                       seed_sweep_target=None,
                       seed_sweep_time_limit=None,
                       seed_sweep_start=0,
                       seed_sweep_spent=0.0):
    """Run one SA per seed, saving each solution as soon as its run ends.

    With `seed_sweep_target` set the `seeds` list is ignored: seeds are taken as
    `seed_sweep_start`, +1, +2, ... and the case stops once it holds that many
    solutions, or after `seed_sweep_time_limit` seconds of its own clock. Both
    are per case. Only solutions found by *this* call count towards the target,
    which is what `seed_sweep_start` is for: resuming counts what is still
    missing, not what the directory already holds.

    `seed_sweep_spent` is time the case already spent in earlier invocations,
    counted against the same budget: the clock that `seed_sweep_time_limit` is
    measured on starts `seed_sweep_spent` seconds in the past. Resuming a sweep
    therefore gets the remainder of the hour, not another hour.
    """
    sweep = seed_sweep_target is not None
    sweep_spent = max(0.0, float(seed_sweep_spent or 0.0)) if sweep else 0.0
    print(f"\n{'='*80}")
    print(f"Test case: {case_name}")
    print(f"Input file: {json_path}")
    print(f"Output dir: {output_dir}")
    freeze = (f"the best cost has not improved for {CONVERGENCE_PATIENCE} iterations"
              if CONVERGENCE_PATIENCE > 0
              else f"{max_iterations} iterations")
    cap = (f"stops when {freeze}, or at the {time_limit:.0f}s wall clock"
           if time_limit else f"stops when {freeze}")
    if sweep:
        budget = (f"{seed_sweep_time_limit:.0f}s"
                  if seed_sweep_time_limit else "no time limit")
        carried = (f" (case clock starts at {sweep_spent:.1f}s already spent, "
                   f"{max(0.0, seed_sweep_time_limit - sweep_spent):.1f}s left)"
                   if seed_sweep_time_limit and sweep_spent else "")
        print(f"Mode: seed sweep -- seed = {seed_sweep_start}, "
              f"{seed_sweep_start + 1}, {seed_sweep_start + 2}, ... until "
              f"{seed_sweep_target} solutions exist or {budget} of this case's "
              f"clock is gone{carried}; no iteration cap: {cap}")
    else:
        print(f"Mode: {len(seeds)} runs, seeds={seeds}, no iteration cap: {cap}")
    print(f"{'='*80}\n")

    # Ensure output directory exists
    ensure_dir(output_dir)

    # Load problem
    problem = load_problem_from_json(json_path)
    print(f"Problem size: {len(problem.chiplets)} chiplets, "
          f"{problem.connection_graph.number_of_edges()} connections\n")

    # Solutions already written to disk (one entry per successful run)
    log_entries = []

    # Per-run detail records
    run_details = []

    # Seeds actually attempted, in order. In fixed-list mode this is just
    # `seeds`; in sweep mode it is whatever the sweep got through before it
    # stopped, which is the only place the final seed count is recorded.
    seeds_run = []

    # Case start timestamp
    case_start_time = time.time()

    # The clock the sweep budget is measured on: backdated by what the case
    # already spent, so `time.time() - sweep_clock_start` is the case's total
    # time, not this invocation's. `case_start_time` stays the real start, so
    # the logged per-invocation times keep their meaning.
    sweep_clock_start = case_start_time - sweep_spent

    def avg_layer(runs, key):
        """Average one per-layer timing field over the given runs (0.0 if none)."""
        values = [r['timing'][key] for r in runs
                  if r.get('timing') and r['timing'].get(key) is not None]
        return sum(values) / len(values) if values else 0.0

    def flush_logs(status):
        """Write log.json + log.txt from the runs recorded so far."""
        # Compute summary statistics
        success_runs = [r for r in run_details if r['status'] == 'success']

        if success_runs:
            costs = [r['cost'] for r in success_runs]
            total_times = [r['total_time'] for r in success_runs]

            stats = {
                'success_count': len(success_runs),
                'failed_count': len(run_details) - len(success_runs),
                'hit_time_limit_count': sum(1 for r in success_runs if r['hit_time_limit']),
                'cost': {
                    'best': min(costs),
                    'worst': max(costs),
                    'average': sum(costs) / len(costs),
                    'std_dev': (sum((c - sum(costs)/len(costs))**2 for c in costs) / len(costs))**0.5
                },
                'time': {
                    'avg_total_time': sum(total_times) / len(total_times),
                    'min_total_time': min(total_times),
                    'max_total_time': max(total_times),
                    # Same runs, split into the three annealing layers (seconds)
                    'avg_layer1_legality_s': avg_layer(success_runs, 'layer1_legality_s'),
                    'avg_layer2_similarity_s': avg_layer(success_runs, 'layer2_similarity_s'),
                    'avg_layer3_quality_s': avg_layer(success_runs, 'layer3_quality_s'),
                    'avg_tree_build_s': avg_layer(success_runs, 'tree_build_s'),
                }
            }
        else:
            stats = {
                'success_count': 0,
                'failed_count': len(run_details)
            }

        log_info = {
            'case_name': case_name,
            'timestamp': datetime.now().isoformat(),
            'status': status,  # 'in_progress' while running, 'completed' at the end
            'seeds': list(seeds_run),
            'total_runs': len(log_entries),
            'num_chiplets': len(problem.chiplets),
            'num_connections': problem.connection_graph.number_of_edges(),
            'max_iterations': max_iterations,
            'time_limit_seconds': time_limit,
            'total_time_seconds': time.time() - case_start_time,
            # Sweep budget accounting. `sweep_elapsed_seconds` is cumulative over
            # resumes and is the field to carry into the next one
            # (`--sweep-spent=<that>`); `total_time_seconds` above is only this
            # invocation's own slice.
            'sweep_spent_before_seconds': sweep_spent if sweep else None,
            'sweep_elapsed_seconds': (sweep_spent + time.time() - case_start_time
                                      if sweep else None),
            'sweep_time_limit_seconds': seed_sweep_time_limit if sweep else None,
            'statistics': stats,  # Summary statistics
            'run_details': run_details,  # Per-run details
            # How many saved solutions pass the physical bridge check
            # (bridge rectangles fit their shared edges and do not overlap).
            'bridge_legal_solutions': sum(1 for e in log_entries
                                          if e.get('bridge_legal')),
            # Sorted by cost for readability; file names keep run order
            'solutions': sorted(log_entries, key=lambda e: e['cost'])
        }

        with open(os.path.join(output_dir, "log.json"), 'w', encoding='utf-8') as f:
            json.dump(log_info, f, indent=2, ensure_ascii=False)

        # Human-readable text log
        with open(os.path.join(output_dir, "log.txt"), 'w', encoding='utf-8') as f:
            f.write(f"{'='*80}\n")
            f.write(f"Test case: {case_name}\n")
            f.write(f"Status: {status}\n")
            f.write(f"Time: {log_info['timestamp']}\n")
            f.write(f"{'='*80}\n\n")
            f.write(f"Problem size:\n")
            f.write(f"  Chiplets: {log_info['num_chiplets']}\n")
            f.write(f"  Connections: {log_info['num_connections']}\n\n")
            f.write(f"Run configuration:\n")
            f.write(f"  Seeds: {list(seeds_run)}\n")
            f.write(f"  Iteration cap: "
                    f"{max_iterations if max_iterations is not None else 'none (unbounded)'}\n")
            f.write(f"  Stopping condition 1 (convergence): no best-cost "
                    f"improvement for {CONVERGENCE_PATIENCE} iterations\n")
            f.write(f"  Stopping condition 2 (wall clock): "
                    f"{f'{time_limit} s ({time_limit/60:.1f} min)' if time_limit else 'none'}\n\n")
            f.write(f"Run statistics:\n")
            f.write(f"  Total solutions: {log_info['total_runs']}\n")
            f.write(f"  Bridge-legal solutions: "
                    f"{log_info['bridge_legal_solutions']}/{log_info['total_runs']}\n")
            f.write(f"  Actual time: {log_info['total_time_seconds']/60:.2f} min\n")
            if sweep:
                here = log_info['total_time_seconds'] / 60
                before = log_info['sweep_spent_before_seconds'] / 60
                if seed_sweep_time_limit:
                    f.write(f"  Sweep budget: {before:.2f} min earlier + "
                            f"{here:.2f} min here = "
                            f"{log_info['sweep_elapsed_seconds']/60:.2f} min "
                            f"of {seed_sweep_time_limit/60:.2f} min\n")
                else:
                    f.write(f"  Sweep budget: none "
                            f"({log_info['sweep_elapsed_seconds']/60:.2f} min so far)\n")
            f.write(f"\n")

            f.write(f"{'='*80}\n")
            f.write(f"Per-run details:\n")
            f.write(f"{'='*80}\n\n")

            failed_runs = [r for r in run_details if r['status'] == 'failed']

            f.write(f"Successful runs: {len(success_runs)}/{len(run_details)}\n")
            f.write(f"Failed runs: {len(failed_runs)}/{len(run_details)}\n")
            f.write(f"Runs that hit the time limit: "
                    f"{sum(1 for r in success_runs if r['hit_time_limit'])}\n\n")

            if success_runs:
                avg_cost = sum(r['cost'] for r in success_runs) / len(success_runs)
                avg_total_time = sum(r['total_time'] for r in success_runs) / len(success_runs)
                best_cost = min(r['cost'] for r in success_runs)
                worst_cost = max(r['cost'] for r in success_runs)

                f.write(f"Cost statistics:\n")
                f.write(f"  Best: {best_cost:.6f}\n")
                f.write(f"  Worst: {worst_cost:.6f}\n")
                f.write(f"  Average: {avg_cost:.6f}\n\n")

                build_times = [r['tree_build_time'] for r in success_runs]
                avg_build_time = sum(build_times) / len(build_times)

                f.write(f"Time statistics (whole run = tree build + annealing):\n")
                f.write(f"  Avg total run time: {avg_total_time:.2f} s\n")
                f.write(f"  Avg tree build time: {avg_build_time:.2f} s "
                        f"({sum(r['tree_build_count'] for r in success_runs)} "
                        f"build(s) total)\n")
                f.write(f"  Avg annealing time: "
                        f"{avg_total_time - avg_build_time:.2f} s\n")
                f.write(f"  Layer split (averaged over {len(success_runs)} run(s)):\n")
                f.write(f"    Layer 1 legality      Pc/Pl     : "
                        f"{avg_layer(success_runs, 'layer1_legality_s'):.2f} s\n")
                f.write(f"    Layer 2 shape+similar Px/Py/Ps  : "
                        f"{avg_layer(success_runs, 'layer2_similarity_s'):.2f} s\n")
                f.write(f"    Layer 3 real quality  A/WL/R    : "
                        f"{avg_layer(success_runs, 'layer3_quality_s'):.2f} s\n\n")

            f.write(f"{'-'*80}\n")
            f.write(f"Detailed run records:\n")
            f.write(f"{'-'*80}\n\n")

            for detail in run_details:
                f.write(f"Run #{detail['run_id']}:\n")
                f.write(f"  Random seed: {detail['seed']}\n")
                f.write(f"  Status: {detail['status']}\n")

                if detail['status'] == 'success':
                    f.write(f"  Cost: {detail['cost']:.6f}\n")
                    f.write(f"  Total run time: {detail['total_time']:.2f} s\n")
                    f.write(f"  Tree build: {detail['tree_build_count']} time(s), "
                            f"{detail['tree_build_time']:.2f} s\n")
                    f.write(f"  Annealing: "
                            f"{detail['total_time'] - detail['tree_build_time']:.2f} s\n")
                    if detail.get('annealing_time') is not None:
                        f.write(f"  Annealing wall clock: {detail['annealing_time']:.2f} s "
                                f"({detail.get('annealing_iterations')} iterations)\n")
                        f.write(f"  Converged: {detail.get('converged')} "
                                f"({detail.get('stop_reason')})\n")
                        if detail.get('best_hold_fraction') is not None:
                            f.write(f"  Best cost occupied: "
                                    f"{detail['best_hold_iterations']} iterations "
                                    f"({detail['best_hold_fraction']:.1%} of the run), "
                                    f"last improved at iteration "
                                    f"{detail.get('last_improve_at')}\n")
                        f.write(f"  Time to best solution: {detail.get('seconds_to_best'):.2f} s\n")
                    f.write(f"  Hit time limit: {detail['hit_time_limit']}\n")
                    f.write(f"  Chiplets: {detail['num_chiplets']}\n")
                else:
                    f.write(f"  Error: {detail.get('error', 'Unknown')}\n")
                    f.write(f"  Run time: {detail.get('total_time', 0):.2f} s\n")
                    if detail.get('tree_build_time') is not None:
                        f.write(f"  Tree build: {detail.get('tree_build_count', 0)} "
                                f"time(s), {detail['tree_build_time']:.2f} s "
                                f"(failed during build)\n")

                # Three-layer time split of this run
                for line in detail.get('timing_lines', []):
                    f.write(f"  {line}\n")

                f.write(f"\n")

            f.write(f"{'='*80}\n")
            f.write(f"All {len(log_entries)} solutions (sorted by cost):\n")
            f.write(f"{'='*80}\n\n")

            for rank, entry in enumerate(log_info['solutions'], 1):
                f.write(f"Solution #{entry['solution_idx']} (rank {rank} by cost):\n")
                f.write(f"  Cost: {entry['cost']:.6f}\n")
                f.write(f"  Utilization: {entry['utilization']:.2f}%\n")
                f.write(f"  Total run time: {entry['total_time']:.2f} s\n")
                f.write(f"  From seed: {entry['seed']}\n")
                f.write(f"  JSON: {entry['json_file']}\n")
                f.write(f"  Image: {entry['image_file']}\n")
                if entry.get('convergence_file'):
                    f.write(f"  Curve: {entry['convergence_file']}\n")
                if entry.get('bridge_legal') is not None:
                    f.write(f"  Bridges: "
                            f"{'legal' if entry['bridge_legal'] else 'ILLEGAL'} "
                            f"({entry.get('bridge_count', 0)} bridge(s)")
                    if entry.get('bridge_overlap_pairs'):
                        f.write(f", {entry['bridge_overlap_pairs']} overlap pair(s), "
                                f"area {entry['bridge_overlap_area']:.4f}")
                    f.write(f")\n")
                    for err in entry.get('bridge_errors') or []:
                        f.write(f"    ! {err}\n")
                f.write(f"\n")

        return log_info

    seed_iter = iter(seeds)
    run_idx = 0
    sweep_stop = None
    while True:
        if sweep:
            # Checked before every run, and on solutions rather than attempts:
            # a seed whose layer-1 build fails just advances the seed, so a case
            # that rarely builds keeps being paid for until it has the count
            # asked for. Both budgets are this case's own.
            if len(log_entries) >= seed_sweep_target:
                sweep_stop = (f'target reached: {len(log_entries)} solutions '
                              f'from {run_idx} seeds')
                break
            if (seed_sweep_time_limit and
                    time.time() - sweep_clock_start >= seed_sweep_time_limit):
                sweep_stop = (f'sweep time limit {seed_sweep_time_limit:.0f}s '
                              f'reached ({sweep_spent:.0f}s before this run + '
                              f'{time.time() - case_start_time:.0f}s here): '
                              f'{len(log_entries)} solutions from '
                              f'{run_idx} seeds')
                break
            seed = seed_sweep_start + run_idx
            # A case that rarely builds can go hundreds of seeds with nothing
            # but failures, so say where the sweep is every 25 attempts.
            if run_idx and run_idx % 25 == 0:
                print(f"  SWEEP {run_idx} seeds tried (up to seed {seed - 1}), "
                      f"{len(log_entries)}/{seed_sweep_target} solutions, "
                      f"{(time.time() - sweep_clock_start)/60:.1f} min "
                      f"of the case's budget")
        else:
            seed = next(seed_iter, None)
            if seed is None:
                break
        run_idx += 1
        seeds_run.append(seed)
        elapsed_time = time.time() - case_start_time
        if sweep and sweep_spent:
            # Show the case's whole clock, not just this invocation's slice --
            # otherwise a resumed sweep looks like it is inside its budget when
            # the time it inherited has already eaten most of it.
            elapsed_str = (f"{sweep_spent/60:.1f} min earlier + "
                           f"{elapsed_time/60:.1f} min here = "
                           f"{(sweep_spent + elapsed_time)/60:.1f} min")
        else:
            elapsed_str = f"{elapsed_time/60:.1f} min"
        progress = (f'{seed_sweep_target} solutions' if sweep
                    else f'{len(seeds)}')
        print(f"\n{'─'*80}")
        print(f"Run #{run_idx}/{progress} (seed={seed}, elapsed: {elapsed_str})")
        print(f"{'─'*80}")

        # Fixed seed -> the run is reproducible
        random.seed(seed)

        # Run start offset from case start
        run_start_offset = time.time() - case_start_time
        run_start_time = time.time()
        tree_build_time = None   # kept outside the try so failures can log it too
        tree_build_count = 0
        bt_tree = None           # same reason: a failed build still has timings
        sa_seconds = 0.0
        sa_stats = {}

        try:
            # Create ECG manager
            ecg_manager = ECGManager(problem)

            # Build BT tree. This dominates the wall clock: every multi-chip ECG
            # runs `run_base_derivation` (30 legality-SAs) and then GroupConstrua.
            # The `finally` keeps the timing (and the attempt count) even when
            # the build itself is what fails, which is the common failure here.
            tree_build_start = time.time()
            bt_tree = BinaryTree()
            try:
                bt_tree.build_from_ecgs(ecg_manager,
                                       build_similarity_forests=True,
                                       seed=seed)
            finally:
                tree_build_time = time.time() - tree_build_start
                tree_build_count = bt_tree.build_count

            print(f"  ✓ BT tree built in {tree_build_time:.2f}s "
                  f"({tree_build_count} build(s))")

            # Collect the cost convergence curve of this run
            trace = [] if SAVE_CONVERGENCE_CURVE else None

            # Layer 3: the main SA. Only this one optimizes real quality
            # (A / WL / R); layers 1 and 2 were the build above.
            sa_stats = {}
            sa_start = time.time()

            # Run Overall SA until the search freezes or the wall clock runs out.
            best_layout, best_cost, _best_found_time = overall_sa(
                bt_tree=bt_tree,
                ecg_manager=ecg_manager,
                problem=problem,
                max_iterations=max_iterations,
                initial_temp=500.0,
                cooling_rate=0.98,
                alpha=0.8,
                beta=0.1,
                gamma=0.1,
                target_ratio=1.0,
                verbose=False,  # Disable verbose logs
                save_best=False,  # Do not auto-save
                output_dir=None,
                time_limit=time_limit,
                trace=trace,
                stats=sa_stats,
                convergence_patience=CONVERGENCE_PATIENCE
            )
            sa_seconds = time.time() - sa_start

            # A run without a bridge-legal layout is a failed run: an illegal
            # layout must never be recorded or saved as a solution.
            if best_layout is None:
                raise RuntimeError(
                    "no bridge-legal layout found: every candidate in layer 3 "
                    "had overlapping or ill-fitting EMIB bridges")

            run_time = time.time() - run_start_time

            # Re-read after annealing: SA only perturbs the already-built tree
            # (swap / move / rotate / switch to another layout of the frozen
            # similarity forest), so this must still be the same as before SA.
            # A larger number here would mean SA rebuilt the tree mid-run.
            tree_build_count_after_sa = bt_tree.build_count
            if tree_build_count_after_sa != tree_build_count:
                print(f"  ⚠ BT tree was rebuilt during annealing "
                      f"({tree_build_count} -> {tree_build_count_after_sa})")
            tree_build_count = tree_build_count_after_sa

            # `overall_sa` times only the annealing loop, so compare that clock
            # (not `run_time`, which also carries the tree build) to the limit.
            hit_time_limit = (time_limit is not None
                              and sa_seconds >= time_limit * 0.999)

            print(f"✓ Done: cost={best_cost:.6f}, total run time {run_time:.2f}s "
                  f"(annealing {sa_seconds:.2f}s, {sa_stats.get('iterations')} iterations)"
                  f"{' [hit time limit]' if hit_time_limit else ''}")

            # Per-layer time split of this run (see `format_layer_timing`).
            timing = build_run_timing(bt_tree, sa_seconds, sa_stats, run_time,
                                      tree_build_seconds=tree_build_time)
            timing_lines = format_layer_timing(
                bt_tree, layer3_seconds=sa_seconds, layer3_stats=sa_stats,
                total_seconds=run_time)

            # Record this run. `run_time` is the whole run: tree building + annealing.
            run_detail = {
                'run_id': run_idx,
                'seed': seed,
                'status': 'success',
                'cost': best_cost,
                'total_time': run_time,  # Whole-run wall clock (tree build + SA)
                # Split of `total_time`: the BT tree build (30 legality-SAs per
                # multi-chip ECG + GroupConstrua) vs the annealing itself.
                # `tree_build_count` is read after SA: 1 means the tree was built
                # once and merely perturbed afterwards.
                'tree_build_time': tree_build_time,
                'tree_build_count': tree_build_count,
                'hit_time_limit': hit_time_limit,
                # Layer 3 exit status: converged = the best cost has not improved
                # for CONVERGENCE_PATIENCE iterations; otherwise the wall clock
                # ran out.
                'annealing_time': sa_seconds,
                'annealing_iterations': sa_stats.get('iterations'),
                'converged': sa_stats.get('converged'),
                'stop_reason': sa_stats.get('stop_reason'),
                'best_hold_iterations': sa_stats.get('best_hold_iterations'),
                'best_hold_fraction': sa_stats.get('best_hold_fraction'),
                'stagnation_iterations': sa_stats.get('stagnation_iterations'),
                'stagnation_fraction': sa_stats.get('stagnation_fraction'),
                'last_improve_at': sa_stats.get('last_improve_at'),
                'seconds_to_best': sa_stats.get('best_found_time'),
                'num_chiplets': len(best_layout),
                'start_offset': run_start_offset,  # Run start offset within the case
                'timing': timing,
                'timing_lines': timing_lines
            }
            run_details.append(run_detail)

            for line in timing_lines:
                print(line)

            # Save this solution immediately: a crash must not lose a finished run
            entry = save_solution(
                best_layout, problem, best_cost, run_idx,
                output_dir, seed, run_time, max_iterations, hit_time_limit,
                trace=trace, timing=timing
            )
            log_entries.append(entry)
            print(f"  ✓ Solution saved: {entry['json_file']}")
            if entry['convergence_file']:
                print(f"  ✓ Convergence curve: {entry['convergence_file']}")

        except Exception as e:
            print(f"✗ Run failed: {e}")
            import traceback
            traceback.print_exc()

            # Record failed run. `tree_build_time` is what the run burned before
            # dying -- for a base-derivation failure that is the whole run, and
            # it is layer 1 that burned all of it.
            failed_total = time.time() - run_start_time
            failed_timing_lines = format_layer_timing(
                bt_tree, layer3_seconds=sa_seconds, layer3_stats=sa_stats,
                total_seconds=failed_total)
            run_detail = {
                'run_id': run_idx,
                'seed': seed,
                'status': 'failed',
                'error': str(e),
                'total_time': failed_total,
                'tree_build_time': tree_build_time,
                'tree_build_count': tree_build_count,
                'timing': build_run_timing(bt_tree, sa_seconds, sa_stats, failed_total,
                                           tree_build_seconds=tree_build_time),
                'timing_lines': failed_timing_lines
            }
            run_details.append(run_detail)
            for line in failed_timing_lines:
                print(line)

        # Refresh the on-disk logs so they always match what has been saved
        flush_logs('in_progress')

    # All solutions are already on disk by now; report what was written
    print(f"\n{'='*80}")
    if sweep:
        print(f"Seed sweep stopped: {sweep_stop}")
        print(f"Completed {len(log_entries)}/{seed_sweep_target} solutions "
              f"from {run_idx} seeds tried; all solutions already saved")
    else:
        print(f"Completed {len(log_entries)}/{len(seeds)} successful runs; "
              f"all solutions already saved")
    print(f"{'='*80}")

    # Run statistics
    success_runs = [r for r in run_details if r['status'] == 'success']
    failed_runs = [r for r in run_details if r['status'] == 'failed']

    print(f"\nRun statistics:")
    print(f"  Success: {len(success_runs)}/{len(run_details)}")
    print(f"  Failed: {len(failed_runs)}/{len(run_details)}")
    print(f"  Hit time limit: {sum(1 for r in success_runs if r['hit_time_limit'])}")
    converged_runs = [r for r in success_runs if r.get('converged')]
    print(f"  Converged (no best-cost improvement for "
          f"{CONVERGENCE_PATIENCE} iterations): "
          f"{len(converged_runs)}/{len(success_runs)}")
    for r in success_runs:
        print(f"    seed {r['seed']}: {r.get('annealing_iterations')} iterations, "
              f"{r.get('annealing_time'):.2f} s, "
              f"best cost occupied {r.get('best_hold_fraction', 0):.1%} of the run, "
              f"{'converged' if r.get('converged') else 'budget exhausted'}"
              f"{'' if r.get('converged') else ' -- ' + str(r.get('stop_reason'))}")

    if success_runs:
        avg_cost = sum(r['cost'] for r in success_runs) / len(success_runs)
        best_cost = min(r['cost'] for r in success_runs)
        worst_cost = max(r['cost'] for r in success_runs)
        total_times = [r['total_time'] for r in success_runs]

        print(f"\nCost statistics:")
        print(f"  Best: {best_cost:.6f}")
        print(f"  Worst: {worst_cost:.6f}")
        print(f"  Average: {avg_cost:.6f}")
        print(f"  Std Dev: {(sum((r['cost'] - avg_cost)**2 for r in success_runs) / len(success_runs))**0.5:.6f}")

        build_times = [r['tree_build_time'] for r in success_runs]
        avg_total = sum(total_times) / len(total_times)
        avg_build = sum(build_times) / len(build_times)

        print(f"\nTime statistics (whole run = tree build + annealing):")
        print(f"  Avg total run time: {avg_total:.2f} s")
        print(f"  Min / Max: {min(total_times):.2f} / {max(total_times):.2f} s")
        print(f"  Avg tree build time: {avg_build:.2f} s "
              f"({sum(r['tree_build_count'] for r in success_runs)} build(s) total)")
        print(f"  Avg annealing time: {avg_total - avg_build:.2f} s")
        annealing_times = [r['annealing_time'] for r in success_runs
                           if r.get('annealing_time') is not None]
        if annealing_times:
            print(f"  Layer 3 annealing wall clock (sum): {sum(annealing_times):.2f} s, "
                  f"avg {sum(annealing_times)/len(annealing_times):.2f} s, "
                  f"min/max {min(annealing_times):.2f} / {max(annealing_times):.2f} s")
        print(f"  Layer split (average over {len(success_runs)} run(s)):")
        print(f"    Layer 1 legality      Pc/Pl     : "
              f"{avg_layer(success_runs, 'layer1_legality_s'):.2f} s")
        print(f"    Layer 2 shape+similar Px/Py/Ps  : "
              f"{avg_layer(success_runs, 'layer2_similarity_s'):.2f} s")
        print(f"    Layer 3 real quality  A/WL/R    : "
              f"{avg_layer(success_runs, 'layer3_quality_s'):.2f} s")

    print()

    # Final log write, marked as completed
    log_info = flush_logs('completed')

    print(f"✓ Log saved: {os.path.join(output_dir, 'log.json')}")
    print(f"✓ Text log saved: {os.path.join(output_dir, 'log.txt')}")

    return log_info


def discover_cases(benchmark_dir):
    """List runnable cases, skipping non-case files and EXCLUDED_CASES."""
    cases = []
    excluded = []
    for file in sorted(os.listdir(benchmark_dir)):
        if not file.endswith('.json'):
            continue
        case_name = file[:-5]  # Remove .json suffix
        if case_name in EXCLUDED_CASES:
            excluded.append((case_name, EXCLUDED_CASES[case_name]))
        else:
            cases.append(case_name)
    return cases, excluded


def main():
    """Main entry: batch test all cases or specified cases.

    Usage:
        python batch_test_overall_sa.py                     # all cases, SEEDS
        python batch_test_overall_sa.py syn1 syn2           # selected cases
        python batch_test_overall_sa.py hp6_m --seeds=1,2,3,4,5
        python batch_test_overall_sa.py cpu-dram --sweep    # raise the seed
        python batch_test_overall_sa.py cpu-dram --sweep --sweep-target=5
        python batch_test_overall_sa.py --sweep --sweep-limit=1800
    """

    # Config (relative to ICCAD23/run/, which is the expected CWD)
    benchmark_dir = os.path.join("..", "..", "..", "benchmark", "test_input")
    result_base_dir = os.path.join("..", "result")

    # `--seeds=1,2,3,4,5` overrides the configured seed list; `--sweep` ignores
    # the list entirely and raises the seed per case instead (see SEED_SWEEP_*
    # above). `--sweep-target=N` / `--sweep-limit=SECONDS` override the budgets;
    # `--sweep-limit=0` means no time budget, solution count only.
    seeds = SEEDS
    seed_sweep = SEED_SWEEP
    seed_sweep_target = SEED_SWEEP_TARGET
    seed_sweep_time_limit = SEED_SWEEP_TIME_LIMIT
    seed_sweep_start = SEED_SWEEP_START
    seed_sweep_spent = SEED_SWEEP_SPENT
    batch_time_limit = BATCH_TIME_LIMIT
    argv = []
    for arg in sys.argv[1:]:
        if arg.startswith("--seeds="):
            seeds = [int(s) for s in arg.split("=", 1)[1].split(",") if s.strip() != ""]
        elif arg.startswith("--total-limit="):
            value = float(arg.split("=", 1)[1])
            batch_time_limit = value if value > 0 else None
        elif arg == "--sweep":
            seed_sweep = True
        elif arg.startswith("--sweep-target="):
            seed_sweep_target = int(arg.split("=", 1)[1])
            seed_sweep = True
        elif arg.startswith("--sweep-limit="):
            value = float(arg.split("=", 1)[1])
            seed_sweep_time_limit = value if value > 0 else None
            seed_sweep = True
        elif arg.startswith("--seed-start="):
            seed_sweep_start = int(arg.split("=", 1)[1])
            seed_sweep = True
        elif arg.startswith("--sweep-spent="):
            # Seconds already spent on this case by earlier seeds. 0 gives the
            # invocation a fresh clock; "auto" reads the case's log.json.
            raw = arg.split("=", 1)[1].strip()
            seed_sweep_spent = None if raw == "auto" else float(raw)
            seed_sweep = True
        else:
            argv.append(arg)
    sys.argv = [sys.argv[0]] + argv
    if not seed_sweep:
        seed_sweep_target = seed_sweep_time_limit = None

    if not os.path.isdir(benchmark_dir):
        sys.exit(f"✗ Benchmark dir not found: {os.path.abspath(benchmark_dir)}\n"
                 f"  Run this script from ICCAD23/run/: "
                 f"python batch_test_overall_sa.py")

    # Discover all available cases
    all_cases, excluded_cases = discover_cases(benchmark_dir)

    # Support case selection from CLI
    if len(sys.argv) > 1:
        test_cases = sys.argv[1:]
        print(f"\n{'#'*80}")
        print(f"Running selected cases")
        print(f"{'#'*80}")
    else:
        # Run all non-excluded cases by default
        test_cases = all_cases
        print(f"\n{'#'*80}")
        print(f"Batch test Overall SA - all cases")
        print(f"{'#'*80}")

    print(f"Benchmark dir: {benchmark_dir}")
    print(f"Result dir: {result_base_dir}")
    print(f"Cases to run ({len(test_cases)}):")
    for case in test_cases:
        print(f"  - {case}")
    if excluded_cases:
        print(f"Excluded ({len(excluded_cases)}):")
        for case_name, reason in excluded_cases:
            print(f"  - {case_name}: {reason}")
    print(f"Usage: python batch_test_overall_sa.py [case1] [case2] ... "
          f"[--seeds=1,2,3] [--sweep]")
    print(f"{'#'*80}\n")

    print(f"Run settings:")
    if seed_sweep:
        limit = (f"{seed_sweep_time_limit:.0f} s "
                 f"({seed_sweep_time_limit/60:.1f} min) per case"
                 if seed_sweep_time_limit else "none")
        print(f"  Seeds per case: sweep -- seed = {seed_sweep_start}, "
              f"{seed_sweep_start + 1}, {seed_sweep_start + 2}, ... until "
              f"{seed_sweep_target} solutions, budget {limit}")
        if seed_sweep_spent is None:
            print(f"  Budget carried over: "
                  f"{'from each case log.json (resume)' if seed_sweep_start > 0 else 'no (fresh clock)'}"
                  f" -- seeds before this run count against {limit}")
        else:
            print(f"  Budget carried over: {seed_sweep_spent:.0f} s charged to "
                  f"each case before it starts")
    else:
        print(f"  Seeds per case: {seeds} (one SA run per seed)")
    print(f"  Iteration cap: "
          f"{'none (unbounded)' if MAX_ITERATIONS is None else MAX_ITERATIONS}")
    print(f"  Stopping condition 1 (convergence): no best-cost improvement for "
          f"{CONVERGENCE_PATIENCE} iterations")
    print(f"  Stopping condition 2 (wall clock): "
          f"{f'{TIME_LIMIT} s ({TIME_LIMIT/60:.1f} min)' if TIME_LIMIT else 'none'}")
    print(f"  Batch time limit (all cases): "
          f"{f'{batch_time_limit:.0f} s ({batch_time_limit/60:.1f} min)' if batch_time_limit else 'none'}\n")

    # Summary
    summary = []

    # Start batch run
    overall_start_time = time.time()

    for case_idx, case_name in enumerate(test_cases, 1):
        print(f"\n\n{'#'*80}")
        print(f"Progress: {case_idx}/{len(test_cases)}")
        print(f"{'#'*80}")

        json_path = os.path.join(benchmark_dir, f"{case_name}.json")
        output_dir = os.path.join(result_base_dir, case_name)

        # Check input existence
        if not os.path.exists(json_path):
            print(f"\n⚠ Skipping {case_name}: file not found ({json_path})")
            summary.append({
                'case_name': case_name,
                'status': 'skipped',
                'error': 'File not found'
            })
            continue

        # Batch budget: hand this case at most what is left of it, and skip it
        # outright once the budget is spent. Trimming rather than checking after
        # the fact is what makes the deadline hard -- a case cannot overshoot it
        # by running a whole case's worth.
        # Carry-over: what this case already spent in earlier invocations, read
        # from its own log.json. Only in sweep mode, and only for a resume
        # (`--seed-start > 0`) -- starting over at seed 0 is a new sweep and
        # gets a fresh clock, otherwise an old log would tax the new run.
        case_sweep_spent = seed_sweep_spent
        if seed_sweep and case_sweep_spent is None:
            case_sweep_spent = 0.0
            prev_log = os.path.join(output_dir, 'log.json')
            if seed_sweep_start > 0 and os.path.exists(prev_log):
                try:
                    with open(prev_log, encoding='utf-8') as fh:
                        prev = json.load(fh)
                    # Cumulative across resumes; fall back to the invocation
                    # time for a log written before this field existed.
                    if prev.get('sweep_elapsed_seconds') is not None:
                        case_sweep_spent = float(prev['sweep_elapsed_seconds'])
                    else:
                        case_sweep_spent = float(prev.get('total_time_seconds') or 0.0)
                    print(f"\n  Carry-over: {case_sweep_spent:.1f}s already spent "
                          f"on {case_name} in earlier seeds "
                          f"(seeds {prev.get('seeds')})")
                    if seed_sweep_time_limit:
                        left = seed_sweep_time_limit - case_sweep_spent
                        print(f"  Budget: {seed_sweep_time_limit:.0f}s total "
                              f"- {case_sweep_spent:.0f}s spent = {left:.0f}s left")
                        if left <= 0:
                            print(f"  ⚠ {case_name}: the case's budget is already "
                                  f"spent; resuming would add no seeds")
                except Exception as exc:      # noqa: BLE001 - never block a run
                    print(f"\n  ⚠ Could not read {prev_log} for carry-over "
                          f"({type(exc).__name__}: {exc}); assuming 0s")

        case_sweep_limit = seed_sweep_time_limit
        if batch_time_limit:
            spent = time.time() - overall_start_time
            remaining = batch_time_limit - spent
            if remaining <= 0:
                print(f"\n⚠ Skipping {case_name}: batch time limit "
                      f"{batch_time_limit:.0f}s already spent ({spent:.0f}s)")
                summary.append({
                    'case_name': case_name,
                    'status': 'skipped_no_budget',
                    'error': f'batch time limit {batch_time_limit:.0f}s spent'
                })
                continue
            if case_sweep_limit is None or remaining < case_sweep_limit:
                case_sweep_limit = remaining
                print(f"\n  Batch budget: {remaining:.0f}s left, "
                      f"capping {case_name} at that")

        try:
            log_info = run_case_all_seeds(
                json_path=json_path,
                case_name=case_name,
                output_dir=output_dir,
                seeds=seeds,
                max_iterations=MAX_ITERATIONS,
                time_limit=TIME_LIMIT,
                seed_sweep_target=seed_sweep_target,
                seed_sweep_time_limit=case_sweep_limit,
                seed_sweep_start=seed_sweep_start,
                seed_sweep_spent=case_sweep_spent
            )

            # Record summary. Status is about solutions, not about whether the
            # call returned: a case whose every seed failed the layer-1 build
            # used to land here as 'success' with num_solutions 0 and a best
            # cost of inf, which reads as a usable row in a results table. It is
            # 'no_solution' now so it cannot be mistaken for one.
            solutions = log_info['solutions']
            summary.append({
                'case_name': case_name,
                'status': 'success' if solutions else 'no_solution',
                'num_solutions': len(solutions),
                'num_seeds_tried': len(log_info.get('seeds') or []),
                'best_cost': min(e['cost'] for e in solutions) if solutions else None,
                'hit_time_limit_count': log_info['statistics'].get('hit_time_limit_count', 0),
                # Solutions whose EMIB bridges pass the physical check
                # (bridge_legality.py): every bridge fits on its shared edge
                # and no two bridge rectangles overlap.
                'bridge_legal_solutions': log_info.get('bridge_legal_solutions'),
                # This invocation's own seconds, and the case's cumulative sweep
                # seconds including the seeds run before it.
                'time_seconds': log_info['total_time_seconds'],
                'sweep_elapsed_seconds': log_info.get('sweep_elapsed_seconds')
            })

        except Exception as e:
            print(f"\n✗ Case {case_name} failed: {e}")
            import traceback
            traceback.print_exc()

            summary.append({
                'case_name': case_name,
                'status': 'failed',
                'error': str(e)
            })

    # Print final summary
    overall_time = time.time() - overall_start_time

    print(f"\n\n{'#'*80}")
    print(f"Batch test completed")
    print(f"{'#'*80}")
    print(f"Total time: {overall_time/3600:.2f} hours")
    print(f"{'#'*80}\n")

    print(f"{'Case Name':<20} {'Status':<10} {'#Solutions':<10} {'Best Cost':<15} "
          f"{'#HitLimit':<10} {'Time (min)':<15}")
    print(f"{'-'*80}")

    for item in summary:
        if item['status'] == 'success':
            print(f"{item['case_name']:<20} "
                  f"{'✓ Success':<10} "
                  f"{item['num_solutions']:<10} "
                  f"{item['best_cost']:<15.6f} "
                  f"{item.get('hit_time_limit_count', 0):<10} "
                  f"{item['time_seconds']/60:<15.2f}")
        elif item['status'] == 'no_solution':
            print(f"{item['case_name']:<20} "
                  f"{'∅ No solution':<10} "
                  f"{0:<10} "
                  f"{'-':<15} "
                  f"{item.get('hit_time_limit_count', 0):<10} "
                  f"{item['time_seconds']/60:<15.2f}")
        elif item['status'] in ('skipped', 'skipped_no_budget'):
            label = ('⊘ No budget' if item['status'] == 'skipped_no_budget'
                     else '⊘ Skipped')
            print(f"{item['case_name']:<20} "
                  f"{label:<10} "
                  f"{'-':<10} "
                  f"{'-':<15} "
                  f"{'-':<10} "
                  f"{'-':<15}")
        else:  # failed
            print(f"{item['case_name']:<20} "
                  f"{'✗ Failed':<10} "
                  f"{'-':<10} "
                  f"{'-':<15} "
                  f"{'-':<10} "
                  f"{'-':<15}")

    print(f"{'-'*80}\n")

    # Save summary file
    summary_path = os.path.join(result_base_dir, "summary.json")
    summary_data = {
        'timestamp': datetime.now().isoformat(),
        # In sweep mode `seeds` is not a fixed list, so record the sweep budget
        # instead -- the seeds each case actually used are in its own log.json.
        'seed_mode': ('sweep' if seed_sweep else 'fixed-list'),
        'seeds': None if seed_sweep else seeds,
        'seed_sweep_target': seed_sweep_target,
        'seed_sweep_time_limit': seed_sweep_time_limit,
        'seed_sweep_start': seed_sweep_start if seed_sweep else None,
        # None = carried over per case from its own log.json (see --sweep-spent).
        'seed_sweep_spent': seed_sweep_spent if seed_sweep else None,
        'batch_time_limit': batch_time_limit,
        'time_limit_seconds': TIME_LIMIT,
        'max_iterations': MAX_ITERATIONS,
        'convergence_patience': CONVERGENCE_PATIENCE,
        'total_cases': len(test_cases),
        'success_count': sum(1 for s in summary if s['status'] == 'success'),
        'total_time_hours': overall_time / 3600,
        'results': summary
    }

    with open(summary_path, 'w', encoding='utf-8') as f:
        json.dump(summary_data, f, indent=2, ensure_ascii=False)

    print(f"✓ Summary saved: {summary_path}\n")


if __name__ == "__main__":
    main()
