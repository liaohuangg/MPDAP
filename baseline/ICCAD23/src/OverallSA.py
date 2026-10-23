"""
Overall SA (Simulated Annealing) module.

Performs global layout optimization on a BT (B*-Tree) structure.
The SA search uses five perturbation operations:
1. Swap two ECG nodes.
2. Detach one node and reinsert it at a random left/right child slot.
3. Rotate: 90° for single-chip ECG nodes, 180° for multi-chip ECG nodes.
4. Slight Transform: replace by another layout in the same similarity tree.
5. Large Transform: replace by a layout from a different similarity tree.
"""

import copy
import itertools
import math
import random
import time
import os
from typing import List, Dict, Tuple, Optional

from BtTree import BinaryTree, BTNode
from input_ECG import ECG, ECGManager
from chiplet_model import Chiplet, LayoutProblem
from GroupConstrua import SimilarityTree, SimilarityTreeNode, compute_similarity
from TCG import get_layout_bounds, get_layout_area
from unit import (
    calculate_wirelength,
    calculate_layout_utilization,
    save_layout_image,
    save_result,
    save_convergence_curve,
)
from wirelength import calculate_manhattan_wirelength  # New wirelength computation module
from bridge_legality import (
    make_bridge_checker,
    shared_edge,
    bridge_specs,
    layout_bridge_rects,
    bridge_conflicts,
)


# ============================================================================
# BT-Tree node layout initialization
# ============================================================================

def initialize_bt_node_layouts(bt_tree: BinaryTree, ecg_manager: ECGManager):
    """
    Initialize per-node current layout state in BT tree.

    Adds these attributes for each `BTNode`:
    - `current_layout`: current internal chiplet layout `{chip_id: Chiplet}`
    - `current_width` / `current_height`: ECG bounding-box size
    - `rotation`: rotation state
    - `current_tree_idx` / `current_node_idx`: index in similarity forest

    Args:
        bt_tree: BT tree
        ecg_manager: ECG manager
    """
    for node in bt_tree.all_nodes:
        if node.is_single_chiplet:
            # Single-chip ECG: use chip dimensions directly
            chip_id = list(node.ecg.chiplets)[0]
            chiplet = ecg_manager.problem.chiplets[chip_id]
            node.current_width = chiplet.width
            node.current_height = chiplet.height
            node.current_layout = {chip_id: copy.deepcopy(chiplet)}
            node.rotation = 0  # 0,1,2,3 -> 0°,90°,180°,270°
            node.current_tree_idx = -1
            node.current_node_idx = -1
        else:
            # Multi-chip ECG
            node.rotation = 0  # 0: original, 1: rotate 180°
            node.current_tree_idx = 0
            node.current_node_idx = 0

            if (node.similarity_forest
                    and isinstance(node.similarity_forest, list)
                    and len(node.similarity_forest) > 0):
                # Use root layout from the first similarity tree
                tree = node.similarity_forest[0]
                node.current_layout = copy.deepcopy(tree.root.layout)
            else:
                # No similarity forest: generate initial layout for subproblem
                sub_problem = ecg_manager.get_ecg_subproblem(node.ecg.id)
                try:
                    from Generate_initial_TCG import generate_initial_TCG
                    from TCG import generate_layout_from_tcg
                    tcg = generate_initial_TCG(sub_problem)
                    node.current_layout = generate_layout_from_tcg(tcg, sub_problem)
                except Exception:
                    # Final fallback: place chiplets in one row
                    node.current_layout = {}
                    x_offset = 0.0
                    for cid in sorted(node.ecg.chiplets):
                        c = ecg_manager.problem.chiplets[cid]
                        chip_copy = copy.deepcopy(c)
                        chip_copy.x = x_offset
                        chip_copy.y = 0.0
                        node.current_layout[cid] = chip_copy
                        x_offset += c.width

            # Compute bounding box
            if node.current_layout:
                x_min, y_min, x_max, y_max = get_layout_bounds(node.current_layout)
                node.current_width = x_max - x_min
                node.current_height = y_max - y_min
            else:
                node.current_width = 0
                node.current_height = 0


# ============================================================================
# Contour-based B*-Tree Packing
# ============================================================================

class ContourLine:
    """
    Contour line data structure for B*-tree packing.

    Maintains a piecewise-constant skyline to quickly query placement height.
    """

    def __init__(self):
        self.segments: List[Tuple[float, float, float]] = []  # [(x_start, x_end, height), ...]

    def get_max_height(self, x_start: float, x_end: float) -> float:
        """Query max contour height within `[x_start, x_end)`."""
        max_h = 0.0
        for seg_s, seg_e, seg_h in self.segments:
            if seg_s < x_end and seg_e > x_start:
                max_h = max(max_h, seg_h)
        return max_h

    def update(self, x_start: float, x_end: float, height: float):
        """Set contour height to `height` within `[x_start, x_end)`."""
        new_segments = []

        for seg_s, seg_e, seg_h in self.segments:
            if seg_e <= x_start or seg_s >= x_end:
                # No overlap, keep segment
                new_segments.append((seg_s, seg_e, seg_h))
            else:
                # Overlap exists, clip segment
                if seg_s < x_start:
                    new_segments.append((seg_s, x_start, seg_h))
                if seg_e > x_end:
                    new_segments.append((x_end, seg_e, seg_h))

        new_segments.append((x_start, x_end, height))
        new_segments.sort(key=lambda s: s[0])
        self.segments = new_segments


_EPS = 1e-6


def _ecg_bridge_specs(ecg: ECG, ecg_manager: ECGManager):
    """
    Return `(specs, {frozenset({id_a, id_b}): EMIB_length})` for one ECG.

    Cached on the manager rather than on the BT node: `op_swap_nodes` moves the
    `ecg` attribute between nodes, so a per-node cache would go stale.
    """
    cache = getattr(ecg_manager, '_bridge_spec_cache', None)
    if cache is None:
        cache = {}
        ecg_manager._bridge_spec_cache = cache

    if ecg.id not in cache:
        specs = []
        try:
            sub_problem = ecg_manager.get_ecg_subproblem(ecg.id)
        except Exception:
            sub_problem = None
        if sub_problem is not None:
            specs = bridge_specs(getattr(sub_problem, 'all_connections', []))
        lengths = {frozenset((s['node1'], s['node2'])): float(s['along'])
                   for s in specs}
        cache[ecg.id] = (specs, lengths)

    return cache[ecg.id]


def _pack_ecg_rigid(node: BTNode, x0: float,
                    contour: 'ContourLine') -> Optional[Dict[str, Tuple[float, float]]]:
    """
    Place an ECG as one rigid block: the pre-per-die behaviour.

    Kept as the fallback for a local layout whose dies cannot be re-legalized
    after they are moved independently.
    """
    layout = getattr(node, 'current_layout', None)
    w = getattr(node, 'current_width', 0)
    h = getattr(node, 'current_height', 0)
    if not layout or w <= 0 or h <= 0:
        return None

    chips = list(layout.values())
    local_x_min = min(c.x for c in chips)
    local_y_min = min(c.y for c in chips)

    # The whole bounding box sits on the highest contour point it covers.
    y0 = contour.get_max_height(x0, x0 + w)
    contour.update(x0, x0 + w, y0 + h)

    return {c.id: (x0 + (c.x - local_x_min), y0 + (c.y - local_y_min))
            for c in chips}


