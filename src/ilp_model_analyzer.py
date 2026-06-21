"""
ILP Model Analysis and Reporting Module

Provides detailed analysis of Gurobi ILP models including:
- Model statistics (variables, constraints, nonzeros)
- Variable type breakdown
- Solve statistics (iterations, nodes, time)
- Memory usage tracking
"""

import os
from datetime import datetime
from typing import Dict, Optional

import gurobipy as gp
from gurobipy import GRB

try:
    import psutil
    HAS_PSUTIL = True
except ImportError:
    HAS_PSUTIL = False
    psutil = None


class MemoryTracker:
    """Track memory usage before and after optimization using psutil."""

    def __init__(self):
        self.process = psutil.Process(os.getpid()) if HAS_PSUTIL else None
        self.initial_memory = None
        self.peak_memory = None
        self.final_memory = None
        self.available = HAS_PSUTIL

    def start(self):
        """Record initial memory."""
        if not self.available or self.process is None:
            return
        try:
            self.initial_memory = self.process.memory_info().rss / (1024 ** 2)  # MB
        except Exception:
            self.available = False

    def record_peak(self):
        """Record current memory (typically called during optimization)."""
        if not self.available or self.process is None:
            return
        try:
            current = self.process.memory_info().rss / (1024 ** 2)
            if self.peak_memory is None:
                self.peak_memory = current
            else:
                self.peak_memory = max(self.peak_memory, current)
        except Exception:
            self.available = False

    def finish(self):
        """Record final memory."""
        if not self.available or self.process is None:
            return
        try:
            self.final_memory = self.process.memory_info().rss / (1024 ** 2)
            self.record_peak()  # Ensure peak is at least the final
        except Exception:
            self.available = False

    def get_stats(self) -> Dict[str, float]:
        """Return memory statistics in MB."""
        if not self.available:
            return {
                'initial_memory_mb': None,
                'peak_memory_mb': None,
                'final_memory_mb': None,
                'peak_increase_mb': None,
                'final_increase_mb': None,
            }
        return {
            'initial_memory_mb': self.initial_memory or 0,
            'peak_memory_mb': self.peak_memory or 0,
            'final_memory_mb': self.final_memory or 0,
            'peak_increase_mb': (self.peak_memory or 0) - (self.initial_memory or 0),
            'final_increase_mb': (self.final_memory or 0) - (self.initial_memory or 0),
        }


def get_model_statistics(model: gp.Model) -> Dict:
    """Extract comprehensive ILP model statistics."""
    stats = {}

    # === Basic Model Size ===
    stats['num_constraints'] = model.NumConstrs
    stats['num_variables'] = model.NumVars
    stats['num_nonzeros'] = model.NumNZs
    stats['num_obj_coefficients'] = sum(1 for v in model.getVars() if v.Obj != 0)

    # === Variable Type Breakdown ===
    continuous_vars = 0
    integer_vars = 0
    binary_vars = 0
    semi_continuous_vars = 0
    semi_integer_vars = 0

    for var in model.getVars():
        if var.VType == GRB.CONTINUOUS:
            continuous_vars += 1
        elif var.VType == GRB.INTEGER:
            integer_vars += 1
        elif var.VType == GRB.BINARY:
            binary_vars += 1
        elif var.VType == GRB.SEMICONT:
            semi_continuous_vars += 1
        elif var.VType == GRB.SEMIINT:
            semi_integer_vars += 1

    stats['continuous_vars'] = continuous_vars
    stats['integer_vars'] = integer_vars
    stats['binary_vars'] = binary_vars
    stats['semi_continuous_vars'] = semi_continuous_vars
    stats['semi_integer_vars'] = semi_integer_vars

    # === Constraint Type Breakdown ===
    constraint_types = {}
    for constr in model.getConstrs():
        sense = constr.Sense
        sense_str = {GRB.LESS_EQUAL: '<=', GRB.EQUAL: '==', GRB.GREATER_EQUAL: '>='}[sense]
        constraint_types[sense_str] = constraint_types.get(sense_str, 0) + 1

    stats['constraint_types'] = constraint_types

    # === Coefficient Statistics ===
    matrix_min = float('inf')
    matrix_max = 0
    obj_min = float('inf')
    obj_max = 0
    bounds_min = float('inf')
    bounds_max = 0

    for var in model.getVars():
        # Objective coefficient
        if var.Obj != 0:
            obj_min = min(obj_min, abs(var.Obj))
            obj_max = max(obj_max, abs(var.Obj))

        # Variable bounds
        if var.LB > -GRB.INFINITY:
            bounds_min = min(bounds_min, var.LB)
            bounds_max = max(bounds_max, var.LB)
        if var.UB < GRB.INFINITY:
            bounds_min = min(bounds_min, var.UB)
            bounds_max = max(bounds_max, var.UB)

    for constr in model.getConstrs():
        expr = model.getRow(constr)
        for i in range(expr.size()):
            coeff = expr.getCoeff(i)
            if coeff != 0:
                matrix_min = min(matrix_min, abs(coeff))
                matrix_max = max(matrix_max, abs(coeff))

    for constr in model.getConstrs():
        rhs = constr.RHS
        if abs(rhs) > 0:
            bounds_min = min(bounds_min, rhs)
            bounds_max = max(bounds_max, rhs)

    if matrix_min == float('inf'):
        matrix_min = 0
    if obj_min == float('inf'):
        obj_min = 0
    if bounds_min == float('inf'):
        bounds_min = 0

    stats['matrix_range'] = (matrix_min, matrix_max)
    stats['objective_range'] = (obj_min, obj_max)
    stats['bounds_range'] = (bounds_min, bounds_max)

    return stats


