#!/usr/bin/env python3
"""
Example: Using ILP Model Analysis with shell script log redirection.

This script shows how to run ILP optimization with analysis output that can be
captured via shell redirection (e.g., python script.py > output.log).

Usage:
    python example_with_log_redirection.py > ilp_output.log

    # Or with stderr included:
    python example_with_log_redirection.py > ilp_output.log 2>&1

    # Then view the log:
    cat ilp_output.log
"""

from pathlib import Path
import sys

# Add src directory to path
sys.path.insert(0, str(Path(__file__).parent))

from ilp_method_EMIB_chiplet import build_placement_ilp_model, solve_placement_ilp_from_model
from tool import ChipletNode


def example_simple_optimization():
    """Example: Simple optimization with analysis output to stdout."""

    print("[EXAMPLE] Starting simple chiplet placement optimization")
    print("[EXAMPLE] Output will include detailed ILP analysis")
    print()

    # Create simple test nodes
    nodes = [
        ChipletNode(name="A", w=10, h=12, power=100),
        ChipletNode(name="B", w=8, h=15, power=120),
        ChipletNode(name="C", w=12, h=10, power=80),
    ]

    # Simple edges (connections)
    edges = [
        {"node1": "A", "node2": "B", "wireCount": 256},
        {"node1": "B", "node2": "C", "wireCount": 128},
    ]

    print(f"[EXAMPLE] Created {len(nodes)} chiplets: {[n.name for n in nodes]}")
    print(f"[EXAMPLE] Created {len(edges)} connections")
    print()

    # Build model
    print("[EXAMPLE] Building ILP model...")
    ctx = build_placement_ilp_model(
        nodes=nodes,
        edges=edges,
        W=50.0,
        H=50.0,
        time_limit=60,
        verbose=True,
        distance_weight=1.0,
        area_weight=2.0,
    )
    print("[EXAMPLE] Model built successfully")
    print()

    # Solve with analysis
    print("[EXAMPLE] Solving ILP model with detailed analysis...")
    print("=" * 80)
    print()

    result = solve_placement_ilp_from_model(
        ctx,
        time_limit=60,
        verbose=True,
        enable_model_analysis=True,        # Enable analysis
        output_dir=None,                   # Output to stdout only (no file)
    )

    print()
    print("=" * 80)
    print()
    print("[EXAMPLE] Optimization completed")
    print(f"[EXAMPLE] Status: {result.status}")
    print(f"[EXAMPLE] Objective value: {result.objective_value:.6f}")
    print(f"[EXAMPLE] Solve time: {result.solve_time:.2f}s")
    print()

    # Show placement results
    if result.status == "Optimal":
        print("[EXAMPLE] Optimal placement found:")
        for name, (x, y) in result.layout.items():
            print(f"  {name}: ({x:.2f}, {y:.2f})")

    return result


def example_with_file_output():
    """Example: Optimization with both stdout and file output."""

    import tempfile
    import os

    print("[EXAMPLE2] Example with both stdout and file output")
    print()

    # Create test nodes
    nodes = [
        ChipletNode(name="X", w=15, h=12, power=150),
        ChipletNode(name="Y", w=10, h=10, power=100),
    ]

    edges = [
        {"node1": "X", "node2": "Y", "wireCount": 512},
    ]

    # Build model
    ctx = build_placement_ilp_model(
        nodes=nodes,
        edges=edges,
        W=40.0,
        H=40.0,
        time_limit=30,
        verbose=True,
    )

    # Create temporary output directory
    with tempfile.TemporaryDirectory() as tmpdir:
        print(f"[EXAMPLE2] Output directory: {tmpdir}")
        print()

        # Solve with both stdout and file output
        result = solve_placement_ilp_from_model(
            ctx,
            time_limit=30,
            verbose=True,
            enable_model_analysis=True,
            output_dir=tmpdir,                # Also save report to file
        )

        # Check if report file was created
        report_file = os.path.join(tmpdir, "ilp_model_analysis.txt")
        if os.path.exists(report_file):
            print(f"\n[EXAMPLE2] Report file saved to: {report_file}")
            print("[EXAMPLE2] Report file size:", os.path.getsize(report_file), "bytes")

    return result


if __name__ == "__main__":
    print("=" * 80)
    print("ILP MODEL ANALYSIS - SHELL REDIRECTION EXAMPLE")
    print("=" * 80)
    print()
    print("Note: All output (including detailed ILP analysis) will be printed to stdout")
    print("and can be captured via shell redirection:")
    print()
    print("  python example_with_log_redirection.py > ilp_output.log 2>&1")
    print()
    print("=" * 80)
    print()

    try:
        # Run examples
        print("\n[MAIN] Example 1: Basic optimization")
        print("-" * 80)
        result1 = example_simple_optimization()

        print("\n" + "=" * 80)
        print("\n[MAIN] Example 2: With file output")
        print("-" * 80)
        result2 = example_with_file_output()

        print("\n" + "=" * 80)
        print("\n[MAIN] All examples completed successfully")
        print()
        print("To capture output to a file, run:")
        print("  python example_with_log_redirection.py > ilp_output.log 2>&1")
        print()

    except Exception as e:
        print(f"\n[ERROR] {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