def _pack_ecg(node: BTNode, x0: float, contour: 'ContourLine',
              ecg_manager: ECGManager) -> Optional[Dict[str, Tuple[float, float]]]:
    """
    Pack one ECG against the contour, die by die (paper §III-D2).

    A die may descend to the contour under its own x-range instead of the whole
    ECG being lifted to the maximum over its bounding box. Two steps mirror the
    paper's packing scheme:

    - dummy-node step: each die's lower bound is the contour over its x-range,
      i.e. the contour segments participate in the placement directly;
    - Cv EMIB-legalization step: the vertical relations of the frozen local
      layout are re-established on the moved dies, so every bridge inside this
      ECG survives the independent vertical movement. Stacked bridges keep
      exact contact (their two dies stay locked); side-by-side bridges keep at
      least the bridge's `EMIB_length` of overlap along the shared edge.

    Constraints are difference constraints, so the lowest feasible placement is
    a longest path from the contour bounds. Bridges that compaction slides into
    each other at a die corner are handled by pinning those bridge pairs back
    to their local offsets (the paper's bridge-overlap adjustment, §III-B2-3).
    The contour is then updated with this ECG's real silhouette, which lets
    later nodes use the hollows the ECG leaves behind rather than being blocked
    by its bounding box.

    Returns None when the local layout is inconsistent, the constraint graph
    has a positive cycle, or a bridge conflict survives the adjustment; the
    caller falls back to the rigid block placement.
    """
    layout = getattr(node, 'current_layout', None)
    if not layout:
        return None

    chips = list(layout.values())
    ids = [c.id for c in chips]

    local_x_min = min(c.x for c in chips)
    gx = {c.id: x0 + (c.x - local_x_min) for c in chips}
    w = {c.id: c.width for c in chips}
    h = {c.id: c.height for c in chips}

    # Difference constraints, all written as `y[v] >= y[u] + weight`.
    edges: List[Tuple[str, str, float]] = []

    # Vertical order between x-overlapping dies, as in the local layout.
    for i, a in enumerate(ids):
        ca = layout[a]
        for b in ids[i + 1:]:
            cb = layout[b]
            ox = min(gx[a] + w[a], gx[b] + w[b]) - max(gx[a], gx[b])
            if ox <= _EPS:
                continue
            if ca.y + h[a] <= cb.y + _EPS:
                edges.append((a, b, h[a]))
            elif cb.y + h[b] <= ca.y + _EPS:
                edges.append((b, a, h[b]))
            else:
                return None  # the local layout itself overlaps

    # EMIB constraints: stacked bridges lock exact contact, side-by-side
    # bridges bound how far the two dies may slide vertically.
    specs, lengths = _ecg_bridge_specs(node.ecg, ecg_manager)
    for pair, length in lengths.items():
        a, b = tuple(pair)
        if a not in layout or b not in layout:
            continue

        info = shared_edge(layout[a], layout[b])
        if info is None:
            return None  # a bridge without a shared edge: not re-legalizable

        if info[0] == 'UD':
            lower, upper = (a, b) if layout[a].y <= layout[b].y else (b, a)
            edges.append((upper, lower, -h[lower]))
        else:  # 'LR': overlap along y must stay >= the bridge length
            lo, hi = (a, b) if layout[a].y <= layout[b].y else (b, a)
            edges.append((hi, lo, length - h[lo]))

    def _solve(frozen):
        """Longest path from the contour bounds, plus `frozen` contact pairs.

        Bellman-Ford, because the contact constraints carry negative weights.
        Returns None on a positive cycle (constraints unsatisfiable).
        """
        yy = {cid: contour.get_max_height(gx[cid], gx[cid] + w[cid])
              for cid in ids}
        all_edges = list(edges)
        for a, b in frozen:
            # Keep this bridge pair at the vertical offset it has in the
            # (already legal) local layout.
            dy = layout[b].y - layout[a].y
            all_edges.append((a, b, dy))
            all_edges.append((b, a, -dy))

        for _ in range(len(ids) + 1):
            changed = False
            for u, v, weight in all_edges:
                candidate = yy[u] + weight
                if candidate > yy[v] + _EPS:
                    yy[v] = candidate
                    changed = True
            if not changed:
                return yy
        return None  # positive cycle: the constraints cannot be satisfied

    y = _solve(())
    if y is None:
        return None

    # Bridge overlap adjustment (paper §III-B2-3). Compaction can slide two
    # bridges that meet at a die corner into each other. Pin the vertical
    # offset of the bridge pairs involved back to the local layout -- the
    # local arrangement is known to be conflict-free -- and re-solve. A layout
    # that still conflicts falls back to the rigid block placement.
    if len(specs) > 1:
        name_to_pair = {f"{s['node1']}-{s['node2']}": (s['node1'], s['node2'])
                        for s in specs}
        frozen = set()
        for _round in range(3):
            trial = {cid: Chiplet(chip_id=cid, width=w[cid], height=h[cid],
                                  x=gx[cid], y=y[cid]) for cid in ids}
            bridges, errors = layout_bridge_rects(trial, specs)
            if errors:
                return None
            conflicts = bridge_conflicts(bridges)
            if not conflicts:
                break

            added = False
            for conflict in conflicts:
                for name in conflict['pair']:
                    pair = name_to_pair.get(name)
                    if (pair is None or pair in frozen
                            or pair[0] not in layout or pair[1] not in layout):
                        continue
                    frozen.add(pair)
                    added = True
            if not added:
                return None
            y = _solve(frozen)
            if y is None:
                return None
        else:
            trial = {cid: Chiplet(chip_id=cid, width=w[cid], height=h[cid],
                                  x=gx[cid], y=y[cid]) for cid in ids}
            bridges, errors = layout_bridge_rects(trial, specs)
            if errors or bridge_conflicts(bridges):
                return None

    # Expose this ECG's true silhouette, not its bounding box. Ascending order
    # keeps the higher die wherever two dies share an x-range (stacked dies).
    for cid in sorted(ids, key=lambda c: y[c] + h[c]):
        contour.update(gx[cid], gx[cid] + w[cid], y[cid] + h[cid])

    return {cid: (gx[cid], y[cid]) for cid in ids}


def _emit_positions(node: BTNode, positions: Dict[str, Tuple[float, float]],
                    out: Dict[str, Chiplet]):
    """Copy one ECG's placed chiplets into the global layout dictionary."""
    layout = node.current_layout
    for chip_id, (x, y) in positions.items():
        chip = layout[chip_id]
        out[chip_id] = Chiplet(
            chip_id=chip.id,
            width=chip.width,
            height=chip.height,
            x=x,
            y=y,
            rotation=chip.rotation,
            power=chip.power,
        )


