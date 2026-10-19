"""Utility helpers for JSON IO, metrics, and layout visualization."""

import json
from typing import Dict, List, Tuple, Optional
from chiplet_model import LayoutProblem, Chiplet
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.patches import Rectangle, FancyBboxPatch


def calculate_wirelength(layout: Dict[str, Chiplet], problem: LayoutProblem) -> float:
    """Return total Euclidean wirelength over connected chip pairs."""
    if not layout or not problem.connection_graph.edges():
        return 0.0
    
    total_wirelength = 0.0
    
    # Iterate over all connections
    for chip1_id, chip2_id in problem.connection_graph.edges():
        # Get chip objects
        chip1 = layout.get(chip1_id)
        chip2 = layout.get(chip2_id)
        
        if chip1 is None or chip2 is None:
            continue
        
        # Compute chip centers
        center1_x = chip1.x + chip1.width / 2
        center1_y = chip1.y + chip1.height / 2
        center2_x = chip2.x + chip2.width / 2
        center2_y = chip2.y + chip2.height / 2
        
        # Euclidean distance between centers
        distance = ((center2_x - center1_x) ** 2 + (center2_y - center1_y) ** 2) ** 0.5
        
        # Accumulate wirelength
        total_wirelength += distance
    
    return total_wirelength


def calculate_manhattan_wirelength(layout: Dict[str, Chiplet], problem: LayoutProblem) -> float:
    """Return total Manhattan-style wirelength with compatibility fallback.

    Uses the newer `wirelength` module when available, otherwise falls back
    to a simple center-based Manhattan sum.
    """
    try:
        # Use new wirelength implementation if available
        from wirelength import calculate_manhattan_wirelength as calc_wl_new
        total_wl, _, _ = calc_wl_new(layout, problem)
        return total_wl
    except ImportError:
        # Fallback for backward compatibility
        if not layout or not problem.connection_graph.edges():
            return 0.0
        
        total_wirelength = 0.0
        
        # Iterate over all connections
        for chip1_id, chip2_id in problem.connection_graph.edges():
            # Get chip objects
            chip1 = layout.get(chip1_id)
            chip2 = layout.get(chip2_id)
            
            if chip1 is None or chip2 is None:
                continue
            
            # Compute chip centers
            center1_x = chip1.x + chip1.width / 2
            center1_y = chip1.y + chip1.height / 2
            center2_x = chip2.x + chip2.width / 2
            center2_y = chip2.y + chip2.height / 2
            
            # Manhattan distance
            distance = abs(center2_x - center1_x) + abs(center2_y - center1_y)
            
            # Accumulate wirelength
            total_wirelength += distance
        
        return total_wirelength


def calculate_layout_utilization(layout: Dict[str, Chiplet]) -> Tuple[float, float, float, float]:
    """Return utilization and bounding-box statistics for a layout."""
    if not layout:
        return 0.0, 0.0, 0.0, 0.0, 0.0
    
    # Bounding box
    chiplets = list(layout.values())
    x_min = min(chip.x for chip in chiplets)
    y_min = min(chip.y for chip in chiplets)
    x_max = max(chip.x + chip.width for chip in chiplets)
    y_max = max(chip.y + chip.height for chip in chiplets)
    
    bbox_width = x_max - x_min
    bbox_height = y_max - y_min
    bbox_area = bbox_width * bbox_height
    
    # Total chip area
    chip_total_area = sum(chip.width * chip.height for chip in chiplets)
    
    # Utilization (%)
    utilization = (chip_total_area / bbox_area * 100) if bbox_area > 0 else 0.0
    
    return utilization, bbox_area, chip_total_area, bbox_width, bbox_height


def best_utilization(tcgs: List, layouts: List[Dict[str, Chiplet]]) -> Tuple[int, Dict[str, Chiplet], float]:
    """Select the layout with the highest area utilization."""
    if not layouts:
        return -1, {}, 0.0
    
    best_index = -1
    best_utilization_value = -1.0
    best_layout = None
    
    for i, layout in enumerate(layouts):
        utilization, bbox_area, chip_area, w, h = calculate_layout_utilization(layout)
        
        if utilization > best_utilization_value:
            best_utilization_value = utilization
            best_index = i
            best_layout = layout
    
    return best_index, best_layout, best_utilization_value


