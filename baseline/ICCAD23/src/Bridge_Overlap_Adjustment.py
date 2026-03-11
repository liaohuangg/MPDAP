
"""
Silicon Bridge Overlap Detection

Detects conflicts in silicon bridge physical areas within chiplet layouts.
Bridges connect adjacent chiplets with area MIN_OVERLAP × bridge_length.
"""

from typing import Dict, List, Tuple, Optional
from chiplet_model import Chiplet, LayoutProblem, get_adjacency_info, MIN_OVERLAP

# Fixed length of silicon bridge (along chip boundary)
SILICONBRIDGE_LENGTH = 1


class SiliconBridge:
    """
    Silicon bridge connecting two adjacent chiplets.
    
    Rectangle with size bridge_width × SILICONBRIDGE_LENGTH.
    - bridge_width: perpendicular to boundary (default MIN_OVERLAP, adjustable)
    - SILICONBRIDGE_LENGTH: across boundary (fixed)
    
    Positioned at center of overlap edge, can slide along it.
    """
    
    def __init__(self, chip1_id: str, chip2_id: str, chip1: Chiplet, chip2: Chiplet, 
                 bridge_width: Optional[float] = None):
        """
        Initialize silicon bridge.
        
        Args:
            chip1_id: ID of first chip
            chip2_id: ID of second chip
            chip1: First chiplet object
            chip2: Second chiplet object
            bridge_width: Bridge width (optional, default MIN_OVERLAP)
        """
        self.chip1_id = chip1_id
        self.chip2_id = chip2_id
        
        # Check if chiplets are adjacent
        is_adj, overlap_len, direction = get_adjacency_info(chip1, chip2)
        
        if not is_adj:
            raise ValueError(f"Chiplets {chip1_id} and {chip2_id} are not adjacent")
        
        # Set bridge width (default MIN_OVERLAP)
        self.bridge_width = bridge_width if bridge_width is not None else MIN_OVERLAP
        
        # Check if overlap edge is long enough for bridge
        if overlap_len < self.bridge_width:
            raise ValueError(f"Overlap length {overlap_len:.2f} is too short for silicon bridge width {self.bridge_width:.2f}")
        
        self.direction = direction  # Direction from chip1 to chip2
        self.bridge_length = SILICONBRIDGE_LENGTH
        
        # Calculate overlap edge range
        if direction in ['left', 'right']:
            # Vertical overlap edge
            self.overlap_start = max(chip1.y, chip2.y)
            self.overlap_end = min(chip1.y + chip1.height, chip2.y + chip2.height)
        else:  # 'top' or 'bottom'
            # Horizontal overlap edge
            self.overlap_start = max(chip1.x, chip2.x)
            self.overlap_end = min(chip1.x + chip1.width, chip2.x + chip2.width)
        
        # Bridge center position (default: center of overlap edge, adjustable)
        self.bridge_center = (self.overlap_start + self.overlap_end) / 2.0
        
        # Compute bounding box
        self._compute_bounding_box(chip1, chip2)
    
    def _compute_bounding_box(self, chip1: Chiplet, chip2: Chiplet):
        """
        Compute bounding box of silicon bridge.
        
        Bridge spans gap between chips:
        - Perpendicular to boundary: width = bridge_width, centered
        - Along boundary: length = SILICONBRIDGE_LENGTH, centered at overlap edge
        """
        bridge_half_length = self.bridge_length / 2.0
        bridge_start = self.bridge_center - bridge_half_length
        bridge_end = self.bridge_center + bridge_half_length
        
        half_width = self.bridge_width / 2.0
        
        if self.direction == 'right':
            # chip1 left, chip2 right (horizontal adjacency)
            boundary = chip1.x + chip1.width
            self.x_min = boundary - bridge_half_length
            self.x_max = boundary + bridge_half_length
            self.y_min = self.bridge_center - half_width
            self.y_max = self.bridge_center + half_width
            
        elif self.direction == 'left':
            # chip1 right, chip2 left (horizontal adjacency)
            boundary = chip1.x
            self.x_min = boundary - bridge_half_length
            self.x_max = boundary + bridge_half_length
            self.y_min = self.bridge_center - half_width
            self.y_max = self.bridge_center + half_width
            
        elif self.direction == 'top':
            # chip1 bottom, chip2 top (vertical adjacency)
            boundary = chip1.y + chip1.height
            self.y_min = boundary - bridge_half_length
            self.y_max = boundary + bridge_half_length
            self.x_min = self.bridge_center - half_width
            self.x_max = self.bridge_center + half_width
            
        elif self.direction == 'bottom':
            # chip1 top, chip2 bottom (vertical adjacency)
            boundary = chip1.y
            self.y_min = boundary - bridge_half_length
            self.y_max = boundary + bridge_half_length
            self.x_min = self.bridge_center - half_width
            self.x_max = self.bridge_center + half_width
    
    def get_bounding_box(self) -> Tuple[float, float, float, float]:
        """Get bounding box of silicon bridge."""
        return (self.x_min, self.y_min, self.x_max, self.y_max)
    
    def __repr__(self) -> str:
        return (f"SiliconBridge({self.chip1_id}-{self.chip2_id}, "
                f"bbox=({self.x_min:.1f},{self.y_min:.1f})-({self.x_max:.1f},{self.y_max:.1f}))")


