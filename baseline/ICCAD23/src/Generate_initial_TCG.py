"""
Initial TCG Generator.

Converts an undirected connection graph into an initial TCG
(transitive closure graph) and its geometric layout.

Implements the maximum-spanning-tree-based partitioning of Lee & Chang,
"Floorplanning for Embedded Multi-Die Interconnect Bridge Packages",
ICCAD'23, §III-B1 (Fig. 7):

  Step 1. Find a maximum spanning tree (MST) in the ECG.
  Step 2. Choose a random root and direct every tree edge parent -> child.
  Step 3. Add `ni -> nj` for every ancestor/descendant pair. The graph that
          holds this closure is the "current topology" (Ch or Cv, chosen at
          random); every pair still unconstrained is given a random direction
          in the other graph.
  Step 4. Alternatively, randomly partition the ECG into two sub-graphs, hold
          one in Ch and the other in Cv, run the MST-based method on each
          separately, and separate the two groups with a partition line.

The MST weight is the bridge bandwidth (`wireCount`), so the highest-bandwidth
bridges become tree edges and therefore reduction edges -- the property the
paper's Step 3 is there to guarantee (`Di - 1` reduction edges per ECG).
"""
import heapq
import itertools
import json
import networkx as nx
import random
from typing import Dict, Tuple, List, Set, Optional
from chiplet_model import Chiplet, LayoutProblem
from TCG import TCG, generate_layout_from_tcg


# Probability of using the paper's two-sub-graph partition variant (§III-B1,
# Fig. 7(c)) instead of one MST over the whole ECG. The partition is the main
# source of structural diversity between bases; the single-MST path remains
# the fallback (and is the only sensible choice for 2-die ECGs).
PARTITION_PROB = 0.5

# Below this die count a random partition only splits off one or two dies and
# adds no structure the single-MST path does not already produce.
MIN_PARTITION_SIZE = 3


