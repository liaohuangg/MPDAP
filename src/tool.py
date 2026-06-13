"""
Utility functions for chiplet placement experiments.

Includes:
- Load chiplet info from JSON input;
- Build random connection graph;
- Draw block diagram (chiplets + phys points + connection arrows).
"""

from __future__ import annotations

import math
import random
from dataclasses import dataclass
from typing import Dict, List, Tuple, Optional

import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch, Rectangle

try:
    import pulp
except ImportError:
    pulp = None

try:
    import gurobipy as gp
except ImportError:
    gp = None

from input_process import build_chiplet_table, load_chiplets_json


def get_var_value(var):
    """
    Get variable value; supports PuLP and Gurobi variables.

    Parameters:
        var: PuLP or Gurobi variable, or None

    Returns:
        Variable value, or None if var is None
    """
    if var is None:
        return None
    
    # Gurobi variable
    if gp is not None and isinstance(var, gp.Var):
        try:
            return var.X
        except AttributeError:
            return None
    
    # PuLP variable
    if pulp is not None:
        try:
            if hasattr(var, 'value'):
                return pulp.value(var)
            elif callable(getattr(var, 'value', None)):
                return var.value()
        except (AttributeError, TypeError):
            return None
    
    return None


# ---------------------------------------------------------------------------
# Data structures and I/O
# ---------------------------------------------------------------------------
@dataclass
class EMIBNode:
    """
    EMIB silicon bridge chiplet info, from connection links.
    width = max_Reach_length, height = EMIB_length
    bump_width = "EMIB_bump_width" in JSON
    """
    node1: str
    node2: str
    wireCount: int
    EMIBType: str
    EMIB_length: float
    EMIB_bump_width: float
    EMIB_max_width: float
    width: float   # = 2*EMIB_bump_width
    height: float  # = EMIB_length

@dataclass
class ChipletNode:
    """A simple wrapper for a chiplet entry."""

    name: str
    dimensions: Dict
    phys: List[Dict]
    power: float

def build_bump_region_map(edges: List[dict], name_to_idx: Dict[str, int]) -> Dict[Tuple[int, int, int], dict]:
    """
    Build bump_region map.
    key: (i, j, k) -> i,j connection pair index (i<j), k chiplet index
    value: {"length": EMIB_length, "width": bump_width}
    """
    bump_region_map = {}
    
    for edge in edges:
        if edge.get("EMIBType") == "interfaceC":
            continue
            
        idx1 = name_to_idx[edge["node1"]]
        idx2 = name_to_idx[edge["node2"]]
        i, j = (idx1, idx2) if idx1 < idx2 else (idx2, idx1)
        
        emib_l = float(edge["EMIB_length"])
        emib_w = float(edge["EMIB_bump_width"])
        bump_region_map[(i, j, i)] = {"length": emib_l, "width": emib_w}
        bump_region_map[(i, j, j)] = {"length": emib_l, "width": emib_w}
        
    return bump_region_map

def _parse_emib_connection(conn: dict, ctx: str = "") -> List:
    """
    Parse single connection from JSON to [src, dst, wireCount, EMIBType, EMIB_length, EMIB_max_width, EMIB_bump_width].
    Only object format supported: {node1, node2, wireCount, EMIBType, EMIB_length, EMIB_max_width, EMIB_bump_width}.
    """
    if not isinstance(conn, dict):
        raise ValueError(f"Connection format error: must be object {{node1, node2, wireCount, ...}}. {ctx}conn: {conn}")
    src = conn.get("node1")
    dst = conn.get("node2")
    weight = conn.get("wireCount")
    emib_type = conn.get("EMIBType")
    emib_length = conn.get("EMIB_length")
    emib_max_width = conn.get("EMIB_max_width")
    emib_bump_width = conn.get("EMIB_bump_width")
    missing = []
    if src is None:
        missing.append("node1")
    if dst is None:
        missing.append("node2")
    if weight is None:
        missing.append("wireCount")
    if emib_type is None:
        missing.append("EMIBType")
    if emib_length is None:
        missing.append("EMIB_length")
    if emib_max_width is None:
        missing.append("EMIB_max_width")
    if emib_bump_width is None:
        missing.append("EMIB_bump_width")
    if missing:
        raise ValueError(f"Connection format error: missing fields {missing}. {ctx}conn: {conn}")
    try:
        emib_length_f = float(emib_length)
        emib_max_width_f = float(emib_max_width)
        bump_width_f = float(emib_bump_width)
        weight_int = int(weight)
    except (TypeError, ValueError) as e:
        raise ValueError(f"Connection format error: wireCount, EMIB_length, EMIB_max_width, EMIB_bump_width must be numeric. {ctx}conn: {conn}") from e
    return [str(src), str(dst), weight_int, str(emib_type), emib_length_f, emib_max_width_f, bump_width_f]


def _emib_type_to_conn_type(emib_type: str) -> int:
    """EMIBType -> conn_type: interfaceA/interfaceB -> 1 (silicon_bridge), else -> 0 (standard)"""
    return 1 if emib_type in ("interfaceA", "interfaceB") else 0


def load_emib_placement_json(
    json_path: str,
) -> Tuple[List["ChipletNode"], List[Tuple], Dict[Tuple[str, str], Dict], Dict[str, int]]:
    """
    Load EMIB placement input from JSON.
    Format: {"chiplets": [...], "connections": [...]}
    Each connection is an object: {node1, node2, wireCount, EMIBType, EMIB_length, EMIB_max_width, EMIB_bump_width}
    Raises on format error or duplicate connection pair.

    Returns:
        nodes: ChipletNode list
        edges: list of connection dicts (can be modified in place)
        edge_map: {(a,b): dict ref into edges}
        name_to_idx: {chiplet_name: index}
    """
    import json

    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    if "chiplets" not in data or not isinstance(data["chiplets"], list):
        raise ValueError(f"JSON format error: must contain 'chiplets' list. File: {json_path}")

    nodes: List[ChipletNode] = []
    for i, chiplet_info in enumerate(data["chiplets"]):
        if not isinstance(chiplet_info, dict):
            raise ValueError(f"Chiplet format error: each chiplet must be an object. Index {i}: {chiplet_info}")
        name = chiplet_info.get("name")
        width = chiplet_info.get("width")
        height = chiplet_info.get("height")
        power = chiplet_info.get("power")
        missing = []
        if name is None:
            missing.append("name")
        if width is None:
            missing.append("width")
        if height is None:
            missing.append("height")
        if power is None:
            missing.append("power")
        if missing:
            raise ValueError(f"Chiplet format error: missing fields {missing}. Index {i}: {chiplet_info}")
        try:
            w_f, h_f = float(width), float(height)
            p_f = float(power)
        except (TypeError, ValueError) as e:
            raise ValueError(f"Chiplet format error: width, height, power must be numeric. Index {i}: {chiplet_info}") from e
        nodes.append(
            ChipletNode(
                name=str(name),
                dimensions={"x": w_f, "y": h_f},
                phys=[],
                power=p_f,
            )
        )

    if "connections" not in data or not isinstance(data["connections"], list):
        raise ValueError(f"JSON format error: must contain 'connections' list. File: {json_path}")
    if len(data["connections"]) == 0:
        raise ValueError(f"JSON format error: connections must not be empty. File: {json_path}")

    chiplet_names = {n.name for n in nodes}
    connections: List[List] = []
    seen_pairs: set = set()
    for idx, conn in enumerate(data["connections"]):
        parsed = _parse_emib_connection(conn, ctx=f"connections[{idx}] ")
        a, b = (parsed[0], parsed[1]) if parsed[0] <= parsed[1] else (parsed[1], parsed[0])
        if a not in chiplet_names or b not in chiplet_names:
            raise ValueError(f"Connection error: node {a} or {b} not in chiplets. connections[{idx}]: {conn}")
        pair = (a, b)
        if pair in seen_pairs:
            raise ValueError(f"Connection error: duplicate pair ({a}, {b}). connections[{idx}]: {conn}")
        seen_pairs.add(pair)
        connections.append(parsed)

    name_to_idx = {node.name: k for k, node in enumerate(nodes)}
    chiplet_names_set = set(name_to_idx.keys())

    edge_map: Dict[Tuple[str, str], Dict] = {}
    for idx, row in enumerate(connections):
        if len(row) < 7:
            raise ValueError(f"Connection error: must have 7 columns. connections[{idx}]: {row}")
        s, t = row[0], row[1]
        emib_type = row[3]
        try:
            w = float(row[2])
            emib_len = float(row[4])
            max_width = float(row[5])
            bump_width = float(row[6])
        except (TypeError, ValueError) as e:
            raise ValueError(f"Connection error: wireCount, EMIB_length, EMIB_max_width, EMIB_bump_width must be numeric. connections[{idx}]: {row}") from e
        ct = _emib_type_to_conn_type(emib_type)
        a, b = (s, t) if s <= t else (t, s)
        if a not in chiplet_names_set or b not in chiplet_names_set:
            raise ValueError(f"Connection error: node {a} or {b} not in chiplets. connections[{idx}]: {row}")
        if (a, b) in edge_map:
            raise ValueError(f"Connection error: duplicate pair ({a}, {b}). connections[{idx}]: {row}")
        edge_map[(a, b)] = {
            "node1": a,
            "node2": b,
            "wireCount": w,
            "conn_type": ct,
            "EMIBType": emib_type,
            "EMIB_length": emib_len,
            "EMIB_width": 2 * bump_width + max_width,
            "EMIB_max_width": max_width,
            "EMIB_bump_width": bump_width,
        }

    # edges: list, each element is a dict (key-value pairs), can be modified in-place
    edges = [v for (a, b), v in edge_map.items()]

    return nodes, edges, edge_map, name_to_idx


def print_emib_node_contents(
    emib_node_dict: Dict[Tuple, "EMIBNode"],
    key_formatter: Optional[Callable[[Tuple], str]] = None,
    prefix: str = "  ",
) -> None:
    """
    Print full content of each connection in EMIBNode dict.
    emib_node_dict: key (i,j) or (node1, node2), value EMIBNode
    key_formatter: optional, format key to string, e.g. lambda k: f"({k[0]},{k[1]})"
    """
    for key, e in emib_node_dict.items():
        key_str = key_formatter(key) if key_formatter else str(key)
        print(f"{prefix}{key_str}: node1={e.node1}, node2={e.node2}, wireCount={e.wireCount}, "
              f"EMIBType={e.EMIBType}, EMIB_length={e.EMIB_length}, EMIB_max_width={e.EMIB_max_width}, "
              f"width={e.width}, height={e.height}, bump_width={e.EMIB_bump_width:.4f}")
# ---------------------------------------------------------------------------
# EMIB post-process: bridge placement and wire distance
# ---------------------------------------------------------------------------


def _get_gurobi_var_val(var, default: float = 0.0) -> float:
    """Get value from Gurobi variable; handle None or unavailable."""
    if var is None:
        return default
    try:
        return float(var.X)
    except (AttributeError, TypeError):
        return default


GRID_SIZE = 16  # 16x16 uniform grid per chiplet
EMIB_CENTER_STEP = 0.01  # Step for bridge center search


def generate_chiplet_wire_grid_16x16(
    chiplet_layout: Dict[str, Tuple[float, float]],
    chiplet_dims: Dict[str, Tuple[float, float]],
    node_name: str,
    display_size: Optional[int] = None,
) -> List[Tuple[float, float]]:
    """
    Divide chiplet into 16x16 grid, return grid point coordinates.
    display_size None or 16 -> 256 points; display_size=4 -> 4x4=16 points (center of each 4x4 block).
    These points are wire endpoints: grid -> bridge center -> grid.

    Returns
    -------
    List[Tuple[float, float]]
        Grid points [(x,y), ...], row-major order
    """
    x, y = chiplet_layout.get(node_name, (0, 0))
    w, h = chiplet_dims.get(node_name, (0, 0))
    size = display_size if display_size is not None and 1 <= display_size <= GRID_SIZE else GRID_SIZE
    if size == GRID_SIZE:
        pts = []
        for i in range(GRID_SIZE):
            for j in range(GRID_SIZE):
                px = x + i * w / max(1, GRID_SIZE - 1)
                py = y + j * h / max(1, GRID_SIZE - 1)
                pts.append((px, py))
        return pts
    block = GRID_SIZE // size
    pts = []
    for bi in range(size):
        for bj in range(size):
            ci = bi * block + (block - 1) / 2
            cj = bj * block + (block - 1) / 2
            px = x + ci * w / max(1, GRID_SIZE - 1)
            py = y + cj * h / max(1, GRID_SIZE - 1)
            pts.append((px, py))
    return pts