def load_problem_from_json(json_path: str) -> LayoutProblem:
    """Load a `LayoutProblem` from JSON input."""
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    problem = LayoutProblem()
    
    # Add chiplets
    for chip_data in data["chiplets"]:
        chip = Chiplet(
            chip_id=chip_data["name"],
            width=chip_data["width"],
            height=chip_data["height"],
            power=chip_data.get("power", 0.0)  # Load power if provided
        )
        problem.add_chiplet(chip)
    
    # Add connections
    num_emib_connections = 0  # EMIB connections (wireCount > 255)
    num_normal_connections = 0  # Normal connections (wireCount <= 255)
    
    for conn in data["connections"]:
        wire_count = conn.get("wireCount", 1)
        node1 = conn["node1"]
        node2 = conn["node2"]
        
        # Store all connections (including normal ones) in all_connections
        problem.all_connections.append({
            "node1": node1,
            "node2": node2,
            "wireCount": wire_count,
            "EMIBType": conn.get("EMIBType", "interfaceB"),
            "EMIB_length": conn.get("EMIB_length", 0.8533),
            "EMIB_max_width": conn.get("EMIB_max_width", 3.0),
            "EMIB_bump_width": conn.get("EMIB_bump_width", 1.0)
        })
        
        # Only EMIB links (wireCount > 255) are added for placement optimization
        if wire_count > 255:
            problem.add_connection(node1, node2, weight=1.0)
            # Store wireCount and EMIB_length in edge attributes
            problem.connection_graph[node1][node2]["wireCount"] = wire_count
            problem.connection_graph[node1][node2]["EMIB_length"] = conn.get("EMIB_length", 1.0)
            num_emib_connections += 1
        else:
            num_normal_connections += 1
    
    print(f"✓ Loaded from {json_path}: {len(data['chiplets'])} chiplets, "
          f"{num_emib_connections} EMIB connections (wireCount>255), "
          f"{num_normal_connections} normal connections (wireCount<=255)")
    
    return problem


def save_problem_to_json(problem: LayoutProblem, json_path: str):
    """Save a `LayoutProblem` to JSON."""
    data = {
        "chiplets": [],
        "connections": []
    }
    
    # Save chiplet info
    for name, chip in problem.chiplets.items():
        data["chiplets"].append({
            "name": chip.id,
            "width": chip.width,
            "height": chip.height
        })
    
    # Save connections
    for edge in problem.connection_graph.edges():
        data["connections"].append([edge[0], edge[1]])
    
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2)
    
    print(f"✓ Saved to {json_path}: {len(data['chiplets'])}chiplets, {len(data['connections'])}connections")


def save_layout_to_json(layout: Dict[str, Chiplet], json_path: str):
    # TODO: adapt to the new JSON schema
    """Save a layout dictionary to JSON."""
    data = {
        "chiplets": []
    }
    
    for name, chip in layout.items():
        data["chiplets"].append({
            "id": chip.id,
            "width": chip.width,
            "height": chip.height,
            "x": chip.x,
            "y": chip.y
        })
    
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2)
    
    print(f"✓ Saved layout to {json_path}: {len(layout)}chiplets")



