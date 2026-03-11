import networkx as nx
import json
from typing import Dict, List, Tuple, Set, Optional
from chiplet_model import Chiplet, LayoutProblem
from chiplet_model import (
    Chiplet, LayoutProblem, is_layout_valid, 
    has_overlap, get_adjacency_info, MIN_OVERLAP
)
from unit import save_layout_image

class TCG:
    """Transitive Closure Graph for chiplet placement.

    - Ch: horizontal constraints, edge u->v means u is left of v
    - Cv: vertical constraints, edge u->v means u is below v
    """
    
    def __init__(self, chip_ids: List[str] = None):
        """Initialize TCG with optional chip IDs."""
        self.Ch = nx.DiGraph()  # Horizontal constraint graph
        self.Cv = nx.DiGraph()  # Vertical constraint graph
        self.chip_ids = chip_ids if chip_ids else []
        
        # Add nodes if chip IDs are provided
        if chip_ids:
            for chip_id in chip_ids:
                self.Ch.add_node(chip_id)
                self.Cv.add_node(chip_id)
    
    def add_chip(self, chip_id: str) -> None:
        """Add one chip node to both graphs."""
        if chip_id not in self.chip_ids:
            self.chip_ids.append(chip_id)
            self.Ch.add_node(chip_id)
            self.Cv.add_node(chip_id)
    
    def add_horizontal_constraint(self, left_chip: str, right_chip: str) -> None:
        """Add horizontal constraint: left_chip is left of right_chip."""
        self.Ch.add_edge(left_chip, right_chip)
    
    def add_vertical_constraint(self, bottom_chip: str, top_chip: str) -> None:
        """Add vertical constraint: bottom_chip is below top_chip."""
        self.Cv.add_edge(bottom_chip, top_chip)
    
    def is_valid(self) -> Tuple[bool, str]:
        """Validate DAG property and pairwise completeness.

        For every chip pair, exactly one relation must exist across Ch/Cv.
        """
        # Check cycles in Ch
        if not nx.is_directed_acyclic_graph(self.Ch):
            return False, "Horizontal graph Ch contains a cycle"
        
        # Check cycles in Cv
        if not nx.is_directed_acyclic_graph(self.Cv):
            return False, "Vertical graph Cv contains a cycle"
        
        # Check completeness: each pair must have exactly one relation
        n = len(self.chip_ids)
        for i in range(n):
            for j in range(i + 1, n):
                chip_i = self.chip_ids[i]
                chip_j = self.chip_ids[j]
                
                # Count Ch relations: i->j or j->i
                has_ch_edge_ij = self.Ch.has_edge(chip_i, chip_j)
                has_ch_edge_ji = self.Ch.has_edge(chip_j, chip_i)
                ch_constraint_count = sum([has_ch_edge_ij, has_ch_edge_ji])
                
                # Count Cv relations: i->j or j->i
                has_cv_edge_ij = self.Cv.has_edge(chip_i, chip_j)
                has_cv_edge_ji = self.Cv.has_edge(chip_j, chip_i)
                cv_constraint_count = sum([has_cv_edge_ij, has_cv_edge_ji])
                
                # Total constraints for this pair
                total_constraints = ch_constraint_count + cv_constraint_count
                
                # Must be exactly one
                if total_constraints == 0:
                    return False, (f"Chip pair ({chip_i}, {chip_j}) misses a relation:\n"
                                 f"  No edge {chip_i}->{chip_j} or {chip_j}->{chip_i} in Ch\n"
                                 f"  No edge {chip_i}->{chip_j} or {chip_j}->{chip_i} in Cv")
                
                if total_constraints > 1:
                    edges_desc = []
                    if has_ch_edge_ij:
                        edges_desc.append(f"Ch: {chip_i}->{chip_j}")
                    if has_ch_edge_ji:
                        edges_desc.append(f"Ch: {chip_j}->{chip_i}")
                    if has_cv_edge_ij:
                        edges_desc.append(f"Cv: {chip_i}->{chip_j}")
                    if has_cv_edge_ji:
                        edges_desc.append(f"Cv: {chip_j}->{chip_i}")
                    
                    return False, (f"Chip pair ({chip_i}, {chip_j}) is over-constrained with {total_constraints} edges:\n"
                                 f"  {', '.join(edges_desc)}")
        
        return True, "TCG is valid"
    
    def get_sources(self, graph: nx.DiGraph) -> List[str]:
        """Return source nodes (nodes with zero in-degree)."""
        return [node for node in graph.nodes() if graph.in_degree(node) == 0]
    
    def __repr__(self) -> str:
        """String representation of TCG."""
        return (f"TCG(chips={len(self.chip_ids)}, "
                f"h_edges={self.Ch.number_of_edges()}, "
                f"v_edges={self.Cv.number_of_edges()})")


