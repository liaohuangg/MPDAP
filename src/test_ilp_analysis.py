"""
Test and demonstration script for ILP Model Analysis functionality.

Shows how to use the new analysis features with a simple example.
"""

import os
import tempfile
import gurobipy as gp
from gurobipy import GRB
from ilp_model_analyzer import (
    MemoryTracker,
    get_model_statistics,
    get_solve_statistics,
    print_model_report,
)


def create_simple_test_model() -> gp.Model:
    """Create a simple test ILP model for demonstration."""
    model = gp.Model("TestILP")

    # Create variables
    x = model.addVar(vtype=GRB.CONTINUOUS, name="x")
    y = model.addVar(vtype=GRB.CONTINUOUS, name="y")
    z = model.addVar(vtype=GRB.BINARY, name="z")
    w = model.addVar(vtype=GRB.INTEGER, name="w")

    # Set objective
    model.setObjective(x + 2 * y + 3 * z + w, GRB.MINIMIZE)

    # Add constraints
    model.addConstr(x + y >= 1, "c1")
    model.addConstr(x - y <= 5, "c2")
    model.addConstr(z + w <= 10, "c3")
    model.addConstr(x + 2 * z >= 2, "c4")
    model.addConstr(y + w <= 8, "c5")

    # Set bounds
    x.LB = 0
    x.UB = 10
    y.LB = 0
    y.UB = 10
    w.LB = 0
    w.UB = 10

    return model


def demonstrate_analysis():
    """Demonstrate the ILP analysis functionality."""
    print("=" * 80)
    print("ILP MODEL ANALYSIS - DEMONSTRATION")
    print("=" * 80)

    # Create test model
    print("\n[1] Creating test ILP model...")
    model = create_simple_test_model()
    print("    Model created successfully")

    # Show pre-solve statistics
    print("\n[2] Pre-solve Model Statistics:")
    print("-" * 80)
    model_stats = get_model_statistics(model)
    print(f"  Constraints: {model_stats['num_constraints']}")
    print(f"  Variables: {model_stats['num_variables']}")
    print(f"    - Continuous: {model_stats['continuous_vars']}")
    print(f"    - Integer: {model_stats['integer_vars']}")
    print(f"    - Binary: {model_stats['binary_vars']}")
    print(f"  Non-zeros: {model_stats['num_nonzeros']}")
    print(f"  Constraint types: {model_stats['constraint_types']}")

    # Solve with memory tracking
    print("\n[3] Solving model with memory tracking...")
    print("-" * 80)

    memory_tracker = MemoryTracker()
    memory_tracker.start()

    model.Params.OutputFlag = 0  # Suppress Gurobi output for cleaner demo
    model.optimize()

    memory_tracker.finish()
    print("    Optimization completed")

    # Get solve statistics
    print("\n[4] Post-solve Statistics:")
    print("-" * 80)
    solve_stats = get_solve_statistics(model)
    print(f"  Status: {solve_stats['status']}")
    if solve_stats['objective_value'] is not None:
        print(f"  Objective value: {solve_stats['objective_value']:.6f}")
    print(f"  Solve time: {solve_stats['solve_time']:.4f}s")
    print(f"  Solutions found: {solve_stats['solution_count']}")
    print(f"  Nodes explored: {solve_stats['nodes_explored']}")

    # Print complete report
    print("\n[5] Complete ILP Analysis Report:")
    print("-" * 80)
    report = print_model_report(
        model,
        model_name="Test ILP Model",
        memory_tracker=memory_tracker,
    )

    # Show solution (if optimal)
    if model.status == GRB.OPTIMAL:
        print("\n[6] Optimal Solution:")
        print("-" * 80)
        for var in model.getVars():
            print(f"  {var.VarName} = {var.X:.6f}")

    # Save report to file
    with tempfile.TemporaryDirectory() as tmpdir:
        report_file = os.path.join(tmpdir, "analysis_report.txt")
        print("\n[7] Saving report to file...")
        print(f"    File: {report_file}")
        with open(report_file, "w") as f:
            f.write(report)
        print("    Report saved successfully")

        # Read and show file path
        if os.path.exists(report_file):
            with open(report_file, "r") as f:
                content = f.read()
            print(f"    File size: {len(content)} bytes")

    print("\n" + "=" * 80)
    print("DEMONSTRATION COMPLETED")
    print("=" * 80)


if __name__ == "__main__":
    try:
        demonstrate_analysis()
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
