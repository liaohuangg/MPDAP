"""
Similarity Tree construction module.

This module builds N-ary trees of legal layout solutions.
Each node stores a legal `(TCG, Layout)` pair, and parent-child
relations are created using layout similarity.
"""

import copy
from typing import Dict, List, Tuple, Optional, Set
from TCG import TCG
from chiplet_model import Chiplet, LayoutProblem, EPSILON


class SimilarityTreeNode:
    """
    Similarity tree node.
    
    Attributes:
        tcg (TCG): TCG topology for this node
        layout (Dict[str, Chiplet]): Geometric layout for this node
        parent (SimilarityTreeNode): Parent node (`None` for root)
        children (List[SimilarityTreeNode]): Child nodes
        similarity_to_parent (float): Similarity to parent (`None` for root)
        cost (float): Layout cost metric
        node_id (int): Unique node ID
    """

    _node_counter = 0  # Class variable for unique IDs
    
    def __init__(self, tcg: TCG, layout: Dict[str, Chiplet], 
                 parent: Optional['SimilarityTreeNode'] = None,
                 similarity_to_parent: Optional[float] = None,
                 cost: float = 0.0):
        """Initialize a similarity tree node."""
        self.tcg = copy.deepcopy(tcg)
        self.layout = copy.deepcopy(layout)
        self.parent = parent
        self.children: List[SimilarityTreeNode] = []
        self.similarity_to_parent = similarity_to_parent
        self.cost = cost
        
        # Assign unique ID
        SimilarityTreeNode._node_counter += 1
        self.node_id = SimilarityTreeNode._node_counter
    
    def add_child(self, child: 'SimilarityTreeNode') -> None:
        """Add a child node."""
        self.children.append(child)
        child.parent = self
    
    def is_root(self) -> bool:
        """Return True if this node is the root."""
        return self.parent is None
    
    def is_leaf(self) -> bool:
        """Return True if this node is a leaf."""
        return len(self.children) == 0
    
    def get_depth(self) -> int:
        """Get node depth (root depth is 0)."""
        depth = 0
        node = self
        while node.parent is not None:
            depth += 1
            node = node.parent
        return depth
    
    def __repr__(self) -> str:
        return (f"TreeNode(id={self.node_id}, depth={self.get_depth()}, "
                f"children={len(self.children)}, cost={self.cost:.4f})")


class SimilarityTree:
    """
    Similarity tree container.
    
    Attributes:
        root (SimilarityTreeNode): Root node
        all_nodes (List[SimilarityTreeNode]): All nodes in the tree
    """
    
    def __init__(self, root: SimilarityTreeNode):
        """Initialize a similarity tree with a root node."""
        self.root = root
        self.all_nodes: List[SimilarityTreeNode] = [root]
    
    def add_node(self, parent: SimilarityTreeNode, child: SimilarityTreeNode) -> None:
        """Add a child node under `parent`."""
        parent.add_child(child)
        self.all_nodes.append(child)
    
    def get_all_leaves(self) -> List[SimilarityTreeNode]:
        """Get all leaf nodes."""
        return [node for node in self.all_nodes if node.is_leaf()]
    
    def get_nodes_at_depth(self, depth: int) -> List[SimilarityTreeNode]:
        """Get all nodes at a specific depth."""
        return [node for node in self.all_nodes if node.get_depth() == depth]
    
    def get_tree_statistics(self) -> Dict:
        """Get tree statistics."""
        max_depth = max(node.get_depth() for node in self.all_nodes) if self.all_nodes else 0
        num_leaves = len(self.get_all_leaves())
        
        return {
            'total_nodes': len(self.all_nodes),
            'max_depth': max_depth,
            'num_leaves': num_leaves,
            'avg_children': sum(len(node.children) for node in self.all_nodes) / len(self.all_nodes)
        }
    
    def __repr__(self) -> str:
        stats = self.get_tree_statistics()
        return (f"SimilarityTree(nodes={stats['total_nodes']}, "
                f"depth={stats['max_depth']}, leaves={stats['num_leaves']})")


