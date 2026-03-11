"""
Chiplet placement optimization using Integer Linear Programming (ILP) with Gurobi.

Main features
-------------
1. **Adjacency constraints**: chiplets connected by an edge must be horizontally or vertically adjacent (touching),
   and the shared edge length must be no smaller than a given lower bound.
2. **Rotation constraints**: each chiplet may rotate 0°/90°, controlled by a binary variable ``r_k`` that swaps width/height.
3. **Non‑overlap constraints**: any two chiplets are forbidden to overlap.
4. **Bounding‑box constraints**: explicitly construct a bounding rectangle that covers all chiplets and add linear
   constraints on its width and height.
5. **Multi‑objective optimization**: the objective is

   ``β1 * wirelength + β2 * t``

   where ``wirelength`` is the sum of Manhattan distances between centers of all connected chiplet pairs, and
   ``t`` is an AM–GM–based convex surrogate variable that approximates the bounding‑box area.

This implementation depends on Gurobi Optimizer.
"""

from __future__ import annotations

import math
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any

import gurobipy as gp
from gurobipy import GRB

try:
    from tool import ChipletNode, draw_chiplet_diagram, EMIBNode, print_emib_node_contents
except ImportError:
    from .tool import ChipletNode, draw_chiplet_diagram, EMIBNode, print_emib_node_contents


def _get_beta_from_env(env_name: str, default: float) -> float:
    """Read beta weights from environment variables; fall back to defaults on missing/invalid values."""
    value = os.getenv(env_name)
    if value is None:
        return default
    try:
        return float(value)
    except ValueError:
        print(f"[EMIB] Warning: invalid {env_name}='{value}', fallback to {default}")
        return default


@dataclass
class ILPPlacementResult:
    """ILP solve result container."""

    # TODO: add English comment
    layout: Dict[str, Tuple[float, float]]  # name -> (x_grid, y_grid)
    rotations: Dict[str, bool]  # TODO: add English comment
    objective_value: float
    status: str
    solve_time: float
    bounding_box: Tuple[float, float]  # TODO: add English comment
    # TODO: add English comment
    cx_grid_var: Dict[str, float]
    cy_grid_var: Dict[str, float]
    # TODO: add English comment
    emib_placements: Optional[List[dict]] = None
    # TODO: add English comment
    aspect_ratio_penalty: Optional[float] = None

@dataclass
class ILPModelContext:
    """
    ILP model context.

    - `model`  : fully-built Gurobi model (variables, constraints, objective; more constraints may be added)
    - `x, y`  : chiplet bottom-left coordinate variables (used for solution-exclusion and other constraints)
    - `r`     : rotation variable for each chiplet (0/1 for 0°/90°)
    - `z1, z2`: adjacency mode variables for each connected chiplet pair (horizontal / vertical)
    - `z1L, z1R, z2D, z2U`: relative-direction variables for each connected pair (left, right, down, up)
    - `all_connected_pairs` : dict, key=(i,j) with i<j, value=edge dict {node1, node2, wireCount, EMIBType, EMIB_length, EMIB_max_width}
    - `bbox_w, bbox_h` : variables for bounding-box width and height
    - `W, H`  : upper bounds for bounding-box size (chosen at modeling time)
    - `fixed_chiplet_idx` : deprecated; fixed-chiplet constraint no longer used (kept for API compatibility)
    """

    model: gp.Model
    nodes: List[ChipletNode]
    edges: List  # TODO: add English comment

    x_grid_var: Dict[int, gp.Var]
    y_grid_var: Dict[int, gp.Var]
    r: Dict[int, gp.Var]
    cx_grid_var: Dict[int, gp.Var]
    cy_grid_var: Dict[int, gp.Var]
    z1: Dict[Tuple[int, int], gp.Var]
    z2: Dict[Tuple[int, int], gp.Var]
    z1L: Dict[Tuple[int, int], gp.Var]
    z1R: Dict[Tuple[int, int], gp.Var]
    z2D: Dict[Tuple[int, int], gp.Var]
    z2U: Dict[Tuple[int, int], gp.Var]
    all_connected_pairs: Dict[Tuple[int, int], dict]

    bbox_w: gp.Var
    bbox_h: gp.Var

    W: float
    H: float
    fixed_chiplet_idx: Optional[int] = None

    # TODO: add English comment
    ref_wirelength: Optional[float] = None
    ref_t: Optional[float] = None
    ref_power: Optional[float] = None
    ref_aspect: Optional[float] = None
    beta_wire: Optional[float] = None
    beta_area: Optional[float] = None
    beta_aspect: Optional[float] = None
    beta_power: Optional[float] = None

    # TODO: add English comment
    EMIB_connected_pairs: Optional[Dict[Tuple[int, int], Any]] = None
    EMIB_x_grid_var: Optional[Dict[Tuple[int, int], Any]] = None
    EMIB_y_grid_var: Optional[Dict[Tuple[int, int], Any]] = None
    EMIB_w_var: Optional[Dict[Tuple[int, int], Any]] = None
    EMIB_h_var: Optional[Dict[Tuple[int, int], Any]] = None
    r_EMIB: Optional[Dict[Tuple[int, int], Any]] = None

    # TODO: add English comment
    @property
    def prob(self):
        """Return underlying model for compatibility (Gurobi-style API)."""
        return self.model

def add_absolute_value_constraint_big_m(
    model: gp.Model,
    abs_var: gp.Var,
    orig_var: gp.Var,
    M: float,
    constraint_prefix: str,
) -> None:
    """
    Use Big-M method to add abs constraint: abs_var = |orig_var|
    
    Implementation (Big-M style):
    1. Create binary variable is_positive indicating orig_var >= 0
    2. Use 4 constraints to enforce abs_var = |orig_var|
       - When orig_var >= 0 (is_positive=1): abs_var = orig_var
       - When orig_var < 0 (is_positive=0): abs_var = -orig_var
    3. Use 2 constraints to enforce correctness of is_positive
    """
    # TODO: add English comment
    is_positive = model.addVar(
        name=f"{constraint_prefix}_is_positive",
        vtype=GRB.BINARY
    )
    
    # TODO: add English comment
    model.addConstr(
        abs_var >= orig_var - M * (1 - is_positive),
        name=f"{constraint_prefix}_abs_ge_orig"
    )
    
    # TODO: add English comment
    model.addConstr(
        abs_var <= orig_var + M * (1 - is_positive),
        name=f"{constraint_prefix}_abs_le_orig"
    )
    
    # TODO: add English comment
    model.addConstr(
        abs_var >= -orig_var - M * is_positive,
        name=f"{constraint_prefix}_abs_ge_neg_orig"
    )
    
    # TODO: add English comment
    model.addConstr(
        abs_var <= -orig_var + M * is_positive,
        name=f"{constraint_prefix}_abs_le_neg_orig"
    )
    
    # TODO: add English comment
    model.addConstr(
        orig_var >= -M * (1 - is_positive),
        name=f"{constraint_prefix}_force_positive"
    )
    
    # TODO: add English comment
    epsilon = 0.001
    model.addConstr(
        orig_var <= M * is_positive,
        name=f"{constraint_prefix}_force_negative"
    )


def select_high_power_indices_by_density(
    n: int,
    nodes: List,
    chiplet_w_orig_grid: Dict[int, float],
    chiplet_h_orig_grid: Dict[int, float],
    top_ratio: float = 0.3,
) -> Tuple[set[int], Optional[float]]:
    """
    Sort chiplets by power density and take the top top_ratio fraction.

    Returns:
        (high_power_indices, density_threshold)
        high_power_indices: indices with power density >= threshold
        density_threshold : lowest selected power density, or None if no valid chiplets
    """
    density_list: List[Tuple[int, float]] = []
    for i in range(n):
        p_i = float(getattr(nodes[i], "power", 0.0) or 0.0)
        w_i = float(chiplet_w_orig_grid.get(i, 0.0) or 0.0)
        h_i = float(chiplet_h_orig_grid.get(i, 0.0) or 0.0)
        area_i = w_i * h_i
        if p_i <= 0.0 or area_i <= 0.0:
            continue
        density_list.append((i, p_i / area_i))

    if not density_list:
        return set(), None

    density_list.sort(key=lambda x: x[1], reverse=True)
    k = max(1, int(len(density_list) * top_ratio))
    density_threshold = density_list[k - 1][1]
    high_indices = {idx for idx, dens in density_list if dens >= density_threshold}
    return high_indices, density_threshold


