"""Local metric and visualization helpers for the standalone RL package."""

from __future__ import annotations

import json
import math
import random
from pathlib import Path
from typing import Dict, List, Tuple

try:
    from .chiplet_model import Chiplet, LayoutProblem, get_adjacency_info
except ImportError:
    from chiplet_model import Chiplet, LayoutProblem, get_adjacency_info


_EPS = 1e-9
EMIB_WIRECOUNT_THRESHOLD = 255


def _shared_edge(chip1: Chiplet, chip2: Chiplet):
    """Return (kind, boundary, lo, hi) for the shared edge, or None.

    kind='LR': vertical shared edge (left/right neighbours) at x=boundary.
    kind='UD': horizontal shared edge (up/down neighbours) at y=boundary.
    lo/hi is the overlap interval along that edge.

    Unlike ``get_adjacency_info`` this applies no minimum-overlap threshold:
    a bridge is drawn wherever the dies touch, even if the overlap is shorter
    than the bridge (that is a legality problem for the checker to report, not
    a reason to leave the rectangle out of the picture).
    """
    x1, y1, x1b, y1b = chip1.get_bounds()
    x2, y2, x2b, y2b = chip2.get_bounds()
    oy = min(y1b, y2b) - max(y1, y2)
    ox = min(x1b, x2b) - max(x1, x2)

    if abs(x1b - x2) < _EPS and oy > _EPS:
        return "LR", x1b, max(y1, y2), min(y1b, y2b)
    if abs(x2b - x1) < _EPS and oy > _EPS:
        return "LR", x2b, max(y1, y2), min(y1b, y2b)
    if abs(y1b - y2) < _EPS and ox > _EPS:
        return "UD", y1b, max(x1, x2), min(x1b, x2b)
    if abs(y2b - y1) < _EPS and ox > _EPS:
        return "UD", y2b, max(x1, x2), min(x1b, x2b)
    return None


def compute_bridge_rects(layout: Dict[str, Chiplet], problem: LayoutProblem) -> List[dict]:
    """Physical EMIB bridge rectangles implied by a layout.

    EMIB_length runs ALONG the shared edge and 2 * EMIB_bump_width ACROSS it,
    centred on the overlap interval and on the shared boundary (touching dies,
    gap = 0).  Up/down neighbours have a horizontal shared edge, so their
    rectangle is rotated 90 degrees: along-edge length in x and across-gap
    width in y.  Left/right neighbours keep the along-edge length in y.

    Returns dicts with name / rect / kind / along / across.  Pairs that no
    longer share an edge are skipped -- there is no rectangle to draw.
    """
    specs = []
    connections = getattr(problem, "all_connections", None) or []
    if connections:
        for conn in connections:
            specs.append((
                conn.get("node1"), conn.get("node2"),
                conn.get("EMIB_length"), conn.get("EMIB_bump_width", 1.0),
                conn.get("EMIBType", "interfaceB"),
                int(conn.get("wireCount", 1)),
            ))
    else:
        for n1, n2, attrs in problem.connection_graph.edges(data=True):
            specs.append((
                n1, n2, attrs.get("EMIB_length"),
                attrs.get("EMIB_bump_width", 1.0),
                attrs.get("EMIBType", "interfaceB"),
                int(attrs.get("wireCount", 1)),
            ))

    bridges, seen = [], set()
    for n1, n2, along, bump, etype, wire_count in specs:
        if wire_count <= EMIB_WIRECOUNT_THRESHOLD:
            continue
        if str(etype).lower() == "interfacec":
            continue
        if along is None:
            continue
        key = frozenset((n1, n2))
        if key in seen:
            continue
        chip1, chip2 = layout.get(n1), layout.get(n2)
        if chip1 is None or chip2 is None:
            continue
        edge = _shared_edge(chip1, chip2)
        if edge is None:
            continue
        seen.add(key)

        kind, boundary, lo, hi = edge
        along = float(along)
        across = 2.0 * (1.0 if bump is None else float(bump))
        mid = (lo + hi) / 2.0
        if kind == "LR":
            rect = (boundary - across / 2.0, mid - along / 2.0,
                    boundary + across / 2.0, mid + along / 2.0)
        else:
            rect = (mid - along / 2.0, boundary - across / 2.0,
                    mid + along / 2.0, boundary + across / 2.0)

        bridges.append({
            "name": f"{n1}-{n2}",
            "node1": n1,
            "node2": n2,
            "rect": rect,
            "kind": kind,
            "along": along,
            "across": across,
            "type": etype,
            "wire_count": wire_count,
            "rotation": 1 if kind == "LR" else 0,
        })
    return bridges