def generate_global_layout(bt_tree: BinaryTree,
                           ecg_manager: ECGManager) -> Dict[str, Chiplet]:
    """
    Generate global chiplet layout from BT tree.

    B*-tree placement rules are unchanged (root at x=0, left child to the right
    of its parent, right child at the parent's x), but each ECG is packed die
    by die against the contour instead of being translated as one rectangular
    block. An ECG's local layout is still frozen; only its dies' y-coordinates
    are recomputed, under the constraints that keep its bridges legal.

    Falls back to the rigid block placement per ECG when the per-die placement
    cannot be re-legalized.

    Args:
        bt_tree: BT tree
        ecg_manager: ECG manager

    Returns:
        Global layout dictionary `{chip_id: Chiplet}`
    """
    if bt_tree.root is None:
        return {}

    contour = ContourLine()
    global_layout: Dict[str, Chiplet] = {}

    def _place(node: BTNode, parent_x: float, parent_width: float,
               is_left_child: bool):
        """Recursive DFS packing, one ECG at a time."""
        if node is None:
            return

        w = getattr(node, 'current_width', 0)
        h = getattr(node, 'current_height', 0)
        if w <= 0 or h <= 0:
            return

        if is_left_child:
            # Left child: right side of parent
            x = parent_x + parent_width
        else:
            # Right child: same x as parent
            x = parent_x

        positions = _pack_ecg(node, x, contour, ecg_manager)
        if positions is None:
            positions = _pack_ecg_rigid(node, x, contour)
        if positions is not None:
            _emit_positions(node, positions, global_layout)

        # Pack left child first, then right child
        _place(node.left_child, x, w, True)
        _place(node.right_child, x, w, False)

    root = bt_tree.root
    rw = getattr(root, 'current_width', 0)
    rh = getattr(root, 'current_height', 0)
    if rw <= 0 or rh <= 0:
        return global_layout

    positions = _pack_ecg(root, 0.0, contour, ecg_manager)
    if positions is None:
        positions = _pack_ecg_rigid(root, 0.0, contour)
    if positions is not None:
        _emit_positions(root, positions, global_layout)

    _place(root.left_child, 0.0, rw, True)
    _place(root.right_child, 0.0, rw, False)

    return global_layout


# ============================================================================
# SA perturbation operations
# ============================================================================

def _find_parent(root: BTNode, target: BTNode) -> Optional[BTNode]:
    """Find parent of `target` in BT tree."""
    if root is None or root is target:
        return None
    if root.left_child is target or root.right_child is target:
        return root
    result = _find_parent(root.left_child, target)
    if result:
        return result
    return _find_parent(root.right_child, target)


def _collect_all_nodes(root: BTNode) -> List[BTNode]:
    """Collect all nodes in subtree rooted at `root`."""
    if root is None:
        return []
    return [root] + _collect_all_nodes(root.left_child) + _collect_all_nodes(root.right_child)


def op_swap_nodes(bt_tree: BinaryTree) -> bool:
    """
    Operation 1: swap two ECG nodes.

    Swaps ECG/layout-related data while keeping tree structure unchanged.

    Returns:
        Whether operation succeeds
    """
    if len(bt_tree.all_nodes) < 2:
        return False

    n1, n2 = random.sample(bt_tree.all_nodes, 2)

    # Swap ECG data, layout, forest references, etc.
    swap_attrs = [
        'ecg', 'is_single_chiplet', 'similarity_forest',
        'current_layout', 'current_width', 'current_height',
        'rotation', 'current_tree_idx', 'current_node_idx',
    ]
    for attr in swap_attrs:
        if hasattr(n1, attr) and hasattr(n2, attr):
            v1, v2 = getattr(n1, attr), getattr(n2, attr)
            setattr(n1, attr, v2)
            setattr(n2, attr, v1)

    return True


def op_move_node(bt_tree: BinaryTree) -> bool:
    """
    Operation 2: detach one node and reinsert at random child slot.

    Changes tree depth and width.

    Returns:
        Whether operation succeeds
    """
    if len(bt_tree.all_nodes) < 2:
        return False

    # Randomly choose a node to move
    node_to_move = random.choice(bt_tree.all_nodes)

    # Detach from tree
    parent = _find_parent(bt_tree.root, node_to_move)

    if parent is None:
        # `node_to_move` is root
        if node_to_move.left_child is None and node_to_move.right_child is None:
            return False  # Only one node
        # Pick one child as new root
        if node_to_move.left_child:
            bt_tree.root = node_to_move.left_child
            orphan = node_to_move.right_child
        else:
            bt_tree.root = node_to_move.right_child
            orphan = None
        # Attach orphan to rightmost branch of new root
        if orphan:
            rightmost = bt_tree.root
            while rightmost.right_child:
                rightmost = rightmost.right_child
            rightmost.right_child = orphan
    else:
        # Non-root node
        replacement = None
        orphan = None
        if node_to_move.left_child and node_to_move.right_child:
            replacement = node_to_move.left_child
            orphan = node_to_move.right_child
            rightmost = replacement
            while rightmost.right_child:
                rightmost = rightmost.right_child
            rightmost.right_child = orphan
        elif node_to_move.left_child:
            replacement = node_to_move.left_child
        elif node_to_move.right_child:
            replacement = node_to_move.right_child

        if parent.left_child is node_to_move:
            parent.left_child = replacement
        else:
            parent.right_child = replacement

    # Clear child references of detached node
    node_to_move.left_child = None
    node_to_move.right_child = None

    # Randomly choose insertion position
    remaining_nodes = _collect_all_nodes(bt_tree.root)
    if not remaining_nodes:
        bt_tree.root = node_to_move
        return True

    target = random.choice(remaining_nodes)
    side = random.choice(['left', 'right'])

    if side == 'left':
        node_to_move.left_child = target.left_child
        target.left_child = node_to_move
    else:
        node_to_move.right_child = target.right_child
        target.right_child = node_to_move

    # Rebuild `all_nodes`
    bt_tree.all_nodes = _collect_all_nodes(bt_tree.root)

    return True


def op_rotate(bt_tree: BinaryTree) -> bool:
    """
    Operation 3: rotation.

    - Single-chip ECG: rotate 90° (swap width/height)
    - Multi-chip ECG: rotate 180° (center symmetry transform)

    Returns:
        Whether operation succeeds
    """
    if not bt_tree.all_nodes:
        return False

    node = random.choice(bt_tree.all_nodes)

    if node.is_single_chiplet:
        # Single-chip ECG: rotate 90° (swap width/height)
        node.current_width, node.current_height = node.current_height, node.current_width
        node.rotation = (getattr(node, 'rotation', 0) + 1) % 4

        if node.current_layout:
            for chip_id, chip in node.current_layout.items():
                chip.width, chip.height = chip.height, chip.width
    else:
        # Multi-chip ECG: rotate 180°
        node.rotation = (getattr(node, 'rotation', 0) + 1) % 2

        if node.current_layout:
            layout = node.current_layout
            x_min, y_min, x_max, y_max = get_layout_bounds(layout)

            for chip_id, chip in layout.items():
                # 180° rotation around bounding-box center
                new_x = x_min + (x_max - chip.x - chip.width)
                new_y = y_min + (y_max - chip.y - chip.height)
                chip.x = new_x
                chip.y = new_y

    return True