def get_nearest_neighbors(chip_id: str, layout: Dict[str, Chiplet]) -> Dict[str, Optional[str]]:
    """
    Get nearest neighbors of a chiplet in four directions.
    
    Args:
        chip_id: Target chiplet ID
        layout: Layout dictionary
        
    Returns:
        Dictionary with keys `left/right/top/bottom`.
        Value is neighbor ID or `None` if absent.
    """
    target_chip = layout[chip_id]
    target_cx = target_chip.x + target_chip.width / 2
    target_cy = target_chip.y + target_chip.height / 2
    
    neighbors = {
        'left': None,
        'right': None,
        'top': None,
        'bottom': None
    }
    
    distances = {
        'left': float('inf'),
        'right': float('inf'),
        'top': float('inf'),
        'bottom': float('inf')
    }
    
    # Iterate over all other chiplets
    for other_id, other_chip in layout.items():
        if other_id == chip_id:
            continue
        
        other_cx = other_chip.x + other_chip.width / 2
        other_cy = other_chip.y + other_chip.height / 2
        
        # Determine direction and update nearest distance
        # Left: `other` is left of `target`
        if other_cx < target_cx - EPSILON:
            dist = abs(target_cx - other_cx)
            if dist < distances['left']:
                distances['left'] = dist
                neighbors['left'] = other_id
        
        # Right: `other` is right of `target`
        if other_cx > target_cx + EPSILON:
            dist = abs(other_cx - target_cx)
            if dist < distances['right']:
                distances['right'] = dist
                neighbors['right'] = other_id
        
        # Bottom: `other` is below `target`
        if other_cy < target_cy - EPSILON:
            dist = abs(target_cy - other_cy)
            if dist < distances['bottom']:
                distances['bottom'] = dist
                neighbors['bottom'] = other_id
        
        # Top: `other` is above `target`
        if other_cy > target_cy + EPSILON:
            dist = abs(other_cy - target_cy)
            if dist < distances['top']:
                distances['top'] = dist
                neighbors['top'] = other_id
    
    return neighbors


def compute_similarity(layout1: Dict[str, Chiplet], 
                       layout2: Dict[str, Chiplet]) -> float:
    """
    Compute layout similarity `SD(σ_i, T_j)` in range `[0, 1]`.

    Similarity is the ratio of matched nearest-neighbor relations
    across `left/right/top/bottom` directions.
    
    Args:
        layout1: First layout
        layout2: Second layout
        
    Returns:
        Similarity score in `[0, 1]`.
        
    Raises:
        ValueError: If layout chiplet sets differ.
    """
    # Ensure both layouts contain the same chiplets
    if set(layout1.keys()) != set(layout2.keys()):
        raise ValueError("Layouts contain different chiplet sets")
    
    chip_ids = list(layout1.keys())
    
    if len(chip_ids) == 0:
        return 1.0  # Empty layouts are treated as identical
    
    # Count matched neighbor relations
    total_relations = 0
    matched_relations = 0
    
    for chip_id in chip_ids:
        # Get neighbors of the same chiplet in both layouts
        neighbors1 = get_nearest_neighbors(chip_id, layout1)
        neighbors2 = get_nearest_neighbors(chip_id, layout2)
        
        # Compare neighbors in four directions
        for direction in ['left', 'right', 'top', 'bottom']:
            # Count only when at least one side has a neighbor
            if neighbors1[direction] is not None or neighbors2[direction] is not None:
                total_relations += 1
                
                # Match if neighbor IDs are equal
                if neighbors1[direction] == neighbors2[direction]:
                    matched_relations += 1
    
    # Compute similarity
    if total_relations == 0:
        return 1.0  # Single-chiplet case: treat as identical
    
    similarity = matched_relations / total_relations
    
    return similarity


