"""Batch test script for Overall SA.

Runs Overall SA on benchmark cases within a fixed time budget,
saves all solutions (JSON + image), and records solve times in logs.
"""

import sys
import os
import time
import json
import random
from datetime import datetime
from pathlib import Path

# Add `src` directory to import path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from unit import load_problem_from_json, save_layout_image, calculate_layout_utilization, save_result
from input_ECG import ECGManager
from BtTree import BinaryTree
from OverallSA import overall_sa, initialize_bt_node_layouts


def ensure_dir(path):
    """Ensure directory exists."""
    os.makedirs(path, exist_ok=True)


def save_solution(layout, problem, cost, case_name, solution_idx, output_dir, solve_time, iteration):
    """Save one solution (JSON + image) and return log metadata."""
    # Save JSON (full schema via `save_result`)
    json_path = os.path.join(output_dir, f"solution_{solution_idx}_cost_{cost:.6f}.json")
    save_result(layout, json_path, problem)
    
    # Save image
    img_path = os.path.join(output_dir, f"solution_{solution_idx}_cost_{cost:.6f}.png")
    save_layout_image(layout, problem, img_path, show_bridges=True, show_coordinates=False)
    
    # Compute utilization
    chip_area = sum(chip.width * chip.height for chip in problem.chiplets.values())
    max_x = max(chip.x + chip.width for chip in layout.values())
    max_y = max(chip.y + chip.height for chip in layout.values())
    layout_area = max_x * max_y if max_x > 0 and max_y > 0 else 1.0
    utilization = (chip_area / layout_area) * 100
    
    return {
        'solution_idx': solution_idx,
        'cost': cost,
        'utilization': utilization,
        'solve_time': solve_time,
        'iteration': iteration,
        'json_file': os.path.basename(json_path),
        'image_file': os.path.basename(img_path)
    }