def load_emib_types(emib_json_path: str = None) -> Dict[str, Dict]:
    """Load EMIB type definitions from JSON or fallback defaults."""
    import os
    
    # If no path is given, try default locations
    if emib_json_path is None:
        # Try multiple candidate paths
        possible_paths = [
            "../../../benchmark/test_input/EMIB.json",
            "../../benchmark/test_input/EMIB.json",
            "../benchmark/test_input/EMIB.json",
            "benchmark/test_input/EMIB.json"
        ]
        
        for path in possible_paths:
            if os.path.exists(path):
                emib_json_path = path
                break
        
        if emib_json_path is None:
            # If not found, return defaults
            return {
                "interfaceA": {"LinearIODensity": 1200, "max_Reach_length": 1},
                "interfaceB": {"LinearIODensity": 300, "max_Reach_length": 5},
                "interfaceC": {"LinearIODensity": 40, "max_Reach_length": 100}
            }
    
    try:
        with open(emib_json_path, 'r', encoding='utf-8') as f:
            emib_data = json.load(f)
        
        emib_types = {}
        for emib_type in emib_data.get('EMIBTypes', []):
            type_name = emib_type['name']
            emib_types[type_name] = {
                'LinearIODensity': emib_type.get('LinearIODensity', 300),
                'max_Reach_length': emib_type.get('max_Reach_length', 5),
                'Gbps': emib_type.get('Gbps', 5),
                'AreaIODensity': emib_type.get('AreaIODensity', 300)
            }
        
        return emib_types
    except Exception as e:
        print(f"  Warning: failed to load EMIB.json: {e}; using defaults")
        return {
            "interfaceA": {"LinearIODensity": 1200, "max_Reach_length": 1},
            "interfaceB": {"LinearIODensity": 300, "max_Reach_length": 5},
            "interfaceC": {"LinearIODensity": 40, "max_Reach_length": 100}
        }


def save_result(Layout: Dict[str,Chiplet], json_path: str, problem: LayoutProblem = None):  
    """Save layout results to JSON, including EMIB bridge metadata."""
    import os
    from chiplet_model import get_adjacency_info
    from wirelength import get_bridge_center, calculate_manhattan_wirelength
    from TCG import get_layout_bounds
    
    os.makedirs(os.path.dirname(json_path), exist_ok=True)

    data = {
        "chiplets": []      
    }
    
    # Save chiplet info
    for name, chip in Layout.items():
        data["chiplets"].append({
            "name": chip.id,
            "x-position": chip.x,
            "y-position": chip.y,
            "width": chip.width,
            "height": chip.height,
            "rotation": getattr(chip, 'rotation', 0),
            "power": getattr(chip, 'power', 0.0)
        })
    
    # If `problem` is provided, append EMIB connection info and stats
    if problem is not None:
        data["connections"] = []
        
        # Load EMIB type definitions
        emib_types = load_emib_types()
        
        # Collect all connections (EMIB + normal)
        if hasattr(problem, 'all_connections') and problem.all_connections:
            # New format: all_connections
            connections_to_process = problem.all_connections
        else:
            # Legacy format: connection_graph
            connections_to_process = []
            for chip1_id, chip2_id in problem.connection_graph.edges():
                edge_data = problem.connection_graph[chip1_id][chip2_id]
                conn = {
                    'node1': chip1_id,
                    'node2': chip2_id,
                    'wireCount': edge_data.get('wireCount', 256),
                    'EMIBType': edge_data.get('EMIBType', 'interfaceB'),
                    'EMIB_max_width': edge_data.get('EMIB_max_width', 3.0),
                    'EMIB_bump_width': edge_data.get('EMIB_bump_width', 1.0)
                }
                connections_to_process.append(conn)
        
        # Process each connection (export only EMIB: wireCount > 255)
        for conn in connections_to_process:
            chip1_id = conn['node1']
            chip2_id = conn['node2']
            wire_count = conn.get('wireCount', 1)
            
            # Export only EMIB connections
            if wire_count <= 255:
                continue
            
            chip1 = Layout.get(chip1_id)
            chip2 = Layout.get(chip2_id)
            
            if chip1 is None or chip2 is None:
                continue
            
            # Get adjacency info
            is_adj, overlap_len, direction = get_adjacency_info(chip1, chip2)
            
            # Compute bridge center for centered placement
            bridge_center_x, bridge_center_y = get_bridge_center(chip1, chip2, direction)
            
            # Bridge rotation: 0=horizontal, 1=vertical
            if direction in ['left', 'right']:
                emib_rotation = 1  # Vertical bridge
            else:
                emib_rotation = 0  # Horizontal bridge
            
            # Bridge parameters
            emib_type = conn.get('EMIBType', 'interfaceB')
            emib_bump_width = conn.get('EMIB_bump_width', 1.0)
            
            # EMIB_length: required minimum shared-edge length (from input)
            emib_length = conn.get('EMIB_length', 0.8533)
            
            # EMIB_width: actual bridge length = EMIB_bump_width * 2
            emib_width = emib_bump_width * 2.0
            
            # Compute bridge lower-left coordinate (centered on shared edge)
            if emib_rotation == 1:  # Vertical bridge (left/right adjacency)
                emib_x = bridge_center_x - emib_width / 2.0
                emib_y = bridge_center_y - emib_length / 2.0
            else:  # Horizontal bridge (top/bottom adjacency)
                emib_x = bridge_center_x - emib_length / 2.0
                emib_y = bridge_center_y - emib_width / 2.0
            
            # max_Reach_length from type definition
            emib_info = emib_types.get(emib_type, emib_types.get('interfaceB'))
            max_reach_length = emib_info.get('max_Reach_length', 5)
            
            connection_data = {
                "node1": chip1_id,
                "node2": chip2_id,
                "EMIBType": emib_type,
                "EMIB_length": emib_length,  # Required minimum shared-edge length
                "EMIB_max_width": max_reach_length,
                "EMIB_width": emib_width,  # Actual bridge length
                "EMIB_bump_width": emib_bump_width,
                "EMIB-x-position": emib_x,  # Lower-left X
                "EMIB-y-position": emib_y,  # Lower-left Y
                "EMIB-rotation": emib_rotation
            }
            data["connections"].append(connection_data)
        
        # Compute and append summary statistics
        try:
            # Wirelength
            total_wl, emib_wl, normal_wl = calculate_manhattan_wirelength(Layout, problem)
            data["wirelength"] = total_wl
        except Exception as e:
            print(f"  Warning: failed to compute wirelength: {e}")
            data["wirelength"] = 0.0
        
        # Area/aspect ratio
        try:
            x_min, y_min, x_max, y_max = get_layout_bounds(Layout)
            width = x_max - x_min
            height = y_max - y_min
            area = width * height
            aspect_ratio = width / height if height > 0 else 1.0
            
            data["area"] = area
            data["aspect_ratio"] = round(aspect_ratio, 2)
        except Exception as e:
            print(f"  Warning: failed to compute area: {e}")
            data["area"] = 0.0
            data["aspect_ratio"] = 1.0

    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

    if problem and "connections" in data:
        print(f"✓ Saved result to {json_path}: {len(Layout)} chiplets, {len(data['connections'])} EMIB connections")
    else:
        print(f"✓ Saved result to {json_path}: {len(Layout)} chiplets")