def _dist(a: Tuple[float, float], b: Tuple[float, float]) -> float:
    """Euclidean distance"""
    return math.sqrt((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2)


def compute_optimal_emib_center(
    src_grid_points: List[Tuple[float, float]],
    tgt_grid_points: List[Tuple[float, float]],
    shared_segment: Tuple[Tuple[float, float], Tuple[float, float]],
    step: float = EMIB_CENTER_STEP,
) -> Tuple[float, float]:
    """
    Search along shared edge for bridge center that minimizes total path length.
    Total path = sum(dist source grid -> center) + sum(dist target grid -> center).

    Parameters
    ----------
    src_grid_points : source chiplet 16x16 grid points
    tgt_grid_points : target chiplet 16x16 grid points
    shared_segment : ((x1,y1), (x2,y2)) shared edge segment

    Returns
    -------
    Tuple[float, float]
        Optimal bridge center
    """
    (xa, ya), (xb, yb) = shared_segment
    seg_len = math.sqrt((xb - xa) ** 2 + (yb - ya) ** 2)
    if seg_len <= 1e-9:
        return ((xa + xb) / 2, (ya + yb) / 2)
    best_center = None
    best_total = float("inf")
    n_steps = max(1, int(seg_len / step) + 1)
    for k in range(n_steps + 1):
        t = k / n_steps if n_steps > 0 else 0.5
        cx = xa + t * (xb - xa)
        cy = ya + t * (yb - ya)
        total = sum(_dist(p, (cx, cy)) for p in src_grid_points) + sum(
            _dist(p, (cx, cy)) for p in tgt_grid_points
        )
        if total < best_total:
            best_total = total
            best_center = (cx, cy)
    return best_center or ((xa + xb) / 2, (ya + yb) / 2)


def compute_emib_placement(
    chiplet_layout: Dict[str, Tuple[float, float]],
    chiplet_dims: Dict[str, Tuple[float, float]],
    emib_connections: List[dict],
    direction_vars: Dict[Tuple[int, int], Dict[str, float]],
    name_to_idx: Dict[str, int],
    idx_to_name: Dict[int, str],
) -> List[dict]:
    """
    Extract precise silicon bridge placement from ILP solution and compute optimal silicon bridge center (minimize total path length).

    Determine chiplet adjacency based on direction variables (z1L/z1R/z2D/z2U), match shared edge length,
    validate EMIB_length, and search along shared edge for center point that minimizes total wire path length.

    Parameters
    ----------
    chiplet_layout : Dict[str, Tuple[float, float]]
        Chiplet bottom-left coordinates name -> (x, y)
    chiplet_dims : Dict[str, Tuple[float, float]]
        Chiplet dimensions (after rotation) name -> (width, height)
    emib_connections : List[dict]
        EMIB connections only (EMIBType != interfaceC), each item {node1, node2, wireCount, EMIB_length}
    direction_vars : Dict[Tuple[int,int], Dict[str, float]]
        (i,j) -> {z1L, z1R, z2D, z2U, z1, z2} solved values (0 or 1)
    name_to_idx : Dict[str, int]
        Chiplet name to index mapping
    idx_to_name : Dict[int, str]
        Index to chiplet name mapping

    Returns
    -------
    List[dict]
        Each item: {
            "emib_id": str,
            "node1": str, "node2": str,
            "direction": "horizontal" | "vertical",
            "x_start": float, "y_start": float, "x_end": float, "y_end": float,
            "emib_physical_dist": float,  # EMIB_max_width: actual distance between chiplets (left-right=j_left-i_right; up-down=j_below-i_above)
            "shared_length": float,
            "emib_length_required": float,
            "emib_center": Tuple[float, float],  # optimal silicon bridge center point
            "ok": bool,
            "warning": str | None,
        }
    """
    results = []
    for conn in emib_connections:
        n1, n2 = conn["node1"], conn["node2"]
        emib_len = float(conn["EMIB_length"])
        wire_count = int(conn.get("wireCount", 0))
        i, j = name_to_idx.get(n1), name_to_idx.get(n2)
        if i is None or j is None:
            results.append({
                "emib_id": f"{n1}-{n2}",
                "node1": n1, "node2": n2,
                "direction": None, "x_start": 0, "y_start": 0, "x_end": 0, "y_end": 0,
                "emib_physical_dist": 0, "shared_length": 0, "emib_length_required": emib_len,
                "ok": False, "warning": f"Node {n1} or {n2} not in layout",
            })
            continue
        if i > j:
            i, j = j, i
            n1, n2 = n2, n1
        dv = direction_vars.get((i, j), {})
        z1L = dv.get("z1L", 0) > 0.5
        z1R = dv.get("z1R", 0) > 0.5
        z2D = dv.get("z2D", 0) > 0.5
        z2U = dv.get("z2U", 0) > 0.5
        z1 = dv.get("z1", 0) > 0.5
        z2 = dv.get("z2", 0) > 0.5

        xi, yi = chiplet_layout.get(n1, (0, 0))
        xj, yj = chiplet_layout.get(n2, (0, 0))
        wi, hi = chiplet_dims.get(n1, (0, 0))
        wj, hj = chiplet_dims.get(n2, (0, 0))

        emib_id = f"{n1}-{n2}"
        direction = None
        x_start, y_start, x_end, y_end = 0.0, 0.0, 0.0, 0.0
        emib_physical = 0.0
        shared_len = 0.0
        ok = True
        warning = None

        if z1:
            # Horizontal adjacency: shared edge in y direction, silicon bridge spans x direction gap
            direction = "horizontal"
            y_low = max(yi, yj)
            y_high = min(yi + hi, yj + hj)
            shared_len = max(0, y_high - y_low)
            if shared_len < emib_len - 1e-6:
                ok = False
                warning = f"Shared length {shared_len:.4f} < EMIB_length {emib_len:.4f}"
            if z1L:
                # Left-right adjacency: i on left, j on right. EMIB_max_width = j_left - i_right = xj - (xi+wi)
                x_start = xi + wi
                x_end = xj
                emib_physical = xj - (xi + wi)
                y_start, y_end = y_low, y_high
            elif z1R:
                # Left-right adjacency: i on right, j on left. EMIB_max_width = i_left - j_right = xi - (xj+wj)
                x_start = xj + wj
                x_end = xi
                emib_physical = xi - (xj + wj)
                y_start, y_end = y_low, y_high
        elif z2:
            # Vertical adjacency: shared edge in x direction, silicon bridge spans y direction gap
            direction = "vertical"
            x_low = max(xi, xj)
            x_high = min(xi + wi, xj + wj)
            shared_len = max(0, x_high - x_low)
            if shared_len < emib_len - 1e-6:
                ok = False
                warning = f"Shared length {shared_len:.4f} < EMIB_length {emib_len:.4f}"
            if z2D:
                # Up-down adjacency: i below, j above. EMIB_max_width = j_below - i_above = yj - (yi+hi)
                y_start = yi + hi
                y_end = yj
                emib_physical = yj - (yi + hi)
                x_start, x_end = x_low, x_high
            elif z2U:
                # Up-down adjacency: i above, j below. EMIB_max_width = i_below - j_above = yi - (yj+hj)
                y_start = yj + hj
                y_end = yi
                emib_physical = yi - (yj + hj)
                x_start, x_end = x_low, x_high
        else:
            ok = False
            warning = "Cannot determine adjacency direction (z1/z2 both 0)"

        # Generate 16x16 grid points and compute optimal silicon bridge center (minimize total path length)
        emib_center = None
        if direction and shared_len > 1e-9:
            src_grid = generate_chiplet_wire_grid_16x16(chiplet_layout, chiplet_dims, n1)
            tgt_grid = generate_chiplet_wire_grid_16x16(chiplet_layout, chiplet_dims, n2)
            y_lo, y_hi = min(y_start, y_end), max(y_start, y_end)
            x_lo, x_hi = min(x_start, x_end), max(x_start, x_end)
            if direction == "horizontal":
                x_mid = (x_start + x_end) / 2
                shared_seg = ((x_mid, y_lo), (x_mid, y_hi))
            else:
                y_mid = (y_start + y_end) / 2
                shared_seg = ((x_lo, y_mid), (x_hi, y_mid))
            emib_center = compute_optimal_emib_center(src_grid, tgt_grid, shared_seg, step=EMIB_CENTER_STEP)
        else:
            if direction == "horizontal":
                emib_center = ((x_start + x_end) / 2, (y_start + y_end) / 2)
            elif direction == "vertical":
                emib_center = ((x_start + x_end) / 2, (y_start + y_end) / 2)
            else:
                emib_center = (0.0, 0.0)

        results.append({
            "emib_id": emib_id,
            "node1": n1, "node2": n2,
            "direction": direction,
            "x_start": x_start, "y_start": y_start, "x_end": x_end, "y_end": y_end,
            "emib_physical_dist": emib_physical,
            "shared_length": shared_len,
            "emib_length_required": emib_len,
            "emib_center": emib_center,
            "ok": ok,
            "warning": warning,
        })
    return results


def layout_wire_endpoints(
    emib_placement: dict,
    chiplet_layout: Dict[str, Tuple[float, float]],
    chiplet_dims: Dict[str, Tuple[float, float]],
    wire_count: int,
    node1_name: str,
    node2_name: str,
) -> Tuple[List[Tuple[float, float]], List[Tuple[float, float]]]:
    """
    Distribute wireCount wire start and end points uniformly in a grid on source/target chiplet connection edge.

    Connection edge is the shared edge region between two chiplets, start and end points uniformly distributed along this region.
    If wireCount cannot evenly divide the grid, use the nearest distributable amount and keep it uniform.

    Parameters
    ----------
    emib_placement : dict
        Single silicon bridge info returned by compute_emib_placement
    chiplet_layout : Dict[str, Tuple[float, float]]
        Chiplet bottom-left coordinates
    chiplet_dims : Dict[str, Tuple[float, float]]
        Chiplet dimensions
    wire_count : int
        Number of wires
    node1_name : str
        Source chiplet name (convention: side close to (x_start,y_start))
    node2_name : str
        Target chiplet name

    Returns
    -------
    (start_points, end_points)
        start_points: wireCount start points on source chiplet [(x,y), ...]
        end_points: wireCount end points on target chiplet [(x,y), ...]
    """
    direction = emib_placement.get("direction")
    x_s, y_s = emib_placement["x_start"], emib_placement["y_start"]
    x_e, y_e = emib_placement["x_end"], emib_placement["y_end"]
    shared_len = emib_placement["shared_length"]

    wire_count = max(1, int(wire_count))
    n = wire_count

    start_pts = []
    end_pts = []

    if direction == "horizontal":
        # Shared edge along y direction, y coordinates of start and end points uniformly distributed
        if shared_len <= 1e-9:
            for _ in range(n):
                start_pts.append((x_s, y_s))
                end_pts.append((x_e, y_e))
        else:
            for k in range(n):
                t = (k + 1) / (n + 1) if n > 0 else 0.5
                y_pt = y_s + t * (y_e - y_s) if abs(y_e - y_s) > 1e-9 else y_s
                start_pts.append((x_s, y_pt))
                end_pts.append((x_e, y_pt))
    elif direction == "vertical":
        # Shared edge along x direction, x coordinates of start and end points uniformly distributed
        if shared_len <= 1e-9:
            for _ in range(n):
                start_pts.append((x_s, y_s))
                end_pts.append((x_e, y_e))
        else:
            for k in range(n):
                t = (k + 1) / (n + 1) if n > 0 else 0.5
                x_pt = x_s + t * (x_e - x_s) if abs(x_e - x_s) > 1e-9 else x_s
                start_pts.append((x_pt, y_s))
                end_pts.append((x_pt, y_e))
    else:
        for _ in range(n):
            start_pts.append((x_s, y_s))
            end_pts.append((x_e, y_e))
    return start_pts, end_pts


def compute_wire_distances(
    start_points: List[Tuple[float, float]],
    end_points: List[Tuple[float, float]],
    emib_placement: dict,
) -> List[dict]:
    """
    Compute segment distance and total path distance for each wire.

    (1) Straight line distance from start point to silicon bridge entrance
    (2) Straight line distance from silicon bridge exit to end point
    (3) Silicon bridge's own physical distance (distance between chiplet edges)
    (4) Total path distance = (1) + (2) + (3)

    Parameters
    ----------
    start_points : List[Tuple[float, float]]
        Start points of each wire on source chiplet
    end_points : List[Tuple[float, float]]
        End points of each wire on target chiplet
    emib_placement : dict
        Single silicon bridge info returned by compute_emib_placement

    Returns
    -------
    List[dict]
        Each wire: {
            "wire_id": int,
            "start": (x,y), "end": (x,y),
            "dist_start_to_emib": float,
            "dist_emib_to_end": float,
            "emib_physical_dist": float,
            "total_dist": float,
        }
    """
    emib_phys = emib_placement["emib_physical_dist"]

    def _dist(a: Tuple[float, float], b: Tuple[float, float]) -> float:
        return math.sqrt((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2)

    results = []
    n = min(len(start_points), len(end_points))
    # When start and end points are on connection edge: start point = silicon bridge entrance, end point = silicon bridge exit, therefore dist_start_to_emib=0, dist_emib_to_end=0
    # Total path distance = straight line distance(start, end), approximately equal to emib_physical_dist (when start and end points have same y or x)
    for i in range(n):
        ps, pe = start_points[i], end_points[i]
        total = _dist(ps, pe)
        results.append({
            "wire_id": i,
            "start": ps, "end": pe,
            "dist_start_to_emib": 0.0,
            "dist_emib_to_end": 0.0,
            "emib_physical_dist": emib_phys,
            "total_dist": total,
        })
    return results


def run_emib_post_process(
    ctx,
    result,
    nodes: List,
    edge_map: Dict,
    name_to_idx: Dict[str, int],
) -> dict:
    """
    Complete post-processing pipeline integrating silicon bridge localization, wire point layout, and distance computation.

    Extract variable values from ILP solution (ctx + result), call three core functions,
    output silicon bridge localization results and distance data for each wire.

    Parameters
    ----------
    ctx : ILPModelContext
        Gurobi ILP model context
    result : ILPPlacementResult
        Solution result
    nodes : List[ChipletNode]
        List of chiplets
    edge_map : Dict[Tuple[str,str], dict]
        (node1, node2) -> {node1, node2, wireCount, EMIB_length, EMIBType, ...}
    name_to_idx : Dict[str, int]
        Chiplet name to index mapping

    Returns
    -------
    dict
        {
            "emib_placements": List[dict],
            "wire_distances": Dict[str, List[dict]],  # emib_id -> distance data for each wire
        }
    """
    idx_to_name = {v: k for k, v in name_to_idx.items()}
    layout = result.layout if hasattr(result, "layout") else {}
    rotations = result.rotations if hasattr(result, "rotations") else {}

    chiplet_dims = {}
    for node in nodes:
        w0 = float(node.dimensions.get("x", 0) or 0)
        h0 = float(node.dimensions.get("y", 0) or 0)
        rot = rotations.get(node.name, False)
        chiplet_dims[node.name] = (h0, w0) if rot else (w0, h0)

    direction_vars = {}
    all_connected = getattr(ctx, "all_connected_pairs", {}) or {}
    for (i, j), edge in all_connected.items():
        if edge.get("EMIBType") == "interfaceC":
            continue
        z1 = getattr(ctx, "z1", None)
        z1L = getattr(ctx, "z1L", None)
        z1R = getattr(ctx, "z1R", None)
        z2 = getattr(ctx, "z2", None)
        z2D = getattr(ctx, "z2D", None)
        z2U = getattr(ctx, "z2U", None)
        dv = {}
        if z1 and (i, j) in z1:
            dv["z1"] = _get_gurobi_var_val(z1[(i, j)])
        if z2 and (i, j) in z2:
            dv["z2"] = _get_gurobi_var_val(z2[(i, j)])
        if z1L and (i, j) in z1L:
            dv["z1L"] = _get_gurobi_var_val(z1L[(i, j)])
        if z1R and (i, j) in z1R:
            dv["z1R"] = _get_gurobi_var_val(z1R[(i, j)])
        if z2D and (i, j) in z2D:
            dv["z2D"] = _get_gurobi_var_val(z2D[(i, j)])
        if z2U and (i, j) in z2U:
            dv["z2U"] = _get_gurobi_var_val(z2U[(i, j)])
        direction_vars[(i, j)] = dv

    emib_connections = []
    for (a, b), v in edge_map.items():
        if v.get("EMIBType") == "interfaceC":
            continue
        emib_connections.append({
            "node1": a, "node2": b,
            "wireCount": v.get("wireCount", 0),
            "EMIB_length": v.get("EMIB_length", 0),
        })

    emib_placements = compute_emib_placement(
        chiplet_layout=layout,
        chiplet_dims=chiplet_dims,
        emib_connections=emib_connections,
        direction_vars=direction_vars,
        name_to_idx=name_to_idx,
        idx_to_name=idx_to_name,
    )

    wire_distances = {}
    for emp, conn in zip(emib_placements, emib_connections):
        emib_id = emp["emib_id"]
        wc = int(conn.get("wireCount", 0))
        start_pts, end_pts = layout_wire_endpoints(
            emib_placement=emp,
            chiplet_layout=layout,
            chiplet_dims=chiplet_dims,
            wire_count=wc,
            node1_name=conn["node1"],
            node2_name=conn["node2"],
        )
        wire_distances[emib_id] = compute_wire_distances(
            start_points=start_pts,
            end_points=end_pts,
            emib_placement=emp,
        )
    return {
        "emib_placements": emib_placements,
        "wire_distances": wire_distances,
    }


def compute_emib_bottom_left(
    emib_center: Tuple[float, float],
    direction: str,
    emib_bump_width: float,
    emib_max_width: float,
    emib_length: float,
) -> Tuple[float, float]:
    """
    Compute silicon bridge bottom-left (x, y) coordinates based on center point, placement orientation, and fixed parameters.

    Horizontal placement (chiplets side-by-side, not rotated):
        x = center_x - EMIB_bump_width - EMIB_max_width/2
        y = center_y - EMIB_length/2

    Vertical placement (chiplets stacked, rotated 90°):
        x = center_x - EMIB_length/2
        y = center_y - EMIB_bump_width - EMIB_max_width/2

    Parameters
    ----------
    emib_center : (cx, cy)
        Silicon bridge center point coordinates
    direction : "horizontal" | "vertical"
        Silicon bridge placement orientation
    emib_bump_width, emib_length : float
        Silicon bridge fixed design parameters
    emib_max_width : float
        Actual distance between chiplets (computed dynamically, from emib_physical_dist)

    Returns
    -------
    (x, y) Silicon bridge bottom-left coordinates
    """
    cx, cy = emib_center
    if direction == "horizontal":
        # Silicon bridge horizontal placement: bottom-left x = center_x - bump_width - max_width/2
        x = cx - emib_bump_width - emib_max_width / 2
        # Bottom-left y = center_y - length/2
        y = cy - emib_length / 2
    else:
        # Silicon bridge vertical placement (rotated): bottom-left x = center_x - length/2
        x = cx - emib_length / 2
        # Bottom-left y = center_y - bump_width - max_width/2
        y = cy - emib_bump_width - emib_max_width / 2
    return (x, y)

def generate_placement_json_with_EMIB(
    result,
    post: dict,
    nodes: list,
    edge_map: dict,
    output_path: str,
    emib_bump_width_override: Optional[float] = None,
    emib_length_override: Optional[float] = None,
    ctx=None,
) -> dict:
    """
    Extract silicon bridge coordinates, dimensions and rotation from ILP solution and generate placement JSON.

    x-position, y-position, EMIB_length, EMIB_width, EMIB-rotation must be read from ILP variables in ctx
    (EMIB_x_grid_var, EMIB_y_grid_var, EMIB_w_var, EMIB_h_var, r_EMIB);
    if ctx has no EMIB variables, fall back to result.emib_placements.

    Parameters
    ----------
    result : ILPPlacementResult
        Solution result (contains layout, rotations, bounding_box)
    post : dict | None
        Return value of run_emib_post_process; can be None
    nodes : list
        List of chiplets
    edge_map : dict
        (node1, node2) -> edge info (contains EMIB_bump_width, EMIB_length, etc.)
    output_path : str
        Output JSON file path
    emib_bump_width_override, emib_length_override : float | None
        Optional, override fixed design parameters in edge
    ctx : ILPModelContext | None
        If contains EMIB_x_grid_var etc., read silicon bridge position and dimensions directly from ILP solution

    Returns
    -------
    dict
        Generated placement data structure
    """
    import json
    from pathlib import Path

    def _r3(v):
        return round(float(v or 0), 3)

    layout = result.layout if hasattr(result, "layout") else {}
    rotations = result.rotations if hasattr(result, "rotations") else {}
    bbox = getattr(result, "bounding_box", (0, 0))
    bbox_w, bbox_h = float(bbox[0]) if bbox else 0, float(bbox[1]) if bbox else 0

    chiplet_dims = {}
    min_w, min_h = float("inf"), float("inf")
    for node in nodes:
        w0 = float(node.dimensions.get("x", 0) or 0)
        h0 = float(node.dimensions.get("y", 0) or 0)
        min_w, min_h = min(min_w, w0), min(min_h, h0)
        rot = rotations.get(node.name, False)
        chiplet_dims[node.name] = (h0, w0) if rot else (w0, h0)

    chiplets_list = []
    for node in nodes:
        x, y = layout.get(node.name, (0, 0))
        w, h = chiplet_dims[node.name]
        rot = 1 if rotations.get(node.name, False) else 0
        power = float(getattr(node, "power", 0) or 0)
        chiplets_list.append({
            "name": node.name,
            "x-position": _r3(x),
            "y-position": _r3(y),
            "width": _r3(w),
            "height": _r3(h),
            "rotation": rot,
            "power": _r3(power),
        })

    connections_list = []
    emib_connected = getattr(ctx, "EMIB_connected_pairs", None) if ctx else None
    emib_has_vars = emib_connected and getattr(ctx, "EMIB_x_grid_var", None)
    if emib_has_vars:
        # Must read directly from ILP solved variables: EMIB_x_grid_var, EMIB_y_grid_var, EMIB_w_var, EMIB_h_var, r_EMIB
        for (i, j), emib_node in emib_connected.items():
            ex = float(ctx.EMIB_x_grid_var[(i, j)].X) if (i, j) in ctx.EMIB_x_grid_var else 0.0
            ey = float(ctx.EMIB_y_grid_var[(i, j)].X) if (i, j) in ctx.EMIB_y_grid_var else 0.0
            ew = float(ctx.EMIB_w_var[(i, j)].X) if (i, j) in ctx.EMIB_w_var else 0.0
            eh = float(ctx.EMIB_h_var[(i, j)].X) if (i, j) in ctx.EMIB_h_var else 0.0
            er = bool(ctx.r_EMIB[(i, j)].X > 0.5) if (i, j) in ctx.r_EMIB else False
            na = nodes[i].name if i < len(nodes) else str(i)
            nb = nodes[j].name if j < len(nodes) else str(j)
            a, b = (na, nb) if na <= nb else (nb, na)
            edge = edge_map.get((a, b), {})
            emib_bump_width = emib_bump_width_override if emib_bump_width_override is not None else float(edge.get("EMIB_bump_width", 0) or getattr(emib_node, "EMIB_bump_width", 0) or 0)
            emib_max_width = float(edge.get("EMIB_max_width", getattr(emib_node, "EMIB_max_width", 0)) or 0)
            connections_list.append({
                "node1": na, "node2": nb,
                "EMIBType": edge.get("EMIBType", getattr(emib_node, "EMIBType", "interfaceB")),
                "EMIB_length": _r3(eh),
                "EMIB_max_width": _r3(emib_max_width),
                "EMIB_width": _r3(ew),
                "EMIB_bump_width": _r3(emib_bump_width),
                "EMIB-x-position": _r3(ex),
                "EMIB-y-position": _r3(ey),
                "EMIB-rotation": 1 if er else 0,
            })
    else:
        print("result.emib_placements is None")
        result_emib = getattr(result, "emib_placements", None) if result else None
        if result_emib:
            for emp in result_emib:
                na, nb = emp.get("node1"), emp.get("node2")
                a, b = (na, nb) if na <= nb else (nb, na)
                edge = edge_map.get((a, b), {})
                emib_bump_width = emib_bump_width_override if emib_bump_width_override is not None else float(edge.get("EMIB_bump_width", 0) or 0)
                emib_max_width = float(edge.get("EMIB_max_width", 0) or 0)
                connections_list.append({
                    "node1": na, "node2": nb,
                    "EMIBType": edge.get("EMIBType", "interfaceB"),
                    "EMIB_length": _r3(emp.get("EMIB_length", 0)),
                    "EMIB_max_width": _r3(emib_max_width),
                    "EMIB_width": _r3(emp.get("EMIB_width", 0)),
                    "EMIB_bump_width": _r3(emib_bump_width),
                    "EMIB-x-position": _r3(emp.get("EMIB-x-position", 0)),
                    "EMIB-y-position": _r3(emp.get("EMIB-y-position", 0)),
                    "EMIB-rotation": emp.get("EMIB-rotation", 0),
                })

    wirelength = 0.0
    for (a, b), edge in edge_map.items():
        n1, n2 = edge.get("node1", a), edge.get("node2", b)
        x1, y1 = layout.get(n1, (0, 0))
        x2, y2 = layout.get(n2, (0, 0))
        w1, h1 = chiplet_dims.get(n1, (0, 0))
        w2, h2 = chiplet_dims.get(n2, (0, 0))
        cx1, cy1 = x1 + w1 / 2, y1 + h1 / 2
        cx2, cy2 = x2 + w2 / 2, y2 + h2 / 2
        wirelength += float(edge.get("wireCount", 1)) * (abs(cx1 - cx2) + abs(cy1 - cy2))

    area = bbox_w * bbox_h if bbox_w and bbox_h else 0
    aspect_ratio = min(bbox_w, bbox_h) / max(bbox_w, bbox_h, 1e-9)

    placement_data = {
        "chiplets": chiplets_list,
        "connections": connections_list,
        "wirelength": _r3(wirelength),
        "area": _r3(area),
        "aspect_ratio": _r3(aspect_ratio),
    }

    out = Path(output_path)
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, "w", encoding="utf-8") as f:
        json.dump(placement_data, f, indent=2, ensure_ascii=False)
    return placement_data


def generate_placement_json(
    result,
    post: dict,
    nodes: list,
    edge_map: dict,
    output_path: str,
    emib_bump_width_override: Optional[float] = None,
    emib_length_override: Optional[float] = None,
) -> dict:
    """
    Extract layout data from ILP solution, compute EMIB_max_width dynamically, then compute silicon bridge bottom-left coordinates, and generate placement JSON.

    Pipeline: EMIB_max_width computed dynamically (actual distance between chiplets) → determine silicon bridge orientation → compute bottom-left coordinates.
    Output values with 3 decimal places.

    Parameters
    ----------
    result : ILPPlacementResult
        Solution result (contains layout, rotations, bounding_box)
    post : dict
        Return value of run_emib_post_process (contains emib_placements, where emib_physical_dist is EMIB_max_width)
    nodes : list
        List of chiplets
    edge_map : dict
        (node1, node2) -> edge info (contains EMIB_bump_width, EMIB_length, etc.)
    output_path : str
        Output JSON file path
    emib_bump_width_override, emib_length_override : float | None
        Optional, override fixed design parameters in edge

    Returns
    -------
    dict
        Generated placement data structure
    """
    import json
    from pathlib import Path

    def _r3(v):
        return round(float(v or 0), 3)

    layout = result.layout if hasattr(result, "layout") else {}
    rotations = result.rotations if hasattr(result, "rotations") else {}
    bbox = getattr(result, "bounding_box", (0, 0))
    bbox_w, bbox_h = float(bbox[0]) if bbox else 0, float(bbox[1]) if bbox else 0

    chiplet_dims = {}
    min_w, min_h = float("inf"), float("inf")
    for node in nodes:
        w0 = float(node.dimensions.get("x", 0) or 0)
        h0 = float(node.dimensions.get("y", 0) or 0)
        min_w, min_h = min(min_w, w0), min(min_h, h0)
        rot = rotations.get(node.name, False)
        chiplet_dims[node.name] = (h0, w0) if rot else (w0, h0)

    chiplets_list = []
    for node in nodes:
        x, y = layout.get(node.name, (0, 0))
        w, h = chiplet_dims[node.name]
        rot = 1 if rotations.get(node.name, False) else 0
        power = float(getattr(node, "power", 0) or 0)
        chiplets_list.append({
            "name": node.name,
            "x-position": _r3(x),
            "y-position": _r3(y),
            "width": _r3(w),
            "height": _r3(h),
            "rotation": rot,
            "power": _r3(power),
        })

    connections_list = []
    for emp in post.get("emib_placements", []):
        n1, n2 = emp["node1"], emp["node2"]
        a, b = (n1, n2) if n1 <= n2 else (n2, n1)
        edge = edge_map.get((a, b), {})

        # Fixed design parameters (configurable override)
        emib_bump_width = emib_bump_width_override if emib_bump_width_override is not None else float(edge.get("EMIB_bump_width", 0) or 0)
        emib_length = emib_length_override if emib_length_override is not None else float(edge.get("EMIB_length", 0) or 0)

        # Step 1: Compute EMIB_max_width dynamically (actual distance between chiplets, not the difference of bottom-left coordinates)
        # From compute_emib_placement: left-right adjacency = j_left-i_right or i_left-j_right; up-down adjacency = j_below-i_above or i_below-j_above
        emib_max_width = float(emp.get("emib_physical_dist", 0) or 0)
        if emib_max_width < 0:
            emib_max_width = 0.0

        emib_center = emp.get("emib_center", (0, 0))
        direction = emp.get("direction", "horizontal")

        # Step 2: Determine silicon bridge orientation (direction already determined by compute_emib_placement) → compute bottom-left coordinates
        x_bl, y_bl = compute_emib_bottom_left(
            emib_center=emib_center,
            direction=direction,
            emib_bump_width=emib_bump_width,
            emib_max_width=emib_max_width,
            emib_length=emib_length,
        )

        emib_rotation = 0 if direction == "horizontal" else 1
        emib_width = emib_max_width + 2 * emib_bump_width
        connections_list.append({
            "node1": n1,
            "node2": n2,
            "EMIBType": edge.get("EMIBType", "interfaceB"),
            "EMIB_length": _r3(emib_length),
            "EMIB_max_width": _r3(emib_max_width),
            "EMIB_width": _r3(emib_width),
            "EMIB_bump_width": _r3(emib_bump_width),
            "EMIB-x-position": _r3(x_bl),
            "EMIB-y-position": _r3(y_bl),
            "EMIB-rotation": emib_rotation,
        })

    wirelength = 0.0
    for (a, b), edge in edge_map.items():
        n1, n2 = edge.get("node1", a), edge.get("node2", b)
        x1, y1 = layout.get(n1, (0, 0))
        x2, y2 = layout.get(n2, (0, 0))
        w1, h1 = chiplet_dims.get(n1, (0, 0))
        w2, h2 = chiplet_dims.get(n2, (0, 0))
        cx1, cy1 = x1 + w1 / 2, y1 + h1 / 2
        cx2, cy2 = x2 + w2 / 2, y2 + h2 / 2
        wirelength += float(edge.get("wireCount", 1)) * (abs(cx1 - cx2) + abs(cy1 - cy2))

    area = bbox_w * bbox_h if bbox_w and bbox_h else 0
    aspect_ratio = min(bbox_w, bbox_h) / max(bbox_w, bbox_h, 1e-9)

    placement_data = {
        "chiplets": chiplets_list,
        "connections": connections_list,
        "wirelength": _r3(wirelength),
        "area": _r3(area),
        "aspect_ratio": _r3(aspect_ratio),
    }

    out = Path(output_path)
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, "w", encoding="utf-8") as f:
        json.dump(placement_data, f, indent=2, ensure_ascii=False)
    return placement_data