def generate_initial_TCG(problem: LayoutProblem, seed: int = None,
                         use_partition: bool = True) -> TCG:
    """
    Generate an initial TCG candidate from the problem graph.

    Steps (paper §III-B1):
    1. Build a maximum spanning tree, weighted by bridge bandwidth.
    2. Choose a random root and orient the tree parent -> child.
    3. Put the ancestor/descendant closure into Ch or Cv (random choice) and
       the remaining pairs, with random directions, into the other graph.
    4. With probability `PARTITION_PROB` (and enough dies), use the partition
       variant instead: two random sub-graphs, one held in Ch and one in Cv,
       separated by a partition line.

    Args:
        problem: Layout problem with chiplets and undirected graph.
        seed: Optional random seed for reproducibility.
        use_partition: False forces the single-MST variant (used by tests and
            by callers that want the pre-partition behaviour).

    Returns:
        Generated TCG object (one Ch/Cv relation per die pair).

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

    chip_ids = list(problem.chiplets.keys())
    tcg = TCG(chip_ids)

    if (use_partition
            and len(chip_ids) >= MIN_PARTITION_SIZE
            and random.random() < PARTITION_PROB):
        _build_partitioned_tcg(problem, tcg, chip_ids)
    else:
        _build_single_mst_tcg(problem, tcg, chip_ids)

    return tcg


def _build_single_mst_tcg(problem: LayoutProblem, tcg: TCG,
                          chip_ids: List[str]) -> str:
    """
    Paper §III-B1 Steps 1-3 on the whole ECG.

    The MST closure goes into Ch or Cv (random, "choose the current topology
    to be in Ch (Cv)"); all remaining pairs go into the other graph with
    random directions.

    Returns:
        Name of the graph that holds the MST closure ('Ch' or 'Cv').
    """
    mst = _compute_maximum_spanning_tree(problem.connection_graph)
    root = random.choice(chip_ids)
    closure = creat_tcg_ch(_orient_tree_from_root(mst, root))

    mst_graph = 'Ch' if random.random() < 0.5 else 'Cv'
    other_graph = 'Cv' if mst_graph == 'Ch' else 'Ch'
    _graph(tcg, mst_graph).add_edges_from(closure)
    _complete_constraints(chip_ids, tcg, other_graph)
    return mst_graph


def _build_partitioned_tcg(problem: LayoutProblem, tcg: TCG,
                           chip_ids: List[str]) -> str:
    """
    Paper §III-B1 Step 4: partition the ECG into two sub-graphs, one held in
    Ch and the other in Cv (Fig. 7(c)(d)).

    Each sub-graph gets its own maximum spanning tree, random root and
    ancestor/descendant closure. Every pair that spans the partition is then
    ordered by the partition line: either all of group 0 left of group 1 (line
    in Ch) or all of group 0 below group 1 (line in Cv). The remaining pairs
    are completed in Cv, as in Step 3.

    Returns:
        Name of the graph that carries the partition line ('Ch' or 'Cv').
    """
    order = list(chip_ids)
    random.shuffle(order)
    cut = random.randint(1, len(order) - 1)
    groups = (order[:cut], order[cut:])

    group_closures = []
    for group in groups:
        # The induced sub-graph can be disconnected (the partition cuts tree
        # edges); the MST helper returns a forest and the orientation below
        # roots every component separately.
        #
        # Build the induced graph as a real Graph in `group` order instead of
        # using `connection_graph.subgraph(group)`: the view's node/edge
        # iteration follows an internal set, so its order changes with
        # PYTHONHASHSEED. That leaked into the MST start node, the tree's node
        # order and then into `_orient_tree_from_root` -- two processes with
        # the same random seed built different initial topologies.
        group_nodes = set(group)
        sub_graph = nx.Graph()
        sub_graph.add_nodes_from(group)
        for u, v, data in problem.connection_graph.edges(data=True):
            if u in group_nodes and v in group_nodes:
                sub_graph.add_edge(u, v, **data)
        forest = _compute_maximum_spanning_tree(sub_graph)
        group_closures.append(
            creat_tcg_ch(_orient_tree_from_root(forest, random.choice(group))))

    if random.random() < 0.5:
        # Vertical partition line: group 0 is left of group 1.
        tcg.Ch.add_edges_from(group_closures[0])
        tcg.Cv.add_edges_from(group_closures[1])
        for left in groups[0]:
            for right in groups[1]:
                tcg.Ch.add_edge(left, right)
        line_graph = 'Ch'
    else:
        # Horizontal partition line: group 0 is below group 1.
        tcg.Cv.add_edges_from(group_closures[0])
        tcg.Ch.add_edges_from(group_closures[1])
        for bottom in groups[0]:
            for top in groups[1]:
                tcg.Cv.add_edge(bottom, top)
        line_graph = 'Cv'

    # Paper Step 3: the pairs not constrained by the partition or either MST
    # go into the other graph with random directions.
    _complete_constraints(chip_ids, tcg,
                          'Cv' if line_graph == 'Ch' else 'Ch')
    return line_graph


def _graph(tcg: TCG, name: str) -> nx.DiGraph:
    """Return `tcg.Ch` or `tcg.Cv` by name."""
    return tcg.Ch if name == 'Ch' else tcg.Cv


def _mst_weight(data: Dict) -> float:
    """
    Weight of one bridge edge for the maximum spanning tree.

    Uses the bridge bandwidth `wireCount` (falling back to the generic
    `weight`): maximizing it makes the highest-bandwidth bridges tree edges,
    hence reduction edges, which is what the EMIB adjacency constraint needs.
    """
    try:
        value = data.get('wireCount', data.get('weight', 1.0))
        return float(value) if value is not None else 1.0
    except (TypeError, ValueError):
        return 1.0


def _compute_maximum_spanning_tree(graph: nx.Graph) -> nx.Graph:
    """
    Compute a maximum spanning tree (forest if disconnected) from an
    undirected graph, weighted by bridge bandwidth.

    Paper §III-B1 Step 1 names Prim's algorithm, but NetworkX's `prim` starts
    from `set(G).pop()`: for string die ids that order changes with
    PYTHONHASHSEED, and with the many tied integer `wireCount` weights it
    produces a different tree in every process. That leaked into the whole
    pipeline -- the same random seed could legalize 411 or 148 topologies
    depending on the process. The Prim below keeps the algorithm and the
    weight/tie-break rule (`(weight, discovery order)`) but starts from the
    first node in the graph's deterministic insertion order and expands in
    deterministic adjacency order.

    Args:
        graph: Undirected graph whose edges carry `wireCount`/`weight`.

    Returns:
        Maximum spanning tree as `nx.Graph`.
    """
    weighted_graph = nx.Graph()
    for u, v, data in graph.edges(data=True):
        weighted_graph.add_edge(u, v, weight=_mst_weight(data))

    if weighted_graph.number_of_nodes() == 0:
        return weighted_graph

    return _prim_maximum_forest(weighted_graph)


def _prim_maximum_forest(graph: nx.Graph) -> nx.Graph:
    """Deterministic Prim maximum spanning forest (see the caller)."""
    tree = nx.Graph()
    tree.add_nodes_from(graph.nodes())
    visited: Set[str] = set()

    # Every component is started from its first node in insertion order, so the
    # forest does not depend on set iteration order.
    for start in graph.nodes():
        if start in visited:
            continue
        visited.add(start)
        frontier: List[Tuple[float, int, str, str]] = []
        order = itertools.count()

        def push(u: str) -> None:
            for v, data in graph.adj[u].items():
                if v in visited:
                    continue
                weight = data.get('weight', 1.0)
                heapq.heappush(frontier, (-weight, next(order), u, v))

        push(start)
        while frontier:
            neg_weight, _, u, v = heapq.heappop(frontier)
            if v in visited:
                continue
            visited.add(v)
            tree.add_edge(u, v, weight=-neg_weight)
            push(v)

    return tree


def _orient_tree_from_root(tree: nx.Graph, root: str) -> List[Tuple[str, str]]:
    """
    Orient all tree edges away from the root.

    Uses BFS to direct edges from parent to child. When `tree` is a forest
    (possible inside a partition group), the root's component is oriented from
    `root` and every other component from a randomly chosen node, so that no
    component is left out of the topology.

    Args:
        tree: Undirected tree or forest.
        root: Root node.

    Returns:
        Directed edge list `[(source, target), ...]`.
    """
    directed_edges: List[Tuple[str, str]] = []
    visited: Set[str] = set()

    def bfs(start: str):
        visited.add(start)
        queue = [start]
        while queue:
            current = queue.pop(0)
            for neighbor in tree.neighbors(current):
                if neighbor not in visited:
                    visited.add(neighbor)
                    directed_edges.append((current, neighbor))
                    queue.append(neighbor)

    if root in tree:
        bfs(root)

    # Remaining components, in sorted node order (deterministic regardless of
    # how the caller's graph was built). The component root is drawn from the
    # sorted unvisited list for the same reason: `random.choice` must index a
    # list whose order does not depend on PYTHONHASHSEED.
    for node in sorted(tree.nodes()):
        if node not in visited:
            unvisited = sorted(n for n in tree.nodes() if n not in visited)
            bfs(random.choice(unvisited))

    return directed_edges


def _complete_constraints(chip_ids: List[str], tcg: TCG,
                          target_name: str) -> List[Tuple[str, str]]:
    """
    Give every still-unconstrained die pair one random relation in `target`.

    Paper §III-B1 Step 3 ("the remaining edges ... should be added in the
    other graph"). `TCG.is_valid()` requires exactly one direct relation per
    pair, so pairs with no relation in either graph are completed here.

    A direction that would close a cycle is flipped; the reverse direction is
    then always safe, because a cycle in the reverse would mean `target`
    already contains both a path u -> v and a path v -> u, which a DAG cannot.

    Args:
        chip_ids: All die ids, in the problem's order.
        tcg: TCG being built.
        target_name: 'Ch' or 'Cv'.

    Returns:
        The edges added.
    """
    target = _graph(tcg, target_name)
    other = _graph(tcg, 'Cv' if target_name == 'Ch' else 'Ch')

    unconstrained = []
    for i, chip1 in enumerate(chip_ids):
        for chip2 in chip_ids[i + 1:]:
            if (target.has_edge(chip1, chip2) or target.has_edge(chip2, chip1)
                    or other.has_edge(chip1, chip2) or other.has_edge(chip2, chip1)):
                continue
            unconstrained.append((chip1, chip2))

    # Shuffling the pair order varies which direction each later pair gets:
    # an earlier pair constrains the DAG and can force the reverse of a later
    # one, so the order is part of the topology's diversity.
    random.shuffle(unconstrained)

    added = []
    for chip1, chip2 in unconstrained:
        if random.random() < 0.5:
            edge, reverse = (chip1, chip2), (chip2, chip1)
        else:
            edge, reverse = (chip2, chip1), (chip1, chip2)

        if nx.has_path(target, edge[1], edge[0]):
            edge = reverse
        target.add_edge(*edge)
        added.append(edge)

    return added


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
    # Start from original MST edges. Keep the insertion order explicit (rather
    # than iterating a set at the end): set iteration order depends on
    # PYTHONHASHSEED, which would make the TCG edge order — and therefore the
    # whole layout — differ between processes even with the same seed.
    all_edges = list(dict.fromkeys(directed_mst_edges))
    seen = set(all_edges)

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
                    if (ni, nj) not in seen:
                        seen.add((ni, nj))
                        all_edges.append((ni, nj))

    return all_edges


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
        



 