def get_solve_statistics(model: gp.Model) -> Dict:
    """Extract solve statistics from completed optimization."""
    stats = {}

    # === Status ===
    status_map = {
        GRB.OPTIMAL: 'Optimal',
        GRB.INFEASIBLE: 'Infeasible',
        GRB.UNBOUNDED: 'Unbounded',
        GRB.INF_OR_UNBD: 'Infeasible or Unbounded',
        GRB.ITERATION_LIMIT: 'Iteration Limit',
        GRB.NODE_LIMIT: 'Node Limit',
        GRB.TIME_LIMIT: 'Time Limit',
        GRB.SOLUTION_LIMIT: 'Solution Limit',
        GRB.INTERRUPTED: 'Interrupted',
        GRB.NUMERIC: 'Numeric',
        GRB.SUBOPTIMAL: 'Suboptimal',
    }
    stats['status'] = status_map.get(model.Status, f'Unknown({model.Status})')

    # === Objective Value ===
    try:
        stats['objective_value'] = model.ObjVal
    except:
        stats['objective_value'] = None

    try:
        stats['obj_bound'] = model.ObjBound
    except:
        stats['obj_bound'] = None

    # === Gap ===
    try:
        stats['mip_gap'] = model.MIPGap
    except:
        stats['mip_gap'] = None

    # === Runtime Statistics ===
    try:
        stats['solve_time'] = model.Runtime
    except:
        stats['solve_time'] = 0.0

    try:
        stats['solution_count'] = model.SolCount
    except:
        stats['solution_count'] = 0

    # === Search Tree Statistics ===
    try:
        stats['nodes_explored'] = model.NodeCount
    except:
        stats['nodes_explored'] = None

    try:
        stats['simplex_iterations'] = model.IterCount
    except:
        stats['simplex_iterations'] = None

    # === Presolve Statistics ===
    try:
        stats['rows_presolved'] = getattr(model, 'PresolveRows', None)
        stats['cols_presolved'] = getattr(model, 'PresolveCols', None)
    except:
        stats['rows_presolved'] = None
        stats['cols_presolved'] = None

    return stats