def compute_longest_path_lengths(graph: nx.DiGraph, problem: LayoutProblem, 
                                  dimension: str = 'width') -> Dict[str, float]:
    """Compute longest-path distances from sources in a DAG."""
    # Initialize distances
    distances = {node: 0.0 for node in graph.nodes()}
    
    # Topological order
    try:
        topo_order = list(nx.topological_sort(graph))
    except nx.NetworkXError:
        raise ValueError("Graph contains a cycle; longest path is undefined")
    
    # Dynamic programming over topo order
    for node in topo_order:
        # Current chip
        chip = problem.get_chiplet(node)
        if chip is None:
            raise ValueError(f"Chip {node} is not found in problem")
        
        # Size contribution along selected dimension
        size = chip.width if dimension == 'width' else chip.height
        
        # Relax outgoing edges
        for successor in graph.successors(node):
            new_distance = distances[node] + size
            if new_distance > distances[successor]:
                distances[successor] = new_distance
    
    return distances


def generate_layout_from_tcg(tcg: TCG, problem: LayoutProblem) -> Dict[str, Chiplet]:
    """Generate geometric layout from TCG using longest paths."""
    # Validate TCG
    is_valid, message = tcg.is_valid()
    if not is_valid:
        raise ValueError(f"Invalid TCG: {message}")
    
    # Compute x from Ch (width)
    x_coordinates = compute_longest_path_lengths(tcg.Ch, problem, dimension='width')
    
    # Compute y from Cv (height)
    y_coordinates = compute_longest_path_lengths(tcg.Cv, problem, dimension='height')
    
    # Build output layout
    layout = {}
    
    for chip_id in tcg.chip_ids:
        # Source chip spec
        original_chip = problem.get_chiplet(chip_id)
        if original_chip is None:
            raise ValueError(f"Chip {chip_id} is not found in problem")
        
        # Create chip instance with solved coordinates
        chip = Chiplet(
            chip_id=original_chip.id,
            width=original_chip.width,
            height=original_chip.height,
            x=x_coordinates[chip_id],
            y=y_coordinates[chip_id]
        )
        
        layout[chip_id] = chip
    
    return layout


def get_layout_bounds(layout: Dict[str, Chiplet]) -> Tuple[float, float, float, float]:
    """Return layout bounding box as (x_min, y_min, x_max, y_max)."""
    if not layout:
        return (0, 0, 0, 0)
    
    x_min = min(chip.x for chip in layout.values())
    y_min = min(chip.y for chip in layout.values())
    x_max = max(chip.x + chip.width for chip in layout.values())
    y_max = max(chip.y + chip.height for chip in layout.values())
    
    return (x_min, y_min, x_max, y_max)


def get_layout_area(layout: Dict[str, Chiplet]) -> float:
    """Return layout area based on bounding box."""
    x_min, y_min, x_max, y_max = get_layout_bounds(layout)
    width = x_max - x_min
    height = y_max - y_min
    return width * height


def print_layout_info(layout: Dict[str, Chiplet], title: str = "Layout Info") -> None:
    """Print chip positions and summary statistics."""
    print(f"\n{title}")
    print("=" * 60)
    
    print("\nChip positions:")
    for chip_id, chip in sorted(layout.items()):
        bounds = chip.get_bounds()
        print(f"  {chip_id}: Position({chip.x:.1f}, {chip.y:.1f}), "
              f"Size({chip.width}x{chip.height}), "
              f"Bounds{bounds}")
    
    x_min, y_min, x_max, y_max = get_layout_bounds(layout)
    width = x_max - x_min
    height = y_max - y_min
    area = width * height
    
    print(f"\nLayout statistics:")
    print(f"  Bounding box: ({x_min:.1f}, {y_min:.1f}) to ({x_max:.1f}, {y_max:.1f})")
    print(f"  Width: {width:.1f}")
    print(f"  Height: {height:.1f}")
    print(f"  Area: {area:.1f}")


 