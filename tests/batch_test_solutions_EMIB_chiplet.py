#!/usr/bin/env python3
"""
Batch test script: search solutions for all cases under test_input (Gurobi).

Usage:
    python3 batch_test_solutions_EMIB_chiplet.py [--min-pair-dist-diff DIFF] [--files FILE1 FILE2 ...]

Examples:
    # Process all files
    python3 batch_test_solutions_gurobi.py

    # With options
    python3 batch_test_solutions_EMIB_chiplet.py --min-pair-dist-diff 3.0
    python batch_test_solutions_EMIB_chiplet.py --min-pair-dist-diff 1.0 --files 5core.json
    python batch_test_solutions_EMIB_chiplet.py --min-pair-dist-diff 10.0 --files 2core.json

    # Specific files only
    python3 batch_test_solutions_EMIB_chiplet.py --files 5core.json 6core.json
    python3 batch_test_solutions_EMIB_chiplet.py --files 5core 6core 8core
"""

import sys
import argparse
import shutil
import os
from pathlib import Path
import logging
from datetime import datetime
import time
from typing import Optional, List

# Ensure ilp_EMIB_search can be imported
sys.path.insert(0, str(Path(__file__).parent.parent / "src"))

from ilp_EMIB_search_EMIB_chiplet import search_multiple_solutions as solve_emib
from ilp_method_EMIB_chiplet import ILPPlacementResult
import json
try:
    from tool import ChipletNode
except ImportError:
    # Fallback if import fails
    class ChipletNode:
        def __init__(self, name, dimensions, phys=None, power=0.0):
            self.name = name
            self.dimensions = dimensions
            self.phys = phys or []
            self.power = power


# Default config (EMIB: at most 1 solution per case)
DEFAULT_MIN_SHARED_LENGTH = 0.1
DEFAULT_FIXED_CHIPLET_IDX = 0
DEFAULT_MIN_PAIR_DIST_DIFF = 7.0


def extract_core_name(json_file: Path) -> str:
    """
    Extract core name from JSON filename for output subdir.
    E.g. "5core.json" -> "5_core", "10core.json" -> "10_core", "13.json" -> "13_core"
    """
    name = json_file.stem
    if name.endswith("core"):
        name = name[:-4]
    return f"{name}_core"


class TeeOutput:
    """Send output to multiple streams (e.g. stdout and file)."""
    def __init__(self, *streams):
        self.streams = streams
    
    def write(self, data):
        for stream in self.streams:
            stream.write(data)
            stream.flush()
    
    def flush(self):
        for stream in self.streams:
            stream.flush()


def print_solution_coordinates_and_distances(
    solution: ILPPlacementResult,
    solution_idx: int,
    nodes: List,
) -> None:
    """
    Print chiplet coordinates and relative distances for a solution.

    Parameters:
        solution: ILP result
        solution_idx: solution index (0-based)
        nodes: node list for chiplet names
    """
    if solution.status != "Optimal":
        return

    print(f"\n=== Solution {solution_idx + 1} ===")
    print(f"\nStatus: {solution.status}")
    print(f"Solve time: {solution.solve_time:.2f} s")
    print(f"Objective: {solution.objective_value:.2f}")

    layout = solution.layout
    # Name -> index from nodes order
    name_to_idx = {}
    idx_to_name = {}
    for idx, node in enumerate(nodes):
        node_name = node.name if hasattr(node, 'name') else f"Chiplet_{idx}"
        name_to_idx[node_name] = idx
        idx_to_name[idx] = node_name
    
    # Only process chiplets present in nodes for consistency
    n = len(nodes)
    
    # Get each chiplet coords by index
    x_coords = {}
    y_coords = {}
    for idx in range(n):
        node_name = idx_to_name[idx]
        if node_name in layout:
            x_coords[idx], y_coords[idx] = layout[node_name]
        else:
            # If not in layout, try match or use 0
            x_coords[idx] = 0.0
            y_coords[idx] = 0.0
    
    # print(f"\nChiplet coordinates:")
    # for idx in range(n):
    #     node_name = idx_to_name[idx]
    #     if idx in x_coords and idx in y_coords:
    #         x_val = x_coords[idx]
    #         y_val = y_coords[idx]
    #         print(f"  [{idx}] {node_name}: x={x_val:.3f}, y={y_val:.3f}")
    
    # print(f"\nPairwise distances:")
    # chiplet_pairs = [(i, j) for i in range(n) for j in range(i+1, n)]
    # for i, j in sorted(chiplet_pairs):
    #     if i in x_coords and j in x_coords and i in y_coords and j in y_coords:
    #         x_dist = abs(x_coords[i] - x_coords[j])
    #         y_dist = abs(y_coords[i] - y_coords[j])
    #         manhattan_dist = x_dist + y_dist
    #         name_i = idx_to_name[i]
    #         name_j = idx_to_name[j]
    #         print(f"  ({i},{j}) [{name_i}, {name_j}]: x_dist={x_dist:.3f}, y_dist={y_dist:.3f}, manhattan={manhattan_dist:.3f}")