def build_similarity_tree(legal_tcgs: List[TCG], 
                          legal_layouts: List[Dict[str, Chiplet]],
                          costs: List[float]) -> SimilarityTree:
    """
    Build a similarity tree from legal solutions.

    Strategy:
    1. Use the lowest-cost solution as root.
    2. For each remaining solution, connect to its most similar
       existing node in the tree.
    
    Args:
        legal_tcgs: List of legal TCGs
        legal_layouts: List of legal layouts
        costs: Cost list for layouts
        
    Returns:
        Built similarity tree.
        
    Raises:
        ValueError: If inputs are empty or lengths mismatch.
    """
    if len(legal_tcgs) == 0:
        raise ValueError("Legal solution list is empty")
    
    if not (len(legal_tcgs) == len(legal_layouts) == len(costs)):
        raise ValueError("Lengths of TCG/layout/cost lists do not match")
    
    # Step 1: Choose the best-cost root
    best_idx = min(range(len(costs)), key=lambda i: costs[i])
    root = SimilarityTreeNode(
        tcg=legal_tcgs[best_idx],
        layout=legal_layouts[best_idx],
        parent=None,
        similarity_to_parent=None,
        cost=costs[best_idx]
    )
    
    tree = SimilarityTree(root)
    
    # Step 2: Attach remaining solutions
    remaining_indices = [i for i in range(len(legal_tcgs)) if i != best_idx]
    
    for idx in remaining_indices:
        # Find most similar existing node as parent
        max_similarity = -1.0
        best_parent = None
        
        for node in tree.all_nodes:
            similarity = compute_similarity(legal_layouts[idx], node.layout)
            if similarity > max_similarity:
                max_similarity = similarity
                best_parent = node
        
        # Create and append child node
        new_node = SimilarityTreeNode(
            tcg=legal_tcgs[idx],
            layout=legal_layouts[idx],
            parent=best_parent,
            similarity_to_parent=max_similarity,
            cost=costs[idx]
        )
        
        tree.add_node(best_parent, new_node)
    
    return tree


def compute_neighbor_cost(base_layout: Dict[str, Chiplet],
                         neighbor_layout: Dict[str, Chiplet],
                         alpha_x: float = 1.0,
                         beta_y: float = 1.0,
                         gamma_s: float = 1.0,
                         expected_similarity: float = 0.8) -> float:
    """
    Compute neighbor topology cost:
    `C_neighbor = α_x * P_x + β_y * P_y + γ_s * P_s`.
    
    Args:
        base_layout: Base layout `(σ_i)`
        neighbor_layout: Neighbor layout `(T_j)`
        alpha_x: Width penalty weight
        beta_y: Height penalty weight
        gamma_s: Similarity penalty weight
        expected_similarity: Expected similarity `S_e` (default 0.8)
        
    Returns:
        Total neighbor cost.
    """
    from TCG import get_layout_bounds
    
    # Compute width/height of base and neighbor layouts
    base_x_min, base_y_min, base_x_max, base_y_max = get_layout_bounds(base_layout)
    base_width = base_x_max - base_x_min
    base_height = base_y_max - base_y_min
    
    neighbor_x_min, neighbor_y_min, neighbor_x_max, neighbor_y_max = get_layout_bounds(neighbor_layout)
    neighbor_width = neighbor_x_max - neighbor_x_min
    neighbor_height = neighbor_y_max - neighbor_y_min
    
    # 1) Shape terms: P_x and P_y
    P_x = neighbor_width / base_width if base_width > 0 else 1.0
    P_y = neighbor_height / base_height if base_height > 0 else 1.0
    
    # 2) Similarity term: P_s = |SD - S_e| / (1 - S_e)
    SD = compute_similarity(base_layout, neighbor_layout)
    if expected_similarity >= 1.0:
        P_s = abs(SD - expected_similarity)
    else:
        P_s = abs(SD - expected_similarity) / (1.0 - expected_similarity)
    
    # Total cost
    C_neighbor = alpha_x * P_x + beta_y * P_y + gamma_s * P_s
    return C_neighbor