def run_case_multiple_times(json_path, case_name, output_dir, 
                            max_iterations=50000,
                            time_limit=300):  # 60 min = 3600 s
    """Run one case repeatedly within time limit and save all solutions."""
    print(f"\n{'='*80}")
    print(f"Test case: {case_name}")
    print(f"Input file: {json_path}")
    print(f"Output dir: {output_dir}")
    print(f"Mode: unlimited runs within {time_limit/60:.1f} minutes")
    print(f"{'='*80}\n")
    
    # Ensure output directory exists
    ensure_dir(output_dir)
    
    # Load problem
    problem = load_problem_from_json(json_path)
    print(f"Problem size: {len(problem.chiplets)} chiplets, "
          f"{problem.connection_graph.number_of_edges()} connections\n")
    
    # Collect all solutions (no top-k limit)
    all_solutions = []  # [(cost, layout, solve_time, iteration, run_idx)]
    
    # Per-run detail records
    run_details = []
    
    # Case start timestamp
    case_start_time = time.time()
    
    run_idx = 0  # Run counter
    
    # Keep running until time limit
    while True:
        # Stop on timeout
        elapsed_time = time.time() - case_start_time
        if elapsed_time >= time_limit:
            print(f"\n⏱ Time limit reached ({time_limit/60:.1f} min), stopping")
            print(f"   Total runs completed: {run_idx}")
            break
        
        run_idx += 1
        remaining_time = time_limit - elapsed_time
        print(f"\n{'─'*80}")
        print(f"Run #{run_idx} (elapsed: {elapsed_time/60:.1f} min, remaining: {remaining_time/60:.1f} min)")
        print(f"{'─'*80}")
        
        # Use a different random seed each run
        seed = int(time.time() * 1000) % 100000 + run_idx
        random.seed(seed)
        print(f"Random seed: {seed}")
        
        try:
            # Create ECG manager
            ecg_manager = ECGManager(problem)
            
            # Build BT tree
            bt_tree = BinaryTree()
            bt_tree.build_from_ecgs(ecg_manager, 
                                   build_similarity_forests=True, 
                                   seed=seed)
            
            # Run start offset from case start
            run_start_offset = time.time() - case_start_time
            
            # Run Overall SA
            run_start_time = time.time()
            
            # Aggressive settings to find more solutions within time budget
            best_layout, best_cost, best_found_time = overall_sa(
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
                output_dir=None
            )
            
            run_time = time.time() - run_start_time
            
            # Absolute found time from case start
            absolute_found_time = run_start_offset + best_found_time
            
            print(f"✓ Done: cost={best_cost:.6f}, best found in {best_found_time:.2f}s, total {run_time:.2f}s")
            print(f"  (from case start: {absolute_found_time:.2f}s)")
            
            # Record this run
            run_detail = {
                'run_id': run_idx,
                'seed': seed,
                'status': 'success',
                'cost': best_cost,
                'found_time': best_found_time,  # Time to best solution in this run
                'total_time': run_time,  # Total run time
                'absolute_time': absolute_found_time,  # Time from case start
                'num_chiplets': len(best_layout),
                'start_offset': run_start_offset  # Run start offset
            }
            run_details.append(run_detail)
            
            # Collect solution using case-relative time
            all_solutions.append((
                best_cost,
                best_layout,
                absolute_found_time,
                max_iterations,
                run_idx
            ))
            
        except Exception as e:
            print(f"✗ Run failed: {e}")
            import traceback
            traceback.print_exc()
            
            # Record failed run
            run_detail = {
                'run_id': run_idx,
                'seed': seed,
                'status': 'failed',
                'error': str(e),
                'total_time': time.time() - run_start_time if 'run_start_time' in locals() else 0
            }
            run_details.append(run_detail)
            continue
    
    # Save all solutions (sorted by cost)
    all_solutions.sort(key=lambda x: x[0])
    
    print(f"\n{'='*80}")
    print(f"Completed {len(all_solutions)} successful runs; saving all solutions")
    print(f"{'='*80}")
    
    # Run statistics
    success_runs = [r for r in run_details if r['status'] == 'success']
    failed_runs = [r for r in run_details if r['status'] == 'failed']
    
    print(f"\nRun statistics:")
    print(f"  Success: {len(success_runs)}/{len(run_details)}")
    print(f"  Failed: {len(failed_runs)}/{len(run_details)}")
    
    if success_runs:
        avg_cost = sum(r['cost'] for r in success_runs) / len(success_runs)
        best_cost = min(r['cost'] for r in success_runs)
        worst_cost = max(r['cost'] for r in success_runs)
        avg_found_time = sum(r['found_time'] for r in success_runs) / len(success_runs)
        
        print(f"\nCost statistics:")
        print(f"  Best: {best_cost:.6f}")
        print(f"  Worst: {worst_cost:.6f}")
        print(f"  Average: {avg_cost:.6f}")
        print(f"  Std Dev: {(sum((r['cost'] - avg_cost)**2 for r in success_runs) / len(success_runs))**0.5:.6f}")
        
        print(f"\nTime statistics:")
        print(f"  Avg time to find best: {avg_found_time:.2f} s")
    
    print()
    
    # Save all solutions
    log_entries = []
    for idx, (cost, layout, solve_time, iteration, run_idx) in enumerate(all_solutions, 1):
        print(f"Saving solution {idx}/{len(all_solutions)}: cost={cost:.6f}, from run #{run_idx}")
        entry = save_solution(
            layout, problem, cost, case_name, idx, 
            output_dir, solve_time, iteration
        )
        entry['run_idx'] = run_idx
        log_entries.append(entry)
    
    # Save log file
    log_path = os.path.join(output_dir, "log.json")
    
    # Compute summary statistics
    success_runs = [r for r in run_details if r['status'] == 'success']
    stats = {}
    if success_runs:
        costs = [r['cost'] for r in success_runs]
        found_times = [r['found_time'] for r in success_runs]
        total_times = [r['total_time'] for r in success_runs]
        
        stats = {
            'success_count': len(success_runs),
            'failed_count': len(run_details) - len(success_runs),
            'cost': {
                'best': min(costs),
                'worst': max(costs),
                'average': sum(costs) / len(costs),
                'std_dev': (sum((c - sum(costs)/len(costs))**2 for c in costs) / len(costs))**0.5
            },
            'time': {
                'avg_found_time': sum(found_times) / len(found_times),
                'avg_total_time': sum(total_times) / len(total_times),
                'min_found_time': min(found_times),
                'max_found_time': max(found_times)
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
        'total_runs': len(all_solutions),
        'num_chiplets': len(problem.chiplets),
        'num_connections': problem.connection_graph.number_of_edges(),
        'time_limit_seconds': time_limit,
        'total_time_seconds': time.time() - case_start_time,
        'statistics': stats,  # Summary statistics
        'run_details': run_details,  # Per-run details
        'solutions': log_entries
    }
    
    with open(log_path, 'w', encoding='utf-8') as f:
        json.dump(log_info, f, indent=2, ensure_ascii=False)
    
    print(f"\n✓ Log saved: {log_path}")
    
    # Also save a human-readable text log
    txt_log_path = os.path.join(output_dir, "log.txt")
    with open(txt_log_path, 'w', encoding='utf-8') as f:
        f.write(f"{'='*80}\n")
        f.write(f"Test case: {case_name}\n")
        f.write(f"Time: {log_info['timestamp']}\n")
        f.write(f"{'='*80}\n\n")
        f.write(f"Problem size:\n")
        f.write(f"  Chiplets: {log_info['num_chiplets']}\n")
        f.write(f"  Connections: {log_info['num_connections']}\n\n")
        f.write(f"Run statistics:\n")
        f.write(f"  Total runs: {log_info['total_runs']}\n")
        f.write(f"  Time limit: {time_limit/60:.1f} min\n")
        f.write(f"  Actual time: {log_info['total_time_seconds']/60:.2f} min\n\n")
        
        # Per-run summary
        f.write(f"{'='*80}\n")
        f.write(f"Per-run details:\n")
        f.write(f"{'='*80}\n\n")
        
        success_runs = [r for r in run_details if r['status'] == 'success']
        failed_runs = [r for r in run_details if r['status'] == 'failed']
        
        f.write(f"Successful runs: {len(success_runs)}/{len(run_details)}\n")
        f.write(f"Failed runs: {len(failed_runs)}/{len(run_details)}\n\n")
        
        if success_runs:
            avg_cost = sum(r['cost'] for r in success_runs) / len(success_runs)
            avg_found_time = sum(r['found_time'] for r in success_runs) / len(success_runs)
            avg_total_time = sum(r['total_time'] for r in success_runs) / len(success_runs)
            best_cost = min(r['cost'] for r in success_runs)
            worst_cost = max(r['cost'] for r in success_runs)
            
            f.write(f"Cost statistics:\n")
            f.write(f"  Best: {best_cost:.6f}\n")
            f.write(f"  Worst: {worst_cost:.6f}\n")
            f.write(f"  Average: {avg_cost:.6f}\n\n")
            
            f.write(f"Time statistics:\n")
            f.write(f"  Avg time to best: {avg_found_time:.2f} s\n")
            f.write(f"  Avg total run time: {avg_total_time:.2f} s\n\n")
        
        f.write(f"{'-'*80}\n")
        f.write(f"Detailed run records:\n")
        f.write(f"{'-'*80}\n\n")
        
        for detail in run_details:
            f.write(f"Run #{detail['run_id']}:\n")
            f.write(f"  Random seed: {detail['seed']}\n")
            f.write(f"  Status: {detail['status']}\n")
            
            if detail['status'] == 'success':
                f.write(f"  Cost: {detail['cost']:.6f}\n")
                f.write(f"  Time to best: {detail['found_time']:.2f} s\n")
                f.write(f"  Total run time: {detail['total_time']:.2f} s\n")
                f.write(f"  From case start: {detail['absolute_time']:.2f} s\n")
                f.write(f"  Chiplets: {detail['num_chiplets']}\n")
            else:
                f.write(f"  Error: {detail.get('error', 'Unknown')}\n")
                f.write(f"  Run time: {detail.get('total_time', 0):.2f} s\n")
            
            f.write(f"\n")
        
        f.write(f"{'='*80}\n")
        f.write(f"All {len(log_entries)} solutions:\n")
        f.write(f"{'='*80}\n\n")
        
        for entry in log_entries:
            f.write(f"Solution #{entry['solution_idx']}:\n")
            f.write(f"  Cost: {entry['cost']:.6f}\n")
            f.write(f"  Utilization: {entry['utilization']:.2f}%\n")
            f.write(f"  Solve time: {entry['solve_time']:.2f} s\n")
            f.write(f"  From run: #{entry['run_idx']}\n")
            f.write(f"  JSON: {entry['json_file']}\n")
            f.write(f"  Image: {entry['image_file']}\n")
            f.write(f"\n")
    
    print(f"✓ Text log saved: {txt_log_path}")
    
    return log_info


def main():
    """Main entry: batch test all cases or specified cases."""
    
    # Config
    benchmark_dir = os.path.join("..", "..", "..", "benchmark", "test_input")
    result_base_dir = os.path.join("..", "result")
    
    # Discover all available cases
    all_cases = []
    for file in os.listdir(benchmark_dir):
        if file.endswith('.json') and file != 'README.md':
            case_name = file[:-5]  # Remove .json suffix
            all_cases.append(case_name)
    
    all_cases.sort()
    
    # Support case selection from CLI
    if len(sys.argv) > 1:
        test_cases = sys.argv[1:]
        print(f"\n{'#'*80}")
        print(f"Running selected cases")
        print(f"{'#'*80}")
    else:
        # Run all cases by default
        test_cases = all_cases
        print(f"\n{'#'*80}")
        print(f"Batch test Overall SA - all cases")
        print(f"{'#'*80}")
    
    print(f"Benchmark dir: {benchmark_dir}")
    print(f"Result dir: {result_base_dir}")
    print(f"Cases to run ({len(test_cases)}):")
    for case in test_cases:
        print(f"  - {case}")
    print(f"Available cases ({len(all_cases)}): {', '.join(all_cases)}")
    print(f"Usage: python batch_test_overall_sa.py [case1] [case2] ...")
    print(f"{'#'*80}\n")
    
    # Run settings
    max_iterations = 50000  # Max iterations per SA run
    time_limit = 3600  # 60-minute limit per case
    
    print(f"Run settings:")
    print(f"  Time limit per case: {time_limit/60:.1f} min")
    print(f"  Max SA iterations per run: {max_iterations}")
    print(f"  Mode: repeat within time limit and save all solutions\n")
    
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
            log_info = run_case_multiple_times(
                json_path=json_path,
                case_name=case_name,
                output_dir=output_dir,
                max_iterations=max_iterations,
                time_limit=time_limit
            )
            
            # Record summary
            best_cost = log_info['solutions'][0]['cost'] if log_info['solutions'] else float('inf')
            summary.append({
                'case_name': case_name,
                'status': 'success',
                'num_solutions': len(log_info['solutions']),
                'best_cost': best_cost,
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
    
    print(f"{'Case Name':<20} {'Status':<10} {'#Solutions':<10} {'Best Cost':<15} {'Time (min)':<15}")
    print(f"{'-'*80}")
    
    for item in summary:
        if item['status'] == 'success':
            print(f"{item['case_name']:<20} "
                f"{'✓ Success':<10} "
                  f"{item['num_solutions']:<10} "
                  f"{item['best_cost']:<15.6f} "
                  f"{item['time_seconds']/60:<15.2f}")
        elif item['status'] == 'skipped':
            print(f"{item['case_name']:<20} "
                f"{'⊘ Skipped':<10} "
                  f"{'-':<10} "
                  f"{'-':<15} "
                  f"{'-':<15}")
        else:  # failed
            print(f"{item['case_name']:<20} "
                f"{'✗ Failed':<10} "
                  f"{'-':<10} "
                  f"{'-':<15} "
                  f"{'-':<15}")
    
    print(f"{'-'*80}\n")
    
    # Save summary file
    summary_path = os.path.join(result_base_dir, "summary.json")
    summary_data = {
        'timestamp': datetime.now().isoformat(),
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