def op_slight_transform(bt_tree: BinaryTree) -> bool:
    """
    Operation 4: Slight Transform.

    For multi-chip ECG nodes, replace current layout with another
    layout from the same similarity tree.

    Returns:
        Whether operation succeeds
    """
    # Filter multi-chip ECG nodes with available similarity trees
    candidates = [
        n for n in bt_tree.all_nodes
        if (not n.is_single_chiplet
            and getattr(n, 'similarity_forest', None)
            and isinstance(n.similarity_forest, list)
            and len(n.similarity_forest) > 0)
    ]
    if not candidates:
        return False

    node = random.choice(candidates)

    tree_idx = getattr(node, 'current_tree_idx', 0)
    if tree_idx < 0 or tree_idx >= len(node.similarity_forest):
        tree_idx = 0

    current_tree = node.similarity_forest[tree_idx]
    if len(current_tree.all_nodes) <= 1:
        return False  # Root only, no alternative node

    current_node_idx = getattr(node, 'current_node_idx', 0)
    available = [i for i in range(len(current_tree.all_nodes)) if i != current_node_idx]
    if not available:
        return False

    new_idx = random.choice(available)
    selected = current_tree.all_nodes[new_idx]

    node.current_layout = copy.deepcopy(selected.layout)
    node.current_node_idx = new_idx

    x_min, y_min, x_max, y_max = get_layout_bounds(node.current_layout)
    node.current_width = x_max - x_min
    node.current_height = y_max - y_min

    return True


def op_large_transform(bt_tree: BinaryTree) -> bool:
    """
    Operation 5: Large Transform.

    For multi-chip ECG nodes, replace layout with a random node from
    a different similarity tree.

    Returns:
        Whether operation succeeds
    """
    # Requires at least two trees
    candidates = [
        n for n in bt_tree.all_nodes
        if (not n.is_single_chiplet
            and getattr(n, 'similarity_forest', None)
            and isinstance(n.similarity_forest, list)
            and len(n.similarity_forest) > 1)
    ]
    if not candidates:
        return False

    node = random.choice(candidates)

    current_tree_idx = getattr(node, 'current_tree_idx', 0)
    available_trees = [i for i in range(len(node.similarity_forest)) if i != current_tree_idx]
    if not available_trees:
        return False

    new_tree_idx = random.choice(available_trees)
    new_tree = node.similarity_forest[new_tree_idx]

    new_node_idx = random.randint(0, len(new_tree.all_nodes) - 1)
    selected = new_tree.all_nodes[new_node_idx]

    node.current_layout = copy.deepcopy(selected.layout)
    node.current_tree_idx = new_tree_idx
    node.current_node_idx = new_node_idx

    x_min, y_min, x_max, y_max = get_layout_bounds(node.current_layout)
    node.current_width = x_max - x_min
    node.current_height = y_max - y_min

    return True


# ============================================================================
# Efficient state save/restore (avoid deepcopy on large forests)
# ============================================================================

def _save_sa_state(bt_tree: BinaryTree) -> dict:
    """
    Save mutable BT-tree state for SA rollback.

    Deep-copy only `current_layout`; keep large objects (e.g. similarity
    forests) as references to avoid expensive deep copies.
    """
    state = {
        'root': bt_tree.root,
        'all_nodes': bt_tree.all_nodes[:],
        'node_data': {}
    }
    for node in bt_tree.all_nodes:
        state['node_data'][node.node_id] = {
            'left_child': node.left_child,
            'right_child': node.right_child,
            'ecg': node.ecg,
            'is_single_chiplet': node.is_single_chiplet,
            'similarity_forest': node.similarity_forest,  # read-only reference
            'current_layout': copy.deepcopy(
                getattr(node, 'current_layout', None)),
            'current_width': getattr(node, 'current_width', 0),
            'current_height': getattr(node, 'current_height', 0),
            'rotation': getattr(node, 'rotation', 0),
            'current_tree_idx': getattr(node, 'current_tree_idx', -1),
            'current_node_idx': getattr(node, 'current_node_idx', -1),
        }
    return state


def _restore_sa_state(bt_tree: BinaryTree, state: dict):
    """Restore BT tree from saved state (for SA rollback)."""
    bt_tree.root = state['root']
    bt_tree.all_nodes = state['all_nodes']
    for node in bt_tree.all_nodes:
        data = state['node_data'][node.node_id]
        node.left_child = data['left_child']
        node.right_child = data['right_child']
        node.ecg = data['ecg']
        node.is_single_chiplet = data['is_single_chiplet']
        node.similarity_forest = data['similarity_forest']
        node.current_layout = data['current_layout']
        node.current_width = data['current_width']
        node.current_height = data['current_height']
        node.rotation = data['rotation']
        node.current_tree_idx = data['current_tree_idx']
        node.current_node_idx = data['current_node_idx']


# ============================================================================
# Cost function
# ============================================================================

def compute_overall_cost(global_layout: Dict[str, Chiplet],
                         problem: LayoutProblem,
                         alpha: float = 1.0,
                         beta: float = 0.5,
                         gamma: float = 0.3,
                         target_ratio: float = 1.0) -> float:
    """
    Compute cost of global layout.

    $$Cost = \\alpha \\cdot A + \\beta \\cdot WL + \\gamma \\cdot (R - R^*)^2$$

    Terms:
    - A: bounding-box area
    - WL: total Manhattan wirelength (including EMIB links)
    - R = W / H: layout aspect ratio
    - R*: target aspect ratio

    Args:
        global_layout: Global layout `{chip_id: Chiplet}`
        problem: Layout problem
        alpha: Area term weight
        beta: Wirelength term weight
        gamma: Aspect-ratio penalty weight
        target_ratio: Target aspect ratio `R*`

    Returns:
        Cost value (lower is better)
    """
    if not global_layout:
        return float('inf')

    chips = list(global_layout.values())
    x_min = min(c.x for c in chips)
    y_min = min(c.y for c in chips)
    x_max = max(c.x + c.width for c in chips)
    y_max = max(c.y + c.height for c in chips)

    W = x_max - x_min
    H = y_max - y_min

    if W <= 0 or H <= 0:
        return float('inf')

    # A: bounding-box area
    A = W * H

    # WL: total wirelength (EMIB + regular)
    WL, emib_wl, normal_wl = calculate_manhattan_wirelength(global_layout, problem)

    # R: aspect ratio
    R = W / H

    # Normalize terms to comparable scales
    total_chip_area = sum(c.width * c.height for c in chips)
    norm_A = A / total_chip_area if total_chip_area > 0 else A
    norm_WL = WL / (total_chip_area ** 0.5) if total_chip_area > 0 else WL

    cost = alpha * norm_A + beta * norm_WL + gamma * (R - target_ratio) ** 2
    return cost


# ============================================================================
# Overall SA main algorithm
# ============================================================================