def SA_neighbor_generation(base_node: SimilarityTreeNode,
                          problem: LayoutProblem,
                          max_iterations: int = 5000,
                          initial_temp: float = 50.0,
                          cooling_rate: float = 0.95,
                          alpha_x: float = 1.0,
                          beta_y: float = 1.0,
                          gamma_s: float = 2.0,
                          expected_similarity: float = 0.8,
                          max_neighbors: int = 10,
                          verbose: bool = False) -> List[Tuple[TCG, Dict[str, Chiplet], float]]:
    """
                        Generate neighbor nodes using similarity-guided SA.
    
    Args:
        base_node: Base (parent) node
        problem: Layout problem
        max_iterations: Maximum SA iterations
        initial_temp: Initial temperature
        cooling_rate: Cooling rate
        alpha_x, beta_y, gamma_s: Cost weights
        expected_similarity: Expected similarity
        max_neighbors: Maximum number of neighbors
        verbose: Print detailed logs if True
        
    Returns:
        Neighbor solution list: `[(TCG, Layout, cost), ...]`.
    """
    import random
    import math
    from TCG import generate_layout_from_tcg
    from legalize_tcg import legalize_tcg
    from Legality_optimized_SA import _generate_neighbor_tcg, cost_legal
    
    if verbose:
        print(f"\n  Generating neighbors for node #{base_node.node_id}...")
    
    base_layout = base_node.layout
    current_tcg = copy.deepcopy(base_node.tcg)
    neighbors = []
    temp = initial_temp
    best_cost = float('inf')
    
    for iteration in range(max_iterations):
        neighbor_tcg = _generate_neighbor_tcg(current_tcg, problem)
        is_valid, _ = neighbor_tcg.is_valid()
        if not is_valid:
            continue
        
        try:
            neighbor_layout = generate_layout_from_tcg(neighbor_tcg, problem)
            legal_cost = cost_legal(neighbor_tcg, problem, neighbor_layout, alpha_c=1.0, beta_l=10.0)
            
            # If illegal, try legalization
            if abs(legal_cost) > 1e-6:
                success, legalized_tcg, legalized_layout = legalize_tcg(neighbor_tcg, problem, verbose=False)
                if success:
                    neighbor_tcg, neighbor_layout = legalized_tcg, legalized_layout
                    legal_cost = cost_legal(neighbor_tcg, problem, neighbor_layout, alpha_c=1.0, beta_l=10.0)
                else:
                    continue
            
            if abs(legal_cost) > 1e-6:
                continue
            
            # Compute neighbor cost
            neighbor_cost = compute_neighbor_cost(base_layout, neighbor_layout,
                                                alpha_x, beta_y, gamma_s, expected_similarity)
            
            if neighbor_cost < best_cost:
                best_cost = neighbor_cost
                
                # Avoid duplicates
                is_duplicate = any(compute_similarity(neighbor_layout, ex_layout) > 0.95 
                                 for _, ex_layout, _ in neighbors)
                
                if not is_duplicate:
                    neighbors.append((copy.deepcopy(neighbor_tcg), 
                                    copy.deepcopy(neighbor_layout), neighbor_cost))
                    if verbose and len(neighbors) <= 3:
                        print(f"    Found neighbor #{len(neighbors)}: cost={neighbor_cost:.4f}")
                    if len(neighbors) >= max_neighbors:
                        if verbose:
                            print(f"    Reached {max_neighbors} neighbors, stopping early")
                        break
                
                current_tcg = copy.deepcopy(neighbor_tcg)
            else:
                delta = neighbor_cost - best_cost
                if random.random() < math.exp(-delta / temp):
                    current_tcg = copy.deepcopy(neighbor_tcg)
        
        except Exception:
            continue
        
        if iteration % 100 == 0:
            temp *= cooling_rate
    
    if verbose:
        print(f"    Done: found {len(neighbors)} legal neighbors")
    return neighbors