EMIB_TYPES_PATH = (Path(__file__).resolve().parent.parent.parent
                   / "benchmark" / "test_input" / "EMIB.json")


def _emib_type_defs() -> dict:
    try:
        data = json.loads(EMIB_TYPES_PATH.read_text(encoding="utf-8"))
    except OSError:
        return {}
    return {e["name"]: e for e in data.get("EMIBTypes", [])}


def bridge_connection_records(layout: Dict[str, Chiplet], problem) -> List[dict]:
    """EMIB records in the ICCAD23 solution-JSON schema (unit.save_result).

    `EMIB_width` is the size ACROSS the shared edge (2 * EMIB_bump_width),
    `EMIB_length` the size ALONG it, `EMIB-rotation` is 1 for a left/right
    (vertical) shared edge and 0 for up/down, and the stored x/y is the
    rectangle's lower-left corner -- the same fields bt_tree solutions carry.
    """
    types = _emib_type_defs()
    records = []
    for b in compute_bridge_rects(layout, problem):
        iface = types.get(b["type"], {})
        x0, y0 = b["rect"][0], b["rect"][1]
        records.append({
            "node1": b["node1"],
            "node2": b["node2"],
            "EMIBType": b["type"],
            "EMIB_length": b["along"],
            "EMIB_max_width": iface.get("max_Reach_length", 5),
            "EMIB_width": b["across"],
            "EMIB_bump_width": b["across"] / 2.0,
            "EMIB-x-position": round(x0, 6),
            "EMIB-y-position": round(y0, 6),
            "EMIB-rotation": b["rotation"],
        })
    return records


def calculate_wirelength(layout: Dict[str, Chiplet], problem: LayoutProblem) -> float:
    """Return total Euclidean wirelength over connected chip pairs."""
    if not layout or not problem.connection_graph.edges():
        return 0.0

    total_wirelength = 0.0
    for chip1_id, chip2_id in problem.connection_graph.edges():
        chip1 = layout.get(chip1_id)
        chip2 = layout.get(chip2_id)
        if chip1 is None or chip2 is None:
            continue

        center1_x = chip1.x + chip1.width / 2
        center1_y = chip1.y + chip1.height / 2
        center2_x = chip2.x + chip2.width / 2
        center2_y = chip2.y + chip2.height / 2
        total_wirelength += ((center2_x - center1_x) ** 2 + (center2_y - center1_y) ** 2) ** 0.5

    return total_wirelength


def calculate_manhattan_wirelength(layout: Dict[str, Chiplet], problem: LayoutProblem) -> float:
    """Return total center-based Manhattan wirelength over connected chip pairs."""
    if not layout or not problem.connection_graph.edges():
        return 0.0

    total_wirelength = 0.0
    for chip1_id, chip2_id in problem.connection_graph.edges():
        chip1 = layout.get(chip1_id)
        chip2 = layout.get(chip2_id)
        if chip1 is None or chip2 is None:
            continue

        center1_x = chip1.x + chip1.width / 2
        center1_y = chip1.y + chip1.height / 2
        center2_x = chip2.x + chip2.width / 2
        center2_y = chip2.y + chip2.height / 2
        total_wirelength += abs(center2_x - center1_x) + abs(center2_y - center1_y)

    return total_wirelength