def load_layout_from_json(json_path: str) -> Dict[str, Chiplet]:
    """Load a layout dictionary from JSON."""
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    layout = {}
    
    for chip_data in data["chiplets"]:
        chip = Chiplet(
            chip_id=chip_data["id"],
            width=chip_data["width"],
            height=chip_data["height"],
            power=chip_data.get("power", 0.0)  # Load power if provided
        )
        chip.x = chip_data["x"]
        chip.y = chip_data["y"]
        layout[chip_data["id"]] = chip
    
    print(f"✓ Loaded layout from {json_path}: {len(layout)} chiplets")
    
    return layout


def print_layout_summary(layout: Dict[str, Chiplet], problem: LayoutProblem = None):
    """Print a compact summary of layout geometry and wirelength."""
    print("\nLayout Summary:")
    print("=" * 60)
    
    # Bounding box
    x_coords = [chip.x for chip in layout.values()]
    y_coords = [chip.y for chip in layout.values()]
    x_max = max(chip.x + chip.width for chip in layout.values())
    y_max = max(chip.y + chip.height for chip in layout.values())
    
    bbox_width = x_max - min(x_coords)
    bbox_height = y_max - min(y_coords)
    
    print(f"Number of chiplets: {len(layout)}")
    print(f"Bounding box: ({min(x_coords):.1f}, {min(y_coords):.1f}) → ({x_max:.1f}, {y_max:.1f})")
    print(f"Total width: {bbox_width:.1f}")
    print(f"Total height: {bbox_height:.1f}")
    print(f"Bounding box area: {bbox_width * bbox_height:.1f}")
    
    # Total chip area
    total_chip_area = sum(chip.width * chip.height for chip in layout.values())
    utilization = (total_chip_area / (bbox_width * bbox_height)) * 100 if bbox_width * bbox_height > 0 else 0
    
    print(f"Total chip area: {total_chip_area:.1f}")
    print(f"Area utilization: {utilization:.1f}%")
    
    # If problem is provided, show wirelength details
    if problem is not None:
        euclidean_wl = calculate_wirelength(layout, problem)
        manhattan_wl = calculate_manhattan_wirelength(layout, problem)
        num_connections = problem.connection_graph.number_of_edges()
        
        print(f"\nWirelength Information:")
        print(f"Number of connections: {num_connections}")
        print(f"Total wirelength (Euclidean): {euclidean_wl:.2f}")
        print(f"Total wirelength (Manhattan): {manhattan_wl:.2f}")
        if num_connections > 0:
            print(f"Average wirelength (Euclidean): {euclidean_wl / num_connections:.2f}")
            print(f"Average wirelength (Manhattan): {manhattan_wl / num_connections:.2f}")
    
    print("\nChip positions:")
    print("-" * 60)
    for name in sorted(layout.keys()):
        chip = layout[name]
        print(f"  {name:6s}: ({chip.x:6.1f}, {chip.y:6.1f}) | Size: {chip.width:4.1f} × {chip.height:4.1f}")
    print("=" * 60)