def overall_sa(bt_tree: BinaryTree,
               ecg_manager: ECGManager,
               problem: LayoutProblem,
               max_iterations: Optional[int] = None,
               initial_temp: float = 500.0,
               cooling_rate: float = 0.995,
               alpha: float = 1.0,
               beta: float = 0.5,
               gamma: float = 0.3,
               target_ratio: float = 1.0,
               op_weights: Optional[List[float]] = None,
               verbose: bool = True,
               save_best: bool = True,
               output_dir: str = "../output/OverallSA",
               time_limit: Optional[float] = None,
               trace: Optional[List[Tuple[float, float, float]]] = None,
               stats: Optional[Dict] = None,
               early_stop: bool = False,
               convergence_patience: int = 10000
               ) -> Tuple[Dict[str, Chiplet], float, float]:
    """
    Overall SA optimization for global layout based on BT tree.

    Flow:
    1. Perturb: choose one of five SA operations.
    2. Packing: compute coordinates via BT packing and contour.
    3. Cost: `Cost = α*A + β*WL + γ*(R - R*)²`.
    4. Accept/reject: Metropolis criterion.
    5. Repeat until max iterations or temperature threshold.

    Args:
        bt_tree: Initial BT tree
        ecg_manager: ECG manager
        problem: Global layout problem
        max_iterations: Iteration cap, or None (default) for no cap at all --
            the intended configuration, in which the run ends only on the
            convergence criterion below or on `time_limit`. An iteration count
            is a guess about how long the annealing takes; the cooling schedule
            and the wall clock are not guesses. With no cap, pass a
            `time_limit` so a run that never freezes still terminates.
        initial_temp: Initial temperature
        cooling_rate: Cooling rate (applied every 50 iterations)
        alpha: Area weight α
        beta: Wirelength weight β
        gamma: Aspect-ratio penalty weight γ
        target_ratio: Target aspect ratio `R*` (width/height)
        op_weights: Operation weights `[w1, w2, w3, w4, w5]`
        verbose: Print detailed logs
        save_best: Save best solution to files
        output_dir: Output directory
        time_limit: Wall-clock cap for the whole run in seconds. Once reached,
            the loop stops and the best solution found so far is returned. This
            is the second stopping condition, next to convergence: with no
            iteration cap, a run that never freezes is bounded by the clock
            instead. None (default) means no time cap.
        trace: Optional list to collect the convergence curve. When given, one
            `(elapsed_seconds, current_cost, best_cost)` record is appended per
            iteration, the first one before any move (so the curve starts at
            the initial cost). `elapsed_seconds` is measured from the start of
            the annealing loop, i.e. it excludes the BT tree build. The caller
            owns the list; passing None (default) records nothing.
        stats: Optional dict filled in with what this layer (layer 3, the only
            one optimizing real quality A / WL / R) did: seconds, iterations
            entered, initial cost, accepts/rejects, per-operation counts and
            the time to the best solution.
        early_stop: Run-terminating shortcut on temperature only. False
            (default) means the temperature break is off; the run ends on
            convergence (see below), on `time_limit`, or on `max_iterations`
            when one is passed.
        convergence_patience: Convergence criterion -- the run stops as soon as
            the best cost has not improved for this many consecutive iterations
            (default 10000). This is the stagnation-count rule the pipeline used
            before the sliding-window band test: `no_improve_count` is reset
            every time a new best cost is found, so the run always gets this
            many iterations after its last improvement before it may stop.
            Pass 0 to disable (the run then ends on `time_limit` alone).
            The number of iterations that ended up sitting on the best cost is
            still reported back as `best_hold_fraction` in `stats` (and echoed
            in `stop_reason`) as supporting evidence, alongside
            `last_improve_at`.

    Returns:
        (best_layout, best_cost, best_found_time)
        - best_layout: best bridge-legal layout, or None when no move ever
          produced one
        - best_cost: its cost (float('inf') when best_layout is None)
        - best_found_time: time to best solution (seconds)
    """
    if op_weights is None:
        op_weights = [1.0, 1.0, 1.0, 0.5, 0.3]

    # Normalize to cumulative probabilities
    total_w = sum(op_weights)
    cum_probs = []
    cumsum = 0.0
    for w in op_weights:
        cumsum += w / total_w
        cum_probs.append(cumsum)

    operations = [op_swap_nodes, op_move_node, op_rotate,
                  op_slight_transform, op_large_transform]
    op_names = ["Swap", "Move", "Rotate", "SlightTransform", "LargeTransform"]

    if verbose:
        print("=" * 80)
        print("Overall SA - Global Layout Simulated Annealing")
        print("=" * 80)
        print(f"ECG count: {len(bt_tree.all_nodes)}")
        print(f"Chiplet count: {len(problem.chiplets)}")
        print(f"Connection count: {problem.connection_graph.number_of_edges()}")
        print(f"Iteration cap: {max_iterations if max_iterations is not None else 'none (unbounded)'}, "
              f"T0={initial_temp}, cooling={cooling_rate}")
        print(f"Cost weights: α={alpha}, β={beta}, γ={gamma}, R*={target_ratio}")
        print(f"Operation weights: {op_weights}")
        print("=" * 80 + "\n")

    # ---- Initialization ----
    initialize_bt_node_layouts(bt_tree, ecg_manager)

    # Bridge gate (layer-3 moves too): overlapping EMIB bridges are a physical
    # violation, so a move that produces them is discarded outright and only
    # bridge-legal layouts are eligible to become the best solution.
    bridge_ok = make_bridge_checker(problem)

    current_layout = generate_global_layout(bt_tree, ecg_manager)
    current_cost = compute_overall_cost(current_layout, problem,
                                        alpha, beta, gamma, target_ratio)

    initial_cost = current_cost

    initial_bridge_legal = bridge_ok(current_layout)
    best_layout = copy.deepcopy(current_layout) if initial_bridge_legal else None
    best_cost = current_cost if initial_bridge_legal else float('inf')
    best_found_time = 0.0  # Time when best solution is found (relative)

    # Minimum temperature threshold
    min_temp = 1e-4

    if verbose:
        util, bbox_a, chip_a, bw, bh = calculate_layout_utilization(current_layout)
        wl_total, wl_emib, wl_normal = calculate_manhattan_wirelength(current_layout, problem)
        R_init = bw / bh if bh > 0 else 0
        print(f"Initial layout: area={bbox_a:.1f} ({bw:.1f}×{bh:.1f}), R={R_init:.2f}, "
              f"utilization={util:.1f}%\n"
              f"  Wirelength: total={wl_total:.1f} (EMIB={wl_emib:.1f}, regular={wl_normal:.1f}), "
              f"cost={current_cost:.4f}\n")

    temp = initial_temp
    accept_count = 0
    reject_count = 0
    bridge_reject_count = 0  # moves discarded for overlapping EMIB bridges
    op_success = [0] * 5
    op_total = [0] * 5
    no_improve_count = 0
    iterations_run = 0
    last_improve_at = 0     # iteration index of the most recent best-cost improvement

    # Convergence criterion: no best-cost improvement for `patience` consecutive
    # iterations. `no_improve_count` is bumped at the top of every iteration and
    # reset the moment a new best is found, so it is exactly "iterations since
    # the best cost last moved".
    patience = convergence_patience
    best_hold_total = 0     # iterations that ended sitting on the best cost
    converged = False
    stop_reason = (f"iteration cap ({max_iterations})" if max_iterations is not None
                   else "no iteration cap: neither stagnant nor timed out")

    def _note_iteration():
        """Record one finished iteration.

        Every iteration calls this exactly once, whatever it did. The call
        counts whether the iteration ended sitting on the best cost
        (`best_hold_total`), reported as `best_hold_fraction`: the share of the
        run the incumbent dominated.
        """
        nonlocal best_hold_total
        if (best_layout is not None
                and current_cost <= best_cost + 1e-9 * max(1.0, abs(best_cost))):
            best_hold_total += 1

    start_time = time.perf_counter()  # monotonic: immune to wall-clock jumps (WSL2 resync)

    # First convergence point: the initial layout, at t = 0
    if trace is not None:
        trace.append((0.0, current_cost, best_cost))

    # Unbounded by default: the run ends on the convergence criterion or on the
    # wall-clock limit, never on an iteration count. A finite `max_iterations`
    # is still honoured when the caller passes one.
    iteration_counter = (itertools.count() if max_iterations is None
                         else range(max_iterations))
    for iteration in iteration_counter:
        iterations_run += 1

        # Counted at the top of every iteration (including ones whose move
        # fails below), so this is exactly "iterations since the best cost last
        # improved" -- the quantity the convergence criterion tests.
        no_improve_count += 1

        # Save current state (efficiently; no deep-copy on forest)
        saved_state = _save_sa_state(bt_tree)

        # Select operation by weights
        r = random.random()
        op_idx = 0
        for i, cp in enumerate(cum_probs):
            if r <= cp:
                op_idx = i
                break
        op_total[op_idx] += 1

        # Execute operation
        success = operations[op_idx](bt_tree)

        if not success:
            # Operation failed -> restore state
            _restore_sa_state(bt_tree, saved_state)
            _note_iteration()
            continue

        op_success[op_idx] += 1

        # Packing: compute new chip coordinates from updated BT tree
        try:
            new_layout = generate_global_layout(bt_tree, ecg_manager)
            new_cost = compute_overall_cost(new_layout, problem,
                                            alpha, beta, gamma, target_ratio)
        except Exception:
            _restore_sa_state(bt_tree, saved_state)
            _note_iteration()
            continue

        # Bridge gate: a move whose EMIB bridges overlap (or no longer fit
        # their shared edge) is physically illegal. Discard it outright --
        # no Metropolis acceptance -- and never let it become the best.
        if not bridge_ok(new_layout):
            _restore_sa_state(bt_tree, saved_state)
            bridge_reject_count += 1
            _note_iteration()
            continue

        # Metropolis criterion
        delta = new_cost - current_cost
        accepted = delta < 0 or random.random() < math.exp(-delta / max(temp, 1e-10))

        if accepted:
            # Accept
            current_layout = new_layout
            current_cost = new_cost
            accept_count += 1

            if best_layout is None or current_cost < best_cost:
                best_layout = copy.deepcopy(current_layout)
                best_cost = current_cost
                best_found_time = time.perf_counter() - start_time
                no_improve_count = 0
                last_improve_at = iterations_run
        else:
            # Reject -> rollback
            _restore_sa_state(bt_tree, saved_state)
            reject_count += 1

        # Bookkeeping for this iteration: it counts towards `best_hold_total`
        # whenever it ended sitting on the best cost.
        _note_iteration()

        # Convergence trace: annealing time vs cost (skips failed moves, the
        # next iteration's record covers the gap)
        if trace is not None:
            trace.append((time.perf_counter() - start_time, current_cost, best_cost))

        # Cool down
        if iteration % 50 == 0 and iteration > 0:
            temp *= cooling_rate

        # Periodic log
        if verbose and best_layout is not None and iteration % 2000 == 0 and iteration > 0:
            elapsed = time.perf_counter() - start_time
            total_decisions = accept_count + reject_count
            acc_rate = accept_count / total_decisions if total_decisions > 0 else 0
            util, bbox_a, _, bw, bh = calculate_layout_utilization(best_layout)
            R_cur = bw / bh if bh > 0 else 0
            print(f"  [{iteration:>6d}/{max_iterations if max_iterations is not None else 'inf'}] "
                  f"cost={current_cost:.4f} best={best_cost:.4f} "
                  f"T={temp:.4f} acc={acc_rate:.1%} "
                  f"area={bbox_a:.0f} R={R_cur:.2f} util={util:.1f}% "
                  f"time={elapsed:.1f}s")

        # Wall-clock cap: stop and keep the best solution found so far
        if time_limit is not None and time.perf_counter() - start_time >= time_limit:
            stop_reason = f"time limit ({time_limit:.0f}s)"
            if verbose:
                print(f"  ⏹ Time limit {time_limit:.0f}s reached at iteration "
                      f"{iteration + 1}, stop (best kept)")
            break

        # Convergence: the best cost has not improved for `patience`
        # consecutive iterations. The annealing is over at that point, so the
        # run ends here (see the criterion above).
        if patience > 0 and no_improve_count >= patience:
            converged = True
            hold_frac = best_hold_total / iterations_run
            stop_reason = (f"converged (no improvement for {no_improve_count} "
                           f"iterations); best cost {best_cost:.4f} last improved "
                           f"at iteration {last_improve_at} and has since "
                           f"occupied {hold_frac:.1%} of the {iterations_run} "
                           f"iterations run")
            if verbose:
                print(f"  ⏹ Converged at iteration {iterations_run}: best cost "
                      f"{best_cost:.4f} has not improved for {no_improve_count} "
                      f"iterations (patience {patience}); it has occupied "
                      f"{hold_frac:.1%} of the run, stop")
            break

        # Legacy temperature shortcut (off by default)
        if early_stop and temp < min_temp:
            stop_reason = f"temperature ({temp:.2e} < {min_temp})"
            if verbose:
                print(f"  ⏹ Temperature dropped to {temp:.2e} < {min_temp}, stop")
            break

    elapsed_total = time.perf_counter() - start_time

    bridge_legal = best_layout is not None
    if not bridge_legal:
        stop_reason = ("no bridge-legal layout found (every candidate had "
                       "overlapping or ill-fitting EMIB bridges)")
        best_cost = float('inf')

    # Layer-3 bookkeeping for the caller. This is the only layer that looks at
    # real quality; the two build-time layers never see A / WL / R.
    if stats is not None:
        stats.update({
            'seconds': elapsed_total,
            'iterations': iterations_run,
            'initial_cost': initial_cost,
            'accept': accept_count,
            'reject': reject_count,
            'bridge_rejected': bridge_reject_count,
            'bridge_legal': bridge_legal,
            'op_attempts': list(op_total),
            'op_success': list(op_success),
            'best_found_time': best_found_time,
            'best_cost': best_cost,
            'converged': converged,
            'stop_reason': stop_reason,
            'convergence_patience': patience,
            'best_hold_iterations': best_hold_total,
            'best_hold_fraction': (best_hold_total / iterations_run
                                   if iterations_run else 0.0),
            'last_improve_at': last_improve_at,
            'stagnation_iterations': no_improve_count,
            'stagnation_fraction': (no_improve_count / iterations_run
                                    if iterations_run else 0.0),
            'seconds_to_best': best_found_time,
        })

    # ---- Summary ----
    if verbose and not bridge_legal:
        print("\n" + "=" * 80)
        print("Overall SA Complete -- NO BRIDGE-LEGAL LAYOUT")
        print("=" * 80)
        print(f"Iterations: {iteration + 1}, elapsed: {elapsed_total:.2f}s")
        print(f"Moves discarded for overlapping bridges: {bridge_reject_count}")
        print("=" * 80)

    if verbose and bridge_legal:
        print("\n" + "=" * 80)
        print("Overall SA Complete")
        print("=" * 80)
        print(f"Iterations: {iteration + 1}, elapsed: {elapsed_total:.2f}s")
        print(f"Stop reason: {stop_reason}"
              + ("  → CONVERGED" if converged else "  → budget exhausted"))
        total_d = accept_count + reject_count
        print(f"Accepted: {accept_count}, Rejected: {reject_count}, "
              f"Acceptance rate: {accept_count / total_d:.1%}" if total_d > 0 else "")
        print(f"\nOperation statistics:")
        for i in range(5):
            t, s = op_total[i], op_success[i]
            rate = f"{s / t:.1%}" if t > 0 else "N/A"
            print(f"  Op{i + 1}({op_names[i]}): attempts={t}, success={s}, success_rate={rate}")

        util, bbox_a, chip_a, bw, bh = calculate_layout_utilization(best_layout)
        wl_total, wl_emib, wl_normal = calculate_manhattan_wirelength(best_layout, problem)
        R_best = bw / bh if bh > 0 else 0
        print(f"\nBest solution:")
        print(f"  Cost (Cost = α*A + β*WL + γ*(R-R*)²): {best_cost:.4f}")
        print(f"  Bounding box: {bbox_a:.1f} ({bw:.1f}×{bh:.1f})")
        print(f"  Total chip area: {chip_a:.1f}")
        print(f"  Utilization: {util:.1f}%")
        print(f"  Wirelength details:")
        print(f"    - Total wirelength (WL): {wl_total:.1f}")
        print(f"    - EMIB wirelength: {wl_emib:.1f} ({wl_emib/wl_total*100:.1f}%)" if wl_total > 0 else f"    - EMIB wirelength: 0.0")
        print(f"    - Regular wirelength: {wl_normal:.1f} ({wl_normal/wl_total*100:.1f}%)" if wl_total > 0 else f"    - Regular wirelength: 0.0")
        print(f"  Aspect ratio R={R_best:.3f}, target R*={target_ratio}, deviation²={(R_best - target_ratio)**2:.4f}")
        print("=" * 80)

    # ---- Save ----
    if save_best and bridge_legal:
        os.makedirs(output_dir, exist_ok=True)
        try:
            from unit import save_result
            # Save layout JSON
            json_path = os.path.join(output_dir, "best_layout.json")
            save_result(best_layout, json_path, problem)  # include problem to export bridge info
            # Save layout image
            img_path = os.path.join(output_dir, "best_layout.png")
            save_layout_image(best_layout, problem, img_path,
                              show_bridges=True, show_coordinates=True)
            if verbose:
                print(f"\nBest solution saved to: {output_dir}/")
                print(f"  - JSON: {json_path}")
                print(f"  - Image: {img_path}")
        except Exception as e:
            import traceback
            print(f"Error while saving results: {e}")
            traceback.print_exc()

    return best_layout, best_cost, best_found_time