def get_bridge_center(chip1: Chiplet, chip2: Chiplet, direction: str) -> Tuple[float, float]:
    """Return the bridge center used by the ICCAD23 wirelength metric."""
    x1_min, y1_min, x1_max, y1_max = chip1.get_bounds()
    x2_min, y2_min, x2_max, y2_max = chip2.get_bounds()

    if direction == "right":
        return x1_max, (max(y1_min, y2_min) + min(y1_max, y2_max)) / 2.0
    if direction == "left":
        return x1_min, (max(y1_min, y2_min) + min(y1_max, y2_max)) / 2.0
    if direction == "top":
        return (max(x1_min, x2_min) + min(x1_max, x2_max)) / 2.0, y1_max
    if direction == "bottom":
        return (max(x1_min, x2_min) + min(x1_max, x2_max)) / 2.0, y1_min

    center1_x = (x1_min + x1_max) / 2.0
    center1_y = (y1_min + y1_max) / 2.0
    center2_x = (x2_min + x2_max) / 2.0
    center2_y = (y2_min + y2_max) / 2.0
    return (center1_x + center2_x) / 2.0, (center1_y + center2_y) / 2.0


def get_grid_points(chip: Chiplet, grid_size: int = 16) -> List[Tuple[float, float]]:
    """Return the 16x16 chiplet grid points used by ICCAD23 EMIB wirelength."""
    x_min, y_min, x_max, y_max = chip.get_bounds()
    points: List[Tuple[float, float]] = []
    for i in range(grid_size):
        for j in range(grid_size):
            x = x_min + (x_max - x_min) * (i + 0.5) / grid_size
            y = y_min + (y_max - y_min) * (j + 0.5) / grid_size
            points.append((x, y))
    return points


def calculate_emib_wirelength(chip1: Chiplet, chip2: Chiplet, wire_count: int) -> float:
    """ICCAD23 EMIB wirelength: grid points on both chips to the bridge center."""
    _, _, direction = get_adjacency_info(chip1, chip2)
    bridge_center_x, bridge_center_y = get_bridge_center(chip1, chip2, direction)
    grid_points_1 = get_grid_points(chip1, grid_size=16)
    grid_points_2 = get_grid_points(chip2, grid_size=16)

    total_wirelength = 0.0
    for wire_idx in range(wire_count):
        point_x, point_y = grid_points_1[wire_idx % len(grid_points_1)]
        total_wirelength += math.sqrt((point_x - bridge_center_x) ** 2 + (point_y - bridge_center_y) ** 2)

    for wire_idx in range(wire_count):
        point_x, point_y = grid_points_2[wire_idx % len(grid_points_2)]
        total_wirelength += math.sqrt((point_x - bridge_center_x) ** 2 + (point_y - bridge_center_y) ** 2)

    return total_wirelength


def calculate_normal_wirelength(chip1: Chiplet, chip2: Chiplet, wire_count: int) -> float:
    """ICCAD23 normal wirelength: center Manhattan distance times wire count."""
    x1_min, y1_min, x1_max, y1_max = chip1.get_bounds()
    x2_min, y2_min, x2_max, y2_max = chip2.get_bounds()

    center1_x = (x1_min + x1_max) / 2.0
    center1_y = (y1_min + y1_max) / 2.0
    center2_x = (x2_min + x2_max) / 2.0
    center2_y = (y2_min + y2_max) / 2.0

    return (abs(center2_x - center1_x) + abs(center2_y - center1_y)) * wire_count


def _iter_connection_records(problem: LayoutProblem) -> List[Tuple[str, str, int]]:
    records: List[Tuple[str, str, int]] = []
    all_conns = getattr(problem, "all_connections", []) or []

    if all_conns:
        for conn in all_conns:
            if not isinstance(conn, dict):
                continue
            chip1_id = conn.get("node1") or conn.get("source") or conn.get("from")
            chip2_id = conn.get("node2") or conn.get("target") or conn.get("to")
            if chip1_id is None or chip2_id is None:
                continue
            wire_count = int(float(conn.get("wireCount", conn.get("weight", 1))))
            records.append((chip1_id, chip2_id, wire_count))
        return records

    for chip1_id, chip2_id in problem.connection_graph.edges():
        edge_data = problem.connection_graph[chip1_id][chip2_id]
        wire_count = int(float(edge_data.get("wireCount", edge_data.get("weight", 1))))
        records.append((chip1_id, chip2_id, wire_count))

    return records