# ---------------------------------------------------------------------------
# EMIB layout visualization (green bridges, blue interconnects, no fixed chiplets)
# ---------------------------------------------------------------------------


def build_emib_placements_from_ctx(ctx, nodes: List, edge_map: Dict) -> List[dict]:
    """
    Extract silicon bridge positions from ILP ctx, construct same structure as post["emib_placements"], for visualization.
    Center point computed directly from bottom-left coordinates: center = (x_bl + w/2, y_bl + h/2)
    """
    emib_placements = []
    emib_connected = getattr(ctx, "EMIB_connected_pairs", None)
    if not emib_connected or not getattr(ctx, "EMIB_x_grid_var", None):
        return emib_placements
    for (i, j), emib_node in emib_connected.items():
        ex = float(ctx.EMIB_x_grid_var[(i, j)].X) if (i, j) in ctx.EMIB_x_grid_var else 0.0
        ey = float(ctx.EMIB_y_grid_var[(i, j)].X) if (i, j) in ctx.EMIB_y_grid_var else 0.0
        ew = float(ctx.EMIB_w_var[(i, j)].X) if (i, j) in ctx.EMIB_w_var else (getattr(emib_node, "width", 0) or 0)
        eh = float(ctx.EMIB_h_var[(i, j)].X) if (i, j) in ctx.EMIB_h_var else (getattr(emib_node, "height", 0) or 0)
        na = nodes[i].name if i < len(nodes) else str(i)
        nb = nodes[j].name if j < len(nodes) else str(j)
        er = bool(ctx.r_EMIB[(i, j)].X > 0.5) if (i, j) in ctx.r_EMIB else False
        a, b = (na, nb) if na <= nb else (nb, na)
        edge = edge_map.get((a, b), {})
        bump = float(edge.get("EMIB_bump_width", 0) or getattr(emib_node, "EMIB_bump_width", 0) or 0)
        emib_max_width = max(0.0, (ew if not er else eh) - 2 * bump)
        emib_len = float(edge.get("EMIB_length", 0) or getattr(emib_node, "EMIB_length", 0) or eh)
        cx, cy = ex + ew / 2, ey + eh / 2
        direction = "vertical" if er else "horizontal"
        # Horizontal: shared edge along y, shared_len=eh; vertical: shared edge along x, shared_len=ew
        shared_len = eh if not er else ew
        emib_placements.append({
            "emib_id": f"{na}-{nb}",
            "node1": na, "node2": nb,
            "direction": direction,
            "x_start": ex, "y_start": ey, "x_end": ex + ew, "y_end": ey + eh,
            "emib_physical_dist": emib_max_width,
            "shared_length": shared_len,
            "emib_center": (cx, cy),
            "ok": True, "warning": None,
        })
    return emib_placements


