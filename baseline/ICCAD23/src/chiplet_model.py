import json
import networkx as nx
from typing import Dict, List, Tuple, Optional


MIN_OVERLAP = 1
EPSILON = 1e-9


class Chiplet:
    """A rectangular chiplet with position, size, rotation, and power."""

    def __init__(self, chip_id: str, width: float, height: float,
                 x: float = 0.0, y: float = 0.0, rotation: bool = 0, power: float = 0.0):
        self.id = chip_id
        self.width = width
        self.height = height
        self.x = x
        self.y = y
        self.rotation = rotation
        self.power = power

    def get_bounds(self) -> Tuple[float, float, float, float]:
        """Return (x_min, y_min, x_max, y_max)."""
        return (self.x, self.y, self.x + self.width, self.y + self.height)

    def __repr__(self) -> str:
        return (f"Chiplet(id='{self.id}', width={self.width}, height={self.height}, "
                f"x={self.x}, y={self.y}, rotation={self.rotation}, power={self.power})")


class LayoutProblem:
    """Represents a complete chiplet placement problem."""

    def __init__(self):
        self.chiplets: Dict[str, Chiplet] = {}
        self.connection_graph: nx.Graph = nx.Graph()  # EMIB connections only (wireCount > 255)
        self.all_connections: List[Dict] = []          # all connections for wirelength calculation

    def add_chiplet(self, chiplet: Chiplet) -> None:
        self.chiplets[chiplet.id] = chiplet
        self.connection_graph.add_node(chiplet.id)

    def add_connection(self, chip_id1: str, chip_id2: str, weight: float = 1.0) -> None:
        if chip_id1 in self.chiplets and chip_id2 in self.chiplets:
            self.connection_graph.add_edge(chip_id1, chip_id2, weight=weight)
        else:
            raise ValueError(f"Chiplet '{chip_id1}' or '{chip_id2}' not found")

    def get_chiplet(self, chip_id: str) -> Optional[Chiplet]:
        return self.chiplets.get(chip_id)

    def get_neighbors(self, chip_id: str) -> List[str]:
        if chip_id in self.connection_graph:
            return list(self.connection_graph.neighbors(chip_id))
        return []

    def get_connection_weight(self, chip_id1: str, chip_id2: str) -> Optional[float]:
        if self.connection_graph.has_edge(chip_id1, chip_id2):
            return self.connection_graph[chip_id1][chip_id2].get('weight', 1.0)
        return None

    def is_cyclic(self) -> bool:
        try:
            nx.find_cycle(self.connection_graph)
            return True
        except nx.exception.NetworkXNoCycle:
            return False

    def __repr__(self) -> str:
        return (f"LayoutProblem(chiplets={len(self.chiplets)}, "
                f"connections={self.connection_graph.number_of_edges()})")