def GroupConstrua_full(root_nodes: List[SimilarityTreeNode],
                      problem: LayoutProblem,
                      num_topologies_to_generate: int = 100,
                      children_per_node: int = 5,
                      max_iterations_sa: int = 5000,
                      alpha_x: float = 1.0,
                      beta_y: float = 1.0,
                      gamma_s: float = 2.0,
                      expected_similarity: float = 0.8,
                      verbose: bool = True) -> List[SimilarityTree]:
    """
     Group Construction: build multiple similarity trees using BFS.

     Strategy:
     1. Perturb each root with SA to generate candidate topologies.
     2. Build the tree in BFS order by attaching the top-N most
         similar unconnected topologies to each current node.
    
    Args:
        root_nodes: Root nodes from base derivation
        problem: Layout problem
        num_topologies_to_generate: Candidate count per tree
        children_per_node: Max children per node
        max_iterations_sa: Max SA iterations
        alpha_x, beta_y, gamma_s: Cost parameters
        expected_similarity: Expected similarity
        verbose: Print detailed logs if True
        
    Returns:
        List of similarity trees (forest).
    """
    from collections import deque
    
    if verbose:
        print("="*80)
        print("Group Construction - Building Similarity Trees (BFS)")
        print("="*80)
        print(f"Root node count: {len(root_nodes)}")
        print(f"Topologies per tree: {num_topologies_to_generate}")
        print(f"Children per node: {children_per_node}")
        print(f"SA params: max_iter={max_iterations_sa}")
        print(f"Cost params: α_x={alpha_x}, β_y={beta_y}, γ_s={gamma_s}, S_e={expected_similarity}")
        print("="*80 + "\n")
    
    similarity_trees = []
    
    for tree_idx, root in enumerate(root_nodes):
        if verbose:
            print(f"\n{'─'*80}")
            print(f"Processing tree #{tree_idx + 1}/{len(root_nodes)} (root id={root.node_id})")
            print(f"{'─'*80}")
        
        # Create tree with root only
        tree = SimilarityTree(root)
        
        # Step 1: Generate candidate topologies via SA
        if verbose:
            print(f"\n  Generating candidate topologies...")
        
        candidate_topologies = []  # [(TCG, Layout, cost), ...]
        
        # Use SA to generate candidates
        generated_count = 0
        while generated_count < num_topologies_to_generate:
            neighbors = SA_neighbor_generation(
                base_node=root, problem=problem,
                max_iterations=max_iterations_sa,
                initial_temp=50.0, cooling_rate=0.95,
                alpha_x=alpha_x, beta_y=beta_y, gamma_s=gamma_s,
                expected_similarity=expected_similarity,
                max_neighbors=min(20, num_topologies_to_generate - generated_count),
                verbose=False
            )
            candidate_topologies.extend(neighbors)
            generated_count = len(candidate_topologies)
            
            if len(neighbors) == 0:
                if verbose:
                    print(f"    Warning: SA cannot generate more topologies, current total={generated_count}")
                break
        
        if verbose:
            print(f"    Generated {len(candidate_topologies)} candidate topologies")
        
        if len(candidate_topologies) == 0:
            if verbose:
                print(f"  → Tree #{tree_idx + 1} done: root only (no candidates)")
            similarity_trees.append(tree)
            continue
        
        # Step 2: Build tree in BFS order
        if verbose:
            print(f"\n  Building tree with BFS...")
        
        # Unconnected topology pool
        unconnected_topologies = candidate_topologies.copy()
        
        # BFS queue of nodes to process
        bfs_queue = deque([root])
        
        while bfs_queue and unconnected_topologies:
            # Step 3: Pop current node in BFS order
            current_node = bfs_queue.popleft()
            
            if verbose:
                print(f"    Processing node #{current_node.node_id}, remaining unconnected: {len(unconnected_topologies)}")
            
            # Compute similarity to all unconnected topologies
            similarities = []
            for idx, (tcg, layout, cost) in enumerate(unconnected_topologies):
                sim = compute_similarity(current_node.layout, layout)
                similarities.append((idx, sim, tcg, layout, cost))
            
            # Select top-N most similar as children
            similarities.sort(key=lambda x: x[1], reverse=True)
            
            num_children = min(children_per_node, len(similarities))
            selected_indices = set()
            
            for i in range(num_children):
                idx, sim, tcg, layout, cost = similarities[i]
                selected_indices.add(idx)
                
                # Create child node
                child_node = SimilarityTreeNode(
                    tcg=tcg, layout=layout,
                    parent=current_node,
                    similarity_to_parent=sim,
                    cost=cost
                )
                
                # Add child to tree
                tree.add_node(current_node, child_node)
                
                # Push child to BFS queue
                bfs_queue.append(child_node)
                
                if verbose and i < 3:  # Print only first 3
                    print(f"      Added child: similarity={sim:.4f}, cost={cost:.4f}")
            
            # Remove selected topologies from unconnected pool
            unconnected_topologies = [
                topo for i, topo in enumerate(unconnected_topologies) 
                if i not in selected_indices
            ]
        
        if verbose:
            stats = tree.get_tree_statistics()
            print(f"  → Tree #{tree_idx + 1} done: {stats['total_nodes']} nodes, "
                f"max depth={stats['max_depth']}, remaining unconnected={len(unconnected_topologies)}")
        
        similarity_trees.append(tree)
    
    if verbose:
        print("\n" + "="*80)
        print("Group Construction Complete")
        print("="*80)
        print(f"Generated tree count: {len(similarity_trees)}")
        for i, tree in enumerate(similarity_trees):
            stats = tree.get_tree_statistics()
            print(f"  Tree #{i+1}: {stats['total_nodes']} nodes, "
                  f"max depth={stats['max_depth']}, "
                  f"leaves={stats['num_leaves']}, "
                  f"avg children={stats['avg_children']:.2f}")
        print("="*80)
    
    return similarity_trees