def extract_layout_data_for_vis(
    result,
    post: Optional[dict],
    nodes: List,
    edge_map: Dict,
    ctx=None,
) -> dict:
    """
    Extract layout data from ILP solution for visualization.
    Preferentially use post["emib_placements"]; if post is None and ctx contains EMIB variables, extract from ctx.

    Parameters
    ----------
    result : ILPPlacementResult
        Solution result (contains layout, rotations)
    post : dict | None
        Return value of run_emib_post_process; can be None
    nodes : List[ChipletNode]
        List of chiplets
    edge_map : Dict[Tuple[str,str], dict]
        Edge mapping
    ctx : ILPModelContext | None
        Optional, ILP context; extract emib_placements from this when post is None

    Returns
    -------
    dict
        chiplet_layout, chiplet_dims, emib_placements, emib_connections, chiplet_power
    """
    layout = result.layout if hasattr(result, "layout") else {}
    rotations = result.rotations if hasattr(result, "rotations") else {}
    chiplet_dims = {}
    chiplet_power = {}
    for node in nodes:
        w0 = float(node.dimensions.get("x", 0) or 0)
        h0 = float(node.dimensions.get("y", 0) or 0)
        rot = rotations.get(node.name, False)
        chiplet_dims[node.name] = (h0, w0) if rot else (w0, h0)
        chiplet_power[node.name] = float(getattr(node, "power", 0) or 0)
    emib_connections = []
    for (a, b), v in edge_map.items():
        if v.get("EMIBType") == "interfaceC":
            continue
        emib_connections.append({
            "node1": a, "node2": b,
            "wireCount": v.get("wireCount", 0),
            "EMIB_length": v.get("EMIB_length", 0),
            "EMIB_max_width": v.get("EMIB_max_width", 0),
        })
    if post is not None and post.get("emib_placements"):
        emib_placements = post["emib_placements"]
    elif ctx is not None and getattr(ctx, "EMIB_x_grid_var", None):
        emib_placements = build_emib_placements_from_ctx(ctx, nodes, edge_map)
    else:
        emib_placements = []
    return {
        "chiplet_layout": dict(layout),
        "chiplet_dims": chiplet_dims,
        "chiplet_power": chiplet_power,
        "emib_placements": emib_placements,
        "emib_connections": emib_connections,
    }


def compute_emib_rect_coords(
    emib_placement: dict,
    emib_length: float,
    emib_width: float,
) -> dict:
    """
    Compute silicon bridge rectangle coordinates based on center point and sizing rules.
    Horizontal adjacency: length=shared edge height, width=max(distance,1); vertical adjacency: length=shared edge width, width=max(distance,1).
    If distance is 0, set width to 1 to ensure visibility.
    """
    direction = emib_placement.get("direction", "horizontal")
    shared_len = emib_placement.get("shared_length") or emib_length
    phys = emib_placement.get("emib_physical_dist") or emib_width
    phys = max(phys, 1.0) if phys <= 1e-9 else phys
    cx, cy = emib_placement.get("emib_center", (0, 0))
    if direction == "horizontal":
        w_rect = phys
        h_rect = shared_len
        x_min = cx - w_rect / 2
        y_min = cy - h_rect / 2
    else:
        w_rect = shared_len
        h_rect = phys
        x_min = cx - w_rect / 2
        y_min = cy - h_rect / 2
    return {
        "x_min": x_min, "y_min": y_min, "width": w_rect, "height": h_rect,
        "emib_center": (cx, cy),
        "direction": direction,
    }


def generate_wire_grid_and_paths(
    emib_placement: dict,
    emib_rect: dict,
    chiplet_layout: Dict[str, Tuple[float, float]],
    chiplet_dims: Dict[str, Tuple[float, float]],
    wire_count: int,
    node1_name: str,
    node2_name: str,
    display_grid_size: Optional[int] = None,
) -> List[dict]:
    """
    Generate wire start and end points on source/target chiplet grid, path: grid point → silicon bridge center → grid point.
    display_grid_size=16 for 256 points, =4 for 4x4=16 points (center of each 4x4 block), distribute wireCount uniformly.
    """
    wire_count = max(1, int(wire_count))
    emib_center = emib_placement.get("emib_center") or emib_rect.get("emib_center", (0, 0))
    src_grid = generate_chiplet_wire_grid_16x16(chiplet_layout, chiplet_dims, node1_name, display_size=display_grid_size)
    tgt_grid = generate_chiplet_wire_grid_16x16(chiplet_layout, chiplet_dims, node2_name, display_size=display_grid_size)
    n_grid = len(src_grid)
    results = []
    for idx in range(wire_count):
        i = idx % n_grid
        start_pt = src_grid[i]
        end_pt = tgt_grid[i]
        path_points = [start_pt, emib_center, end_pt]
        results.append({
            "wire_id": idx,
            "start": start_pt, "end": end_pt,
            "path_points": path_points,
        })
    return results


