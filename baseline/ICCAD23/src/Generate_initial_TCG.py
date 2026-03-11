"""
Initial TCG Generator.

Converts an undirected connection graph into an initial TCG
(transitive closure graph) and its geometric layout.
Uses a maximum spanning tree (MST) as the backbone and assigns
constraints to horizontal/vertical graphs.
"""
import json
import networkx as nx
import random
from typing import Dict, Tuple, List, Set
from chiplet_model import Chiplet, LayoutProblem
from TCG import TCG, generate_layout_from_tcg


def generate_initial_TCG(problem: LayoutProblem, seed: int = None) -> TCG:
    """
    Generate an initial TCG candidate from the problem graph.
    
    Steps:
    1. Build MST using edge weights.
    2. Choose a root and orient MST edges.
    3. Build `TCG.Ch` from MST transitive closure.
    4. Build `TCG.Cv` for unconstrained node pairs.
    
    Args:
        problem: Layout problem with chiplets and undirected graph.
        seed: Optional random seed for reproducibility.
        
    Returns:
        Generated TCG object.
        
    Raises:
        ValueError: If there are no chiplets or graph has no edges.
    """
    if seed is not None:
        random.seed(seed)
    
    # Validate input
    if len(problem.chiplets) == 0:
        raise ValueError("No chiplets found in problem")
    
    if problem.connection_graph.number_of_edges() == 0:
        raise ValueError("Connection graph is empty, cannot build MST")
    
    # Step 1: Build maximum spanning tree (MST)
    # Use negative weights with `minimum_spanning_tree` to get MST.
    mst = _compute_maximum_spanning_tree(problem.connection_graph)
    
    # Step 2: Choose root and orient MST
    root = random.choice(list(problem.chiplets.keys()))
    # print(f"\nSelected MST root: {root}")
    directed_mst_edges = _orient_tree_from_root(mst, root)
    # print(f"Directed MST edges: {directed_mst_edges}")
    
    # Step 3: Create initial TCG
    chip_ids = list(problem.chiplets.keys())
    tcg = TCG(chip_ids)

    # Step 4: Build TCG.Ch
    # print("Building TCG.Ch edges...")
    ch_edges = creat_tcg_ch(directed_mst_edges)
    tcg.Ch.add_edges_from(ch_edges)
    # print(f"Current Ch: {list(tcg.Ch.edges())}")
   
    # Track reachable pairs in Ch
    ch_reachable = _build_reachability_set(directed_mst_edges, is_mst=True)
    # print(f"Reachable pairs in Ch: {ch_reachable}")

    # Step 5: Build TCG.Cv
    # print("\nBuilding TCG.Cv edges...")
    cv_edges = creat_tcg_cv(chip_ids, tcg.Ch)
    tcg.Cv.add_edges_from(cv_edges)
    # print(f"Current Cv: {list(tcg.Cv.edges())}")
    
    return tcg


def _compute_maximum_spanning_tree(graph: nx.Graph) -> nx.Graph:
    """
    Compute maximum spanning tree from an undirected graph.
    
    Args:
        graph: Undirected graph, edges may contain `weight`.
        
    Returns:
        Maximum spanning tree as `nx.Graph`.
    """
    # Create a weighted copy with negated weights
    weighted_graph = nx.Graph()
    for u, v, data in graph.edges(data=True):
        weight = data.get('weight', 1.0)
        weighted_graph.add_edge(u, v, weight=-weight)
    
    # Apply minimum spanning tree on negated weights
    mst = nx.minimum_spanning_tree(weighted_graph)
    
    return mst


def _orient_tree_from_root(tree: nx.Graph, root: str) -> List[Tuple[str, str]]:
    """
    Orient all tree edges away from the root.
    
    Uses BFS to direct edges from parent to child.
    
    Args:
        tree: Undirected tree.
        root: Root node.
        
    Returns:
        Directed edge list `[(source, target), ...]`.
    """
    directed_edges = []
    visited = {root}
    queue = [root]
    
    while queue:
        current = queue.pop(0)
        
        for neighbor in tree.neighbors(current):
            if neighbor not in visited:
                visited.add(neighbor)
                directed_edges.append((current, neighbor))
                queue.append(neighbor)
    
    return directed_edges


def _build_reachability_set(edges: List[Tuple[str, str]], is_mst: bool = True) -> Set[Tuple[str, str]]:
    """
    Build a reachability set from directed edges.
    
    Args:
        edges: Directed edge list.
        is_mst: Reserved flag for future extension (currently unused).
        
    Returns:
        Set of reachable node pairs.
    """
    reachable = set()
    for source, target in edges:
        reachable.add((source, target))
    return reachable


def _has_path_in_graph(graph: nx.DiGraph, source: str, target: str) -> bool:
    """
    Check whether a directed path exists from source to target.
    
    Args:
        graph: Directed graph.
        source: Source node.
        target: Target node.
        
    Returns:
        True if path exists, else False.
    """
    try:
        return nx.has_path(graph, source, target)
    except nx.NodeNotFound:
        return False