def create_example_problem() -> LayoutProblem:
    """Create a small example problem for quick testing."""
    problem = LayoutProblem()
    
    # Create 5 chiplets
    chips = [
        Chiplet(chip_id="A", width=8, height=8),
        Chiplet(chip_id="B", width=10, height=10),
        Chiplet(chip_id="C", width=12, height=8),
        Chiplet(chip_id="D", width=10, height=12),
        Chiplet(chip_id="E", width=8, height=10),
    ]
    
    for chip in chips:
        problem.add_chiplet(chip)
    
    # Add connections
    connections = [
        ("A", "B"),
        ("B", "C"),
        ("C", "D"),
        ("D", "E"),
        ("A", "E"),
        ("B", "D"),
    ]
    
    for conn in connections:
        problem.add_connection(conn[0], conn[1])
    
    return problem


def generate_color(chip_id: str):
    """Generate a deterministic color for a chip ID."""
    import random
    # Local RNG: `random.Random(chip_id)` derives its state from a sha512 of the
    # string, so the color is identical across runs *and* processes (unlike
    # `hash(chip_id)`, which PYTHONHASHSEED salts per process), and the global
    # RNG stream that drives the solver is left untouched.
    rng = random.Random(chip_id)

    # Keep colors reasonably bright
    r = rng.uniform(0.3, 0.9)
    g = rng.uniform(0.3, 0.9)
    b = rng.uniform(0.3, 0.9)

    return (r, g, b)