def calculate_iccad23_wirelength(layout: Dict[str, Chiplet], problem: LayoutProblem) -> Tuple[float, float, float, int]:
    """Return ICCAD23 total wirelength split into EMIB and normal parts.

    Connections with wireCount > 255 are treated as EMIB, matching
    baseline/ICCAD23/src/wirelength.py.
    """
    if not layout:
        return 0.0, 0.0, 0.0, 0

    emib_wirelength = 0.0
    normal_wirelength = 0.0
    total_wire_count = 0

    for chip1_id, chip2_id, wire_count in _iter_connection_records(problem):
        chip1 = layout.get(chip1_id)
        chip2 = layout.get(chip2_id)
        if chip1 is None or chip2 is None:
            continue

        total_wire_count += wire_count
        if wire_count > 255:
            emib_wirelength += calculate_emib_wirelength(chip1, chip2, wire_count)
        else:
            normal_wirelength += calculate_normal_wirelength(chip1, chip2, wire_count)

    return emib_wirelength + normal_wirelength, emib_wirelength, normal_wirelength, total_wire_count


def calculate_layout_utilization(layout: Dict[str, Chiplet]) -> Tuple[float, float, float, float, float]:
    """Return utilization percentage and bounding-box statistics."""
    if not layout:
        return 0.0, 0.0, 0.0, 0.0, 0.0

    chiplets = list(layout.values())
    x_min = min(chip.x for chip in chiplets)
    y_min = min(chip.y for chip in chiplets)
    x_max = max(chip.x + chip.width for chip in chiplets)
    y_max = max(chip.y + chip.height for chip in chiplets)

    bbox_width = x_max - x_min
    bbox_height = y_max - y_min
    bbox_area = bbox_width * bbox_height
    chip_total_area = sum(chip.width * chip.height for chip in chiplets)
    utilization = (chip_total_area / bbox_area * 100) if bbox_area > 0 else 0.0

    return utilization, bbox_area, chip_total_area, bbox_width, bbox_height


def save_layout_to_json(layout: Dict[str, Chiplet], json_path: str) -> None:
    data = {
        "chiplets": [
            {
                "id": chip.id,
                "width": chip.width,
                "height": chip.height,
                "x": chip.x,
                "y": chip.y,
                "power": getattr(chip, "power", 0.0),
            }
            for chip in layout.values()
        ]
    }
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


def generate_color(chip_id: str):
    # Local RNG: `random.Random(chip_id)` derives its state from a sha512 of the
    # string, so the color is identical across runs *and* processes (unlike
    # `hash(chip_id)`, which PYTHONHASHSEED salts per process), and the global
    # RNG stream that drives the solver is left untouched.
    rng = random.Random(chip_id)
    return (
        rng.uniform(0.3, 0.9),
        rng.uniform(0.3, 0.9),
        rng.uniform(0.3, 0.9),
    )