# ============================================================================
# Main entry
# ============================================================================

def format_layer_timing(bt_tree: Optional[BinaryTree] = None,
                        layer1_seconds: float = 0.0,
                        layer2_seconds: float = 0.0,
                        layer3_seconds: float = 0.0,
                        layer1_stats: Optional[Dict] = None,
                        layer2_stats: Optional[Dict] = None,
                        layer3_stats: Optional[Dict] = None,
                        total_seconds: Optional[float] = None) -> List[str]:
    """Render the three-annealing-layer time split as printable lines.

    The pipeline is three SAs stacked on top of each other, each with its own
    objective, so their costs add up along one wall clock:

      layer 1  legality only          Pc / Pl          (base derivation)
      layer 2  shape + similarity     Px / Py / Ps     (group construction)
      layer 3  real quality           A / WL / R       (main SA)

    Layers 1 and 2 run once, at build time; layer 3 is the main annealing.
    `total_seconds` defaults to the sum of the three layers.
    """
    layer1_stats = layer1_stats or {}
    layer2_stats = layer2_stats or {}
    layer3_stats = layer3_stats or {}
    if bt_tree is not None:
        build = bt_tree.get_build_timing()
        layer1_seconds = build['layer1_seconds']
        layer2_seconds = build['layer2_seconds']
        layer1_stats = layer1_stats or build['layer1_stats']
        layer2_stats = layer2_stats or build['layer2_stats']

    if total_seconds is None:
        total_seconds = layer1_seconds + layer2_seconds + layer3_seconds
    total_seconds = max(total_seconds, 1e-9)

    def pct(seconds):
        return seconds / total_seconds * 100.0

    d1 = (f"{layer1_stats.get('runs', 0)} base-derivation runs "
          f"({layer1_stats.get('sa_runs', 0)} entered the legality SA_1, "
          f"{layer1_stats.get('already_legal_runs', 0)} already legal) -> "
          f"{layer1_stats.get('legal_solutions', 0)} legal solutions / "
          f"{layer1_stats.get('root_nodes', 0)} root nodes"
          + (" [run deadline reached with no legal base]"
             if layer1_stats.get('deadline_hit') else ""))
    d2 = (f"{layer2_stats.get('trees', 0)} trees, "
          f"{layer2_stats.get('sa_calls', 0)} neighbour SA calls "
          f"({layer2_stats.get('sa_iterations', 0)} iterations), "
          f"{layer2_stats.get('candidates', 0)} candidates, "
          f"forest of {layer2_stats.get('forest_nodes', 0)} nodes")
    d3 = (f"{layer3_stats.get('iterations', 0)} iterations, "
          f"{layer3_stats.get('accept', 0)} accepted / "
          f"{layer3_stats.get('reject', 0)} rejected")
    if 'best_found_time' in layer3_stats:
        d3 += (f", best found at {layer3_stats['best_found_time']:.2f} s "
               f"(cost {layer3_stats.get('initial_cost', float('nan')):.4f} -> "
               f"{layer3_stats.get('best_cost', float('nan')):.4f})")
    if 'stop_reason' in layer3_stats:
        verdict = ("converged" if layer3_stats.get('converged')
                   else "not converged (iteration cap reached)")
        d3 += f", {verdict}: {layer3_stats['stop_reason']}"

    lines = [
        "Per-layer time (three stacked SAs, one wall clock, different objectives):",
        f"  layer 1  legality         Pc/Pl     : {layer1_seconds:8.2f} s ({pct(layer1_seconds):5.1f}%)  {d1}",
        f"  layer 2  shape+similarity Px/Py/Ps  : {layer2_seconds:8.2f} s ({pct(layer2_seconds):5.1f}%)  {d2}",
        f"  layer 3  real quality     A/WL/R    : {layer3_seconds:8.2f} s ({pct(layer3_seconds):5.1f}%)  {d3}",
        f"  {'-'*62}",
        f"  build total (layers 1+2)            : {layer1_seconds + layer2_seconds:8.2f} s "
        f"({pct(layer1_seconds + layer2_seconds):5.1f}%)",
        f"  full run (layers 1+2+3)             : {total_seconds:8.2f} s (100.0%)",
    ]
    return lines