def print_generation_info(problem: LayoutProblem, tcg: TCG) -> None:
    """
    Print initial TCG generation summary.
    
    Args:
        problem: Original problem.
        tcg: Generated TCG.
    """
    print("\nInitial TCG Generation Info")
    print("=" * 60)
    print(f"\nGenerated TCG: {tcg}")
    print(f"  Horizontal constraints (Ch): {list(tcg.Ch.edges())}")
    print(f"  Vertical constraints (Cv): {list(tcg.Cv.edges())}")

    print(f"\nProblem size:")
    print(f"  Chiplet count: {len(problem.chiplets)}")
    print(f"  Connection count: {problem.connection_graph.number_of_edges()}")
    
    print(f"\nTCG structure:")
    print(f"  Horizontal constraint count: {tcg.Ch.number_of_edges()}")
    print(f"  Vertical constraint count: {tcg.Cv.number_of_edges()}")
    
    is_valid, message = tcg.is_valid()
    print(f"\nTCG validity: {is_valid} - {message}")


def creat_tcg_ch(directed_mst_edges: List[Tuple[str, str]]) -> List[Tuple[str, str]]:
    """
    Build transitive closure edges from directed MST edges.
    
    For each node pair `(ni, nj)`, add edge `ni -> nj` when
    `ni` is an ancestor of `nj`.
    
    Args:
        directed_mst_edges: Directed MST edge list `[(source, target), ...]`.
        
    Returns:
        Directed edges including MST and transitive closure.
    """
    # Start from original MST edges
    all_edges = set(directed_mst_edges)
    
    # Build directed graph for ancestor checks
    graph = nx.DiGraph()
    graph.add_edges_from(directed_mst_edges)
    
    # Get all nodes
    all_nodes = list(graph.nodes())
    
    # Add edge ni -> nj if ni can reach nj
    for ni in all_nodes:
        for nj in all_nodes:
            if ni != nj:
                # Check if there is a path from ni to nj
                if nx.has_path(graph, ni, nj):
                    # Add transitive edge
                    all_edges.add((ni, nj))
    
    return list(all_edges)


def creat_tcg_cv(chip_ids: List[str], ch_graph: nx.DiGraph) -> List[Tuple[str, str]]:
    """
    Build edge set for `TCG.Cv`.
    
    Select node pairs that are unconstrained in Ch, assign random
    directions, and add them to Cv while keeping Cv acyclic.
    No transitive closure is added to keep Cv sparse.
    
    Args:
        chip_ids: List of all chiplet IDs.
        ch_graph: Built Ch graph (horizontal constraints).
        
    Returns:
        Directed Cv edge list (without transitive closure).
    """
    # Step 1: collect unconstrained pairs in Ch
    unconstrained_pairs = []
    
    for i, chip1 in enumerate(chip_ids):
        for j, chip2 in enumerate(chip_ids):
            if i < j:  # Consider each pair once
                # Check if Ch already constrains this pair
                has_ch_constraint = (
                    _has_path_in_graph(ch_graph, chip1, chip2) or
                    _has_path_in_graph(ch_graph, chip2, chip1)
                )
                
                # Keep pair if unconstrained in Ch
                if not has_ch_constraint:
                    unconstrained_pairs.append((chip1, chip2))
    
    # Step 2: assign directions while avoiding cycles
    # Shuffle pair order
    random.shuffle(unconstrained_pairs)
    
    cv_graph = nx.DiGraph()
    cv_edges = []
    
    for chip1, chip2 in unconstrained_pairs:
        # Choose random direction
        if random.random() < 0.5:
            edge = (chip1, chip2)
        else:
            edge = (chip2, chip1)
        
        # Try edge and check cycle
        cv_graph.add_edge(edge[0], edge[1])
        
        if not nx.is_directed_acyclic_graph(cv_graph):
            # Cycle formed, try reverse edge
            cv_graph.remove_edge(edge[0], edge[1])
            reverse_edge = (edge[1], edge[0])
            cv_graph.add_edge(reverse_edge[0], reverse_edge[1])
            
            if not nx.is_directed_acyclic_graph(cv_graph):
                # Reverse also forms cycle, skip this pair
                cv_graph.remove_edge(reverse_edge[0], reverse_edge[1])
            else:
                # Reverse is valid
                cv_edges.append(reverse_edge)
        else:
            # Original direction is valid
            cv_edges.append(edge)
    
    return cv_edges
    