def load_problem_from_json(file_path: str) -> LayoutProblem:
    """
    Load a LayoutProblem from a JSON file.

    Expected JSON format:
    {
        "dies": [{"id": "A", "width": 10, "height": 20}, ...],
        "connections": [["A", "B"], ["B", "C", 0.5], ...]
    }
    Each connection supports 2 elements [chip1, chip2] or 3 elements [chip1, chip2, weight].
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    problem = LayoutProblem()

    if 'dies' not in data:
        raise KeyError("JSON must contain a 'dies' field")

    for die_data in data['dies']:
        if 'id' not in die_data or 'width' not in die_data or 'height' not in die_data:
            raise KeyError("Each die must have 'id', 'width', and 'height' fields")
        chiplet = Chiplet(
            chip_id=die_data['id'],
            width=float(die_data['width']),
            height=float(die_data['height']),
            x=float(die_data.get('x', 0.0)),
            y=float(die_data.get('y', 0.0)),
            power=float(die_data.get('power', 0.0)),
        )
        problem.add_chiplet(chiplet)

    for connection in data.get('connections', []):
        if len(connection) == 2:
            problem.add_connection(connection[0], connection[1])
        elif len(connection) == 3:
            problem.add_connection(connection[0], connection[1], float(connection[2]))
        else:
            raise ValueError("Each connection must be [chip1, chip2] or [chip1, chip2, weight]")

    return problem


# ==================== Layout validation ====================

def has_overlap(chip1: Chiplet, chip2: Chiplet) -> bool:
    """Return True if the two chiplets overlap (using EPSILON tolerance)."""
    x1_min, y1_min, x1_max, y1_max = chip1.get_bounds()
    x2_min, y2_min, x2_max, y2_max = chip2.get_bounds()
    x_overlap = not (x1_max <= x2_min + EPSILON or x2_max <= x1_min + EPSILON)
    y_overlap = not (y1_max <= y2_min + EPSILON or y2_max <= y1_min + EPSILON)
    return x_overlap and y_overlap


def get_adjacency_info(chip1: Chiplet, chip2: Chiplet) -> Tuple[bool, float, str]:
    """
    Check whether two chiplets are adjacent and return the shared edge length.

    Returns:
        (is_adjacent, overlap_length, direction)
        direction: 'right' | 'left' | 'top' | 'bottom' | 'none'
        'right' means chip1 is to the left of chip2 (chip1.x_max == chip2.x_min).
    """
    x1_min, y1_min, x1_max, y1_max = chip1.get_bounds()
    x2_min, y2_min, x2_max, y2_max = chip2.get_bounds()

    # chip1 left of chip2
    if abs(x1_max - x2_min) < EPSILON:
        overlap_length = min(y1_max, y2_max) - max(y1_min, y2_min)
        if overlap_length >= MIN_OVERLAP - EPSILON:
            return True, overlap_length, 'right'

    # chip1 right of chip2
    if abs(x1_min - x2_max) < EPSILON:
        overlap_length = min(y1_max, y2_max) - max(y1_min, y2_min)
        if overlap_length >= MIN_OVERLAP - EPSILON:
            return True, overlap_length, 'left'

    # chip1 below chip2
    if abs(y1_max - y2_min) < EPSILON:
        overlap_length = min(x1_max, x2_max) - max(x1_min, x2_min)
        if overlap_length >= MIN_OVERLAP - EPSILON:
            return True, overlap_length, 'top'

    # chip1 above chip2
    if abs(y1_min - y2_max) < EPSILON:
        overlap_length = min(x1_max, x2_max) - max(x1_min, x2_min)
        if overlap_length >= MIN_OVERLAP - EPSILON:
            return True, overlap_length, 'bottom'

    return False, 0.0, 'none'


def is_layout_valid(layout: Dict[str, Chiplet], problem: LayoutProblem,
                    verbose: bool = False) -> bool:
    """
    Validate a layout against two rules:
      1. No overlap between any pair of chiplets.
      2. Every EMIB-connected pair must be physically adjacent with shared edge >= MIN_OVERLAP.
    """
    chip_list = list(layout.values())
    n = len(chip_list)

    if verbose:
        print(f"Validating layout with {n} chiplets...")

    # Rule 1: no overlap
    for i in range(n):
        for j in range(i + 1, n):
            chip1, chip2 = chip_list[i], chip_list[j]
            if has_overlap(chip1, chip2):
                if verbose:
                    print(f"  FAIL overlap: {chip1.id} vs {chip2.id} "
                          f"{chip1.get_bounds()} {chip2.get_bounds()}")
                return False

    # Rule 2: adjacency for connected pairs
    for chip_id1, chip_id2 in problem.connection_graph.edges():
        if chip_id1 not in layout or chip_id2 not in layout:
            if verbose:
                print(f"  FAIL missing: {chip_id1} or {chip_id2} not in layout")
            return False

        is_adjacent, overlap_length, direction = get_adjacency_info(
            layout[chip_id1], layout[chip_id2]
        )

        if not is_adjacent:
            if verbose:
                print(f"  FAIL not adjacent: {chip_id1} - {chip_id2}")
            return False

        if overlap_length < MIN_OVERLAP - EPSILON:
            if verbose:
                print(f"  FAIL overlap too short: {chip_id1} - {chip_id2} "
                      f"({overlap_length:.4f} < {MIN_OVERLAP})")
            return False

        if verbose:
            print(f"  OK {chip_id1} - {chip_id2}: dir={direction}, overlap={overlap_length:.2f}")

    if verbose:
        print("Layout is valid.")
    return True


if __name__ == "__main__":
    problem = LayoutProblem()
    for cid, w, h, p in [("A", 10, 20, 12.3), ("B", 15, 25, 5.6), ("C", 12, 18, 8.9)]:
        problem.add_chiplet(Chiplet(cid, w, h, power=p))
    problem.add_connection("A", "B")
    problem.add_connection("B", "C")
    print(problem)
    for chiplet in problem.chiplets.values():
        print(" ", chiplet)