def run_single_case(json_path: str,
                    max_iterations: Optional[int] = None,
                    initial_temp: float = 500.0,
                    cooling_rate: float = 0.98,
                    time_limit: Optional[float] = 3600.0,
                    alpha: float = 0.8,
                    beta: float = 0.1,
                    gamma: float = 0.1,
                    target_ratio: float = 1.0,
                    build_similarity: bool = True,
                    seed:  int = None,
                    verbose: bool = True):
    """
    Run Overall SA for a single case and save to `result/<case_name>/`.

    The annealing ends the way it does in the batch runner: on convergence (the
    search freezes) or on the wall clock, never on an iteration count -- hence
    `max_iterations=None` and a `time_limit` by default.

    Args:
        json_path: Input JSON path
        time_limit: Wall clock cap for the annealing, in seconds.
        Other arguments are same as `overall_sa`
    """
    from unit import load_problem_from_json

    # Extract case name from file path
    case_name = os.path.splitext(os.path.basename(json_path))[0]
    output_dir = os.path.join("..", "result", case_name)

    print(f"\n{'#' * 80}")
    print(f"Case: {case_name}")
    print(f"Input: {json_path}")
    print(f"Output: {output_dir}/")
    print(f"{'#' * 80}")

    # 1. Load problem
    problem = load_problem_from_json(json_path)

    # 2. Build ECG manager
    ecg_manager = ECGManager(problem)
    ecg_manager.print_summary()

    # 3. Build BT tree (this is usually the bulk of the wall clock)
    tree_build_start = time.time()
    bt_tree = BinaryTree()
    bt_tree.build_from_ecgs(ecg_manager,
                            build_similarity_forests=build_similarity,
                            seed=seed)
    tree_build_time = time.time() - tree_build_start
    bt_tree.print_tree_structure()
    print(f"BT tree built in {tree_build_time:.2f}s "
          f"({bt_tree.build_count} build(s))")

    # 4. Run Overall SA (collecting the cost convergence trace)
    trace = []
    sa_stats: Dict = {}
    sa_start = time.time()
    best_layout, best_cost, best_found_time = overall_sa(
        bt_tree=bt_tree,
        ecg_manager=ecg_manager,
        problem=problem,
        max_iterations=max_iterations,
        initial_temp=initial_temp,
        cooling_rate=cooling_rate,
        alpha=alpha,
        beta=beta,
        gamma=gamma,
        target_ratio=target_ratio,
        verbose=verbose,
        save_best=False,  # Saved below, under seed-tagged names
        output_dir=output_dir,
        time_limit=time_limit,
        trace=trace,
        stats=sa_stats,
    )
    sa_seconds = time.time() - sa_start

    if best_layout is None:
        raise RuntimeError(
            f"Case [{case_name}]: no bridge-legal layout found; refusing to "
            f"save an illegal solution")

    # 5. Save layout JSON + image + convergence curve, every name tagged `_seedNN`
    os.makedirs(output_dir, exist_ok=True)
    tag = f"seed{seed:02d}" if seed is not None else "seedNA"
    json_path = os.path.join(output_dir, f"solution_{tag}_cost_{best_cost:.6f}.json")
    save_result(best_layout, json_path, problem)
    img_path = os.path.join(output_dir, f"solution_{tag}_cost_{best_cost:.6f}.png")
    save_layout_image(best_layout, problem, img_path,
                      show_bridges=True, show_coordinates=False)
    curve_path = os.path.join(output_dir, f"convergence_{tag}.png")
    save_convergence_curve(
        trace, curve_path,
        title=f"{case_name}: cost vs annealing time (seed={seed})")
    print(f"  JSON: {json_path}")
    print(f"  Image: {img_path}")
    print(f"  Convergence curve: {curve_path}")

    run_s = time.time() - tree_build_start
    print(f"\nCase [{case_name}] done: cost={best_cost:.4f}, "
          f"time_to_best={best_found_time:.2f}s, chiplets={len(best_layout)}")
    print(f"  tree build: {tree_build_time:.2f}s ({bt_tree.build_count} build(s)), "
          f"annealing: {sa_seconds:.2f}s")
    for line in format_layer_timing(bt_tree, layer3_seconds=sa_seconds,
                                    layer3_stats=sa_stats, total_seconds=run_s):
        print(line)
    print(f"Results saved in: {output_dir}/")
    return best_layout, best_cost, best_found_time