def GroupConstrua(root_nodes: List[SimilarityTreeNode]) -> List[SimilarityTree]:
    """
    Simplified version: build one tree per root node (root only).
    
    Args:
        root_nodes: Root node list from base derivation
        
    Returns:
        Similarity tree list
    """
    similarity_trees = []
    for root in root_nodes:
        tree = SimilarityTree(root)
        similarity_trees.append(tree)
    return similarity_trees
# Notes:
# - Build one similarity tree per root from `BaseDerivation`.
# - Neighbor generation uses SA with legalization when needed.
# - Neighbor cost: C_neighbor = α_x * P_x + β_y * P_y + γ_s * P_s.
# - P_x/P_y penalize width/height distortion; P_s controls similarity
#   around expected value S_e.



if __name__ == "__main__":
    # # Simple test for similarity computation
    # print("Testing similarity computation...")
    # chip_a1 = Chiplet("A", 10, 10, 0, 0)
    # chip_b1 = Chiplet("B", 10, 10, 10, 0)
    # chip_c1 = Chiplet("C", 10, 10, 0, 10)
    
    # layout1 = {
    #     "A": chip_a1,
    #     "B": chip_b1,
    #     "C": chip_c1
    # }
    
    # chip_a2 = Chiplet("A", 10, 10, 0, 0)
    # chip_b2 = Chiplet("B", 10, 10, 10, 2)
    # chip_c2 = Chiplet("C", 10, 10, 5, 10)  # C has different position
    
    # layout2 = {
    #     "A": chip_a2,
    #     "B": chip_b2,
    #     "C": chip_c2
    # }
    
    # similarity = compute_similarity(layout1, layout2)
    # print(f"Similarity between layout1 and layout2 : {similarity:.4f}")
    from BaseDerivation import run_base_derivation
    from unit import load_problem_from_json
    problem = load_problem_from_json("../test_input/8core.json")




# 2. Base derivation (generate root nodes)
    root_nodes = run_base_derivation(problem, num_runs=5, min_similarity=0.4)
    # print(f"\nBase derivation done, generated {len(root_nodes)} root nodes.")
    from unit import visualize_layout_with_bridges, save_layout_image
    # image_path = f"../output/BaseDerivation/root_node_{0+1}_layout.png"
    # save_layout_image(root_nodes[0].layout, problem, image_path)
    # print(f"  Root node #{0+1} layout image saved: {image_path}")


    similarity_trees = GroupConstrua_full(
        root_nodes=root_nodes,
        problem=problem,
        num_topologies_to_generate=5,  # Generate 5 candidates per tree
        children_per_node=5,  # Up to 5 children per node
        max_iterations_sa=5000,
        alpha_x=1.0,
        beta_y=1.0,
        gamma_s=2.0,
        expected_similarity=0.8,
        verbose=True
    )
    print(f"\nGroup Construction complete, generated {len(similarity_trees)} similarity trees.")
 
    for i, tree in enumerate(similarity_trees):
        stats = tree.get_tree_statistics()
        print(f"  Tree #{i+1}: {stats['total_nodes']} nodes, max depth={stats['max_depth']}")

    print(similarity_trees[0])
    # Save layout image for each node
    import os
    output_dir = "../output/GroupConstrua"
    os.makedirs(output_dir, exist_ok=True)  # Create directory if needed
    
    for node in similarity_trees[0].all_nodes:
        image_path = f"{output_dir}/tree1_node{node.node_id}_layout.png"
        save_layout_image(node.layout, problem, image_path)
        print(f"  Node #{node.node_id} layout image saved: {image_path}")
        