def compute_normalization_factors(
    n: int,
    nodes: List,
    chiplet_w_orig_grid: Dict[int, float],
    chiplet_h_orig_grid: Dict[int, float],
    all_connected_pairs: Dict[Tuple[int, int], dict],
    power_aware_enabled: bool,
) -> Tuple[float, float, float, float]:
    """
    Estimate normalization scales (static scaling) so multi-objective terms have similar magnitude.
    All returned reference values are around O(1e2).

    Returns
    ----
    (ref_wirelength, ref_t, ref_power, ref_aspect)
        Reference values for wirelength, area proxy, power term, and aspect-ratio deviation (all ~1e2).
    """
    # TODO: add English comment
    total_area = sum(
        chiplet_w_orig_grid[i] * chiplet_h_orig_grid[i] for i in range(n)
    )
    L_avg = math.sqrt(total_area) if total_area > 0 else 1.0
    print(f"[DEBUG] L_avg: {L_avg}")
    print(f"[DEBUG] total_area: {total_area}")
    # 2.  scaling factors
    # TODO: add English comment
    ref_t = L_avg * 2.0

    # TODO: add English comment
    total_wire_count = sum(
        e.get("wireCount", 1) if isinstance(e, dict) else getattr(e, "wireCount", 1)
        for e in all_connected_pairs.values()
    )
    ref_wirelength = max(total_wire_count * L_avg / 2.0, 1.0)

    # TODO: add English comment
    sum_long = 0.0
    sum_short = 0.0
    for i in range(n):
        w = chiplet_w_orig_grid[i]
        h = chiplet_h_orig_grid[i]
        sum_long += max(w, h)
        sum_short += min(w, h)
    ref_aspect = max(sum_long - sum_short, 1.0)

    # TODO: add English comment
    # TODO: add English comment
    ref_power = 1.0
    if power_aware_enabled:
        high_idxs, density_threshold = select_high_power_indices_by_density(
            n, nodes, chiplet_w_orig_grid, chiplet_h_orig_grid, top_ratio=0.3
        )
        if high_idxs:
            pair_sum = 0.0
            self_sum = 0.0
            high_list = sorted(high_idxs)
            for a in range(len(high_list)):
                i = high_list[a]
                p_i = float(getattr(nodes[i], "power", 0.0) or 0.0)
                self_sum += p_i * p_i
                for b in range(a + 1, len(high_list)):
                    j = high_list[b]
                    p_j = float(getattr(nodes[j], "power", 0.0) or 0.0)
                    pair_sum += p_i * p_j

            # TODO: add English comment
            scale = max(len(high_list), 1)
            ref_power = max(L_avg / (n / 4.0) * (pair_sum + self_sum) / scale, 1.0)

    print(f"[DEBUG] ref_wirelength: {ref_wirelength}")
    print(f"[DEBUG] ref_t: {ref_t}")
    print(f"[DEBUG] ref_power: {ref_power}")
    print(f"[DEBUG] ref_aspect: {ref_aspect}")
    return ref_wirelength, ref_t, ref_power, ref_aspect


def log_objective_breakdown(ctx: "ILPModelContext", model: gp.Model) -> None:
    """
    Print normalized objective breakdown to stdout.
    Can be called after solve_placement_ilp_from_model or _solve_once_with_gap succeeds.
    """
    if getattr(ctx, "ref_wirelength", None) is None or getattr(ctx, "ref_t", None) is None:
        return
    try:
        v_wl = model.getVarByName("wirelength")
        v_t = model.getVarByName("bbox_area_proxy_t")
        v_asp = model.getVarByName("aspect_ratio_penalty")
        v_pwr = model.getVarByName("power_aware_penalty")
        val_wl = float(v_wl.X) if v_wl else 0.0
        val_t = float(v_t.X) if v_t else 0.0
        val_asp = float(v_asp.X) if v_asp else 0.0
        val_pwr = float(v_pwr.X) if v_pwr else 0.0
        norm_wl = val_wl / ctx.ref_wirelength
        norm_t = val_t / ctx.ref_t
        norm_asp = val_asp / (ctx.ref_aspect or 1.0)
        norm_pwr = val_pwr / (ctx.ref_power or 1.0)
        contrib_wl = (ctx.beta_wire or 1.0) * norm_wl
        contrib_t = (ctx.beta_area or 1.0) * norm_t
        contrib_asp = (ctx.beta_aspect or 0.0) * norm_asp
        contrib_pwr = (ctx.beta_power or 0.0) * norm_pwr
        print("power_penalty(power)={val_pwr:.4f}, aspect_penalty(aspect)={val_asp:.4f}")
    except Exception as e:
        print("DEBUG")


def solve_placement_ilp_from_model(
    ctx: ILPModelContext,
    time_limit: int = 600,  # TODO: add English comment
    verbose: bool = True,
) -> ILPPlacementResult:
    """
    Solve on an existing ILPModelContext and extract solution.

    Additional constraints (e.g. solution-exclusion cuts) can be added between solves.
    """
    import time

    model = ctx.model
    nodes = ctx.nodes
    x_grid_var, y_grid_var, r = ctx.x_grid_var, ctx.y_grid_var, ctx.r
    cx_grid_var, cy_grid_var = ctx.cx_grid_var, ctx.cy_grid_var
    W, H = ctx.W, ctx.H

    start_time = time.time()

    if verbose:
        print("DEBUG")
        print("DEBUG")
        print("DEBUG")

    # TODO: add English comment
    model.setParam('TimeLimit', time_limit)
    model.setParam('OutputFlag', 1 if verbose else 0)
    model.setParam('LogToConsole', 1 if verbose else 0)

    try:
        model.optimize()
        solve_time = time.time() - start_time

        # TODO: add English comment
        status_map = {
            GRB.OPTIMAL: "Optimal",
            GRB.INFEASIBLE: "Infeasible",
            GRB.UNBOUNDED: "Unbounded",
            GRB.TIME_LIMIT: "TimeLimit",
            GRB.INTERRUPTED: "Interrupted",
        }
        status_str = status_map.get(model.status, f"Unknown({model.status})")

        # if verbose:
        print("DEBUG")
        print("DEBUG")
        if model.status == GRB.OPTIMAL or model.status == GRB.FEASIBLE:
            print("DEBUG")
            log_objective_breakdown(ctx, model)

        # TODO: add English comment
        layout: Dict[str, Tuple[float, float]] = {}
        rotations: Dict[str, bool] = {}
        cx_grid_val: Dict[str, float] = {}
        cy_grid_val: Dict[str, float] = {}
        for k, node in enumerate(nodes):
            if model.status == GRB.OPTIMAL:
                x_val = float(x_grid_var[k].X) if x_grid_var[k] is not None else 0.0
                y_val = float(y_grid_var[k].X) if y_grid_var[k] is not None else 0.0
                r_val = float(r[k].X) if r[k] is not None else 0.0
                layout[node.name] = (x_val, y_val)
                rotations[node.name] = bool(r_val > 0.5)

                # TODO: add English comment
                cx_grid_val[node.name] = float(cx_grid_var[k].X) if cx_grid_var.get(k) is not None else 0.0
                cy_grid_val[node.name] = float(cy_grid_var[k].X) if cy_grid_var.get(k) is not None else 0.0
            else:
                layout[node.name] = (0.0, 0.0)
                rotations[node.name] = False
                cx_grid_val[node.name] = 0.0
                cy_grid_val[node.name] = 0.0
        obj_value = (
            model.ObjVal if model.status == GRB.OPTIMAL else float("inf")
        )

        # TODO: add English comment
        try:
            bw_val = ctx.bbox_w.X if ctx.bbox_w is not None else None
            bh_val = ctx.bbox_h.X if ctx.bbox_h is not None else None
        except Exception:
            bw_val, bh_val = None, None

        bbox_tuple = (
            float(bw_val) if bw_val is not None else 0.0,
            float(bh_val) if bh_val is not None else 0.0,
        )

        return ILPPlacementResult(
            layout=layout,
            rotations=rotations,
            objective_value=obj_value,
            status=status_str,
            solve_time=solve_time,
            bounding_box=bbox_tuple,
            cx_grid_var=cx_grid_val,
            cy_grid_var=cy_grid_val,
        )

    except Exception as e:
        solve_time = time.time() - start_time
        if verbose:
            print("DEBUG")
            import traceback

            traceback.print_exc()

        # TODO: add English comment
        layout = {node.name: (0.0, 0.0) for node in nodes}
        rotations = {node.name: False for node in nodes}
        return ILPPlacementResult(
            layout=layout,
            rotations=rotations,
            objective_value=float("inf"),
            status="Error",
            solve_time=solve_time,
            bounding_box=(W if W else 100.0, H if H else 100.0),
        )