def main():
    """
    Main function: run Overall SA for selected cases.
    Results are saved under `result/<case_name>/`.
    """
    import sys

    # All available test cases
    test_input_dir = "../../../benchmark/test_input"
    all_cases = [
        "syn1", "syn2", "syn3", "syn4", "syn5", "syn6",
        "hp6_m", "hp8_m", "hp11_m",
        "xerox6_m", "xerox7_m", "xerox8_m",
        "cpu-dram", "ascend910", "multigpu", "sys_micro150",
    ]

    # Support command-line cases: python OverallSA.py syn1 hp6_m
    if len(sys.argv) > 1:
        cases_to_run = sys.argv[1:]
    else:
        # Default: run only syn1 as demo
        cases_to_run = ["syn1"]

    print(f"Cases to run: {cases_to_run}")
    print(f"(Available cases: {all_cases})")
    print(f"(Usage: python OverallSA.py [case1] [case2] ...)")

    results = {}
    for case_name in cases_to_run:
        json_path = os.path.join(test_input_dir, f"{case_name}.json")
        if not os.path.exists(json_path):
            print(f"\n⚠ Skip {case_name}: file not found ({json_path})")
            continue

        try:
            best_layout, best_cost, best_found_time = run_single_case(
                json_path=json_path,
                max_iterations=None,
                alpha=1.0,
                beta=0.1,
                gamma=0.1,
                target_ratio=1.0,
                seed=42,
                verbose=True,
            )
            results[case_name] = best_cost
        except Exception as e:
            import traceback
            print(f"\n✗ Case {case_name} failed: {e}")
            traceback.print_exc()
            results[case_name] = None

    # Summary
    print("\n" + "=" * 80)
    print("All Case Results")
    print("=" * 80)
    for case_name, cost in results.items():
        status = f"cost={cost:.4f}" if cost is not None else "failed"
        print(f"  {case_name:>15}: {status}")
    print("=" * 80)


if __name__ == "__main__":
    main()