def setup_logging(log_dir: Path, core_name: str):
    """
    Set up logging to directory and redirect stdout so print goes to log file.
    
    Args:
        log_dir: log file directory
        core_name: core name
    """
    log_dir.mkdir(parents=True, exist_ok=True)
    log_file = log_dir / f"{core_name}_gurobi.log"
    
    # Open log file
    log_file_handle = open(log_file, 'w', encoding='utf-8')
    
    # Log format
    log_format = '%(asctime)s - %(levelname)s - %(message)s'
    date_format = '%Y-%m-%d %H:%M:%S'
    
    # File handler
    file_handler = logging.FileHandler(log_file, mode='w', encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(logging.Formatter(log_format, date_format))
    
    # Console handler
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(logging.INFO)
    console_handler.setFormatter(logging.Formatter(log_format, date_format))
    
    # Root logger
    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG)
    root_logger.handlers.clear()
    root_logger.addHandler(file_handler)
    root_logger.addHandler(console_handler)
    
    # Save original stdout
    original_stdout = sys.stdout
    
    # Tee to stdout and log file
    tee = TeeOutput(original_stdout, log_file_handle)
    
    # Redirect stdout to Tee
    sys.stdout = tee
    
    return log_file, log_file_handle, original_stdout


def run_batch_tests(
    min_shared_length: float = DEFAULT_MIN_SHARED_LENGTH,
    fixed_chiplet_idx: int = DEFAULT_FIXED_CHIPLET_IDX,
    min_pair_dist_diff: float = DEFAULT_MIN_PAIR_DIST_DIFF,
    time_limit: int = 600,  # Time limit (s), default 10 min
    test_input_dir: Optional[Path] = None,
    output_base_dir: Optional[Path] = None,
    json_files: Optional[List[str]] = None,
    mutual_distancing_enabled: bool = True,
    central_avoidance_enabled: bool = True,
    total_time_limit: int = 3600,
    stage1_gap: float = 0.0,
    stage1_time_limit: int = 300,
    stage2_gap: float = 0.3,
    stage2_time_limit: int = 300,
    stage3_gap: float = 0.8,
):
    """
    Run batch tests (Gurobi). EMIB: at most 1 solution per case.

    Parameters:
        min_shared_length: min shared edge between adjacent chiplets
        fixed_chiplet_idx: fixed chiplet index
        min_pair_dist_diff: min distance-diff threshold between chiplet pairs
        test_input_dir: test input dir (default if None)
        output_base_dir: output base dir (default if None)
        json_files: JSON file list to process (None = all)
        mutual_distancing_enabled: enable high-power mutual distancing term
        central_avoidance_enabled: enable high-power central avoidance term
        total_time_limit: total budget for three-phase solve
        stage1_gap: phase 1 MIP gap
        stage1_time_limit: phase 1 max seconds
        stage2_gap: phase 2 MIP gap
        stage2_time_limit: phase 2 max seconds
        stage3_gap: phase 3 MIP gap; time is remaining total budget
    """
    # Project root
    project_root = Path(__file__).parent.parent
    
    # Test input dir
    if test_input_dir is None:
        test_input_dir = project_root / "benchmark" / "test_input"
    
    if not test_input_dir.exists():
        print(f"Error: test input dir does not exist: {test_input_dir}")
        sys.exit(1)
    
    # Output base dir
    if output_base_dir is None:
        base_env = os.getenv("EMIB_OUTPUT_BASE")
        if base_env:
            output_base_dir = Path(base_env)
            if not output_base_dir.is_absolute():
                output_base_dir = project_root / output_base_dir
        else:
            output_base_dir = project_root / "output_gurobi_EMIB_chiplet"
    else:
        if not output_base_dir.is_absolute():
            output_base_dir = project_root / output_base_dir
    
    # Create output base dir
    output_base_dir.mkdir(parents=True, exist_ok=True)
    
    # Find JSON files
    if json_files is not None and len(json_files) > 0:
        # If file list given, only those files
        selected_files = []
        for file_spec in json_files:
            # Try as full path
            file_path = Path(file_spec)
            if file_path.is_absolute() and file_path.exists():
                selected_files.append(file_path)
            else:
                # Try as filename under test_input_dir
                file_path = test_input_dir / file_spec
                if file_path.exists():
                    selected_files.append(file_path)
                else:
                    # Try adding .json
                    if not file_spec.endswith('.json'):
                        file_path = test_input_dir / f"{file_spec}.json"
                        if file_path.exists():
                            selected_files.append(file_path)
                        else:
                            print(f"Warning: file not found: {file_spec}, skip")
                    else:
                        print(f"Warning: file not found: {file_spec}, skip")
        
        json_files_list = sorted(selected_files)
        
        if not json_files_list:
            print(f"Error: no valid JSON files found")
            sys.exit(1)
    else:
        # No file list: process all JSON files
        json_files_list = sorted(test_input_dir.glob("*.json"))
    
    if not json_files_list:
        print(f"Warning: no JSON files in {test_input_dir}")
        return
    
    print(f"\n{'='*80}")
    time_start = time.time()
    print(f"Batch test start (Gurobi)")
    print(f"{'='*80}")
    print(f"Test input dir: {test_input_dir}")
    print(f"Output base dir: {output_base_dir}")
    print(f"Found {len(json_files_list)} test file(s)")
    if json_files is not None and len(json_files) > 0:
        print(f"Files to process: {', '.join([f.name for f in json_files_list])}")
    # print(f"\nParameters:")
    # print(f"  - min_shared_length: {min_shared_length}")
    # print(f"  - fixed_chiplet_idx: {fixed_chiplet_idx}")
    # print(f"  - min_pair_dist_diff: {min_pair_dist_diff}")
    # print(f"  - time_limit: {time_limit} s ({time_limit/60:.1f} min)")
    
    print(f"{'='*80}\n")
    
    # Counters
    success_count = 0
    fail_count = 0
    total_solutions_found = 0
    total_solutions_expected = 0  # EMIB: at most 1 per case
    results_summary = []
    
    # Process each JSON file
    for idx, json_file in enumerate(json_files_list, 1):
        core_name = extract_core_name(json_file)
        
        # Create output dirs
        log_dir = output_base_dir / "log" / core_name
        lp_dir = output_base_dir / "lp" / core_name
        fig_dir = output_base_dir / "fig" / core_name
        placement_dir = output_base_dir / "placement"
        placement_file = placement_dir / f"{json_file.stem}.json"

        print(f"\n[{idx}/{len(json_files_list)}] Processing: {json_file.name}")
        print(f"  Core name: {core_name}")
        print(f"  Log dir: {log_dir}")
        print(f"  LP dir: {lp_dir}")
        print(f"  Fig dir: {fig_dir}")
        print(f"  Placement file: {placement_file}")

        # Remove old output dir if present
        for old_dir in [log_dir, lp_dir, fig_dir]:
            if old_dir.exists():
                print(f"  Removing old output dir: {old_dir}")
                shutil.rmtree(old_dir)
        
        # Create output dirs
        log_dir.mkdir(parents=True, exist_ok=True)
        lp_dir.mkdir(parents=True, exist_ok=True)
        fig_dir.mkdir(parents=True, exist_ok=True)
        placement_dir.mkdir(parents=True, exist_ok=True)
        
        # Set up logging (redirect stdout to log)
        log_file, log_file_handle, original_stdout = setup_logging(log_dir, core_name)
        logger = logging.getLogger()
        
        # logger.info(f"{'='*80}")
        # logger.info(f"Processing: {json_file.name} (Gurobi)")
        # logger.info(f"Core name: {core_name}")
        # logger.info(f"Log dir: {log_dir}")
        # logger.info(f"LP dir: {lp_dir}")
        # logger.info(f"Fig dir: {fig_dir}")
        # logger.info(f"Parameters:")
        # logger.info(f"  - min_shared_length: {min_shared_length}")
        # logger.info(f"  - fixed_chiplet_idx: {fixed_chiplet_idx}")
        # logger.info(f"  - min_pair_dist_diff: {min_pair_dist_diff}")
        # logger.info(f"  - time_limit: {time_limit} s ({time_limit/60:.1f} min)")
        # logger.info(f"{'='*80}")
        
        try:
            # Load nodes (for coords and distances)
            nodes = []
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                if "chiplets" in data and isinstance(data["chiplets"], list):
                    # Format 1: ICCAD23
                    for chiplet_info in data["chiplets"]:
                        name = chiplet_info.get("name", "")
                        width = chiplet_info.get("width", 0.0)
                        height = chiplet_info.get("height", 0.0)
                        nodes.append(
                            ChipletNode(
                                name=name,
                                dimensions={"x": width, "y": height},
                                phys=[],
                                power=chiplet_info.get("power", 0.0),
                            )
                        )
                else:
                    # Format 2: dict
                    for chiplet_name, chiplet_data in data.items():
                        if isinstance(chiplet_data, dict) and "dimensions" in chiplet_data:
                            dims = chiplet_data["dimensions"]
                            width = dims.get("x", 0.0) if isinstance(dims, dict) else 0.0
                            height = dims.get("y", 0.0) if isinstance(dims, dict) else 0.0
                            nodes.append(
                                ChipletNode(
                                    name=chiplet_name,
                                    dimensions={"x": width, "y": height},
                                    phys=chiplet_data.get("phys", []),
                                    power=chiplet_data.get("power", 0.0),
                                )
                            )
            except Exception as e:
                logger.warning(f"Failed to load nodes: {e}, will infer from solution layout")
            
            # Run EMIB solver (Gurobi)
            logger.info(f"Calling EMIB solver (Gurobi)...")
            
            # Relative paths from project root
            project_root = Path(__file__).parent.parent
            try:
                lp_dir_relative = lp_dir.relative_to(project_root)
                fig_dir_relative = fig_dir.relative_to(project_root)
                placement_path_relative = placement_file.relative_to(project_root)
            except ValueError:
                lp_dir_relative = lp_dir
                fig_dir_relative = fig_dir
                placement_path_relative = placement_file
            
            # Log parameters before solve
            # logger.info(f"{'='*80}")
            # logger.info(f"Solve parameters (before EMIB solver):")
            # logger.info(f"  - min_shared_length: {min_shared_length} (type: {type(min_shared_length).__name__})")
            # logger.info(f"  - fixed_chiplet_idx: {fixed_chiplet_idx} (type: {type(fixed_chiplet_idx).__name__})")
            # logger.info(f"  - min_pair_dist_diff: {min_pair_dist_diff} (type: {type(min_pair_dist_diff).__name__})")
            # logger.info(f"  - time_limit: {time_limit} (type: {type(time_limit).__name__})")
            # logger.info(f"  - input_json_path: {str(json_file.absolute())}")
            # logger.info(f"  - output_dir: {str(lp_dir_relative)}")
            # logger.info(f"  - image_output_dir: {str(fig_dir_relative)}")
            # logger.info(f"  - placement_output_path: {str(placement_path_relative)}")
            # logger.info(f"{'='*80}")
            # logger.info(f"Calling EMIB solver...")
            
            sols = solve_emib(
                num_solutions=1,
                min_shared_length=min_shared_length,
                input_json_path=str(json_file.absolute()),
                fixed_chiplet_idx=fixed_chiplet_idx,
                output_dir=str(lp_dir_relative),
                image_output_dir=str(fig_dir_relative),
                placement_output_path=str(placement_path_relative),
                mutual_distancing_enabled=mutual_distancing_enabled,
                central_avoidance_enabled=central_avoidance_enabled,
                total_time_limit=total_time_limit,
                stage1_gap=stage1_gap,
                stage1_time_limit=stage1_time_limit,
                stage2_gap=stage2_gap,
                stage2_time_limit=stage2_time_limit,
                stage3_gap=stage3_gap,
            )
            time_end = time.time()
            logger.info(f"\nEMIB returned {len(sols)} solution(s) (max 1).")
            print(f"  ✓ EMIB: {len(sols)} solution(s)")
            
            # Update solution counts
            total_solutions_found += len(sols)
            total_solutions_expected += 1
            
            # If nodes not loaded from JSON, infer from first solution layout
            if len(nodes) == 0 and len(sols) > 0 and sols[0].status == "Optimal":
                layout = sols[0].layout
                for idx, (name, (x, y)) in enumerate(sorted(layout.items())):
                    nodes.append(
                        ChipletNode(
                            name=name,
                            dimensions={"x": 0.0, "y": 0.0},
                            phys=[],
                            power=0.0,
                        )
                    )
            
            # Print coords and distances per solution
            # if len(nodes) > 0:
            #     for idx, sol in enumerate(sols):
            #         print_solution_coordinates_and_distances(sol, idx, nodes)
            #         logger.info(f"\nSolution {idx + 1} coords and distances logged")
            
            success_count += 1
            results_summary.append({
                'file': json_file.name,
                'core_name': core_name,
                'status': 'success',
                'num_solutions': len(sols),
                'log_dir': str(log_dir),
                'lp_dir': str(lp_dir),
                'fig_dir': str(fig_dir),
                'placement_file': str(placement_file),
            })
            
        except Exception as e:
            logger.error(f"\nError during solve: {e}", exc_info=True)
            print(f"  ✗ Failed: {e}")
            
            fail_count += 1
            results_summary.append({
                'file': json_file.name,
                'core_name': core_name,
                'status': 'failed',
                'error': str(e),
                'log_dir': str(log_dir),
                'lp_dir': str(lp_dir),
                'fig_dir': str(fig_dir),
                'placement_file': str(placement_file),
            })
        finally:
            # Restore stdout
            sys.stdout = original_stdout
            # Close log handle
            if log_file_handle:
                log_file_handle.close()
    
    # Summary
    print(f"\n{'='*80}")
    print(f"Batch test done (Gurobi)")
    time_end = time.time()
    print(f"  Total time: {time_end - time_start:.2f} s")
    print(f"{'='*80}")
    print(f"File summary:")
    print(f"  Success: {success_count}/{len(json_files_list)}")
    print(f"  Failed: {fail_count}/{len(json_files_list)}")
    print(f"Solution count:")
    print(f"  Found: {total_solutions_found}/{total_solutions_expected}")
    print(f"\nDetails:")
    for result in results_summary:
        if result['status'] == 'success':
            print(f"  ✓ {result['file']} -> {result['core_name']}: {result['num_solutions']} solution(s)")
            print(f"    Log dir: {result.get('log_dir', 'N/A')}")
            print(f"    LP dir: {result.get('lp_dir', 'N/A')}")
            print(f"    Fig dir: {result.get('fig_dir', 'N/A')}")
            print(f"    Placement: {result.get('placement_file', 'N/A')}")
        else:
            print(f"  ✗ {result['file']} -> {result['core_name']}: failed")
            print(f"    Error: {result.get('error', 'Unknown error')}")
            print(f"    Log dir: {result.get('log_dir', 'N/A')}")
            print(f"    LP dir: {result.get('lp_dir', 'N/A')}")
            print(f"    Fig dir: {result.get('fig_dir', 'N/A')}")
            print(f"    Placement: {result.get('placement_file', 'N/A')}")
    print(f"{'='*80}\n")