def visualize_layout_with_bridges(
    layout: Dict[str, Chiplet],
    problem: LayoutProblem,
    output_file: str = "layout_with_bridges.png",
    show_bridges: bool = True,
    show_coordinates: bool = True,
) -> None:
    """Visualize chiplets and directly adjacent EMIB bridge regions."""
    try:
        import matplotlib.pyplot as plt
        from matplotlib.patches import Rectangle
    except ImportError:
        print("matplotlib is not installed; skip layout visualization")
        return

    plt.rcParams["font.sans-serif"] = ["Arial", "Helvetica", "DejaVu Sans", "Liberation Sans", "sans-serif"]
    plt.rcParams["axes.unicode_minus"] = False

    if not layout:
        print("Error: no chiplet data")
        return

    chiplets = list(layout.values())
    x_min = min(chip.x for chip in chiplets)
    y_min = min(chip.y for chip in chiplets)
    x_max = max(chip.x + chip.width for chip in chiplets)
    y_max = max(chip.y + chip.height for chip in chiplets)
    margin = max((x_max - x_min), (y_max - y_min)) * 0.1

    fig, ax = plt.subplots(1, 1, figsize=(12, 10))

    for chip_id, chip in layout.items():
        rect = Rectangle(
            (chip.x, chip.y),
            chip.width,
            chip.height,
            linewidth=2,
            edgecolor="black",
            facecolor=generate_color(chip_id),
            alpha=0.6,
            label=chip_id,
        )
        ax.add_patch(rect)

        center_x = chip.x + chip.width / 2
        center_y = chip.y + chip.height / 2
        ax.text(
            center_x,
            center_y,
            chip_id,
            ha="center",
            va="center",
            fontsize=12,
            fontweight="bold",
            color="black",
            bbox=dict(boxstyle="round,pad=0.3", facecolor="white", alpha=0.8),
        )

        ax.text(
            center_x, chip.y - 1,
            f"{chip.width}x{chip.height}",
            ha="center", va="top",
            fontsize=9, color="darkblue",
        )
        if show_coordinates:
            ax.text(
                chip.x, chip.y + chip.height + 0.5,
                f"({chip.x:.1f}, {chip.y:.1f})",
                ha="left", va="bottom",
                fontsize=8, color="darkgreen",
            )

    if show_bridges:
        try:
            # Real per-edge EMIB geometry instead of the fixed 1x1 boxes in
            # Bridge_Overlap_Adjustment: length runs along the shared edge,
            # width (2 * EMIB_bump_width) across it, and up/down neighbours get
            # a 90-degree rotated rectangle -- compute_bridge_rects() already
            # returns the final x/y extents with that rotation applied.
            for bridge in compute_bridge_rects(layout, problem):
                x_min_b, y_min_b, x_max_b, y_max_b = bridge["rect"]
                width_b = x_max_b - x_min_b
                height_b = y_max_b - y_min_b

                ax.add_patch(
                    Rectangle(
                        (x_min_b, y_min_b),
                        width_b,
                        height_b,
                        linewidth=1,
                        edgecolor="red",
                        facecolor="yellow",
                        alpha=0.5,
                        linestyle="--",
                    )
                )
        except Exception as exc:
            print(f"Warning: failed to render bridges - {exc}")

    ax.set_xlim(x_min - margin, x_max + margin)
    ax.set_ylim(y_min - margin, y_max + margin)
    ax.set_aspect("equal")
    ax.grid(True, alpha=0.3, linestyle="--")
    ax.set_xlabel("X Coordinate", fontsize=12)
    ax.set_ylabel("Y Coordinate", fontsize=12)
    title = f"Chiplet Layout Visualization ({len(layout)} chiplets"
    if show_bridges:
        title += f", {problem.connection_graph.number_of_edges()} connections"
    title += ")"
    ax.set_title(title, fontsize=14, fontweight="bold")

    legend_text = "Legend:\n"
    legend_text += "• Black border = Chiplet boundary\n"
    legend_text += "• Semi-transparent fill = Chiplet area"
    if show_bridges:
        legend_text += "\n• Red dashed box = Silicon bridge area\n"
        legend_text += "• Yellow semi-transparent = Bridge occupancy"
    ax.text(
        0.02,
        0.98,
        legend_text,
        transform=ax.transAxes,
        fontsize=10,
        verticalalignment="top",
        bbox=dict(boxstyle="round", facecolor="wheat", alpha=0.8),
    )

    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    print(f"\n✓ Layout visualization saved to: {output_path}")
    print(f"  - Number of chiplets: {len(layout)}")
    print(f"  - Number of connections: {problem.connection_graph.number_of_edges()}")
    print(f"  - Layout dimensions: {x_max - x_min:.1f} x {y_max - y_min:.1f}")
    print(f"  - Layout area: {(x_max - x_min) * (y_max - y_min):.1f}")
    plt.close()