def visualize_layout_with_bridges(layout: Dict[str, Chiplet], 
                                   problem: LayoutProblem,
                                   output_file: str = 'layout_with_bridges.png',
                                   show_bridges: bool = True,
                                   show_coordinates: bool = True):
    """Visualize chiplet layout and EMIB bridges, then save as PNG."""
    from bridge_legality import bridge_specs_from_problem, layout_bridge_rects
    
    # Font configuration
    plt.rcParams['font.sans-serif'] = ['Arial', 'Helvetica', 'DejaVu Sans', 'Liberation Sans', 'sans-serif']
    plt.rcParams['axes.unicode_minus'] = False
    
    if not layout:
        print("Error: no chiplet data")
        return
    
    # Layout bounds
    chiplets = list(layout.values())
    x_min = min(chip.x for chip in chiplets)
    y_min = min(chip.y for chip in chiplets)
    x_max = max(chip.x + chip.width for chip in chiplets)
    y_max = max(chip.y + chip.height for chip in chiplets)
    
    # Margin
    margin = max((x_max - x_min), (y_max - y_min)) * 0.1
    
    # Figure
    fig, ax = plt.subplots(1, 1, figsize=(12, 10))
    
    # Draw chiplets
    for chip_id, chip in layout.items():
        x, y = chip.x, chip.y
        width, height = chip.width, chip.height
        
        # Color
        color = generate_color(chip_id)
        
        # Rectangle
        rect = Rectangle(
            (x, y), width, height,
            linewidth=2,
            edgecolor='black',
            facecolor=color,
            alpha=0.6,
            label=chip_id
        )
        ax.add_patch(rect)
        
        # Chip ID label (center)
        center_x = x + width / 2
        center_y = y + height / 2
        ax.text(
            center_x, center_y, chip_id,
            ha='center', va='center',
            fontsize=12, fontweight='bold',
            color='black',
            bbox=dict(boxstyle='round,pad=0.3', facecolor='white', alpha=0.8)
        )
        
        # Size annotation
        size_text = f"{width}x{height}"
        ax.text(
            center_x, y - 1,
            size_text,
            ha='center', va='top',
            fontsize=9,
            color='darkblue'
        )
        
        # Coordinate annotation
        if show_coordinates:
            coord_text = f"({x:.1f}, {y:.1f})"
            ax.text(
                x, y + height + 0.5,
                coord_text,
                ha='left', va='bottom',
                fontsize=8,
                color='darkgreen'
            )
    
    # Draw bridges
    if show_bridges:
        try:
            # Real per-edge EMIB geometry, not the 1x1 placeholder used by
            # Bridge_Overlap_Adjustment.SiliconBridge: EMIB_length runs ALONG
            # the shared edge and 2 * EMIB_bump_width runs ACROSS it.  For
            # up/down neighbours (horizontal shared edge) that means the
            # rectangle is rotated 90 degrees -- along x across instead of
            # across x along -- and layout_bridge_rects() applies exactly that
            # rotation, centred on the shared boundary.
            specs = bridge_specs_from_problem(problem)
            bridges, bridge_errors = layout_bridge_rects(layout, specs)

            for bridge in bridges:
                x_min_b, y_min_b, x_max_b, y_max_b = bridge['rect']
                width_b = x_max_b - x_min_b
                height_b = y_max_b - y_min_b

                # Bridge rectangle (width/height already include the rotation
                # above, so up/down bridges come out tall and narrow).
                bridge_rect = Rectangle(
                    (x_min_b, y_min_b), width_b, height_b,
                    linewidth=1,
                    edgecolor='red',
                    facecolor='yellow',
                    alpha=0.5,
                    linestyle='--'
                )
                ax.add_patch(bridge_rect)

            for err in bridge_errors:
                print(f"  ⚠ bridge geometry: {err}")
        except Exception as e:
            print(f"Warning: failed to render bridges - {e}")
    
    # Axes
    ax.set_xlim(x_min - margin, x_max + margin)
    ax.set_ylim(y_min - margin, y_max + margin)
    ax.set_aspect('equal')
    ax.grid(True, alpha=0.3, linestyle='--')
    ax.set_xlabel('X Coordinate', fontsize=12)
    ax.set_ylabel('Y Coordinate', fontsize=12)
    
    # Title
    title = f'Chiplet Layout Visualization ({len(layout)} chiplets'
    if show_bridges:
        title += f', {problem.connection_graph.number_of_edges()} connections'
    title += ')'
    ax.set_title(title, fontsize=14, fontweight='bold')
    
    # Legend
    legend_text = 'Legend:\n'
    legend_text += '• Black border = Chiplet boundary\n'
    legend_text += '• Semi-transparent fill = Chiplet area'
    if show_bridges:
        legend_text += '\n• Red dashed box = Silicon bridge area\n'
        legend_text += '• Yellow semi-transparent = Bridge occupancy'
    
    ax.text(
        0.02, 0.98, legend_text,
        transform=ax.transAxes,
        fontsize=10,
        verticalalignment='top',
        bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.8)
    )
    
    # Save image
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"\n✓ Layout visualization saved to: {output_file}")
    print(f"  - Number of chiplets: {len(layout)}")
    print(f"  - Number of connections: {problem.connection_graph.number_of_edges()}")
    print(f"  - Layout dimensions: {x_max - x_min:.1f} x {y_max - y_min:.1f}")
    print(f"  - Layout area: {(x_max - x_min) * (y_max - y_min):.1f}")
    
    plt.close()


def save_layout_image(layout: Dict[str, Chiplet],
                     problem: LayoutProblem,
                     output_file: str,
                     show_bridges: bool = True,
                     show_coordinates: bool = False):
    """Simplified wrapper for saving layout visualization images."""
    visualize_layout_with_bridges(
        layout=layout,
        problem=problem,
        output_file=output_file,
        show_bridges=show_bridges,
        show_coordinates=show_coordinates
    )