if __name__ == "__main__":
    # Test example
    print("Initial TCG Generator Test")
    print("=" * 60)
    from unit import load_problem_from_json, save_layout_to_json
    # Create a simple test problem
    problem =  load_problem_from_json("../test_input/12core.json")
    
    # # Add chiplets
    # chips = [
    #     Chiplet("A", 15, 10),
    #     Chiplet("B", 6, 10),
    #     Chiplet("C", 10, 4),
    #     Chiplet("D", 3, 3),
    # ]
    
    # for chip in chips:
    #     problem.add_chiplet(chip)
    
    # # Add weighted connections
    # problem.add_connection("A", "B", weight=5.0)
    # problem.add_connection("B", "D", weight=4.0)
    # problem.add_connection("C", "D", weight=2.0)
    # # problem.add_connection("A", "D", weight=1.0)
    # problem.add_connection("A", "C", weight=3.0)
    
    print(f"\nCreated problem: {problem}")
    print(f"Connections:")
    for u, v, data in problem.connection_graph.edges(data=True):
        print(f"  {u} - {v}: weight={data.get('weight', 1.0)}")
    
    # Generate initial candidate
    print("\n" + "=" * 60)
    print("Generating initial TCG...")
    print("=" * 60)
    
    try:
        # Generate TCG
        tcg = generate_initial_TCG(problem, seed=None)
        print_generation_info(problem, tcg)
        
        # Generate layout using helper in TCG.py
        print("\n" + "=" * 60)
        print("Generating geometric layout from TCG...")
        print("=" * 60)
        
        layout = generate_layout_from_tcg(tcg, problem)
        
        # Print layout details
        from TCG import print_layout_info, get_layout_area
        print_layout_info(layout, "Generated Initial Layout")
        
        # Validate layout
        from chiplet_model import is_layout_valid
        is_valid = is_layout_valid(layout, problem, verbose=True)
        print(f"\nFinal layout validity: {'✓ valid' if is_valid else '✗ invalid'}")
        print(f"Layout area: {get_layout_area(layout):.1f}")
        from unit import visualize_layout_with_bridges
        visualize_layout_with_bridges(layout, problem, "initial_layout.png", show_bridges=True, show_coordinates=True)
        
    except ValueError as e:
        print(f"\nGeneration failed: {e}")





    # print("\n\n" + "=" * 70)
    # print("Test 2: 12-chip complex topology - 1000 random attempts")
    # print("=" * 70)
    # from unit import load_problem_from_json, save_layout_to_json
    # from chiplet_model import is_layout_valid
    # problem2 = load_problem_from_json("../test_input/8core.json")
    
    # max_attempts = 10000
    # success_count = 0
    # best_layout = None
    # best_area = float('inf')
    
    # print(f"\nStart generating {max_attempts} random TCGs and legalizing...")
    # print("=" * 70)
     
    # for attempt in range(max_attempts):
    #     # Generate random TCG
    #     tcg2 = generate_initial_TCG(problem2, seed=None)
    #     layout = generate_layout_from_tcg(tcg2, problem2)
    #     is_valid_layout = is_layout_valid(layout, problem2, verbose=False)
        
        
        
    #     # Validate layout
    #     if is_valid_layout:
    #         success_count += 1
            
    #             # Compute area
    #         x_coords = [chip.x for chip in layout.values()]
    #         y_coords = [chip.y for chip in layout.values()]
    #         x_max = max(chip.x + chip.width for chip in layout.values())
    #         y_max = max(chip.y + chip.height for chip in layout.values())
    #         width = x_max - min(x_coords)
    #         height = y_max - min(y_coords)
    #         area = width * height
                
    #             # Update best layout
    #         if area < best_area:
    #                 best_area = area
    #                 best_layout = layout
    #                 print(f"  [{attempt+1}/{max_attempts}] ✓ Success! area={area:.1f} (w={width:.1f}, h={height:.1f}) [new best]")
    #         else:
    #                 print(f"  [{attempt+1}/{max_attempts}] ✓ Success! area={area:.1f} (w={width:.1f}, h={height:.1f})")
        
    #     # Report progress every 100 runs
    #     if (attempt + 1) % 100 == 0:
    #         print(f"\nProgress: {attempt+1}/{max_attempts}, success rate: {success_count}/{attempt+1} = {success_count/(attempt+1)*100:.1f}%")
    #         print("-" * 70)
    
    # # Final statistics
    # print("\n" + "=" * 70)
    # print("Final statistics")
    # print("=" * 70)
    # print(f"Total attempts: {max_attempts}")
    # print(f"Success count: {success_count}")
    # print(f"Success rate: {success_count/max_attempts*100:.2f}%")
    
    # if best_layout:
    #     print(f"\nBest layout:")
    #     print(f"  Area: {best_area:.1f}")
        
    #     # Visualize best layout
    #     from unit import visualize_layout_with_bridges
    #     visualize_layout_with_bridges(best_layout, problem2, "../output/best_layout.png")
    #     save_layout_to_json(best_layout, "../output/best_layout.json")
        
    #     print(f"\n✓ Best layout saved:")
    #     print(f"  - Visualization: ../output/best_layout.png")
    #     print(f"  - JSON: ../output/best_layout.json")
    # else:
    #     print("\n✗ No legal layout found")
    #     print("Suggestion: increase attempts or relax constraints")
        



 