def draw_emib_layout_diagram(
    chiplet_layout: Dict[str, Tuple[float, float]],
    chiplet_dims: Dict[str, Tuple[float, float]],
    emib_placements: List[dict],
    emib_connections: List[dict],
    chiplet_power: Optional[Dict[str, float]] = None,
    title: str = "EMIB Chiplet Layout",
    show_axes: bool = True,
    save_path: Optional[str] = None,
    save_format: str = "png",
    figsize: Tuple[float, float] = (10, 8),
    wire_paths: Optional[Dict[str, List[dict]]] = None,
    show: bool = False,
    display_grid_size: Optional[int] = 4,
) -> dict:
    """
    Draw EMIB chiplet layout diagram: chiplet rectangles, red circle for silicon bridge center, blue wires (path: grid point → silicon bridge center → grid point).

    Parameters
    ----------
    chiplet_layout : Dict[str, Tuple[float, float]]
        Chiplet bottom-left coordinates
    chiplet_dims : Dict[str, Tuple[float, float]]
        Chiplet dimensions
    emib_placements : List[dict]
        Silicon bridge position information
    emib_connections : List[dict]
        Interconnection relationships (contains wireCount, EMIB_length, EMIB_max_width)
    title : str
        Figure title
    show_axes : bool
        Whether to show coordinate axes
    save_path : str | None
        Save path, None for no save
    save_format : str
        Save format, e.g., "png", "svg"
    figsize : Tuple[float, float]
        Figure size
    wire_paths : Dict[str, List[dict]] | None
        emib_id -> list of paths returned by generate_wire_grid_and_paths, generate internally if None
    display_grid_size : int | None
        Display blue wire grid scale, 16 for 16x16=256, 4 for 4x4=16 (each 4x4 block center), default 4

    Returns
    -------
    dict
        Structured data: emib_coords, wire_start_end, emib_edge_centers
    """
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from matplotlib.patches import Rectangle

    fig, ax = plt.subplots(figsize=figsize)
    emib_rects_data = []
    all_wire_paths = wire_paths or {}
    for emp, conn in zip(emib_placements, emib_connections):
        emib_id = emp["emib_id"]
        emib_len = float(conn.get("EMIB_length", 0) or emp.get("shared_length", 0))
        emib_w = float(conn.get("EMIB_max_width", 0) or emp.get("emib_physical_dist", 0))
        rect_info = compute_emib_rect_coords(emp, emib_length=emib_len, emib_width=emib_w)
        emib_rects_data.append(rect_info)
        if emib_id not in all_wire_paths:
            all_wire_paths[emib_id] = generate_wire_grid_and_paths(
                emib_placement=emp,
                emib_rect=rect_info,
                chiplet_layout=chiplet_layout,
                chiplet_dims=chiplet_dims,
                wire_count=int(conn.get("wireCount", 1)),
                node1_name=conn["node1"],
                node2_name=conn["node2"],
                display_grid_size=display_grid_size,
            )

    chiplet_power = chiplet_power or {}
    # 1. Draw chiplet rectangles with name and power labels
    for name, (x, y) in chiplet_layout.items():
        w, h = chiplet_dims.get(name, (0, 0))
        rect = Rectangle((x, y), w, h, facecolor="lightgray", edgecolor="black", linewidth=1.5)
        ax.add_patch(rect)
        power_val = chiplet_power.get(name, 0)
        label = f"{name}\npower: {power_val:.0f}"
        ax.text(x + w / 2, y + h / 2, label, ha="center", va="center", fontsize=9, fontweight="bold")

    # 2. Draw blue wires (path: grid point → silicon bridge center → grid point)
    for emib_id, paths in all_wire_paths.items():
        for p in paths:
            pts = p["path_points"]
            for i in range(len(pts) - 1):
                ax.plot(
                    [pts[i][0], pts[i + 1][0]],
                    [pts[i][1], pts[i + 1][1]],
                    color="blue",
                    linewidth=0.6,
                    alpha=0.8,
                )

    # 3. Draw silicon bridge center point (large red circle, above blue wires for visibility)
    for rect_info in emib_rects_data:
        cx, cy = rect_info.get("emib_center", (0, 0))
        ax.plot(cx, cy, "o", color="red", markersize=20, markeredgecolor="darkred", markeredgewidth=2, zorder=10)

    ax.set_aspect("equal")
    ax.set_title(title)
    if not show_axes:
        ax.set_axis_off()
    x_lo = min(x for x, _ in chiplet_layout.values()) if chiplet_layout else 0
    y_lo = min(y for _, y in chiplet_layout.values()) if chiplet_layout else 0
    x_hi = max(x + chiplet_dims.get(nm, (0, 0))[0] for nm, (x, _) in chiplet_layout.items()) if chiplet_layout else 10
    y_hi = max(y + chiplet_dims.get(nm, (0, 0))[1] for nm, (_, y) in chiplet_layout.items()) if chiplet_layout else 10
    for rect_info in emib_rects_data:
        cx, cy = rect_info.get("emib_center", (0, 0))
        x_lo = min(x_lo, cx)
        y_lo = min(y_lo, cy)
        x_hi = max(x_hi, cx)
        y_hi = max(y_hi, cy)
    margin = (max(x_hi - x_lo, y_hi - y_lo) or 1) * 0.1
    ax.set_xlim(x_lo - margin, x_hi + margin)
    ax.set_ylim(y_lo - margin, y_hi + margin)
    plt.tight_layout()
    if save_path:
        path = save_path if save_path.endswith(f".{save_format}") else f"{save_path}.{save_format}"
        plt.savefig(path, dpi=150, bbox_inches="tight")
    if show:
        plt.show()
    else:
        plt.close(fig)
    wire_start_end = {}
    for eid, pl in all_wire_paths.items():
        wire_start_end[eid] = [{"start": p["start"], "end": p["end"]} for p in pl]
    out = {
        "emib_coords": [
            {
                "x_min": r["x_min"], "y_min": r["y_min"],
                "width": r["width"], "height": r["height"],
                "emib_center": r.get("emib_center", (0, 0)),
            }
            for r in emib_rects_data
        ],
        "wire_start_end": wire_start_end,
        "emib_centers": [r.get("emib_center", (0, 0)) for r in emib_rects_data],
    }
    return out


def load_chiplet_nodes(max_nodes: Optional[int] = None) -> List[ChipletNode]:
    """
    Load chiplets from JSON and convert them into :class:`ChipletNode` objects.

    Parameters
    ----------
    max_nodes:
        If specified, return only the first max_nodes chiplets. Default returns first 4.
    """

    raw = load_chiplets_json()
    table = build_chiplet_table(raw)

    nodes: List[ChipletNode] = []
    limit = max_nodes if max_nodes is not None else 4  # Default: return only first 4
    for row in table[:limit]:
        nodes.append(
            ChipletNode(
                name=row["name"],
                dimensions=row["dimensions"],
                phys=row["phys"],
                power=row["power"]
            )
        )
    return nodes


def generate_random_links(
    node_names: List[str],
    edge_prob: float = 0.2,
    allow_self_loop: bool = False,
    undirected: bool = True,
    fixed_num_edges: int = 10,
) -> List[Tuple[str, str]]:
    """
    Generate fixed number of links (returns the same links each time).

    Use fixed random seed to ensure same links are generated for the same node list each time.
    """

    import random

    # Set fixed random seed to ensure same links are generated each time
    random.seed(42)

    # Generate all possible edge pairs (excluding self-loops)
    all_possible_edges: List[Tuple[str, str]] = []
    n = len(node_names)
    for i in range(n):
        for j in range(n):
            # Explicitly exclude self-loops (self-linking)
            if i == j:
                continue
            if undirected and j <= i:
                # For undirected graph, keep only edges where i < j
                continue

            all_possible_edges.append((node_names[i], node_names[j]))

    # If number of possible edges < fixed count, return all edges
    if len(all_possible_edges) <= fixed_num_edges:
        # Ensure no self-loops again (double-check)
        edges = [(a, b) for a, b in all_possible_edges if a != b]
        random.seed()
        return edges

    # Randomly select fixed number of edges
    edges = random.sample(all_possible_edges, fixed_num_edges)

    # Final filter: ensure no self-loops (double-check)
    edges = [(a, b) for a, b in edges if a != b]

    # If filtered edge count < target, re-select
    while len(edges) < fixed_num_edges and len(all_possible_edges) > len(edges):
        remaining = [e for e in all_possible_edges if e not in edges]
        if not remaining:
            break
        needed = fixed_num_edges - len(edges)
        additional = random.sample(remaining, min(needed, len(remaining)))
        edges.extend(additional)
        edges = [(a, b) for a, b in edges if a != b]  # Filter again

    # Reset random seed to avoid affecting other code using random numbers
    random.seed()

    return edges


