"""Batch test script for Overall SA.

For every benchmark case, run Overall SA once per seed in `SEEDS`. There is no
iteration cap: a run ends when the annealing is over (the search has frozen --
see CONVERGENCE_WINDOW / CONVERGENCE_ACCEPT_EPS below) or, failing that, at
TIME_LIMIT seconds of annealing wall clock. Every solution is written to disk
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


# ---- Run configuration ----
SEEDS = [0, 1, 2, 3, 4]   # one SA run per seed, per case
# No iteration cap: annealing ends when it is over, not when a guessed iteration
# count runs out. The run has exactly two stopping conditions --
#   1. convergence: over the last CONVERGENCE_WINDOW iterations the share of
#      moves that CHANGED the cost has fallen to CONVERGENCE_ACCEPT_EPS or
#      below, i.e. the chain has frozen and further iterations are deterministic
#      rejections; the run ends there.
#   2. TIME_LIMIT seconds of annealing wall clock, for the case where a run
#      never freezes.
# Cost-neutral moves (`delta == 0`) are excluded from condition 1: they are
# neither progress nor exploration, and at low temperature they are the only
# moves still accepted, so on a small instance they alone could hold a plain
# acceptance ratio above the threshold forever.
# An iteration count is a guess about a length that only the cooling schedule
# knows; the cost-change rate observes it instead, and the clock bounds the
# worst case. `best_hold_fraction` (share of the run spent sitting on the best
# cost) and `last_improve_at` are reported alongside as evidence.
MAX_ITERATIONS = None            # None = unbounded (see above)
CONVERGENCE_WINDOW = 5000        # sliding window W, in iterations
CONVERGENCE_ACCEPT_EPS = 0.01    # cost-changing move rate at or below this = frozen
# Wall-clock cap of a single SA run (seconds). The second stopping condition:
# with no iteration cap, this is what bounds a run that never freezes. Measured
# annealing cost is ~0.5 ms/iteration, and a normal freeze lands at 15k-30k
# iterations (~10-15 s), so this is a safety net, not the usual exit.
TIME_LIMIT = 3600
SAVE_CONVERGENCE_CURVE = True  # write cost-vs-time PNG per run (costs a little RAM)

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
        'timing': timing or {},
    }


def run_case_all_seeds(json_path, case_name, output_dir,
                       seeds=SEEDS,
                       max_iterations=MAX_ITERATIONS,
                       time_limit=TIME_LIMIT):
    """Run one SA per seed, saving each solution as soon as its run ends."""
    print(f"\n{'='*80}")
    print(f"Test case: {case_name}")
    print(f"Input file: {json_path}")
    print(f"Output dir: {output_dir}")
    freeze = (f"the search freezes (cost-changing moves <= "
              f"{CONVERGENCE_ACCEPT_EPS:.0%} over the last "
              f"{CONVERGENCE_WINDOW} moves)" if CONVERGENCE_WINDOW > 0
              else f"{max_iterations} iterations")
    cap = (f"stops when {freeze}, or at the {time_limit:.0f}s wall clock"
           if time_limit else f"stops when {freeze}")
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

    # Case start timestamp
    case_start_time = time.time()

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
            'seeds': list(seeds),
            'total_runs': len(log_entries),
            'num_chiplets': len(problem.chiplets),
            'num_connections': problem.connection_graph.number_of_edges(),
            'max_iterations': max_iterations,
            'time_limit_seconds': time_limit,
            'total_time_seconds': time.time() - case_start_time,
            'statistics': stats,  # Summary statistics
            'run_details': run_details,  # Per-run details
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
            f.write(f"  Seeds: {list(seeds)}\n")
            f.write(f"  Iteration cap: "
                    f"{max_iterations if max_iterations is not None else 'none (unbounded)'}\n")
            f.write(f"  Stopping condition 1 (convergence): search frozen -- "
                    f"cost-changing moves <= {CONVERGENCE_ACCEPT_EPS:.0%} over the "
                    f"last {CONVERGENCE_WINDOW} iterations\n")
            f.write(f"  Stopping condition 2 (wall clock): "
                    f"{f'{time_limit} s ({time_limit/60:.1f} min)' if time_limit else 'none'}\n\n")
            f.write(f"Run statistics:\n")
            f.write(f"  Total solutions: {log_info['total_runs']}\n")
            f.write(f"  Actual time: {log_info['total_time_seconds']/60:.2f} min\n\n")

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
                        if detail.get('cost_change_ratio_window') is not None:
                            f.write(f"  Cost-changing moves over the last "
                                    f"{CONVERGENCE_WINDOW} iterations: "
                                    f"{detail['cost_change_ratio_window']:.2%}\n")
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
                f.write(f"\n")

        return log_info

    for run_idx, seed in enumerate(seeds, 1):
        elapsed_time = time.time() - case_start_time
        print(f"\n{'─'*80}")
        print(f"Run #{run_idx}/{len(seeds)} (seed={seed}, elapsed: {elapsed_time/60:.1f} min)")
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
                convergence_window=CONVERGENCE_WINDOW,
                convergence_accept_eps=CONVERGENCE_ACCEPT_EPS
            )
            sa_seconds = time.time() - sa_start

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
                # Layer 3 exit status: converged = the search froze (share of
                # cost-changing moves <= CONVERGENCE_ACCEPT_EPS over the last
                # CONVERGENCE_WINDOW iterations); otherwise the wall clock ran out.
                'annealing_time': sa_seconds,
                'annealing_iterations': sa_stats.get('iterations'),
                'converged': sa_stats.get('converged'),
                'stop_reason': sa_stats.get('stop_reason'),
                'cost_change_ratio_window': sa_stats.get('cost_change_ratio_window'),
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
    print(f"  Converged (search frozen: cost-changing moves <= "
          f"{CONVERGENCE_ACCEPT_EPS:.0%} over the last {CONVERGENCE_WINDOW} "
          f"iterations): "
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
    """

    # Config (relative to ICCAD23/run/, which is the expected CWD)
    benchmark_dir = os.path.join("..", "..", "..", "benchmark", "test_input")
    result_base_dir = os.path.join("..", "result")

    # `--seeds=1,2,3,4,5` overrides the configured seed list
    seeds = SEEDS
    argv = []
    for arg in sys.argv[1:]:
        if arg.startswith("--seeds="):
            seeds = [int(s) for s in arg.split("=", 1)[1].split(",") if s.strip() != ""]
        else:
            argv.append(arg)
    sys.argv = [sys.argv[0]] + argv

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
    print(f"Usage: python batch_test_overall_sa.py [case1] [case2] ... [--seeds=1,2,3]")
    print(f"{'#'*80}\n")

    print(f"Run settings:")
    print(f"  Seeds per case: {seeds} (one SA run per seed)")
    print(f"  Iteration cap: "
          f"{'none (unbounded)' if MAX_ITERATIONS is None else MAX_ITERATIONS}")
    print(f"  Stopping condition 1 (convergence): cost-changing moves <= "
          f"{CONVERGENCE_ACCEPT_EPS:.0%} over the last {CONVERGENCE_WINDOW} "
          f"iterations")
    print(f"  Stopping condition 2 (wall clock): "
          f"{f'{TIME_LIMIT} s ({TIME_LIMIT/60:.1f} min)' if TIME_LIMIT else 'none'}\n")

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

        try:
            log_info = run_case_all_seeds(
                json_path=json_path,
                case_name=case_name,
                output_dir=output_dir,
                seeds=seeds,
                max_iterations=MAX_ITERATIONS,
                time_limit=TIME_LIMIT
            )

            # Record summary
            solutions = log_info['solutions']
            best_cost = solutions[0]['cost'] if solutions else float('inf')
            summary.append({
                'case_name': case_name,
                'status': 'success',
                'num_solutions': len(solutions),
                'best_cost': best_cost,
                'hit_time_limit_count': log_info['statistics'].get('hit_time_limit_count', 0),
                'time_seconds': log_info['total_time_seconds']
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
        elif item['status'] == 'skipped':
            print(f"{item['case_name']:<20} "
                  f"{'⊘ Skipped':<10} "
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
        'seeds': SEEDS,
        'time_limit_seconds': TIME_LIMIT,
        'max_iterations': MAX_ITERATIONS,
        'convergence_window': CONVERGENCE_WINDOW,
        'convergence_accept_eps': CONVERGENCE_ACCEPT_EPS,
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