def build_placement_ilp_model(
    nodes: List[ChipletNode],
    edges: Optional[List] = None,  # TODO: add English comment
    emib_nodes: Optional[Dict[Tuple[int, int], "EMIBNode"]] = None,  # TODO: add English comment
    W: Optional[float] = None,
    H: Optional[float] = None,
    time_limit: int = 600,  # TODO: add English comment
    verbose: bool = True,
    min_shared_length: float = 0.0,
    minimize_bbox_area: bool = True,
    distance_weight: float = 1.0,
    area_weight: float = 2.0,
    fixed_chiplet_idx: Optional[int] = None,  # TODO: add English comment
    min_aspect_ratio: float = 0.5,
    max_aspect_ratio: float = 2,
    power_aware_enabled: bool = True,
) -> ILPModelContext:
    """
    Solve chiplet placement with a continuous-coordinate ILP model (no grid discretization).
    
    Differences from build_placement_ilp_model:
    1. Coordinates/sizes are continuous (same units as input).
    2. silicon_bridge connections use tight adjacency constraints (zero gap).
    3. Shared edge length uses actual units (no grid scaling).
    
    Parameters
    ----
    fixed_chiplet_idx: Optional[int]
        Deprecated: fixed-chiplet constraint not used (kept for API compatibility).
    Other parameters are the same as build_placement_ilp_model.
    """
    import math
    
    n = len(nodes)
    name_to_idx = {node.name: i for i, node in enumerate(nodes)}
    
    # TODO: add English comment
    # TODO: add English comment
    chiplet_w_orig = {}
    chiplet_h_orig = {}
    for i, node in enumerate(nodes):
        chiplet_w_orig[i] = float(node.dimensions.get("x", 0.0))
        chiplet_h_orig[i] = float(node.dimensions.get("y", 0.0))
        print(f"node {i} w: {chiplet_w_orig[i]}, h: {chiplet_h_orig[i]}")
    
    # TODO: add English comment
    chiplet_w_orig_grid = {i: chiplet_w_orig[i] for i in range(n)}
    chiplet_h_orig_grid = {i: chiplet_h_orig[i] for i in range(n)}
    
    # TODO: add English comment
    all_connected_pairs: Dict[Tuple[int, int], Any] = {}
    if emib_nodes is not None:
        for (i, j), emib_node in emib_nodes.items():
            if i >= j:
                i, j = j, i
            all_connected_pairs[(i, j)] = emib_node
    elif edges is not None:
        for edge in edges:
            if not isinstance(edge, dict) or not all(k in edge for k in ("node1", "node2", "wireCount", "EMIBType", "EMIB_length", "EMIB_max_width", "EMIB_bump_width")):
                raise ValueError(f"Invalid edge format: each edge must contain node1, node2, wireCount, EMIBType, EMIB_length, EMIB_max_width, EMIB_bump_width. Edge: {edge}")
            src_name = edge["node1"]
            dst_name = edge["node2"]
            if src_name not in name_to_idx or dst_name not in name_to_idx:
                continue
            i, j = name_to_idx[src_name], name_to_idx[dst_name]
            if i == j:
                continue
            if i > j:
                i, j = j, i
            bump = float(edge.get("EMIB_bump_width", 0) or 0)
            all_connected_pairs[(i, j)] = EMIBNode(
                node1=src_name, node2=dst_name,
                wireCount=int(edge.get("wireCount", 0) or 0),
                EMIBType=str(edge.get("EMIBType", "") or ""),
                EMIB_length=float(edge.get("EMIB_length", 0) or 0),
                EMIB_bump_width=bump,
                EMIB_max_width=float(edge.get("EMIB_max_width", 0) or 0),
                width=2.0 * bump,
                height=float(edge.get("EMIB_length", 0) or 0),
            )
    else:
        raise ValueError("build_placement_ilp_model requires emib_nodes or edges")

    # TODO: add English comment
    EMIB_connected_pairs: Dict[Tuple[int, int], Any] = {
        (i, j): e for (i, j), e in all_connected_pairs.items() if e.EMIBType != "interfaceC"
    }

    if verbose:
        print("DEBUG")
        print("DEBUG")
        print_emib_node_contents(
            all_connected_pairs,
            key_formatter=lambda k: f"({nodes[k[0]].name},{nodes[k[1]].name})",
        )
    # TODO: add English comment
    if W is None or H is None:
        total_area = sum(chiplet_w_orig_grid[i] * chiplet_h_orig_grid[i] for i in range(n))
        print(f"total_area: {total_area}")
        estimated_side = math.ceil(math.sqrt(total_area * 2))
        print(f"estimated_side: {estimated_side}")
        if W is None:
            W = estimated_side * 3
        if H is None:
            H = estimated_side * 3
        print(f"Estimated W: {W}, H: {H}")
    
    if verbose:
        print("DEBUG")
        print("DEBUG")
        print("DEBUG")
        for (i, j), e in all_connected_pairs.items():
            print(f"  ({i},{j}): [{e.node1}, {e.node2}, {e.wireCount}, {e.EMIBType}, {e.EMIB_length}, {e.EMIB_max_width}]")
    
    # TODO: add English comment
    model = gp.Model("ChipletPlacementGrid")
    
    # TODO: add English comment
    M = max(W, H) * 2 # TODO: add English comment

    # TODO: add English comment
    # TODO: add English comment
    r = {}
    for k in range(n):
        r[k] = model.addVar(name=f"r_{k}", vtype=GRB.BINARY)
    
    r_EMIB = {}
    for (i, j), emib_node in EMIB_connected_pairs.items():
        r_EMIB[(i, j)] = model.addVar(name=f"r_EMIB_{i}_{j}", vtype=GRB.BINARY)

    # TODO: add English comment
    w_var = {}
    h_var = {}
    for k in range(n):
        w_min = min(chiplet_w_orig_grid[k], chiplet_h_orig_grid[k])
        w_max = max(chiplet_w_orig_grid[k], chiplet_h_orig_grid[k])
        w_var[k] = model.addVar(name=f"w_var_{k}", lb=w_min, ub=w_max, vtype=GRB.CONTINUOUS)
        h_var[k] = model.addVar(name=f"h_var_{k}", lb=w_min, ub=w_max, vtype=GRB.CONTINUOUS)
    
     # TODO: add English comment
    EMIB_w_var = {}
    EMIB_h_var = {}
    for (i, j), emib_node in EMIB_connected_pairs.items():
        w_min = min(emib_node.width, emib_node.height)
        w_max = max(emib_node.width, emib_node.height)
        EMIB_w_var[(i, j)] = model.addVar(name=f"EMIB_w_var_{i}_{j}", lb=w_min, ub=w_max, vtype=GRB.CONTINUOUS)
        EMIB_h_var[(i, j)] = model.addVar(name=f"EMIB_h_var_{i}_{j}", lb=w_min, ub=w_max, vtype=GRB.CONTINUOUS)
    print(f"EMIB_w_var: {EMIB_w_var}")
    print(f"EMIB_h_var: {EMIB_h_var}")
    print(f"EMIB_connected_pairs: {EMIB_connected_pairs}")
    # TODO: add English comment
    # TODO: add English comment
    x_grid_var = {}
    y_grid_var = {}
    for k in range(n):
        x_grid_var[k] = model.addVar(
            name=f"x_grid_var_{k}",
            lb=0,
            ub=W,
            vtype=GRB.CONTINUOUS
        )
        y_grid_var[k] = model.addVar(
            name=f"y_grid_var_{k}",
            lb=0,
            ub=H,
            vtype=GRB.CONTINUOUS
        )

     # TODO: add English comment
    EMIB_x_grid_var = {}
    EMIB_y_grid_var = {}
    for (i, j), emib_node in EMIB_connected_pairs.items():
        EMIB_x_grid_var[(i, j)] = model.addVar(name=f"EMIB_x_grid_var_{i}_{j}", lb=0, ub=W, vtype=GRB.CONTINUOUS)
        EMIB_y_grid_var[(i, j)] = model.addVar(name=f"EMIB_y_grid_var_{i}_{j}", lb=0, ub=H, vtype=GRB.CONTINUOUS)

    # TODO: add English comment
    EMIB_cx_grid_var = {}
    EMIB_cy_grid_var = {}
    for (i, j), emib_node in EMIB_connected_pairs.items():
        EMIB_cx_grid_var[(i, j)] = model.addVar(name=f"EMIB_cx_grid_var_{i}_{j}", lb=0, ub=2 * W, vtype=GRB.CONTINUOUS)
        EMIB_cy_grid_var[(i, j)] = model.addVar(name=f"EMIB_cy_grid_var_{i}_{j}", lb=0, ub=2 * H, vtype=GRB.CONTINUOUS)

    # TODO: add English comment
    cx_grid_var = {}
    cy_grid_var = {}
    for k in range(n):
        cx_grid_var[k] = model.addVar(name=f"cx_grid_var_{k}", lb=0, ub=2 * W, vtype=GRB.CONTINUOUS)
        cy_grid_var[k] = model.addVar(name=f"cy_grid_var_{k}", lb=0, ub=2 * H, vtype=GRB.CONTINUOUS)
    
    # TODO: add English comment
    z1 = {}
    z2 = {}
    z1L = {}
    z1R = {}
    z2D = {}
    z2U = {}
    
    # TODO: add English comment
    for (i, j), edge in all_connected_pairs.items():
        if edge.EMIBType == "interfaceC":  # TODO: add English comment
            continue
        z1[(i, j)] = model.addVar(name=f"z1_{i}_{j}", vtype=GRB.BINARY)
        z2[(i, j)] = model.addVar(name=f"z2_{i}_{j}", vtype=GRB.BINARY)
        z1L[(i, j)] = model.addVar(name=f"z1L_{i}_{j}", vtype=GRB.BINARY)
        z1R[(i, j)] = model.addVar(name=f"z1R_{i}_{j}", vtype=GRB.BINARY)
        z2D[(i, j)] = model.addVar(name=f"z2D_{i}_{j}", vtype=GRB.BINARY)
        z2U[(i, j)] = model.addVar(name=f"z2U_{i}_{j}", vtype=GRB.BINARY)
    
    # TODO: add English comment
    cx_center = model.addVar(name=f"cx_center", lb=0, ub=W, vtype=GRB.CONTINUOUS)
    cy_center = model.addVar(name=f"cy_center", lb=0, ub=H, vtype=GRB.CONTINUOUS)
    # TODO: add English comment

    # TODO: add English comment
    for k in range(n):
        # TODO: add English comment
        model.addConstr(
            w_var[k] == chiplet_w_orig_grid[k] + r[k] * (chiplet_h_orig_grid[k] - chiplet_w_orig_grid[k]),
            name=f"width_rotation_{k}"
        )
        model.addConstr(
            h_var[k] == chiplet_h_orig_grid[k] + r[k] * (chiplet_w_orig_grid[k] - chiplet_h_orig_grid[k]),
            name=f"height_rotation_{k}"
        )
        # TODO: add English comment
        model.addConstr(x_grid_var[k] <= W - w_var[k], name=f"x_grid_var_ub_{k}")
        model.addConstr(y_grid_var[k] <= H - h_var[k], name=f"y_grid_var_ub_{k}")
    
    # TODO: add English comment
    for (i, j), emib_node in EMIB_connected_pairs.items():
        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        model.addConstr(
            EMIB_w_var[(i, j)] == emib_node.width * (1 - r_EMIB[(i, j)]) + emib_node.height * r_EMIB[(i, j)],
            name=f"EMIB_width_rotation_{i}_{j}"
        )
        model.addConstr(
            EMIB_h_var[(i, j)] == emib_node.height * (1 - r_EMIB[(i, j)]) + emib_node.width * r_EMIB[(i, j)],
            name=f"EMIB_height_rotation_{i}_{j}"
        )
        # TODO: add English comment
        model.addConstr(EMIB_x_grid_var[(i, j)] <= W - EMIB_w_var[(i, j)], name=f"EMIB_x_grid_var_ub_{i}_{j}")
        model.addConstr(EMIB_y_grid_var[(i, j)] <= H - EMIB_h_var[(i, j)], name=f"EMIB_y_grid_var_ub_{i}_{j}")

    # TODO: add English comment
    # TODO: add English comment
    for k in range(n):
        model.addConstr(cx_grid_var[k] == x_grid_var[k] + w_var[k] / 2, name=f"cx_def_{k}")
        model.addConstr(cy_grid_var[k] == y_grid_var[k] + h_var[k] / 2, name=f"cy_def_{k}")
    
    for (i, j), emib_node in EMIB_connected_pairs.items():
        model.addConstr(EMIB_cx_grid_var[(i, j)] == EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)] / 2, name=f"EMIB_cx_def_{i}_{j}")
        model.addConstr(EMIB_cy_grid_var[(i, j)] == EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)] / 2, name=f"EMIB_cy_def_{i}_{j}")

     # TODO: add English comment
    # TODO: add English comment
    for (i, j), emib_node in EMIB_connected_pairs.items():
        # TODO: add English comment
        model.addConstr(
            z1[(i, j)] + z2[(i, j)] == 1,
            name=f"must_adjacent_sb_{i}_{j}"
        )
        
        # TODO: add English comment
        model.addConstr(
            z1L[(i, j)] + z1R[(i, j)] == z1[(i, j)],
            name=f"horizontal_direction_sb_{i}_{j}"
        )
        
        # TODO: add English comment
        model.addConstr(
            z2D[(i, j)] + z2U[(i, j)] == z2[(i, j)],
            name=f"vertical_direction_sb_{i}_{j}"
        )
        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        model.addConstr(r_EMIB[(i, j)] == z2[(i, j)], name=f"EMIB_rotate_eq_z2_{i}_{j}")

        # TODO: add English comment
        # TODO: add English comment

        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        eps = 0.001
        model.addConstr(
            x_grid_var[j] - (x_grid_var[i] + w_var[i]) >= 0 - M * (1 - z1L[(i, j)]),
            name=f"horizontal_left_dist_lb_{i}_{j}"
        )
        model.addConstr(
            (x_grid_var[i] + w_var[i]) - EMIB_x_grid_var[(i, j)] >= emib_node.EMIB_bump_width - eps - M * (1 - z1L[(i, j)]),
            name=f"EMIB_left_overlap_{i}_{j}"
        )
        model.addConstr(
            (EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)]) - x_grid_var[j] >= emib_node.EMIB_bump_width - eps - M * (1 - z1L[(i, j)]),
            name=f"EMIB_right_overlap_{i}_{j}"
        )
     

        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        model.addConstr(
            x_grid_var[i] - (x_grid_var[j] + w_var[j]) >= 0 - M * (1 - z1R[(i, j)]),
            name=f"horizontal_right_dist_lb_{i}_{j}"
        )
        model.addConstr(
            (x_grid_var[j] + w_var[j]) - EMIB_x_grid_var[(i, j)] >= emib_node.EMIB_bump_width - eps - M * (1 - z1R[(i, j)]),
            name=f"EMIB_left_overlap_right_{i}_{j}"
        )
        model.addConstr(
            (EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)]) - x_grid_var[i] >= emib_node.EMIB_bump_width - eps - M * (1 - z1R[(i, j)]),
            name=f"EMIB_right_overlap_right_{i}_{j}"
        )
       

        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        model.addConstr(
            y_grid_var[j] - (y_grid_var[i] + h_var[i]) >= 0 - M * (1 - z2D[(i, j)]),
            name=f"vertical_down_dist_lb_{i}_{j}"
        )
        model.addConstr(
            (y_grid_var[i] + h_var[i]) - EMIB_y_grid_var[(i, j)] >= emib_node.EMIB_bump_width - eps - M * (1 - z2D[(i, j)]),
            name=f"EMIB_bottom_overlap_down_{i}_{j}"
        )
        model.addConstr(
            (EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)]) - y_grid_var[j] >= emib_node.EMIB_bump_width - eps - M * (1 - z2D[(i, j)]),
            name=f"EMIB_top_overlap_down_{i}_{j}"
        )
        

        # TODO: add English comment
        model.addConstr(
            y_grid_var[i] - (y_grid_var[j] + h_var[j]) >= 0 - M * (1 - z2U[(i, j)]),
            name=f"vertical_up_dist_lb_{i}_{j}"
        )
        model.addConstr(
            (y_grid_var[j] + h_var[j]) - EMIB_y_grid_var[(i, j)] >= emib_node.EMIB_bump_width - eps - M * (1 - z2U[(i, j)]),
            name=f"EMIB_bottom_overlap_up_{i}_{j}"
        )
        model.addConstr(
            (EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)]) - y_grid_var[i] >= emib_node.EMIB_bump_width - eps - M * (1 - z2U[(i, j)]),
            name=f"EMIB_top_overlap_up_{i}_{j}"
        )
        
        
        # TODO: add English comment
        # TODO: add English comment
        model.addConstr(
            (y_grid_var[i] + h_var[i]) >=  EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)] - M * (1 - z1[(i, j)]),
            name=f"shared_yi_ub1_{i}_{j}"
        )
        model.addConstr(
            y_grid_var[i] <= EMIB_y_grid_var[(i, j)] + M * (1 - z1[(i, j)]),
            name=f"shared_yi_ub2_{i}_{j}"
        )
        model.addConstr(
            (y_grid_var[j] + h_var[j]) >=  EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)] - M * (1 - z1[(i, j)]),
            name=f"shared_yj_ub1_{i}_{j}"
        )
        model.addConstr(
            y_grid_var[j] <= EMIB_y_grid_var[(i, j)] + M * (1 - z1[(i, j)]),
            name=f"shared_yj_ub2_{i}_{j}"
        )

        # TODO: add English comment
        model.addConstr(
            (x_grid_var[i] + w_var[i]) >= EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)] - M * (1 - z2[(i, j)]),
            name=f"shared_xi_ub1_{i}_{j}"
        )
        model.addConstr(
            x_grid_var[i] <= EMIB_x_grid_var[(i, j)] + M * (1 - z2[(i, j)]),
            name=f"shared_xi_ub2_{i}_{j}"
        )
        model.addConstr(
            (x_grid_var[j] + w_var[j]) >= EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)] - M * (1 - z2[(i, j)]),
            name=f"shared_xj_ub1_{i}_{j}"
        )
        model.addConstr(
            x_grid_var[j] <= EMIB_x_grid_var[(i, j)] + M * (1 - z2[(i, j)]),
            name=f"shared_xj_ub2_{i}_{j}"
        )
    
    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    p_left = {}
    p_right = {}
    p_down = {}
    p_up = {}
    
    all_pairs = []
    for i in range(n):
        for j in range(i + 1, n):
            all_pairs.append((i, j))
            p_left[(i, j)] = model.addVar(name=f"p_left_{i}_{j}", vtype=GRB.BINARY)
            p_right[(i, j)] = model.addVar(name=f"p_right_{i}_{j}", vtype=GRB.BINARY)
            p_down[(i, j)] = model.addVar(name=f"p_down_{i}_{j}", vtype=GRB.BINARY)
            p_up[(i, j)] = model.addVar(name=f"p_up_{i}_{j}", vtype=GRB.BINARY)

    # TODO: add English comment
    for i, j in all_pairs:
        # TODO: add English comment
        model.addConstr(
            p_left[(i, j)] + p_right[(i, j)] + p_down[(i, j)] + p_up[(i, j)] >= 1,
            name=f"non_overlap_any_{i}_{j}"
        )
        
        # TODO: add English comment
        # TODO: add English comment
        model.addConstr(
            x_grid_var[i] + w_var[i] - x_grid_var[j] <= M * (1 - p_left[(i, j)]),
            name=f"non_overlap_left_{i}_{j}"
        )
        # TODO: add English comment
        model.addConstr(
            x_grid_var[j] - (x_grid_var[i] + w_var[i]) <= M * p_left[(i, j)],
            name=f"non_overlap_left_rev_{i}_{j}"
        )
        
        # TODO: add English comment
        model.addConstr(
            x_grid_var[j] + w_var[j] - x_grid_var[i] <= M * (1 - p_right[(i, j)]),
            name=f"non_overlap_right_{i}_{j}"
        )
        model.addConstr(
            x_grid_var[i] - (x_grid_var[j] + w_var[j]) <= M * p_right[(i, j)],
            name=f"non_overlap_right_rev_{i}_{j}"
        )
        
        # TODO: add English comment
        model.addConstr(
            y_grid_var[i] + h_var[i] - y_grid_var[j] <= M * (1 - p_down[(i, j)]),
            name=f"non_overlap_down_{i}_{j}"
        )
        model.addConstr(
            y_grid_var[j] - (y_grid_var[i] + h_var[i]) <= M * p_down[(i, j)],
            name=f"non_overlap_down_rev_{i}_{j}"
        )
        
        # TODO: add English comment
        model.addConstr(
            y_grid_var[j] + h_var[j] - y_grid_var[i] <= M * (1 - p_up[(i, j)]),
            name=f"non_overlap_up_{i}_{j}"
        )
        model.addConstr(
            y_grid_var[i] - (y_grid_var[j] + h_var[j]) <= M * p_up[(i, j)],
            name=f"non_overlap_up_rev_{i}_{j}"
        )

    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    emib_list = list(EMIB_connected_pairs.items())
    emib_non_overlap_pairs = []  # TODO: add English comment
    for idx_a in range(len(emib_list)):
        (i, j), _ = emib_list[idx_a]
        chips_a = {i, j}  # TODO: add English comment
        for idx_b in range(idx_a + 1, len(emib_list)):
            (k, l), _ = emib_list[idx_b]
            chips_b = {k, l}
            if chips_a & chips_b:  # TODO: add English comment
                emib_non_overlap_pairs.append(((i, j), (k, l)))

    p_EMIB_left = {}
    p_EMIB_right = {}
    p_EMIB_down = {}
    p_EMIB_up = {}

    for (i, j), (k, l) in emib_non_overlap_pairs:
        key = ((i, j), (k, l))
        p_EMIB_left[key] = model.addVar(name=f"p_EMIB_left_{i}_{j}_{k}_{l}", vtype=GRB.BINARY)
        p_EMIB_right[key] = model.addVar(name=f"p_EMIB_right_{i}_{j}_{k}_{l}", vtype=GRB.BINARY)
        p_EMIB_down[key] = model.addVar(name=f"p_EMIB_down_{i}_{j}_{k}_{l}", vtype=GRB.BINARY)
        p_EMIB_up[key] = model.addVar(name=f"p_EMIB_up_{i}_{j}_{k}_{l}", vtype=GRB.BINARY)

        # TODO: add English comment
        model.addConstr(
            p_EMIB_left[key] + p_EMIB_right[key] + p_EMIB_down[key] + p_EMIB_up[key] >= 1,
            name=f"EMIB_non_overlap_any_{i}_{j}_{k}_{l}"
        )
        # TODO: add English comment
        model.addConstr(
            EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)] - EMIB_x_grid_var[(k, l)] <= M * (1 - p_EMIB_left[key]),
            name=f"EMIB_non_overlap_left_{i}_{j}_{k}_{l}"
        )
        model.addConstr(
            EMIB_x_grid_var[(k, l)] - (EMIB_x_grid_var[(i, j)] + EMIB_w_var[(i, j)]) <= M * p_EMIB_left[key],
            name=f"EMIB_non_overlap_left_rev_{i}_{j}_{k}_{l}"
        )
        # TODO: add English comment
        model.addConstr(
            EMIB_x_grid_var[(k, l)] + EMIB_w_var[(k, l)] - EMIB_x_grid_var[(i, j)] <= M * (1 - p_EMIB_right[key]),
            name=f"EMIB_non_overlap_right_{i}_{j}_{k}_{l}"
        )
        model.addConstr(
            EMIB_x_grid_var[(i, j)] - (EMIB_x_grid_var[(k, l)] + EMIB_w_var[(k, l)]) <= M * p_EMIB_right[key],
            name=f"EMIB_non_overlap_right_rev_{i}_{j}_{k}_{l}"
        )
        # TODO: add English comment
        model.addConstr(
            EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)] - EMIB_y_grid_var[(k, l)] <= M * (1 - p_EMIB_down[key]),
            name=f"EMIB_non_overlap_down_{i}_{j}_{k}_{l}"
        )
        model.addConstr(
            EMIB_y_grid_var[(k, l)] - (EMIB_y_grid_var[(i, j)] + EMIB_h_var[(i, j)]) <= M * p_EMIB_down[key],
            name=f"EMIB_non_overlap_down_rev_{i}_{j}_{k}_{l}"
        )
        # TODO: add English comment
        model.addConstr(
            EMIB_y_grid_var[(k, l)] + EMIB_h_var[(k, l)] - EMIB_y_grid_var[(i, j)] <= M * (1 - p_EMIB_up[key]),
            name=f"EMIB_non_overlap_up_{i}_{j}_{k}_{l}"
        )
        model.addConstr(
            EMIB_y_grid_var[(i, j)] - (EMIB_y_grid_var[(k, l)] + EMIB_h_var[(k, l)]) <= M * p_EMIB_up[key],
            name=f"EMIB_non_overlap_up_rev_{i}_{j}_{k}_{l}"
        )

    # if verbose and emib_non_overlap_pairs:
    print("DEBUG")
    #     for (i, j), (k, l) in emib_non_overlap_pairs:
    #         na, nb = nodes[i].name, nodes[j].name
    #         nc, nd = nodes[k].name, nodes[l].name
    #         print(f"  EMIB ({na}-{nb}) vs ({nc}-{nd})")

    
    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment

    # TODO: add English comment
    bbox_min_x = model.addVar(name="bbox_min_x", lb=0, ub=W, vtype=GRB.CONTINUOUS)
    bbox_max_x = model.addVar(name="bbox_max_x", lb=0, ub=W, vtype=GRB.CONTINUOUS)
    bbox_min_y = model.addVar(name="bbox_min_y", lb=0, ub=H, vtype=GRB.CONTINUOUS)
    bbox_max_y = model.addVar(name="bbox_max_y", lb=0, ub=H, vtype=GRB.CONTINUOUS)
    bbox_w = model.addVar(name="bbox_w", lb=0, ub=W, vtype=GRB.CONTINUOUS)
    bbox_h = model.addVar(name="bbox_h", lb=0, ub=H, vtype=GRB.CONTINUOUS)
    
    # TODO: add English comment
    for k in range(n):
        model.addConstr(bbox_min_x <= x_grid_var[k], name=f"bbox_min_x_{k}")
        model.addConstr(bbox_max_x >= x_grid_var[k] + w_var[k], name=f"bbox_max_x_{k}")
        model.addConstr(bbox_min_y <= y_grid_var[k], name=f"bbox_min_y_{k}")
        model.addConstr(bbox_max_y >= y_grid_var[k] + h_var[k], name=f"bbox_max_y_{k}")
    
    model.addConstr(bbox_w == bbox_max_x - bbox_min_x, name="bbox_w_def")
    model.addConstr(bbox_h == bbox_max_y - bbox_min_y, name="bbox_h_def")

    # TODO: add English comment
    model.addConstr(cx_center == (bbox_max_x + bbox_min_x) / 2, name=f"cx_center_def")
    model.addConstr(cy_center == (bbox_max_y + bbox_min_y) / 2, name=f"cy_center_def")
    
    # TODO: add English comment
    # if min_aspect_ratio is not None:
    #     # bbox_w / bbox_h >= min_aspect_ratio
    # TODO: add English comment
    #     model.addConstr(
    #         bbox_w >= min_aspect_ratio * bbox_h,
    #         name="aspect_ratio_min"
    #     )
    #     if verbose:
    print("DEBUG")
    
    # if max_aspect_ratio is not None:
    #     # bbox_w / bbox_h <= max_aspect_ratio
    # TODO: add English comment
    #     model.addConstr(
    #         bbox_w <= max_aspect_ratio * bbox_h,
    #         name="aspect_ratio_max"
    #     )
    #     if verbose:
    print("DEBUG")
    
    # TODO: add English comment
    # TODO: add English comment
    # aspect_ratio_penalty = None

    aspect_ratio_penalty = model.addVar(
        name="aspect_ratio_penalty",
        lb=0,
        ub=max(W, H),
        vtype=GRB.CONTINUOUS
    )
    # |bbox_w - bbox_h| <= aspect_ratio_diff
    model.addConstr(
        aspect_ratio_penalty >= bbox_w - bbox_h,
        name="aspect_ratio_diff_ge_w_minus_h"
    )
    model.addConstr(
        aspect_ratio_penalty >= bbox_h - bbox_w,
        name="aspect_ratio_diff_ge_h_minus_w"
    )

    
    # TODO: add English comment
    power_aware_enabled = False # TODO: add English comment
    power_aware_penalty = None
    if power_aware_enabled:
        power_aware_penalty = model.addVar(
            name="power_aware_penalty",
            lb=0,
            ub=GRB.INFINITY,
            vtype=GRB.CONTINUOUS
        )
        power_aware_expr = gp.LinExpr()

        # TODO: add English comment
        high_power_indices, density_threshold = select_high_power_indices_by_density(
            n, nodes, chiplet_w_orig_grid, chiplet_h_orig_grid, top_ratio=0.3
        )

        # TODO: add English comment
        # TODO: add English comment
        if len(high_power_indices) >= 2:
            high_power_pairs = [(i, j) for i in range(n) for j in range(i + 1, n) if i in high_power_indices and j in high_power_indices]
            print("DEBUG")
            for i, j in high_power_pairs:
                power_i = float(getattr(nodes[i], "power", 0.0) or 0.0)
                power_j = float(getattr(nodes[j], "power", 0.0) or 0.0)
                power_weight_ij = power_i * power_j
                if power_weight_ij == 0.0:
                    continue

                dx_grid_abs_ij = model.addVar(
                    name=f"dx_grid_abs_pair_{i}_{j}",
                    lb=0,
                    ub=W,
                    vtype=GRB.CONTINUOUS
                )
                dy_grid_abs_ij = model.addVar(
                    name=f"dy_grid_abs_pair_{i}_{j}",
                    lb=0,
                    ub=H,
                    vtype=GRB.CONTINUOUS
                )
                dx_grid_diff = model.addVar(
                    name=f"dx_grid_diff_{i}_{j}",
                    lb=-W,
                    ub=W,
                    vtype=GRB.CONTINUOUS
                )
                model.addConstr(
                    dx_grid_diff == cx_grid_var[i] - cx_grid_var[j],
                    name=f"dx_grid_diff_def_{i}_{j}"
                )
                add_absolute_value_constraint_big_m(
                    model=model,
                    abs_var=dx_grid_abs_ij,
                    orig_var=dx_grid_diff,
                    M=M,
                    constraint_prefix=f"dx_grid_abs_pair_{i}_{j}",
                )
                dy_grid_diff = model.addVar(
                    name=f"dy_grid_diff_{i}_{j}",
                    lb=-H,
                    ub=H,
                    vtype=GRB.CONTINUOUS
                )
                model.addConstr(
                    dy_grid_diff == cy_grid_var[i] - cy_grid_var[j],
                    name=f"dy_grid_diff_def_{i}_{j}"
                )
                add_absolute_value_constraint_big_m(
                    model=model,
                    abs_var=dy_grid_abs_ij,
                    orig_var=dy_grid_diff,
                    M=M,
                    constraint_prefix=f"dy_grid_abs_pair_{i}_{j}",
                )
                dist_curr_ij = model.addVar(
                    name=f"dist_curr_pair_{i}_{j}",
                    lb=0,
                    ub=W + H,
                    vtype=GRB.CONTINUOUS
                )
                model.addConstr(
                    dist_curr_ij == dx_grid_abs_ij + dy_grid_abs_ij,
                    name=f"dist_curr_pair_def_{i}_{j}"
                )
                power_aware_expr += power_weight_ij * dist_curr_ij
        else:
            print("DEBUG")

        # TODO: add English comment
        print("DEBUG")

        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        # TODO: add English comment
        if not high_power_indices:
            print("DEBUG")
        else:
            # TODO: add English comment
            high_power_count = 0
            for i in range(n):
                if i not in high_power_indices:
                    continue
                p_i = float(getattr(nodes[i], "power", 0.0) or 0.0)
                high_power_count += 1
                print(
                    f"[DEBUG] chiplet {i} in top 30% power density, add away-from-center constraint"
                )

                # TODO: add English comment
                dx_center_diff_i = model.addVar(
                    name=f"dx_center_diff_{i}",
                    lb=-W,
                    ub=W,
                    vtype=GRB.CONTINUOUS
                )
                model.addConstr(
                    dx_center_diff_i == cx_grid_var[i] - cx_center,
                    name=f"dx_center_diff_def_{i}"
                )

                # TODO: add English comment
                dx_center_abs_i = model.addVar(
                    name=f"dx_center_abs_{i}",
                    lb=0,
                    ub=W,
                    vtype=GRB.CONTINUOUS
                )
                add_absolute_value_constraint_big_m(
                    model=model,
                    abs_var=dx_center_abs_i,
                    orig_var=dx_center_diff_i,
                    M=M,
                    constraint_prefix=f"dx_center_abs_{i}",
                )

                # TODO: add English comment
                dy_center_diff_i = model.addVar(
                    name=f"dy_center_diff_{i}",
                    lb=-H,
                    ub=H,
                    vtype=GRB.CONTINUOUS
                )
                model.addConstr(
                    dy_center_diff_i == cy_grid_var[i] - cy_center,
                    name=f"dy_center_diff_def_{i}"
                )

                # TODO: add English comment
                dy_center_abs_i = model.addVar(
                    name=f"dy_center_abs_{i}",
                    lb=0,
                    ub=H,
                    vtype=GRB.CONTINUOUS
                )
                add_absolute_value_constraint_big_m(
                    model=model,
                    abs_var=dy_center_abs_i,
                    orig_var=dy_center_diff_i,
                    M=M,
                    constraint_prefix=f"dy_center_abs_{i}",
                )

                # TODO: add English comment
                dist_center_i = model.addVar(
                    name=f"dist_center_{i}",
                    lb=0,
                    ub=W+H,
                    vtype=GRB.CONTINUOUS
                )
                model.addConstr(
                    dist_center_i == dx_center_abs_i + dy_center_abs_i,
                    name=f"dist_center_def_{i}"
                )

                # TODO: add English comment
                power_aware_expr += p_i * p_i *  dist_center_i

        print("DEBUG")
        # TODO: add English comment
        model.addConstr(power_aware_penalty == power_aware_expr, name="power_aware_penalty_def")

    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    # TODO: add English comment
    wirelength = model.addVar(
        name="wirelength",
        lb=0,
        ub=1024 * 4.0 * (W + H) * max(1, len(all_connected_pairs)),
        vtype=GRB.CONTINUOUS,
    )
    wirelength_sum = gp.LinExpr()

    # TODO: add English comment
    for (i, j), edge in all_connected_pairs.items():
        if edge.EMIBType != "interfaceC":
            continue
        wire_count = edge.wireCount
        dx_abs = model.addVar(name=f"dx_abs_{i}_{j}", lb=0, vtype=GRB.CONTINUOUS)
        dy_abs = model.addVar(name=f"dy_abs_{i}_{j}", lb=0, vtype=GRB.CONTINUOUS)
        dx_diff = model.addVar(name=f"dx_diff_{i}_{j}", lb=-W, ub=W, vtype=GRB.CONTINUOUS)
        dy_diff = model.addVar(name=f"dy_diff_{i}_{j}", lb=-H, ub=H, vtype=GRB.CONTINUOUS)
        model.addConstr(dx_diff == cx_grid_var[i] - cx_grid_var[j], name=f"dx_diff_def_{i}_{j}")
        model.addConstr(dy_diff == cy_grid_var[i] - cy_grid_var[j], name=f"dy_diff_def_{i}_{j}")
        add_absolute_value_constraint_big_m(
            model=model, abs_var=dx_abs, orig_var=dx_diff, M=M,
            constraint_prefix=f"dx_abs_{i}_{j}",
        )
        add_absolute_value_constraint_big_m(
            model=model, abs_var=dy_abs, orig_var=dy_diff, M=M,
            constraint_prefix=f"dy_abs_{i}_{j}",
        )
        wirelength_sum += wire_count * (dx_abs + dy_abs)

    # TODO: add English comment
    # TODO: add English comment
    for (i, j), edge in EMIB_connected_pairs.items():
        wire_count = edge.wireCount
        dx_abs_i = model.addVar(name=f"dx_abs_i_{i}_{j}", lb=0, vtype=GRB.CONTINUOUS)
        dy_abs_i = model.addVar(name=f"dy_abs_i_{i}_{j}", lb=0, vtype=GRB.CONTINUOUS)
        dx_abs_j = model.addVar(name=f"dx_abs_j_{i}_{j}", lb=0, vtype=GRB.CONTINUOUS)
        dy_abs_j = model.addVar(name=f"dy_abs_j_{i}_{j}", lb=0, vtype=GRB.CONTINUOUS)
        dx_diff_i = model.addVar(name=f"dx_diff_i_{i}_{j}", lb=-W, ub=W, vtype=GRB.CONTINUOUS)
        dy_diff_i = model.addVar(name=f"dy_diff_i_{i}_{j}", lb=-H, ub=H, vtype=GRB.CONTINUOUS)
        dx_diff_j = model.addVar(name=f"dx_diff_j_{i}_{j}", lb=-W, ub=W, vtype=GRB.CONTINUOUS)
        dy_diff_j = model.addVar(name=f"dy_diff_j_{i}_{j}", lb=-H, ub=H, vtype=GRB.CONTINUOUS)
        model.addConstr(dx_diff_i == cx_grid_var[i] - EMIB_cx_grid_var[(i, j)], name=f"dx_diff_def_i_{i}_{j}")
        model.addConstr(dx_diff_j == cx_grid_var[j] - EMIB_cx_grid_var[(i, j)], name=f"dx_diff_def_j_{i}_{j}")
        model.addConstr(dy_diff_i == cy_grid_var[i] - EMIB_cy_grid_var[(i, j)], name=f"dy_diff_def_i_{i}_{j}")
        model.addConstr(dy_diff_j == cy_grid_var[j] - EMIB_cy_grid_var[(i, j)], name=f"dy_diff_def_j_{i}_{j}")
        add_absolute_value_constraint_big_m(
            model=model, abs_var=dx_abs_i, orig_var=dx_diff_i, M=M,
            constraint_prefix=f"dx_abs_i_{i}_{j}",
        )
        add_absolute_value_constraint_big_m(
            model=model, abs_var=dy_abs_i, orig_var=dy_diff_i, M=M,
            constraint_prefix=f"dy_abs_i_{i}_{j}",
        )
        add_absolute_value_constraint_big_m(
            model=model, abs_var=dx_abs_j, orig_var=dx_diff_j, M=M,
            constraint_prefix=f"dx_abs_j_{i}_{j}",
        )
        add_absolute_value_constraint_big_m(
            model=model, abs_var=dy_abs_j, orig_var=dy_diff_j, M=M,
            constraint_prefix=f"dy_abs_j_{i}_{j}",
        )
        wirelength_sum += wire_count * (dx_abs_i + dy_abs_i + dx_abs_j + dy_abs_j)

    model.addConstr(wirelength == wirelength_sum, name="wirelength_def")

    # TODO: add English comment
    ref_wirelength, ref_t, ref_power, ref_aspect = compute_normalization_factors(
        n=n,
        nodes=nodes,
        chiplet_w_orig_grid=chiplet_w_orig_grid,
        chiplet_h_orig_grid=chiplet_h_orig_grid,
        all_connected_pairs=all_connected_pairs,
        power_aware_enabled=power_aware_enabled,
    )

    # TODO: add English comment
    t = model.addVar(
        name="bbox_area_proxy_t",
        lb=0,
        ub=W+H,
        vtype=GRB.CONTINUOUS
    )
    # TODO: add English comment
    # TODO: add English comment
    # model.addConstr(t >= bbox_w, name="t_ge_width")
    # model.addConstr(t >= bbox_h, name="t_ge_height")
    
    # TODO: add English comment
    # TODO: add English comment
    alpha = 0.8
    model.addConstr(t >= alpha * (bbox_w + bbox_h), name="t_ge_scaled_mean")
    
    # TODO: add English comment
    # TODO: add English comment
    beta_wire = _get_beta_from_env("EMIB_BETA_WIRE", 5.0)
    beta_area = _get_beta_from_env("EMIB_BETA_AREA", 20.0)
    beta_aspect = _get_beta_from_env("EMIB_BETA_ASPECT", 0.1)
    beta_power = _get_beta_from_env("EMIB_BETA_POWER", 0.0)
    # aspect_ratio_penalty = 1
    # power_aware_penalty = 1
    # TODO: add English comment
    norm_wirelength = (1.0 / ref_wirelength) * wirelength
    norm_t = (1.0 / ref_t) * t
    norm_aspect = ((1.0 / ref_aspect) * aspect_ratio_penalty)
    norm_power = ((1.0 / ref_power) * power_aware_penalty) if power_aware_penalty is not None else 0

    # TODO: add English comment
    # TODO: add English comment
    objective = (
        beta_wire * norm_wirelength
        + beta_area * norm_t
        + beta_aspect * norm_aspect
        - beta_power * norm_power
    )
    model.setObjective(objective, GRB.MINIMIZE)
    if verbose:
        print(f"\n[Normalization Info]")
        print(f"  Ref Wirelength: {ref_wirelength:.2f}")
        print(f"  Ref Area Proxy (t): {ref_t:.2f}")
        print(f"  Ref Power Term: {ref_power:.2f}")
        print(f"  Ref Aspect: {ref_aspect:.2f}")
        obj_parts = [
            f"beta_wire({beta_wire})*wirelength/ref",
            f"beta_area({beta_area})*t/ref",
            f"beta_aspect({beta_aspect})*aspect_ratio/ref"
        ]
        if power_aware_penalty is not None:
            obj_parts.append(f"- beta_power({beta_power})*power/ref")
        print("DEBUG")

    
    return ILPModelContext(
        model=model,
        nodes=nodes,
        edges=edges,
        x_grid_var=x_grid_var,
        y_grid_var=y_grid_var,
        r=r,
        z1=z1,
        z2=z2,
        z1L=z1L,
        z1R=z1R,
        z2D=z2D,
        z2U=z2U,
        all_connected_pairs=all_connected_pairs,
        bbox_w=bbox_w,
        bbox_h=bbox_h,
        W=W,
        H=H,
        fixed_chiplet_idx=fixed_chiplet_idx,
        cx_grid_var=cx_grid_var,
        cy_grid_var=cy_grid_var,
        ref_wirelength=ref_wirelength,
        ref_t=ref_t,
        ref_power=ref_power,
        ref_aspect=ref_aspect,
        beta_wire=beta_wire,
        beta_area=beta_area,
        beta_aspect=beta_aspect,
        beta_power=beta_power,
        EMIB_connected_pairs=EMIB_connected_pairs,
        EMIB_x_grid_var=EMIB_x_grid_var,
        EMIB_y_grid_var=EMIB_y_grid_var,
        EMIB_w_var=EMIB_w_var,
        EMIB_h_var=EMIB_h_var,
        r_EMIB=r_EMIB,
    )