def generate_typed_edges(
    node_names: List[str],
    num_silicon_bridge_edges: int = 5,
    num_normal_edges: int = 5,
    seed: Optional[int] = 42,
) -> Tuple[List[Tuple[str, str, str]], List[Tuple[str, str, str]]]:
    """
    Generate two types of connection edges: silicon bridge edges and normal edges.

    Parameters
    ----------
    node_names:
        List of node names
    num_silicon_bridge_edges:
        Number of silicon bridge edges
    num_normal_edges:
        Number of normal edges
    seed:
        Random seed for reproducible generation

    Returns
    -------
    Tuple[List[Tuple[str, str, str]], List[Tuple[str, str, str]]]:
        Return two lists:
        - First list: silicon bridge edges, format (src, dst, "silicon_bridge")
        - Second list: normal edges, format (src, dst, "normal")
    """
    if seed is not None:
        random.seed(seed)

    # Generate all possible edge pairs (excluding self-loops)
    all_possible_edges: List[Tuple[str, str]] = []
    n = len(node_names)
    for i in range(n):
        for j in range(i + 1, n):  # Undirected graph, keep only edges where i < j
            all_possible_edges.append((node_names[i], node_names[j]))

    # Ensure enough edges can be generated
    total_needed = num_silicon_bridge_edges + num_normal_edges
    if len(all_possible_edges) < total_needed:
        print(f"Warning: possible edges ({len(all_possible_edges)}) < needed ({total_needed})")
        # Adjust counts
        num_silicon_bridge_edges = min(num_silicon_bridge_edges, len(all_possible_edges) // 2)
        num_normal_edges = min(num_normal_edges, len(all_possible_edges) - num_silicon_bridge_edges)
        total_needed = num_silicon_bridge_edges + num_normal_edges

    # Randomly select edges
    selected_edges = random.sample(all_possible_edges, total_needed)

    # Assign edge types
    silicon_bridge_edges = [
        (src, dst, "silicon_bridge")
        for src, dst in selected_edges[:num_silicon_bridge_edges]
    ]

    normal_edges = [
        (src, dst, "normal")
        for src, dst in selected_edges[num_silicon_bridge_edges:]
    ]

    # Reset random seed
    if seed is not None:
        random.seed()
    
    return silicon_bridge_edges, normal_edges


def build_random_chiplet_graph(
    edge_prob: float = 0.2,
    max_nodes: Optional[int] = None,
    fixed_num_edges: int = 4,
    num_silicon_bridge_edges: Optional[int] = None,
    num_normal_edges: Optional[int] = None,
    seed: Optional[int] = 42,
) -> Tuple[List[ChipletNode], List[Tuple[str, str]]]:
    """
    Convenience helper: load chiplets and generate a random connectivity graph.

    Parameters
    ----------
    edge_prob:
        Edge probability (deprecated, now use fixed_num_edges or num_silicon_bridge_edges/num_normal_edges)
    max_nodes:
        If specified, load only first max_nodes chiplets. Default loads first 4.
    fixed_num_edges:
        Number of fixed edges (used when num_silicon_bridge_edges and num_normal_edges not specified). Default 4.
    num_silicon_bridge_edges:
        Number of silicon bridge edges (if specified, will use typed edge generation)
    num_normal_edges:
        Number of normal edges (if specified, will use typed edge generation)
    seed:
        Random seed for reproducible generation (used only when num_silicon_bridge_edges or num_normal_edges specified)

    Returns
    -------
    Tuple[List[ChipletNode], List[Tuple[str, str]]]:
        Return node list and edge list (old format, backward compatible)
    """

    nodes = load_chiplet_nodes(max_nodes=max_nodes)
    names = [n.name for n in nodes]

    # If silicon bridge or normal edge counts specified, use typed edge generation
    if num_silicon_bridge_edges is not None or num_normal_edges is not None:
        # Set default values
        if num_silicon_bridge_edges is None:
            num_silicon_bridge_edges = fixed_num_edges // 2 if fixed_num_edges > 0 else 0
        if num_normal_edges is None:
            num_normal_edges = fixed_num_edges - num_silicon_bridge_edges if fixed_num_edges > 0 else 0

        # Generate typed edges
        silicon_bridge_edges, normal_edges = generate_typed_edges(
            node_names=names,
            num_silicon_bridge_edges=num_silicon_bridge_edges,
            num_normal_edges=num_normal_edges,
            seed=seed
        )

        # Merge into old format (without type labels)
        edges = [(src, dst) for src, dst, _ in silicon_bridge_edges + normal_edges]
    else:
        # Use old generation method (backward compatible)
        edges = generate_random_links(names, edge_prob=edge_prob, fixed_num_edges=fixed_num_edges)
    
    return nodes, edges


# ---------------------------------------------------------------------------
# Drawing-related helpers
# ---------------------------------------------------------------------------


def default_grid_layout(nodes: List[ChipletNode]) -> Dict[str, Tuple[float, float]]:
    """
    Determine offset (origin_x, origin_y) on canvas for each chiplet.

    - Each chiplet internally uses bottom-left as (0, 0) local coordinate;
    - Return a dict: name -> (origin_x, origin_y).
    """

    if not nodes:
        return {}

    max_w = max(n.dimensions.get("x", 0) for n in nodes)
    max_h = max(n.dimensions.get("y", 0) for n in nodes)
    margin = max(max_w, max_h) * 0.3

    n = len(nodes)
    cols = math.ceil(math.sqrt(n))
    rows = math.ceil(n / cols)

    layout: Dict[str, Tuple[float, float]] = {}
    for idx, node in enumerate(nodes):
        r = idx // cols
        c = idx % cols
        origin_x = c * (max_w + margin)
        origin_y = r * (max_h + margin)
        layout[node.name] = (origin_x, origin_y)

    return layout


def draw_chiplet_diagram(
    nodes: List[ChipletNode],
    edges: List[Tuple[str, str]] | List[Tuple[str, str, str]],
    save_path: Optional[str] = None,
    layout: Optional[Dict[str, Tuple[float, float]]] = None,
    edge_types: Optional[Dict[Tuple[str, str], str]] = None,
    labels: Optional[Dict[str, str]] = None,  # Optional: custom text shown inside each block (name -> label)
    fixed_chiplet_names: Optional[set] = None,  # Set of fixed chiplet names; these chiplets are drawn in pink
    grid_size: float = 1.0,  # Grid size used to convert grid coordinates to physical coordinates
    rotations: Optional[Dict[str, bool]] = None,  # Rotation info: name -> whether rotated
):
    """
    Draw chiplet block diagram.

    Parameters
    ----------
    nodes:
        List of Chiplets.
    edges:
        List of connection edges, can be:
        - Old format: (src_name, dst_name)
        - New format: (src_name, dst_name, edge_type), where edge_type is "silicon_bridge" or "normal"
    save_path:
        If given, save to path; otherwise show directly.
    layout:
        Optional, custom layout dict: name -> (x_grid, y_grid), where coordinates are grid coordinates (multiply by grid_size for actual coordinates).
        If None, use :func:`default_grid_layout`.
    edge_types:
        Optional edge type mapping, format {(src, dst): "silicon_bridge" | "normal"}.
        If edges are new format or this parameter provided, use different colors based on type:
        - Silicon bridge edges: green
        - Normal edges: gray
    labels:
        Optional display text mapping, format {chiplet_name: "display text"}.
        If provided, display this text at chiplet block center; otherwise display chiplet name.
    fixed_chiplet_names:
        Set of fixed chiplet names. If provided, these chiplets drawn in pink, others in light blue.
    grid_size:
        Grid size, used to convert grid coordinates in layout to actual coordinates. Default 1.0.
    rotations:
        Rotation info dict: name -> whether rotated. If provided, swap chiplet dimensions based on rotation.
    """

    if not nodes:
        raise ValueError("No chiplet nodes to draw.")

    if layout is None:
        layout = default_grid_layout(nodes)

    fig, ax = plt.subplots(figsize=(10, 8))

    # Record anchor coordinates for each chiplet for connecting edges (unified use of center point, interface-independent)
    anchor: Dict[str, Tuple[float, float]] = {}

    # Debug: check layout and nodes
    print(f"[DEBUG drawing] number of nodes: {len(nodes)}, number of chiplets in layout: {len(layout)}")
    missing_in_layout = [n.name for n in nodes if n.name not in layout]
    if missing_in_layout:
        print(f"[DEBUG drawing] following chiplets not in layout: {missing_in_layout}")

    # 1) Draw chiplet rectangles and phys anchor points
    drawn_count = 0
    for node in nodes:
        if node.name not in layout:
            print(f"[WARNING] chiplet {node.name} not in layout, skipping draw")
            continue

        # Get grid coordinates and convert to actual coordinates
        x_grid, y_grid = layout[node.name]
        origin_x = float(x_grid) * grid_size
        origin_y = float(y_grid) * grid_size

        drawn_count += 1
        print(f"[DEBUG drawing] draw {node.name}: grid coords=({x_grid:.2f}, {y_grid:.2f}), actual coords=({origin_x:.2f}, {origin_y:.2f})")

        # Get original dimensions
        orig_w = float(node.dimensions.get("x", 0.0))
        orig_h = float(node.dimensions.get("y", 0.0))

        # Check if rotated
        is_rotated = False
        if rotations is not None and node.name in rotations:
            is_rotated = rotations[node.name]

        # If rotated, swap width and height
        if is_rotated:
            w = orig_h
            h = orig_w
        else:
            w = orig_w
            h = orig_h

        # Determine if fixed chiplet, fixed chiplets in pink, others in light blue
        if fixed_chiplet_names is not None and node.name in fixed_chiplet_names:
            facecolor = "pink"  # pink
        else:
            facecolor = "#cce6ff"  # light blue
        
        rect = Rectangle(
            (origin_x, origin_y),
            w,
            h,
            facecolor=facecolor,
            edgecolor="black",
            linewidth=1.0,
        )
        ax.add_patch(rect)

        # Write name at center of chiplet block
        center_x = origin_x + w / 2.0
        center_y = origin_y + h / 2.0
        display_text = labels.get(node.name, node.name) if labels is not None else node.name
        ax.text(
            center_x,
            center_y,
            display_text,
            fontsize=10,
            ha="center",
            va="center",
            weight="bold",
            color="black",
        )

        # phys points: red squares (for display only, not for connections)
        if node.phys:
            for p in node.phys:
                px = origin_x + float(p.get("x", 0.0))
                py = origin_y + float(p.get("y", 0.0))

                anchor_size = min(w, h) * 0.05
                ax.add_patch(
                    Rectangle(
                        (px - anchor_size / 2.0, py - anchor_size / 2.0),
                        anchor_size,
                        anchor_size,
                        facecolor="red",
                        edgecolor="none",
                    )
                )

        # All connections start from chiplet center (interface-independent)
        anchor[node.name] = (origin_x + w / 2.0, origin_y + h / 2.0)

    # 2) Draw directed edges (arrows)
    # Build edge type mapping
    edge_type_map: Dict[Tuple[str, str], str] = {}
    if edge_types:
        edge_type_map.update(edge_types)

    # Extract type info from edges (if new format)
    # edges may be (src, dst, conn_type) format, where conn_type is integer: 1=silicon_bridge, 0=standard
    for edge in edges:
        if len(edge) == 3:
            src, dst, conn_type = edge
            # Convert integer conn_type to string type
            if isinstance(conn_type, int):
                if conn_type == 1:
                    edge_type_map[(src, dst)] = "silicon_bridge"
                    edge_type_map[(dst, src)] = "silicon_bridge"  # bidirectional
                else:
                    edge_type_map[(src, dst)] = "normal"
                    edge_type_map[(dst, src)] = "normal"  # bidirectional
            elif isinstance(conn_type, str):
                # If already string, use directly
                edge_type_map[(src, dst)] = conn_type
                edge_type_map[(dst, src)] = conn_type  # bidirectional
        elif len(edge) == 2:
            src, dst = edge
            # If no type provided, default to normal edge
            if (src, dst) not in edge_type_map:
                edge_type_map[(src, dst)] = "normal"
                edge_type_map[(dst, src)] = "normal"  # bidirectional

    # Debug output: print edge type mapping
    print(f"[DEBUG drawing] edge type mapping:")
    for (src, dst), etype in edge_type_map.items():
        print(f"  ({src}, {dst}): {etype}")

    for edge in edges:
        # Handle different edge formats
        if len(edge) == 3:
            src, dst, _ = edge
        elif len(edge) == 2:
            src, dst = edge
        else:
            continue

        if src not in anchor or dst not in anchor:
            continue
        sx, sy = anchor[src]
        dx, dy = anchor[dst]

        # Choose color based on EMIBType: interfaceC gray, interfaceB green, others (incl. interfaceA) red
        edge_type = edge_type_map.get((src, dst), "normal")
        print(f"[DEBUG drawing] draw edge ({src}, {dst}): type={edge_type}")
        if edge_type == "interfaceC":
            edge_color = "gray"
            linewidth = 1.0
        elif edge_type == "interfaceB":
            edge_color = "green"
            linewidth = 3.0
        else:
            edge_color = "red"  # interfaceA and other types
            linewidth = 3.0

        arrow = FancyArrowPatch(
            (sx, sy),
            (dx, dy),
            arrowstyle="->",
            mutation_scale=10,
            linewidth=linewidth,
            color=edge_color,
            alpha=0.8,
        )
        ax.add_patch(arrow)

    ax.set_aspect("equal", adjustable="datalim")
    ax.axis("off")

    # Debug output
    print(f"[DEBUG drawing] actually drew {drawn_count} chiplets (total {len(nodes)})")

    # Adjust view range (consider full range of all modules, including width and height)
    all_x_min = []
    all_x_max = []
    all_y_min = []
    all_y_max = []

    for node in nodes:
        if node.name not in layout:
            continue
        x_grid, y_grid = layout[node.name]
        ox = float(x_grid) * grid_size
        oy = float(y_grid) * grid_size

        # Get original dimensions
        orig_w = float(node.dimensions.get("x", 0.0))
        orig_h = float(node.dimensions.get("y", 0.0))

        # Check if rotated
        is_rotated = False
        if rotations is not None and node.name in rotations:
            is_rotated = rotations[node.name]

        # If rotated, swap width and height
        if is_rotated:
            w = orig_h
            h = orig_w
        else:
            w = orig_w
            h = orig_h

        # Record bottom-left and top-right coordinates
        all_x_min.append(ox)
        all_x_max.append(ox + w)
        all_y_min.append(oy)
        all_y_max.append(oy + h)

    if all_x_min and all_y_min:
        # Compute min and max coordinates of all modules
        x_min = min(all_x_min)
        x_max = max(all_x_max)
        y_min = min(all_y_min)
        y_max = max(all_y_max)

        # Add margin (10% extra space)
        x_range = x_max - x_min
        y_range = y_max - y_min
        margin_x = max(x_range * 0.1, 1.0)  # at least 1.0 margin
        margin_y = max(y_range * 0.1, 1.0)
        
        ax.set_xlim(x_min - margin_x, x_max + margin_x)
        ax.set_ylim(y_min - margin_y, y_max + margin_y)

    if save_path is not None:
        fig.savefig(save_path, bbox_inches="tight")
    else:
        plt.show()

    plt.close(fig)
 


if __name__ == "__main__":
    # Simple test: randomly generate connections and draw default layout
    nodes, edges = build_random_chiplet_graph(edge_prob=0.3)
    # Use relative path, output to project root
    from pathlib import Path
    out_path = Path(__file__).parent.parent / "output" / "chiplet_diagram_from_tool.png"
    draw_chiplet_diagram(nodes, edges, save_path=str(out_path))
    print(f"Diagram saved to: {out_path}")

    # Test generating two types of edges
    print("\n=== Test generating two types of connection edges ===")
    node_names = [node.name for node in nodes]
    silicon_bridge_edges, normal_edges = generate_typed_edges(
        node_names=node_names,
        num_silicon_bridge_edges=5,
        num_normal_edges=5,
        seed=42
    )

    print(f"\nSilicon bridge edges ({len(silicon_bridge_edges)} edges):")
    for src, dst, edge_type in silicon_bridge_edges:
        print(f"  {src} <-> {dst} (type: {edge_type})")

    print(f"\nNormal edges ({len(normal_edges)} edges):")
    for src, dst, edge_type in normal_edges:
        print(f"  {src} <-> {dst} (type: {edge_type})")


# ---------------------------------------------------------------------------
# Constraint printing function (for debugging ILP constraints)
# ---------------------------------------------------------------------------

if pulp is not None:
    # Constraint sense mapping table
    SENSE_MAP = {
        pulp.LpConstraintLE: "<=",
        pulp.LpConstraintGE: ">=",
        pulp.LpConstraintEQ: "=",
    }

    def print_constraint_formal(constraint) -> None:
        """
        Print formal mathematical expression of constraint.

        Parameters:
            constraint: PuLP constraint object or Gurobi constraint object
        """
        # Check if Gurobi constraint
        if gp is not None and isinstance(constraint, gp.Constr):
            # Gurobi constraint
            try:
                constraint_name = constraint.ConstrName
            except (AttributeError, Exception):
                # If constraint doesn't have name yet (e.g., just added but model not updated), skip
                return
            # Gurobi constraint string representation
            constraint_str = str(constraint)
            # Print constraint (can modify to output to log file)
            # print(f"[ADD CONSTRAINT] {constraint_name}: {constraint_str}")
            return

        # PuLP constraint
        if pulp is not None and isinstance(constraint, pulp.LpConstraint):
            # Process left-hand expression: remove redundant *1.0, beautify output
            lhs = str(constraint.expr).replace("*1.0", "").replace(" + ", " + ").strip()

            # Process right-hand constant: PuLP stores internally as expr + constant <= 0, need to negate
            rhs = round(-constraint.constant, 4)

            # Get constraint sense string
            sense_str = SENSE_MAP.get(constraint.sense, "?")

            # Build formal expression
            formal_expr = f"[{constraint.name}] {lhs} {sense_str} {rhs}"

            # Print constraint (can modify to output to log file)
            # print(f"[ADD CONSTRAINT] {formal_expr}")
            return

        # If neither matches, silently ignore
        pass
else:
    # If pulp not installed, provide placeholder function
    def print_constraint_formal(*args, **kwargs):
        # Check if Gurobi constraint
        if gp is not None and len(args) > 0:
            constraint = args[0]
            if isinstance(constraint, gp.Constr):
                # Gurobi constraint, silent handling
                return
        # Other cases raise error
        raise ImportError("pulp not installed, constraint print unavailable")


# ---------------------------------------------------------------------------
# ILP solution result printing helpers
# ---------------------------------------------------------------------------

def print_pair_distances_only(
    ctx,
    result,
    solution_idx: int,
    prev_pair_distances_list: Optional[List[Dict[Tuple[int, int], float]]] = None,
    min_pair_dist_diff: float = 1.0,
) -> None:
    """
    Simplified output: only print relative distances of each chiplet pair and comparison with previous solutions.

    Parameters:
        ctx: ILP model context
        result: Solution result
        solution_idx: Solution index (0-indexed)
        prev_pair_distances_list: Optional, list of chiplet pair distances from all previous solutions
        min_pair_dist_diff: Minimum threshold for determining if distances are same
    """
    if result.status != "Optimal":
        return

    nodes = ctx.nodes
    n = len(nodes)

    # Get coordinates of current solution
    x_curr = {}
    y_curr = {}
    for k in range(n):
        x_val = get_var_value(ctx.x_grid_var[k])
        y_val = get_var_value(ctx.y_grid_var[k])
        if x_val is not None and y_val is not None:
            x_curr[k] = float(x_val)
            y_curr[k] = float(y_val)
        else:
            return  # If cannot get coordinates, return directly

    # Compute relative distance of each chiplet pair (absolute x and y differences)
    curr_pair_distances = {}
    chiplet_pairs = [(i, j) for i in range(n) for j in range(i+1, n)]

    for i, j in chiplet_pairs:
        if i in x_curr and j in x_curr and i in y_curr and j in y_curr:
            # Compute x and y relative distances (absolute differences)
            x_dist = abs(x_curr[i] - x_curr[j])
            y_dist = abs(y_curr[i] - y_curr[j])
            curr_pair_distances[(i, j)] = (x_dist, y_dist)
    
    # Output relative distances of current solution
    # print(f"\n=== Solution {solution_idx + 1} ===")
    # print(f"\nRelative distance of each chiplet pair (|x[i]-x[j]|, |y[i]-y[j]|):")
    # for i, j in sorted(chiplet_pairs):
    #     if (i, j) in curr_pair_distances:
    #         x_dist, y_dist = curr_pair_distances[(i, j)]
    #         name_i = nodes[i].name if hasattr(nodes[i], 'name') else f"Chiplet_{i}"
    #         name_j = nodes[j].name if hasattr(nodes[j], 'name') else f"Chiplet_{j}"
    #         # Compute Manhattan distance (for display)
    #         manhattan_dist = x_dist + y_dist
    #         print(f"  ({i},{j}) [{name_i}, {name_j}]: x_dist={x_dist:.3f}, y_dist={y_dist:.3f}, manhattan_dist={manhattan_dist:.3f}")

    # Compare with previous solutions
    if prev_pair_distances_list and len(prev_pair_distances_list) > 0:
        # Get grid_size, used to convert grid coordinate distance to actual coordinate distance
        grid_size_val = ctx.grid_size if hasattr(ctx, 'grid_size') and ctx.grid_size is not None else 1.0

        print(f"\nDistance comparison with previous solutions (threshold={min_pair_dist_diff:.3f}):")
        for prev_idx, prev_distances in enumerate(prev_pair_distances_list):
            print(f"\n  Comparison with solution {prev_idx + 1}:")
            same_pairs = []
            diff_pairs_with_info = []  # Store different pairs and their distance diff info

            for i, j in sorted(chiplet_pairs):
                if (i, j) in curr_pair_distances and (i, j) in prev_distances:
                    curr_x_dist, curr_y_dist = curr_pair_distances[(i, j)]
                    # prev_distances stores Manhattan distance in grid coordinates, need to convert to actual coordinate distance
                    prev_dist_grid = prev_distances[(i, j)]  # Manhattan distance in grid coordinates
                    prev_dist = prev_dist_grid * grid_size_val  # Convert to actual coordinate distance

                    # Compute Manhattan distance of current solution (actual coordinates)
                    curr_dist = curr_x_dist + curr_y_dist

                    # Compute distance diff (absolute value)
                    dist_diff = abs(curr_dist - prev_dist)

                    if dist_diff < min_pair_dist_diff:
                        same_pairs.append((i, j))
                    else:
                        # Only consider different when distance diff >= min_pair_dist_diff
                        # In else branch, dist_diff >= min_pair_dist_diff always holds
                        diff_pairs_with_info.append((i, j, curr_dist, prev_dist, dist_diff))
            
            if same_pairs:
                print(f"    Same chiplet pairs (distance diff < threshold {min_pair_dist_diff:.3f}):")
                for i, j in same_pairs:
                    if (i, j) in curr_pair_distances and (i, j) in prev_distances:
                        curr_x_dist, curr_y_dist = curr_pair_distances[(i, j)]
                        curr_dist = curr_x_dist + curr_y_dist
                        prev_dist_grid = prev_distances[(i, j)]  # grid coordinate distance
                        prev_dist = prev_dist_grid * grid_size_val  # Convert to actual coordinate distance
                        dist_diff = abs(curr_dist - prev_dist)
                        name_i = nodes[i].name if hasattr(nodes[i], 'name') else f"Chiplet_{i}"
                        name_j = nodes[j].name if hasattr(nodes[j], 'name') else f"Chiplet_{j}"
                        print(f"      ({i},{j}) [{name_i}, {name_j}]: current_dist={curr_dist:.3f}, prev_dist={prev_dist:.3f}, dist_diff={dist_diff:.3f} (< {min_pair_dist_diff:.3f})")
            if diff_pairs_with_info:
                print(f"    Different chiplet pairs (distance diff >= threshold {min_pair_dist_diff:.3f}):")
                for i, j, curr_dist, prev_dist, dist_diff in diff_pairs_with_info:
                    name_i = nodes[i].name if hasattr(nodes[i], 'name') else f"Chiplet_{i}"
                    name_j = nodes[j].name if hasattr(nodes[j], 'name') else f"Chiplet_{j}"
                    print(f"      ({i},{j}) [{name_i}, {name_j}]: current_dist={curr_dist:.3f}, prev_dist={prev_dist:.3f}, dist_diff={dist_diff:.3f} (>= {min_pair_dist_diff:.3f}, meets threshold)")
            if not same_pairs and not diff_pairs_with_info:
                print(f"    (no data)")
    else:
        print(f"\n(First solution, no historical solutions for comparison)")


def print_all_variables(
    ctx: ILPModelContext,
    result: ILPPlacementResult,
    prev_pair_distances_list: Optional[List[Dict[Tuple[int, int], float]]] = None
) -> None:
    """
    Print values of all variables, including those related to exclusion constraints.

    Parameters:
        ctx: ILP model context
        result: Solution result
        prev_pair_distances_list: Optional, list of chiplet pair distances from all previous solutions, for comparison info
    """
    if result.status != "Optimal":
        return

    nodes = ctx.nodes
    n = len(nodes)

    print("\n" + "=" * 80)
    print("Variable values detail")
    print("=" * 80)

    # 1. Coordinate variables (x, y)
    print("\n【Coordinate variables】")
    for k in range(n):
        x_val = get_var_value(ctx.x[k])
        y_val = get_var_value(ctx.y[k])
        node_name = nodes[k].name if hasattr(nodes[k], 'name') else f"Chiplet_{k}"
        print(f"  x[{k}] ({node_name}): {x_val}")
        print(f"  y[{k}] ({node_name}): {y_val}")
    
    # 2. Grid coordinate variables (x_grid, y_grid)
    print("\n【Grid coordinate variables】")
    for k in range(n):
        # Compatible with PuLP and Gurobi variable retrieval
        if hasattr(ctx.prob, 'variablesDict'):
            # PuLP
            x_grid_var = ctx.prob.variablesDict().get(f"x_grid_{k}")
            y_grid_var = ctx.prob.variablesDict().get(f"y_grid_{k}")
        elif hasattr(ctx.prob, 'getVarByName'):
            # Gurobi
            x_grid_var = ctx.prob.getVarByName(f"x_grid_{k}")
            y_grid_var = ctx.prob.getVarByName(f"y_grid_{k}")
        else:
            x_grid_var = None
            y_grid_var = None
        x_grid_val = get_var_value(x_grid_var)
        y_grid_val = get_var_value(y_grid_var)
        node_name = nodes[k].name if hasattr(nodes[k], 'name') else f"Chiplet_{k}"
        print(f"  x_grid[{k}] ({node_name}): {x_grid_val}")
        print(f"  y_grid[{k}] ({node_name}): {y_grid_val}")

    # 3. Rotation variables (r)
    print("\n【Rotation variables】")
    for k in range(n):
        r_val = get_var_value(ctx.r[k])
        rotated_str = "yes" if (r_val is not None and r_val > 0.5) else "no"
        node_name = nodes[k].name if hasattr(nodes[k], 'name') else f"Chiplet_{k}"
        print(f"  r[{k}] ({node_name}): {r_val} (rotated: {rotated_str})")

    # 4. Width and height variables (w, h)
    print("\n【Dimension variables】")
    for k in range(n):
        # Compatible with PuLP and Gurobi variable retrieval
        if hasattr(ctx.prob, 'variablesDict'):
            # PuLP
            w_var = ctx.prob.variablesDict().get(f"w_{k}")
            h_var = ctx.prob.variablesDict().get(f"h_{k}")
        elif hasattr(ctx.prob, 'getVarByName'):
            # Gurobi
            w_var = ctx.prob.getVarByName(f"w_{k}")
            h_var = ctx.prob.getVarByName(f"h_{k}")
        else:
            w_var = None
            h_var = None
        w_val = get_var_value(w_var)
        h_val = get_var_value(h_var)
        node_name = nodes[k].name if hasattr(nodes[k], 'name') else f"Chiplet_{k}"
        print(f"  w[{k}] ({node_name}): {w_val}")
        print(f"  h[{k}] ({node_name}): {h_val}")

    # 5. Center coordinate variables (cx, cy)
    if hasattr(ctx, 'cx') and ctx.cx is not None:
        print("\n【Center coordinate variables】")
        for k in range(n):
            cx_val = get_var_value(ctx.cx[k])
            cy_val = get_var_value(ctx.cy[k])
            node_name = nodes[k].name if hasattr(nodes[k], 'name') else f"Chiplet_{k}"
            print(f"  cx[{k}] ({node_name}): {cx_val}")
            print(f"  cy[{k}] ({node_name}): {cy_val}")
    
    # 6. Adjacency mode variables (z1, z2, z1L, z1R, z2D, z2U)
    connected_pairs = getattr(ctx, 'all_connected_pairs', []) or []

    if len(connected_pairs) > 0:
        print("\n【Adjacency mode variables】")
        for i, j in connected_pairs:
            name_i = nodes[i].name if hasattr(nodes[i], 'name') else f"Chiplet_{i}"
            name_j = nodes[j].name if hasattr(nodes[j], 'name') else f"Chiplet_{j}"
            z1_val = get_var_value(ctx.z1.get((i, j))) if (i, j) in ctx.z1 else None
            z2_val = get_var_value(ctx.z2.get((i, j))) if (i, j) in ctx.z2 else None
            z1L_val = get_var_value(ctx.z1L.get((i, j))) if (i, j) in ctx.z1L else None
            z1R_val = get_var_value(ctx.z1R.get((i, j))) if (i, j) in ctx.z1R else None
            z2D_val = get_var_value(ctx.z2D.get((i, j))) if (i, j) in ctx.z2D else None
            z2U_val = get_var_value(ctx.z2U.get((i, j))) if (i, j) in ctx.z2U else None
            print(f"  Module pair ({name_i}, {name_j}):")
            print(f"    z1[{i},{j}] (horizontal adjacency): {z1_val}")
            print(f"    z2[{i},{j}] (vertical adjacency): {z2_val}")
            if z1_val is not None and z1_val > 0.5:
                print(f"      z1R[{i},{j}] (i on right): {z1R_val}")
            if z2_val is not None and z2_val > 0.5:
                print(f"      z2D[{i},{j}] (i below): {z2D_val}")
                print(f"      z2U[{i},{j}] (i above): {z2U_val}")

    # 7. Non-overlapping constraint variables (p_left, p_right, p_down, p_up)
    print("\n【Non-overlapping constraint variables】")
    all_pairs = []
    for i in range(n):
        for j in range(i + 1, n):
            all_pairs.append((i, j))
    
    for i, j in all_pairs:
        name_i = nodes[i].name if hasattr(nodes[i], 'name') else f"Chiplet_{i}"
        name_j = nodes[j].name if hasattr(nodes[j], 'name') else f"Chiplet_{j}"
        # Compatible with both PuLP and Gurobi variable lookup
        if hasattr(ctx.prob, 'variablesDict'):
            # PuLP
            p_left_var = ctx.prob.variablesDict().get(f"p_left_{i}_{j}")
            p_right_var = ctx.prob.variablesDict().get(f"p_right_{i}_{j}")
            p_down_var = ctx.prob.variablesDict().get(f"p_down_{i}_{j}")
            p_up_var = ctx.prob.variablesDict().get(f"p_up_{i}_{j}")
        elif hasattr(ctx.prob, 'getVarByName'):
            # Gurobi
            p_left_var = ctx.prob.getVarByName(f"p_left_{i}_{j}")
            p_right_var = ctx.prob.getVarByName(f"p_right_{i}_{j}")
            p_down_var = ctx.prob.getVarByName(f"p_down_{i}_{j}")
            p_up_var = ctx.prob.getVarByName(f"p_up_{i}_{j}")
        else:
            p_left_var = p_right_var = p_down_var = p_up_var = None
        
        p_left_val = get_var_value(p_left_var)
        p_right_val = get_var_value(p_right_var)
        p_down_val = get_var_value(p_down_var)
        p_up_val = get_var_value(p_up_var)
        
        print(f"  模块对 ({name_i}, {name_j}):")
        print(f"    p_left[{i},{j}]: {p_left_val}")
        print(f"    p_right[{i},{j}]: {p_right_val}")
        print(f"    p_down[{i},{j}]: {p_down_val}")
        print(f"    p_up[{i},{j}]: {p_up_val}")
    
    # 8. Bounding box variables
    print("\n【边界框变量】")
    bbox_w_val = get_var_value(ctx.bbox_w)
    bbox_h_val = get_var_value(ctx.bbox_h)
    print(f"  bbox_w: {bbox_w_val}")
    print(f"  bbox_h: {bbox_h_val}")
    
    # 9. Other auxiliary variables (shared_x, shared_y, dx_abs, dy_abs, bbox_min/max, etc.)
    print("\n【其他辅助变量】")
    other_vars = []
    # Compatible with both PuLP and Gurobi variable lookup
    if hasattr(ctx.prob, 'variablesDict'):
        # PuLP
        var_dict = ctx.prob.variablesDict()
    elif hasattr(ctx.prob, 'getVars'):
        # Gurobi
        var_dict = {var.VarName: var for var in ctx.prob.getVars()}
    else:
        var_dict = {}
    
    for var_name, var in var_dict.items():
        if var_name.startswith("shared_") or var_name.startswith("dx_abs_") or \
           var_name.startswith("dy_abs_") or var_name.startswith("bbox_") or \
           var_name.startswith("bbox_area_proxy"):
            # Exclude variables related to solution-exclusion constraints (printed separately below)
            if not (var_name.startswith("dx_abs_pair_") or var_name.startswith("dy_abs_pair_") or \
                    var_name.startswith("dx_grid_abs_pair_") or var_name.startswith("dy_grid_abs_pair_")):
                val = get_var_value(var)
                if val is not None:
                    other_vars.append((var_name, val))
    
    if other_vars:
        for var_name, val in sorted(other_vars):
            print(f"  {var_name}: {val}")
    else:
        print("  (无)")
    
    # 10. Variables and constraints related to solution exclusion (printed only from the second solve onward)
    exclude_vars = []
    # Collect all variables related to solution exclusion, including all possible naming patterns
    # Compatible with both PuLP and Gurobi variable lookup
    if hasattr(ctx.prob, 'variablesDict'):
        # PuLP
        var_dict = ctx.prob.variablesDict()
    elif hasattr(ctx.prob, 'getVars'):
        # Gurobi
        var_dict = {var.VarName: var for var in ctx.prob.getVars()}
    else:
        var_dict = {}
    
    for var_name, var in var_dict.items():
        # Check whether this variable is related to solution-exclusion constraints
        is_exclude_var = (
            var_name.startswith("dx_abs_pair_") or 
            var_name.startswith("dy_abs_pair_") or 
            var_name.startswith("dx_grid_abs_pair_") or 
            var_name.startswith("dy_grid_abs_pair_") or 
            var_name.startswith("dist_curr_pair_") or 
            var_name.startswith("dist_diff_pair_") or 
            var_name.startswith("dist_diff_abs_pair_") or 
            var_name.startswith("diff_dist_pair_") or 
            var_name.startswith("same_dist_pair_")
        )
        if is_exclude_var:
            val = get_var_value(var)
            # Record it even if the value is None, for debugging
            exclude_vars.append((var_name, val))
    
    if exclude_vars:
        print("\n" + "=" * 80)
        print("排除解约束相关变量和约束")
        print("=" * 80)
        
        # 10.1 Print variables related to exclusion constraints
        print("\n【排除约束变量】")
        
        # Group by variable type
        dx_abs_pair_vars = []
        dy_abs_pair_vars = []
        dx_grid_abs_pair_vars = []
        dy_grid_abs_pair_vars = []
        dist_curr_pair_vars = []
        dist_diff_pair_vars = []
        dist_diff_abs_pair_vars = []
        diff_dist_pair_vars = []
        same_dist_pair_vars = []
        
        for var_name, val in exclude_vars:
            if var_name.startswith("dx_grid_abs_pair_"):
                dx_grid_abs_pair_vars.append((var_name, val))
            elif var_name.startswith("dy_grid_abs_pair_"):
                dy_grid_abs_pair_vars.append((var_name, val))
            elif var_name.startswith("dist_curr_pair_"):
                dist_curr_pair_vars.append((var_name, val))
            elif var_name.startswith("dx_abs_pair_"):
                dx_abs_pair_vars.append((var_name, val))
            elif var_name.startswith("dy_abs_pair_"):
                dy_abs_pair_vars.append((var_name, val))
            elif var_name.startswith("dist_diff_pair_") and not var_name.startswith("dist_diff_abs_pair_"):
                dist_diff_pair_vars.append((var_name, val))
            elif var_name.startswith("dist_diff_abs_pair_"):
                dist_diff_abs_pair_vars.append((var_name, val))
            elif var_name.startswith("diff_dist_pair_"):
                diff_dist_pair_vars.append((var_name, val))
            elif var_name.startswith("same_dist_pair_"):
                same_dist_pair_vars.append((var_name, val))
        
        if dx_grid_abs_pair_vars:
            print("\n  dx_grid_abs_pair (chiplet对的x方向grid坐标距离绝对值):")
            for var_name, val in sorted(dx_grid_abs_pair_vars):
                print(f"    {var_name}: {val}")
        
        if dy_grid_abs_pair_vars:
            print("\n  dy_grid_abs_pair (chiplet对的y方向grid坐标距离绝对值):")
            for var_name, val in sorted(dy_grid_abs_pair_vars):
                print(f"    {var_name}: {val}")
        
        # Organize output by chiplet pair for clarity
        import re
        pair_info = {}  # key: (i, j), value: dict with all related vars
        
        # Parse all variables and group them by chiplet pair
        unmatched_vars = []  # Record variables that cannot be matched
        for var_name, val in exclude_vars:
            # Match patterns: {prefix}_{suffix}_{i}_{j} or {prefix}_{suffix}_{i}_{j}_prev{prev_idx}
            # Note: variable names may be like dist_diff_abs_pair_{suffix}_{i}_{j}_prev{prev_idx}
            match = re.search(r'([^_]+(?:_[^_]+)*)_[^_]+_(\d+)_(\d+)(?:_prev(\d+))?', var_name)
            if match:
                prefix = match.group(1)
                i_val = int(match.group(2))
                j_val = int(match.group(3))
                prev_idx = match.group(4)
                pair_key = (i_val, j_val)
                
                if pair_key not in pair_info:
                    pair_info[pair_key] = {
                        'dx_grid_abs': None,
                        'dy_grid_abs': None,
                        'dist_curr': None,
                        'dist_diff': {},
                        'dist_diff_abs': {},
                        'diff_dist': None,
                        'same_dist': {}
                    }
                
                # Handle each variable prefix
                if prefix == 'dx_grid_abs_pair':
                    pair_info[pair_key]['dx_grid_abs'] = val
                elif prefix == 'dy_grid_abs_pair':
                    pair_info[pair_key]['dy_grid_abs'] = val
                elif prefix == 'dist_curr_pair':
                    pair_info[pair_key]['dist_curr'] = val
                elif prefix == 'dist_diff_pair' and prev_idx:
                    pair_info[pair_key]['dist_diff'][int(prev_idx)] = val
                elif prefix == 'dist_diff_abs_pair' and prev_idx:
                    pair_info[pair_key]['dist_diff_abs'][int(prev_idx)] = val
                elif prefix == 'diff_dist_pair':
                    pair_info[pair_key]['diff_dist'] = val
                elif prefix == 'same_dist_pair' and prev_idx:
                    pair_info[pair_key]['same_dist'][int(prev_idx)] = val
                else:
                    # Variables that cannot be matched are recorded in unmatched_vars
                    unmatched_vars.append((var_name, val))
            else:
                # Variables that cannot be parsed are recorded in unmatched_vars
                unmatched_vars.append((var_name, val))
        
        # Display detailed information by chiplet pair
        if pair_info:
            print("\n  【按chiplet对分组显示】")
            for (i, j) in sorted(pair_info.keys()):
                info = pair_info[(i, j)]
                name_i = nodes[i].name if hasattr(nodes[i], 'name') and i < len(nodes) else f"Chiplet_{i}"
                name_j = nodes[j].name if hasattr(nodes[j], 'name') and j < len(nodes) else f"Chiplet_{j}"
                
                print(f"\n    模块对 ({name_i}, {name_j}) [索引: ({i}, {j})]:")
                
                if info['dx_grid_abs'] is not None:
                    print(f"      dx_grid_abs (x方向grid距离): {info['dx_grid_abs']:.2f}")
                if info['dy_grid_abs'] is not None:
                    print(f"      dy_grid_abs (y方向grid距离): {info['dy_grid_abs']:.2f}")
                if info['dist_curr'] is not None:
                    print(f"      dist_curr (当前距离，grid单位): {info['dist_curr']:.2f}")
                    print(f"        验证: dx_grid_abs + dy_grid_abs = {info['dx_grid_abs']:.2f} + {info['dy_grid_abs']:.2f} = {info['dx_grid_abs'] + info['dy_grid_abs']:.2f}")
                
                if info['dist_diff'] or info['dist_diff_abs']:
                    print(f"      与之前解的距离比较:")
                    for prev_idx in sorted(set(list(info['dist_diff'].keys()) + list(info['dist_diff_abs'].keys()))):
                        dist_diff = info['dist_diff'].get(prev_idx, None)
                        dist_diff_abs = info['dist_diff_abs'].get(prev_idx, None)
                        same_dist = info['same_dist'].get(prev_idx, None)
                        
                        # Show the previous solution distance if available
                        prev_dist = None
                        if prev_pair_distances_list and prev_idx < len(prev_pair_distances_list):
                            prev_dist = prev_pair_distances_list[prev_idx].get((i, j), None)
                        
                        print(f"        解 {prev_idx}:")
                        if prev_dist is not None:
                            print(f"          之前解的距离: {prev_dist:.2f} (grid单位)")
                        if info['dist_curr'] is not None:
                            print(f"          当前解的距离: {info['dist_curr']:.2f} (grid单位)")
                        if dist_diff is not None:
                            print(f"          距离差 (dist_diff): {dist_diff:.2f}")
                            if prev_dist is not None and info['dist_curr'] is not None:
                                print(f"            验证: {info['dist_curr']:.2f} - {prev_dist:.2f} = {dist_diff:.2f}")
                        if dist_diff_abs is not None:
                            print(f"          距离差绝对值 (dist_diff_abs): {dist_diff_abs:.2f}")
                        if same_dist is not None:
                            same_str = "是" if same_dist > 0.5 else "否"
                            print(f"          是否相同 (same_dist_pair): {same_dist} ({same_str})")
                            if dist_diff_abs is not None:
                                if same_dist > 0.5:
                                    print(f"            → 距离差 {dist_diff_abs:.2f} < 阈值，标记为相同")
                                else:
                                    print(f"            → 距离差 {dist_diff_abs:.2f} >= 阈值，标记为不同")
                
                if info['diff_dist'] is not None:
                    diff_str = "是" if info['diff_dist'] > 0.5 else "否"
                    print(f"      diff_dist_pair (与所有之前解都不同): {info['diff_dist']} ({diff_str})")
                    if info['diff_dist'] > 0.5:
                        print(f"        → 该chiplet对的距离与所有之前解都不同，满足排除约束")
        
        # Keep the original detailed variable list output as supplemental information
        if dist_curr_pair_vars:
            print("\n  【详细变量列表 - dist_curr_pair】")
            for var_name, val in sorted(dist_curr_pair_vars):
                print(f"    {var_name}: {val:.2f}")
        
        if dx_abs_pair_vars:
            print("\n  【详细变量列表 - dx_abs_pair (旧版本)】")
            for var_name, val in sorted(dx_abs_pair_vars):
                print(f"    {var_name}: {val:.2f}")
        
        if dy_abs_pair_vars:
            print("\n  【详细变量列表 - dy_abs_pair (旧版本)】")
            for var_name, val in sorted(dy_abs_pair_vars):
                print(f"    {var_name}: {val:.2f}")
        
        if dist_diff_pair_vars:
            print("\n  【详细变量列表 - dist_diff_pair】")
            for var_name, val in sorted(dist_diff_pair_vars):
                print(f"    {var_name}: {val:.2f}")
        
        if dist_diff_abs_pair_vars:
            print("\n  【详细变量列表 - dist_diff_abs_pair】")
            for var_name, val in sorted(dist_diff_abs_pair_vars):
                if val is not None:
                    print(f"    {var_name}: {val:.2f}")
                else:
                    print(f"    {var_name}: None (未求解)")
        
        if diff_dist_pair_vars:
            print("\n  【详细变量列表 - diff_dist_pair (二进制)】")
            for var_name, val in sorted(diff_dist_pair_vars):
                if val is not None:
                    diff_str = "是" if val > 0.5 else "否"
                    print(f"    {var_name}: {val} ({diff_str})")
                else:
                    print(f"    {var_name}: None (未求解)")
        
        # Print all other variables related to solution-exclusion constraints, including unmatched ones
        if unmatched_vars:
            print("\n  【其他排除解约束相关变量（未在分组中显示）】")
            for var_name, val in sorted(unmatched_vars):
                if val is not None:
                    print(f"    {var_name}: {val}")
                else:
                    print(f"    {var_name}: None (未求解)")
        
        # Print the complete list of all solution-exclusion-related variables for debugging
        print("\n  【完整变量列表（所有排除解约束相关变量）】")
        for var_name, val in sorted(exclude_vars):
            if val is not None:
                # Format output based on variable type
                if var_name.startswith("diff_dist_pair_") or var_name.startswith("same_dist_pair_"):
                    # Binary variable
                    binary_str = "是" if val > 0.5 else "否"
                    print(f"    {var_name}: {val} ({binary_str})")
                elif isinstance(val, (int, float)):
                    # Numeric variable
                    print(f"    {var_name}: {val:.4f}")
                else:
                    print(f"    {var_name}: {val}")
            else:
                print(f"    {var_name}: None (未求解)")
        
        if same_dist_pair_vars:
            print("\n  same_dist_pair (chiplet对的距离是否与某个之前解相同，二进制变量):")
            # Group output by chiplet pair and previous-solution index
            same_dist_by_pair = {}
            import re
            for var_name, val in same_dist_pair_vars:
                # Parse variable names: same_dist_pair_{suffix}_{i}_{j}_prev{prev_idx}
                # Use regex to match: same_dist_pair_*_number_number_prevnumber
                match = re.search(r'same_dist_pair_[^_]+_(\d+)_(\d+)_prev(\d+)', var_name)
                if match:
                    i_val = int(match.group(1))
                    j_val = int(match.group(2))
                    prev_idx = int(match.group(3))
                    pair_key = (i_val, j_val, prev_idx)
                    if pair_key not in same_dist_by_pair:
                        same_dist_by_pair[pair_key] = []
                    same_dist_by_pair[pair_key].append((var_name, val))
                else:
                    # If regex matching fails, show the variable name directly
                    if "unknown" not in same_dist_by_pair:
                        same_dist_by_pair["unknown"] = []
                    same_dist_by_pair["unknown"].append((var_name, val))
            
            # Sort output by chiplet pair and previous-solution index
            for key, vars_list in sorted(same_dist_by_pair.items()):
                if key == "unknown":
                    print("    无法解析的变量:")
                    for var_name, val in sorted(vars_list):
                        print(f"      {var_name}: {val}")
                else:
                    i, j, prev_idx = key
                    name_i = nodes[i].name if hasattr(nodes[i], 'name') and i < len(nodes) else f"Chiplet_{i}"
                    name_j = nodes[j].name if hasattr(nodes[j], 'name') and j < len(nodes) else f"Chiplet_{j}"
                    print(f"    模块对 ({name_i}, {name_j}) 与解 {prev_idx}:")
                    for var_name, val in sorted(vars_list):
                        print(f"      {var_name}: {val}")
        
        # 10.2 Print constraints related to exclusion constraints
        print("\n【排除约束】")
        exclude_constraints = []
        for constraint_name, constraint in ctx.prob.constraints.items():
            if constraint_name.startswith("dx_abs_pair_") or constraint_name.startswith("dy_abs_pair_") or \
               constraint_name.startswith("dx_grid_abs_pair_") or constraint_name.startswith("dy_grid_abs_pair_") or \
               constraint_name.startswith("dist_curr_pair_") or \
               constraint_name.startswith("dist_diff_pair_") or constraint_name.startswith("dist_diff_abs_pair_") or \
               constraint_name.startswith("exclude_solution_dist_pair_") or \
               constraint_name.startswith("same_dist_pair_") or constraint_name.startswith("diff_dist_pair_implies_") or \
               constraint_name.startswith("not_same_implies_") or constraint_name.startswith("all_not_same_implies_"):
                exclude_constraints.append(constraint_name)
        
        if exclude_constraints:
            print(f"  共找到 {len(exclude_constraints)} 个排除约束:")
            for constraint_name in sorted(exclude_constraints):
                constraint = ctx.prob.constraints[constraint_name]
                print(f"    {constraint_name}: {constraint}")
        else:
            print("  (未找到排除约束)")
    else:
        print("\n【排除解约束】")
        print("  (第一次求解，无排除约束)")