def main():
    """Main: parse CLI and run batch test."""
    def str2bool(value):
        if isinstance(value, bool):
            return value
        normalized = value.strip().lower()
        if normalized in ('true', '1', 'yes', 'y', 'on'):
            return True
        if normalized in ('false', '0', 'no', 'n', 'off'):
            return False
        raise argparse.ArgumentTypeError(f"expected true/false, got '{value}'")

    parser = argparse.ArgumentParser(
        description='Batch test: EMIB placement solve on test_input (Gurobi)',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Default parameters
  python3 batch_test_solutions_EMIB_chiplet.py
  
  # With parameters
  python3 batch_test_solutions_EMIB_chiplet.py --min-pair-dist-diff 3.0
  
  # Specific files
  python3 batch_test_solutions_EMIB_chiplet.py --files 5core.json 6core.json
        """
    )
    
    parser.add_argument(
        '--min-shared-length',
        type=float,
        default=DEFAULT_MIN_SHARED_LENGTH,
        dest='min_shared_length',
        help=f'Min shared edge between adjacent chiplets (default: {DEFAULT_MIN_SHARED_LENGTH})'
    )
    
    parser.add_argument(
        '--fixed-chiplet-idx',
        type=int,
        default=DEFAULT_FIXED_CHIPLET_IDX,
        help=f'Fixed chiplet index (default: {DEFAULT_FIXED_CHIPLET_IDX})'
    )
    
    parser.add_argument(
        '--min-pair-dist-diff',
        type=float,
        default=DEFAULT_MIN_PAIR_DIST_DIFF,
        help=f'Min distance-diff between chiplet pairs (default: {DEFAULT_MIN_PAIR_DIST_DIFF})'
    )
    
    parser.add_argument(
        '--time-limit',
        type=int,
        default=600,
        help='Time limit in seconds (default: 600)'
    )
    
    parser.add_argument(
        '--test-input-dir',
        type=str,
        default=None,
        help='Test input dir (default: benchmark/test_input)'
    )
    
    parser.add_argument(
        '--output-dir',
        type=str,
        default=None,
        help='Output base dir (default: output_gurobi_EMIB_chiplet)'
    )
    
    parser.add_argument(
        '--files',
        type=str,
        nargs='+',
        default=None,
        metavar='FILE',
        help='JSON files to process (e.g. --files 5core.json 6core or --files 5core 6core)'
    )

    parser.add_argument(
        '--mutual-distancing-enabled',
        type=str2bool,
        default=True,
        help='Enable high-power mutual distancing constraints/objective term (default: true)'
    )

    parser.add_argument(
        '--central-avoidance-enabled',
        type=str2bool,
        default=True,
        help='Enable high-power central avoidance constraints/objective term (default: true)'
    )

    parser.add_argument(
        '--timeout',
        type=int,
        default=3600,
        help='Total time budget for the three-phase solve in seconds (default: 3600)'
    )

    parser.add_argument(
        '--stage1',
        type=float,
        nargs=2,
        metavar=('GAP', 'TIME_LIMIT'),
        default=(0.0, 300),
        help='Stage 1 MIP gap and time limit seconds (default: 0.0 300)'
    )

    parser.add_argument(
        '--stage2',
        type=float,
        nargs=2,
        metavar=('GAP', 'TIME_LIMIT'),
        default=(0.3, 300),
        help='Stage 2 MIP gap and time limit seconds (default: 0.3 300)'
    )

    parser.add_argument(
        '--stage3',
        type=float,
        nargs='+',
        metavar='VALUE',
        default=(0.8,),
        help='Stage 3 MIP gap; an optional second value is accepted but ignored because time is remaining timeout (default: 0.8)'
    )
    
    # Log raw CLI args
    # print(f"\n{'='*80}")
    # print(f"Raw CLI args:")
    # print(f"  sys.argv: {sys.argv}")
    # print(f"{'='*80}\n")
    
    args = parser.parse_args()
    if len(args.stage3) > 2:
        parser.error("--stage3 accepts GAP and an optional ignored TIME_LIMIT value")
    
    # Log parsed args
    # print(f"\n{'='*80}")
    # print(f"Parsed args:")
    # print(f"  - min_shared_length: {args.min_shared_length} (type: {type(args.min_shared_length).__name__})")
    # print(f"  - fixed_chiplet_idx: {args.fixed_chiplet_idx} (type: {type(args.fixed_chiplet_idx).__name__})")
    # print(f"  - min_pair_dist_diff: {args.min_pair_dist_diff} (type: {type(args.min_pair_dist_diff).__name__})")
    # print(f"  - time_limit: {args.time_limit} (type: {type(args.time_limit).__name__})")
    # print(f"  - files: {args.files}")
    # print(f"  - test_input_dir: {args.test_input_dir}")
    # print(f"  - output_dir: {args.output_dir}")
    # print(f"{'='*80}\n")
    
    # Check for unrecognized args
    # if hasattr(args, '__dict__'):
    #     print(f"All parsed args:")
    #     for key, value in vars(args).items():
    #         print(f"  {key}: {value} (type: {type(value).__name__})")
    #     print(f"{'='*80}\n")
    
    # Resolve paths
    test_input_dir = Path(args.test_input_dir) if args.test_input_dir else None
    output_dir = Path(args.output_dir) if args.output_dir else None
    
    # Run batch test
    run_batch_tests(
        min_shared_length=args.min_shared_length,
        fixed_chiplet_idx=args.fixed_chiplet_idx,
        min_pair_dist_diff=args.min_pair_dist_diff,
        time_limit=args.time_limit,
        test_input_dir=test_input_dir,
        output_base_dir=output_dir,
        json_files=args.files,
        mutual_distancing_enabled=args.mutual_distancing_enabled,
        central_avoidance_enabled=args.central_avoidance_enabled,
        total_time_limit=args.timeout,
        stage1_gap=args.stage1[0],
        stage1_time_limit=int(args.stage1[1]),
        stage2_gap=args.stage2[0],
        stage2_time_limit=int(args.stage2[1]),
        stage3_gap=args.stage3[0],
    )


if __name__ == "__main__":
    main()