def rectangles_overlap(rect1: Tuple[float, float, float, float], 
                       rect2: Tuple[float, float, float, float]) -> bool:
    """Check if two rectangles overlap."""
    x1_min, y1_min, x1_max, y1_max = rect1
    x2_min, y2_min, x2_max, y2_max = rect2
    
    overlap_x = not (x1_max <= x2_min or x2_max <= x1_min)
    overlap_y = not (y1_max <= y2_min or y2_max <= y1_min)
    
    return overlap_x and overlap_y


def generate_silicon_bridges(layout: Dict[str, Chiplet], 
                             problem: LayoutProblem) -> List[SiliconBridge]:
    """Generate all silicon bridges from layout and connection requirements."""
    bridges = []
    
    for chip1_id, chip2_id in problem.connection_graph.edges():
        chip1 = layout[chip1_id]
        chip2 = layout[chip2_id]
        
        is_adj, _, _ = get_adjacency_info(chip1, chip2)
        
        if not is_adj:
            continue
        
        try:
            bridge = SiliconBridge(chip1_id, chip2_id, chip1, chip2)
            bridges.append(bridge)
        except ValueError:
            continue
    
    return bridges


def SiliconBridge_is_legal(layout: Dict[str, Chiplet], 
                           problem: LayoutProblem, 
                           verbose: bool = False) -> bool:
    """
    Check if silicon bridge layout is legal (no overlaps).
    
    Each bridge is a MIN_OVERLAP × bridge_length rectangle.
    """
    if verbose:
        print("\n" + "=" * 60)
        print("Silicon Bridge Legality Check")
        print("=" * 60)
    
    bridges = generate_silicon_bridges(layout, problem)
    
    if verbose:
        print(f"\nGenerated {len(bridges)} silicon bridges:")
        for i, bridge in enumerate(bridges, 1):
            bbox = bridge.get_bounding_box()
            print(f"  [{i}] {bridge.chip1_id}-{bridge.chip2_id}: "
                  f"bbox=({bbox[0]:.1f},{bbox[1]:.1f})-({bbox[2]:.1f},{bbox[3]:.1f}), "
                  f"width={bridge.bridge_width:.2f}, length={bridge.bridge_length:.2f}, "
                  f"area={bridge.bridge_width * bridge.bridge_length:.2f}")
    
    # Check for overlaps between any two bridges
    all_legal = True
    conflict_count = 0
    
    for i in range(len(bridges)):
        for j in range(i + 1, len(bridges)):
            bridge1 = bridges[i]
            bridge2 = bridges[j]
            
            bbox1 = bridge1.get_bounding_box()
            bbox2 = bridge2.get_bounding_box()
            
            if rectangles_overlap(bbox1, bbox2):
                all_legal = False
                conflict_count += 1
                
                if verbose:
                    print(f"\n✗ Overlap detected:")
                    print(f"  Bridge1: {bridge1.chip1_id}-{bridge1.chip2_id}")
                    print(f"    bbox: ({bbox1[0]:.1f}, {bbox1[1]:.1f}) to ({bbox1[2]:.1f}, {bbox1[3]:.1f})")
                    print(f"  Bridge2: {bridge2.chip1_id}-{bridge2.chip2_id}")
                    print(f"    bbox: ({bbox2[0]:.1f}, {bbox2[1]:.1f}) to ({bbox2[2]:.1f}, {bbox2[3]:.1f})")
    
    if verbose:
        print("\n" + "=" * 60)
        if all_legal:
            print("✓ Legal: All bridges are non-overlapping")
        else:
            print(f"✗ Illegal: {conflict_count} bridge overlap(s) found")
        print("=" * 60)
    
    return all_legal


# Examples and tests
if __name__ == "__main__":
    from chiplet_model import Chiplet, LayoutProblem
    
    print("Silicon Bridge Legality Check - Examples")
    print("=" * 60)
    
    # Example 1: Layout causing bridge overlap
    print("\nExample 1: Bridge Overlap Case")
    print("-" * 60)
    
    problem1 = LayoutProblem()
    
    # Create T-shaped layout
    #   [C]
    # [A][B]
    chips1 = [
        Chiplet("A", 10, 10, x=0, y=0),
        Chiplet("B", 10, 10, x=10, y=0),
        Chiplet("C", 10, 10, x=10, y=10),
    ]
    
    for chip in chips1:
        problem1.add_chiplet(chip)
    
    # Add connections: A-B (horizontal) and B-C (vertical)
    problem1.add_connection("A", "B")
    problem1.add_connection("B", "C")
    
    layout1 = {chip.id: chip for chip in chips1}
    
    is_legal1 = SiliconBridge_is_legal(layout1, problem1, verbose=True)
    print(f"\nExample 1 result: {'Legal' if is_legal1 else 'Illegal'}")
    
    # Example 2: Legal bridge layout
    print("\n" + "=" * 60)
    print("Example 2: Legal Bridge Layout")
    print("-" * 60)
    
    problem2 = LayoutProblem()
    
    # Create linear layout
    # [A][B][C]
    chips2 = [
        Chiplet("A", 10, 10, x=0, y=0),
        Chiplet("B", 10, 10, x=10, y=0),
        Chiplet("C", 10, 10, x=20, y=0),
    ]
    
    for chip in chips2:
        problem2.add_chiplet(chip)
    
    # Add connections: A-B and B-C (both horizontal, no overlap)
    problem2.add_connection("A", "B")
    problem2.add_connection("B", "C")
    
    layout2 = {chip.id: chip for chip in chips2}
    
    is_legal2 = SiliconBridge_is_legal(layout2, problem2, verbose=True)
    print(f"\nExample 2 result: {'Legal' if is_legal2 else 'Illegal'}")