def print_model_report(
    model: gp.Model,
    model_name: str = "ILP Model",
    memory_tracker: Optional[MemoryTracker] = None,
    log_file: Optional[str] = None,
) -> str:
    """
    Generate and print comprehensive ILP model report.

    Parameters
    ----------
    model : gp.Model
        Gurobi model to analyze
    model_name : str
        Name for the model in output
    memory_tracker : MemoryTracker, optional
        Memory tracker with pre/post stats
    log_file : str, optional
        Path to save report to file

    Returns
    -------
    str
        Formatted report string
    """

    report_lines = []
    separator = "=" * 80

    # === Header ===
    report_lines.append(separator)
    report_lines.append(f"ILP MODEL ANALYSIS REPORT - {model_name}")
    report_lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    report_lines.append(separator)

    # === Model Statistics ===
    model_stats = get_model_statistics(model)

    report_lines.append("\n[MODEL STRUCTURE]")
    report_lines.append(f"  Constraints (rows):        {model_stats['num_constraints']:>15}")
    report_lines.append(f"  Variables (columns):       {model_stats['num_variables']:>15}")
    report_lines.append(f"  Non-zero elements:         {model_stats['num_nonzeros']:>15}")
    report_lines.append(f"  Objective coefficients:    {model_stats['num_obj_coefficients']:>15}")

    # === Variable Types ===
    report_lines.append("\n[VARIABLE TYPES]")
    report_lines.append(f"  Continuous:                {model_stats['continuous_vars']:>15}")
    report_lines.append(f"  Integer:                   {model_stats['integer_vars']:>15}")
    report_lines.append(f"  Binary:                    {model_stats['binary_vars']:>15}")
    if model_stats['semi_continuous_vars'] > 0:
        report_lines.append(
            f"  Semi-continuous:           {model_stats['semi_continuous_vars']:>15}"
        )
    if model_stats['semi_integer_vars'] > 0:
        report_lines.append(f"  Semi-integer:              {model_stats['semi_integer_vars']:>15}")

    # === Constraint Types ===
    report_lines.append("\n[CONSTRAINT TYPES]")
    for sense, count in sorted(model_stats['constraint_types'].items()):
        report_lines.append(f"  {sense} constraints:                  {count:>15}")

    # === Coefficient Statistics ===
    report_lines.append("\n[COEFFICIENT STATISTICS]")
    if model_stats['matrix_range'][1] > 0:
        report_lines.append(
            f"  Matrix range:              [{model_stats['matrix_range'][0]:.2e}, "
            f"{model_stats['matrix_range'][1]:.2e}]"
        )
    if model_stats['objective_range'][1] > 0:
        report_lines.append(
            f"  Objective range:           [{model_stats['objective_range'][0]:.2e}, "
            f"{model_stats['objective_range'][1]:.2e}]"
        )
    if model_stats['bounds_range'][1] > 0:
        report_lines.append(
            f"  Bounds range:              [{model_stats['bounds_range'][0]:.2e}, "
            f"{model_stats['bounds_range'][1]:.2e}]"
        )

    # === Solve Statistics ===
    solve_stats = get_solve_statistics(model)

    report_lines.append("\n[SOLVE STATISTICS]")
    report_lines.append(f"  Status:                    {solve_stats['status']}")
    if solve_stats['objective_value'] is not None:
        report_lines.append(f"  Objective value:           {solve_stats['objective_value']:>15.6f}")
    if solve_stats['obj_bound'] is not None:
        report_lines.append(f"  Best bound:                {solve_stats['obj_bound']:>15.6f}")
    if solve_stats['mip_gap'] is not None:
        report_lines.append(f"  MIP gap:                   {solve_stats['mip_gap'] * 100:>14.4f}%")
    report_lines.append(f"  Solve time (s):            {solve_stats['solve_time']:>15.2f}")
    report_lines.append(f"  Solutions found:           {solve_stats['solution_count']:>15}")
    if solve_stats['nodes_explored'] is not None:
        report_lines.append(f"  Nodes explored:            {solve_stats['nodes_explored']:>15}")
    else:
        report_lines.append(f"  Nodes explored:            {'(not available)':>15}")
    if solve_stats['simplex_iterations'] is not None:
        report_lines.append(f"  Simplex iterations:        {solve_stats['simplex_iterations']:>15}")
    else:
        report_lines.append(f"  Simplex iterations:        {'(not available)':>15}")

    # === Memory Statistics ===
    if memory_tracker and memory_tracker.available:
        memory_stats = memory_tracker.get_stats()
        if any(v is not None for v in memory_stats.values()):
            report_lines.append("\n[MEMORY USAGE]")
            if memory_stats['initial_memory_mb'] is not None:
                report_lines.append(f"  Initial memory:            {memory_stats['initial_memory_mb']:>14.2f} MB")
            if memory_stats['peak_memory_mb'] is not None:
                report_lines.append(f"  Peak memory:               {memory_stats['peak_memory_mb']:>14.2f} MB")
            if memory_stats['final_memory_mb'] is not None:
                report_lines.append(f"  Final memory:              {memory_stats['final_memory_mb']:>14.2f} MB")
            if memory_stats['peak_increase_mb'] is not None:
                report_lines.append(
                    f"  Peak increase:             {memory_stats['peak_increase_mb']:>14.2f} MB"
                )
            if memory_stats['final_increase_mb'] is not None:
                report_lines.append(
                    f"  Final increase:            {memory_stats['final_increase_mb']:>14.2f} MB"
                )
        else:
            report_lines.append("\n[MEMORY USAGE]")
            report_lines.append("  (psutil unavailable for memory tracking)")
    elif memory_tracker:
        report_lines.append("\n[MEMORY USAGE]")
        report_lines.append("  (psutil not available - install psutil for memory tracking)")

    report_lines.append("\n" + separator)

    # === Combine and output ===
    report_text = "\n".join(report_lines)

    print(report_text)

    # Save to file if requested
    if log_file:
        try:
            with open(log_file, 'a') as f:
                f.write(report_text + "\n\n")
        except Exception as e:
            print(f"Warning: Could not write report to {log_file}: {e}")

    return report_text


def print_gurobi_log_extract(_model: Optional[gp.Model] = None, log_file: Optional[str] = None) -> str:
    """
    Extract and format key information from Gurobi solve.

    Parameters
    ----------
    _model : gp.Model, optional
        Gurobi model after optimization (reserved for future use)
    log_file : str, optional
        Path to Gurobi log file (if any)

    Returns
    -------
    str
        Extracted log information
    """
    lines = []

    lines.append("\n[GUROBI OPTIMIZATION LOG SUMMARY]")

    # Try to read log file if provided
    if log_file and os.path.exists(log_file):
        lines.append(f"\nLog file: {log_file}")
        try:
            with open(log_file, 'r') as f:
                log_content = f.read()
                # Extract key lines
                for line in log_content.split('\n'):
                    if any(
                        keyword in line
                        for keyword in [
                            'Optimize a model with',
                            'Variable types:',
                            'Presolve',
                            'Root relaxation',
                            'Cutting planes:',
                            'Explored',
                            'Optimal solution found',
                        ]
                    ):
                        lines.append(f"  {line.strip()}")
        except Exception as e:
            lines.append(f"Could not read log file: {e}")
    else:
        lines.append("(No log file provided or file not found)")

    return "\n".join(lines)
