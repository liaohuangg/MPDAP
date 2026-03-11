import math
from typing import Dict, Tuple
from chiplet_model import Chiplet, LayoutProblem, get_adjacency_info, EPSILON


def get_bridge_center(chip1: Chiplet, chip2: Chiplet, direction: str) -> Tuple[float, float]:
    """Return the center of the silicon bridge between two adjacent chiplets."""
    x1_min, y1_min, x1_max, y1_max = chip1.get_bounds()
    x2_min, y2_min, x2_max, y2_max = chip2.get_bounds()
    
    if direction == 'right':  # chip1 is to the right of chip2, shared vertical edge
        bridge_x = x1_max
        y_overlap_start = max(y1_min, y2_min)
        y_overlap_end = min(y1_max, y2_max)
        bridge_y = (y_overlap_start + y_overlap_end) / 2
        return bridge_x, bridge_y
    
    elif direction == 'left':  # chip1 is to the left of chip2, shared vertical edge
        bridge_x = x1_min
        y_overlap_start = max(y1_min, y2_min)
        y_overlap_end = min(y1_max, y2_max)
        bridge_y = (y_overlap_start + y_overlap_end) / 2
        return bridge_x, bridge_y
    
    elif direction == 'top':  # chip1 is above chip2, shared horizontal edge
        x_overlap_start = max(x1_min, x2_min)
        x_overlap_end = min(x1_max, x2_max)
        bridge_x = (x_overlap_start + x_overlap_end) / 2
        bridge_y = y1_max
        return bridge_x, bridge_y
    
    elif direction == 'bottom':  # chip1 is below chip2, shared horizontal edge
        x_overlap_start = max(x1_min, x2_min)
        x_overlap_end = min(x1_max, x2_max)
        bridge_x = (x_overlap_start + x_overlap_end) / 2
        bridge_y = y1_min
        return bridge_x, bridge_y
    
    else:
        # Not adjacent; return midpoint between the two chiplet centers
        center1_x = (x1_min + x1_max) / 2
        center1_y = (y1_min + y1_max) / 2
        center2_x = (x2_min + x2_max) / 2
        center2_y = (y2_min + y2_max) / 2
        return (center1_x + center2_x) / 2, (center1_y + center2_y) / 2


def get_grid_points(chip: Chiplet, grid_size: int = 16) -> list:
    """Return the center points of a grid_size x grid_size uniform grid over the chiplet."""
    x_min, y_min, x_max, y_max = chip.get_bounds()
    
    points = []
    for i in range(grid_size):
        for j in range(grid_size):
            x = x_min + (x_max - x_min) * (i + 0.5) / grid_size
            y = y_min + (y_max - y_min) * (j + 0.5) / grid_size
            points.append((x, y))
    
    return points


def calculate_emib_wirelength(chip1: Chiplet, chip2: Chiplet, wire_count: int) -> float:
    """Calculate the total wirelength for an EMIB (silicon bridge) connection.

    Each of the wire_count wires connects a grid point on chip1 and chip2 to
    the bridge center (Euclidean distance).  Grid points are reused cyclically
    when wire_count exceeds the number of grid points (256).
    """
    is_adjacent, overlap_length, direction = get_adjacency_info(chip1, chip2)
    bridge_center_x, bridge_center_y = get_bridge_center(chip1, chip2, direction)
    grid_points_1 = get_grid_points(chip1, grid_size=16)
    grid_points_2 = get_grid_points(chip2, grid_size=16)
    
    total_wirelength = 0.0
    
    # Sum distances from chip1 grid points to bridge center
    for wire_idx in range(wire_count):
        point_idx = wire_idx % len(grid_points_1)
        point_x, point_y = grid_points_1[point_idx]
        distance = math.sqrt((point_x - bridge_center_x)**2 + (point_y - bridge_center_y)**2)
        total_wirelength += distance
    
    # Sum distances from chip2 grid points to bridge center
    for wire_idx in range(wire_count):
        point_idx = wire_idx % len(grid_points_2)
        point_x, point_y = grid_points_2[point_idx]
        distance = math.sqrt((point_x - bridge_center_x)**2 + (point_y - bridge_center_y)**2)
        total_wirelength += distance
    
    return total_wirelength


def calculate_normal_wirelength(chip1: Chiplet, chip2: Chiplet, wire_count: int) -> float:
    """Calculate wirelength for a normal connection (Manhattan distance * wire_count)."""
    x1_min, y1_min, x1_max, y1_max = chip1.get_bounds()
    x2_min, y2_min, x2_max, y2_max = chip2.get_bounds()
    
    center1_x = (x1_min + x1_max) / 2
    center1_y = (y1_min + y1_max) / 2
    center2_x = (x2_min + x2_max) / 2
    center2_y = (y2_min + y2_max) / 2
    
    manhattan_distance = abs(center2_x - center1_x) + abs(center2_y - center1_y)
    return manhattan_distance * wire_count


def calculate_manhattan_wirelength(layout: Dict[str, Chiplet], problem: LayoutProblem) -> Tuple[float, float, float]:
    """Calculate total wirelength of a layout, split into EMIB and normal wirelengths.

    Returns:
        (total_wirelength, emib_wirelength, normal_wirelength)
    """
    if not layout:
        return 0.0, 0.0, 0.0
    
    emib_wirelength = 0.0
    normal_wirelength = 0.0
    
    all_conns = getattr(problem, 'all_connections', [])
    
    if not all_conns:
        # Fallback: read from connection_graph for backward compatibility
        if not problem.connection_graph.edges():
            return 0.0, 0.0, 0.0
        
        for chip1_id, chip2_id in problem.connection_graph.edges():
            chip1 = layout.get(chip1_id)
            chip2 = layout.get(chip2_id)
            
            if chip1 is None or chip2 is None:
                continue
            
            edge_data = problem.connection_graph[chip1_id][chip2_id]
            wire_count = edge_data.get('wireCount', 1)
            
            if wire_count > 255:
                wirelength = calculate_emib_wirelength(chip1, chip2, wire_count)
                emib_wirelength += wirelength
            else:
                wirelength = calculate_normal_wirelength(chip1, chip2, wire_count)
                normal_wirelength += wirelength
    else:
        for conn in all_conns:
            chip1_id = conn['node1']
            chip2_id = conn['node2']
            wire_count = conn['wireCount']
            
            chip1 = layout.get(chip1_id)
            chip2 = layout.get(chip2_id)
            
            if chip1 is None or chip2 is None:
                continue
            
            if wire_count > 255:  # EMIB connection
                wirelength = calculate_emib_wirelength(chip1, chip2, wire_count)
                emib_wirelength += wirelength
            else:  # normal connection
                wirelength = calculate_normal_wirelength(chip1, chip2, wire_count)
                normal_wirelength += wirelength
    
    total_wirelength = emib_wirelength + normal_wirelength
    
    return total_wirelength, emib_wirelength, normal_wirelength