def save_convergence_curve(trace: List[Tuple[float, float, float]],
                           output_file: str,
                           title: str = "SA convergence",
                           log_scale: bool = False) -> Optional[str]:
    """Plot an SA convergence trace (cost vs annealing time) and save it as PNG.

    Args:
        trace: `(elapsed_seconds, current_cost, best_cost)` records, as
            collected by `overall_sa(..., trace=...)`.
        output_file: PNG path to write.
        title: Figure title.
        log_scale: Log-scale the cost axis (useful when the initial cost is
            orders of magnitude above the final one).

    Returns:
        The output path, or None when `trace` is empty.

    All figure text is English on purpose: this environment has no CJK font
    installed for matplotlib, so Chinese labels would render as boxes.
    """
    if not trace:
        return None

    times = [t for t, _, _ in trace]
    current = [c for _, c, _ in trace]
    best = [b for _, _, b in trace]

    fig, ax = plt.subplots(figsize=(7.5, 4.5), dpi=150)
    ax.plot(times, current, color='#8c98a4', linewidth=0.8, alpha=0.75,
            label='Current cost')
    ax.plot(times, best, color='#c0392b', linewidth=1.8,
            label='Best cost so far')

    # `best` never increases, so the first index holding the final value is the
    # moment that value was reached -- worth marking, it is what SA costs time for.
    t_best = times[best.index(best[-1])]
    ax.axvline(t_best, color='#c0392b', linewidth=0.8, linestyle=':', alpha=0.6)
    ax.annotate(f"best={best[-1]:.6f} at {t_best:.2f}s",
                xy=(0.98, 0.06), xycoords='axes fraction',
                ha='right', va='bottom', fontsize=9, color='#c0392b')

    ax.set_xlabel('Annealing time (s)')
    ax.set_ylabel('Cost')
    ax.set_title(title, fontsize=11)
    if log_scale:
        ax.set_yscale('log')
    ax.grid(True, linestyle='--', alpha=0.3)
    ax.legend(loc='upper right', fontsize=9)
    fig.tight_layout()
    fig.savefig(output_file, bbox_inches='tight')
    plt.close(fig)
    return output_file


if __name__ == "__main__":
    # Example tests
    print("Unit tests - utility functions")
    print("=" * 70)
    
    # Test 1: load problem from JSON
    print("\nTest 1: Load problem from JSON")
    print("-" * 70)
    problem = load_problem_from_json("../test_input/12core.json")
    print(f"Chiplets: {list(problem.chiplets.keys())}")
    print(f"Connections: {len(list(problem.connection_graph.edges()))}")
    
    # Test 2: save problem to JSON
    print("\nTest 2: Save problem to JSON")
    print("-" * 70)
    save_problem_to_json(problem, "test_output_problem.json")
    
    # Test 3: load layout from JSON
    print("\nTest 3: Load layout from JSON")
    print("-" * 70)
    from TCG import generate_layout_from_tcg  
    from Generate_initial_TCG import generate_initial_TCG

    layout = generate_layout_from_tcg(generate_initial_TCG(problem), problem)
    print_layout_summary(layout, problem)
    
    # Test 3.1: calculate wirelength
    print("\nTest 3.1: Calculate wirelength")
    print("-" * 70)
    euclidean_wl = calculate_wirelength(layout, problem)
    manhattan_wl = calculate_manhattan_wirelength(layout, problem)
    print(f"Euclidean wirelength: {euclidean_wl:.2f}")
    print(f"Manhattan wirelength: {manhattan_wl:.2f}")
    
    # Test 4: save layout
    print("\nTest 4: Save layout to JSON")
    print("-" * 70)
    save_layout_to_json(layout, "test_output_layout.json")
    
    # Test 5: visualize layout and bridges
    print("\nTest 5: Visualize layout and bridges")
    print("-" * 70)
    visualize_layout_with_bridges(
        layout, 
        problem, 
        output_file='../output/layout_with_bridges.png',
        show_bridges=True,
        show_coordinates=True
    )
    
    print("\n✓ All tests completed")