def main():
    """
    Main entry: solve once with continuous-coordinate ILP model and visualize.
    """
    from pathlib import Path

    # TODO: add English comment
    time_limit = 600  # TODO: add English comment
    min_shared_length = 0.1
    fixed_chiplet_idx = None  # TODO: add English comment
    
    # TODO: add English comment
    output_dir = Path(__file__).parent.parent / "output"
    output_dir.mkdir(exist_ok=True)
    
    # TODO: add English comment
    json_path = Path(__file__).parent.parent / "baseline" / "ICCAD23" / "test_input" / "2core.json"
    
    print("=" * 80)
    print("DEBUG")
    print("=" * 80)
    
    # TODO: add English comment
    print("DEBUG")
    if not json_path.exists():
        raise FileNotFoundError(f"JSON file does not exist: {json_path}")

    from tool import load_emib_placement_json
    nodes, edges, edge_map, name_to_idx = load_emib_placement_json(str(json_path))
    
    print("DEBUG")
    print("DEBUG")
    print("DEBUG")
    print("DEBUG")
    
    # TODO: add English comment
    print("DEBUG")
    ctx = build_placement_ilp_model(
        nodes=nodes,
        edges=edges,
        W=None,  # TODO: add English comment
        H=None,  # TODO: add English comment
        verbose=True,
        min_shared_length=min_shared_length,
        minimize_bbox_area=True,
        distance_weight=1.0,
        area_weight=0.1,
        fixed_chiplet_idx=fixed_chiplet_idx,
    )
    
    # TODO: add English comment
    lp_file = output_dir / "ilp_model_gurobi.lp"
    ctx.model.write(str(lp_file))
    print("DEBUG")
    
    # TODO: add English comment
    print("DEBUG")
    result = solve_placement_ilp_from_model(
        ctx,
        time_limit=time_limit,
        verbose=True,
    )
    
    # TODO: add English comment
    print("\n" + "=" * 80)
    print("DEBUG")
    print("=" * 80)
    print("DEBUG")
    print("DEBUG")
    print("DEBUG")
    print("DEBUG")
    
    print("DEBUG")
    for name, (x, y) in result.layout.items():
        rotated = result.rotations.get(name, False)
        rot_str = " (rotated)" if rotated else ""
        print(f"  {name}: ({x:.2f}, {y:.2f}){rot_str}")
    
    # TODO: add English comment
    if result.status == "Optimal":
        print("DEBUG")
        try:
            save_path = output_dir / "ilp_single_solution_gurobi.png"
            
            draw_edges = [(e["node1"], e["node2"], e["EMIBType"]) for e in edges]
            draw_chiplet_diagram(
                nodes=nodes,
                edges=draw_edges,
                layout=result.layout,  # TODO: add English comment
                save_path=str(save_path),
                rotations=result.rotations,
            )
            print("DEBUG")
        except Exception as e:
            print("DEBUG")
            import traceback
            traceback.print_exc()
    else:
        print("DEBUG")
    
    print("\n" + "=" * 80)
    print("DEBUG")
    print("=" * 80)


if __name__ == "__main__":
    main()

