"""
Legality-optimized simulated annealing.

Uses a legality cost function to guide TCG optimization.
"""
import networkx as nx
from typing import Dict, Set, Tuple, List
from TCG import TCG
from chiplet_model import Chiplet, LayoutProblem, MIN_OVERLAP, get_adjacency_info


def count_emib_closure_edges(tcg: TCG, problem: LayoutProblem) -> int:
    """
    Count how many EMIB edges are closure edges.

    Key constraint: EMIB edges should be reduction edges.
    A closure EMIB edge implies indirect relation with blockers.
    
    Args:
        tcg: TCG topology
        problem: Layout problem
        
    Returns:
        Number of closure edges among EMIB edges
    """
    emib_closure_count = 0
    
    # Iterate all EMIB connections
    for chip1_id, chip2_id in problem.connection_graph.edges():
        # Check if this EMIB edge is a closure edge in Ch or Cv
        
        # Case in Ch
        if tcg.Ch.has_edge(chip1_id, chip2_id):
            # Check closure
            is_closure = False
            for nk in tcg.Ch.nodes():
                if nk != chip1_id and nk != chip2_id:
                    if tcg.Ch.has_edge(chip1_id, nk) and tcg.Ch.has_edge(nk, chip2_id):
                        is_closure = True
                        break
            if is_closure:
                emib_closure_count += 1
        
        elif tcg.Ch.has_edge(chip2_id, chip1_id):
            # Reverse edge
            is_closure = False
            for nk in tcg.Ch.nodes():
                if nk != chip1_id and nk != chip2_id:
                    if tcg.Ch.has_edge(chip2_id, nk) and tcg.Ch.has_edge(nk, chip1_id):
                        is_closure = True
                        break
            if is_closure:
                emib_closure_count += 1
        
        # Case in Cv
        elif tcg.Cv.has_edge(chip1_id, chip2_id):
            is_closure = False
            for nk in tcg.Cv.nodes():
                if nk != chip1_id and nk != chip2_id:
                    if tcg.Cv.has_edge(chip1_id, nk) and tcg.Cv.has_edge(nk, chip2_id):
                        is_closure = True
                        break
            if is_closure:
                emib_closure_count += 1
        
        elif tcg.Cv.has_edge(chip2_id, chip1_id):
            is_closure = False
            for nk in tcg.Cv.nodes():
                if nk != chip1_id and nk != chip2_id:
                    if tcg.Cv.has_edge(chip2_id, nk) and tcg.Cv.has_edge(nk, chip1_id):
                        is_closure = True
                        break
            if is_closure:
                emib_closure_count += 1
    
    return emib_closure_count


def count_closure_edges(graph: nx.DiGraph) -> int:
    """
    Count closure edges in a directed graph.

    Edge `ni -> nj` is closure if there exists `nk` such that
    `ni -> nk` and `nk -> nj` both exist.
    
    Args:
        graph: Directed graph
        
    Returns:
        Number of closure edges
    """
    closure_count = 0
    
    for ni, nj in graph.edges():
        # Check if an intermediate node nk exists
        is_closure = False
        for nk in graph.nodes():
            if nk != ni and nk != nj:
                # Check path ni -> nk -> nj
                if graph.has_edge(ni, nk) and graph.has_edge(nk, nj):
                    is_closure = True
                    break
        
        if is_closure:
            closure_count += 1
    
    return closure_count


def get_emib_edges(problem: LayoutProblem) -> Set[Tuple[str, str]]:
    """
    Get all EMIB edges (bridge connection edges).
    
    Args:
        problem: Layout problem
        
    Returns:
        EMIB edge set
    """
    emib_edges = set()
    for chip1_id, chip2_id in problem.connection_graph.edges():
        emib_edges.add((chip1_id, chip2_id))
        emib_edges.add((chip2_id, chip1_id))  # Bidirectional
    return emib_edges


def count_legal_emib_edges(tcg: TCG, problem: LayoutProblem, layout: Dict[str, Chiplet]) -> int:
    """
    Count legal EMIB edges in current layout.

    A legal EMIB edge means adjacent chiplets with overlap >= threshold.
    
    Args:
        tcg: TCG topology
        problem: Layout problem
        layout: Current layout
        
    Returns:
        Number of legal EMIB edges
    """
    legal_count = 0
    
    for chip1_id, chip2_id in problem.connection_graph.edges():
        chip1 = layout.get(chip1_id)
        chip2 = layout.get(chip2_id)
        
        if chip1 and chip2:
            is_adj, overlap_len, _ = get_adjacency_info(chip1, chip2)
            if is_adj and overlap_len >= problem.connection_graph[chip1_id][chip2_id].get('EMIB_length', MIN_OVERLAP):
                legal_count += 1
    
    return legal_count


def cost_legal(tcg: TCG, problem: LayoutProblem, layout: Dict[str, Chiplet],
               alpha_c: float = 1.0, beta_l: float = 1.0) -> float:
    """
        Compute legality cost of a TCG.

        Formula: `Clegal = αc * Pc(Ti) + βl * Pl(Ti)`
        - `Pc`: ratio of EMIB closure edges
        - `Pl`: ratio of illegal EMIB edges
    
    Args:
        tcg: TCG graph
        problem: Layout problem
        layout: Current layout
        alpha_c: Penalty weight for EMIB closure edges
        beta_l: Penalty weight for illegal EMIB edges
        
    Returns:
        Legality cost (lower is better)
    """
    total_emib_edges = len(problem.connection_graph.edges())  # 无向边数量
    
    if total_emib_edges == 0:
        # No bridge connections
        return 0.0
    
    # 1) Ratio of EMIB closure edges: Pc
    emib_closure_count = count_emib_closure_edges(tcg, problem)
    Pc = emib_closure_count / total_emib_edges if total_emib_edges > 0 else 0.0
    
    # 2) Ratio of illegal EMIB edges: Pl
    legal_emib_count = count_legal_emib_edges(tcg, problem, layout)
    illegal_emib_count = total_emib_edges - legal_emib_count
    
    Pl = illegal_emib_count / total_emib_edges if total_emib_edges > 0 else 0.0
    
    # 3) Total cost
    Clegal = alpha_c * Pc + beta_l * Pl
    
    return Clegal


def SA_1(initial_tcg: TCG, problem: LayoutProblem, 
         max_iterations: int = 10000,
         initial_temp: float = 100.0,
         cooling_rate: float = 0.95,
         alpha_c: float = 1.0,
         beta_l: float = 2.0,
         use_legalize: bool = True,
         verbose: bool = False) -> Tuple[List[TCG], List[Dict[str, Chiplet]], float]:
    """
        Legality-optimized simulated annealing.

        Searches from an initial (possibly illegal) TCG toward legal
        solutions with `cost_legal = 0`, optionally using `legalize_tcg`.
    
    Args:
        initial_tcg: Initial TCG (may be illegal)
        problem: Layout problem
        max_iterations: Max iterations
        initial_temp: Initial temperature
        cooling_rate: Cooling rate
        alpha_c: Penalty for EMIB closure edges
        beta_l: Penalty for illegal EMIB edges
        use_legalize: Try `legalize_tcg` on neighbors
        verbose: Print detailed logs
        
    Returns:
        `(legal_tcgs, legal_layouts, best_cost)`:
        - `legal_tcgs`: all found legal TCGs
        - `legal_layouts`: corresponding legal layouts
        - `best_cost`: best observed cost
    """
    import copy
    import random
    import math
    from TCG import generate_layout_from_tcg
    from legalize_tcg import legalize_tcg
    
    # Initialize
    current_tcg = copy.deepcopy(initial_tcg)
    current_layout = generate_layout_from_tcg(current_tcg, problem)
    current_cost = cost_legal(current_tcg, problem, current_layout, alpha_c, beta_l)
    
    # Return early if initial TCG is already legal
    if abs(current_cost) < 1e-6:
        if verbose:
            print(f"SA_1 legality optimization: initial TCG is already legal")
            print(f"  Initial cost: {current_cost:.4f}")
        return [copy.deepcopy(current_tcg)], [copy.deepcopy(current_layout)], 0.0
    
    # If enabled, try legalizing initial TCG first
    if use_legalize:
        success, legalized_tcg, legalized_layout = legalize_tcg(current_tcg, problem, verbose=False)
        if success:
            legalized_cost = cost_legal(legalized_tcg, problem, legalized_layout, alpha_c, beta_l)
            if legalized_cost < current_cost:
                current_tcg = legalized_tcg
                current_layout = legalized_layout
                current_cost = legalized_cost
                if verbose:
                    print(f"  Initial TCG improved by legalize: {current_cost:.4f}")
                if abs(current_cost) < 1e-6:
                    if verbose:
                        print(f"  Initial TCG becomes legal after legalize")
                    return [copy.deepcopy(current_tcg)], [copy.deepcopy(current_layout)], 0.0
    
    best_tcg = copy.deepcopy(current_tcg)
    best_layout = copy.deepcopy(current_layout)
    best_cost = current_cost
    
    # Store all legal solutions found
    legal_tcgs = []
    legal_layouts = []
    
    if verbose:
        print(f"SA_1 legality optimization starts")
        print(f"Initial cost: {current_cost:.4f}")
        print(f"Target: cost_legal = 0.0")
        print(f"legalize_tcg enabled: {use_legalize}")
        print("=" * 70)
    
    temp = initial_temp
    iterations_without_improvement = 0
    legalize_success_count = 0
    
    for iteration in range(max_iterations):
        # Generate neighbor by random operation
        neighbor_tcg = _generate_neighbor_tcg(current_tcg, problem)
        
        # Validate TCG
        is_valid, msg = neighbor_tcg.is_valid()
        if not is_valid:
            continue  # Skip invalid TCG
        
        # Generate layout and compute cost
        try:
            neighbor_layout = generate_layout_from_tcg(neighbor_tcg, problem)
            neighbor_cost = cost_legal(neighbor_tcg, problem, neighbor_layout, alpha_c, beta_l)
            
            # Try improving neighbor with legalize_tcg
            if use_legalize:
                success, legalized_tcg, legalized_layout = legalize_tcg(neighbor_tcg, problem, verbose=False)
                if success:
                    legalized_cost = cost_legal(legalized_tcg, problem, legalized_layout, alpha_c, beta_l)
                    if legalized_cost < neighbor_cost:
                        # legalize improves solution
                        neighbor_tcg = legalized_tcg
                        neighbor_layout = legalized_layout
                        neighbor_cost = legalized_cost
                        legalize_success_count += 1
                        
                        # If legalize directly finds a legal solution
                        if abs(neighbor_cost) < 1e-6:
                            if verbose and len(legal_tcgs) < 10:  # Print first 10 only
                                print(f"  [iter {iteration}] legalize found legal solution! (#{len(legal_tcgs)+1})")
                            legal_tcgs.append(copy.deepcopy(neighbor_tcg))
                            legal_layouts.append(copy.deepcopy(neighbor_layout))
        
        except Exception as e:
            if verbose and iteration % 100 == 0:
                print(f"  Layout generation failed: {e}")
            continue
        
        # Metropolis criterion
        delta_cost = neighbor_cost - current_cost
        
        if delta_cost < 0 or random.random() < math.exp(-delta_cost / temp):
            # Accept new solution
            current_tcg = neighbor_tcg
            current_layout = neighbor_layout
            current_cost = neighbor_cost
            
            # Update best solution
            if current_cost < best_cost:
                best_tcg = copy.deepcopy(current_tcg)
                best_layout = copy.deepcopy(current_layout)
                best_cost = current_cost
                iterations_without_improvement = 0
                
                if verbose:
                    print(f"  [iter {iteration}] New best cost: {best_cost:.4f} (temp={temp:.2f})")
                
                # Check if legal solution is found
                if abs(best_cost) < 1e-6:  # cost ≈ 0
                    if best_tcg not in [tcg for tcg in legal_tcgs]:
                        legal_tcgs.append(copy.deepcopy(best_tcg))
                        legal_layouts.append(copy.deepcopy(best_layout))
                        
                        if verbose:
                            print(f"  ✓ Found legal solution! (#{len(legal_tcgs)})")
            else:
                iterations_without_improvement += 1
        
        # Cool down
        if iteration % 100 == 0:
            temp *= cooling_rate
        
        # Progress log
        if verbose and iteration % 500 == 0 and iteration > 0:
            print(f"  [iter {iteration}/{max_iterations}] current={current_cost:.4f}, "
                  f"best={best_cost:.4f}, temp={temp:.2f}, legal={len(legal_tcgs)}, "
                  f"legalize_success={legalize_success_count}")
        
        # Early stopping
        if len(legal_tcgs) >= 1000:
            if verbose:
                print(f"  Found {len(legal_tcgs)} legal solutions, stopping early")
            break
        
        if iterations_without_improvement > 30000:
            if verbose:
                print(f"  No improvement for 30000 iterations, stopping early")
            break
    
    if verbose:
        print("=" * 70)
        print(f"SA_1 completed:")
        print(f"  Best cost: {best_cost:.4f}")
        print(f"  Legal solutions found: {len(legal_tcgs)}")
        print(f"  Total iterations: {iteration + 1}")
        if use_legalize:
            print(f"  legalize success count: {legalize_success_count}")
    
    # Return legal solution set if found; otherwise return best cost only
    if len(legal_tcgs) > 0:
        return legal_tcgs, legal_layouts, 0.0
    else:
        # No legal solution found
        return [], [], best_cost


def _generate_neighbor_tcg(tcg: TCG, problem: LayoutProblem) -> TCG:
    """
    Generate a neighboring TCG by random operation.

    Operations:
    1. Reverse direction of one edge in Ch/Cv
    2. Move one non-EMIB edge between Ch and Cv
    3. Randomly add/remove one edge
    
    Args:
        tcg: Current TCG
        problem: Layout problem
        
    Returns:
        New neighboring TCG
    """
    import copy
    import random
    
    new_tcg = copy.deepcopy(tcg)
    
    # Randomly select operation type
    op_type = random.choice([1, 2, 3])
    
    if op_type == 1:
        # Op1: reverse one edge
        graph_choice = random.choice(['Ch', 'Cv'])
        graph = new_tcg.Ch if graph_choice == 'Ch' else new_tcg.Cv
        
        if graph.number_of_edges() > 0:
            edge = random.choice(list(graph.edges()))
            graph.remove_edge(edge[0], edge[1])
            graph.add_edge(edge[1], edge[0])
    
    elif op_type == 2:
        # Op2: move edge between Ch and Cv
        if new_tcg.Ch.number_of_edges() > 0 and random.random() < 0.5:
            # Ch -> Cv
            edge = random.choice(list(new_tcg.Ch.edges()))
            # EMIB edges cannot be moved
            is_emib = problem.connection_graph.has_edge(edge[0], edge[1])
            if not is_emib:
                new_tcg.Ch.remove_edge(edge[0], edge[1])
                new_tcg.Cv.add_edge(edge[0], edge[1])
        elif new_tcg.Cv.number_of_edges() > 0:
            # Cv -> Ch
            edge = random.choice(list(new_tcg.Cv.edges()))
            is_emib = problem.connection_graph.has_edge(edge[0], edge[1])
            if not is_emib:
                new_tcg.Cv.remove_edge(edge[0], edge[1])
                new_tcg.Ch.add_edge(edge[0], edge[1])
    
    elif op_type == 3:
        # Op3: randomly add or remove one edge
        graph_choice = random.choice(['Ch', 'Cv'])
        graph = new_tcg.Ch if graph_choice == 'Ch' else new_tcg.Cv
        
        nodes = list(graph.nodes())
        if len(nodes) >= 2:
            n1, n2 = random.sample(nodes, 2)
            if graph.has_edge(n1, n2):
                # Keep EMIB edges unchanged
                is_emib = problem.connection_graph.has_edge(n1, n2)
                if not is_emib:
                    graph.remove_edge(n1, n2)
            else:
                graph.add_edge(n1, n2)
    
    return new_tcg


# ============================================================================
# Test code
# ============================================================================

if __name__ == "__main__":
    from unit import load_problem_from_json
    from Generate_initial_TCG import generate_initial_TCG
    from TCG import generate_layout_from_tcg
    from legalize_tcg import legalize_tcg
    
    print("=" * 70)
    print("Legality Cost Function Test")
    print("=" * 70)
    
    # Test 1: simple 3-chip case
    print("\nTest 1: 3-chip case")
    print("-" * 70)
    
    problem = load_problem_from_json("../test_input/3core.json")
    print(f"Loaded problem: {len(problem.chiplets)} chiplets, {problem.connection_graph.number_of_edges()} edges")
    
    # Generate random TCG
    # tcg = generate_initial_TCG(problem, seed=42)
   

    tcg=TCG(["A","B","C"])
    tcg.add_horizontal_constraint("C","B")
    tcg.add_horizontal_constraint("A","C")
    tcg.add_horizontal_constraint("A","B")


    print(f"\nGenerated TCG: Ch edges={tcg.Ch.number_of_edges()}, Cv edges={tcg.Cv.number_of_edges()}")
    print(f"TCG.Ch edges: {list(tcg.Ch.edges())}")
    print(f"TCG.Cv edges: {list(tcg.Cv.edges())}")
    
    # Generate initial layout
    layout = generate_layout_from_tcg(tcg, problem)
    print(f"\nInitial layout:")
    for chip_id, chip in layout.items():
        print(f"  {chip_id}: ({chip.x:.1f}, {chip.y:.1f})")
    
    # Compute legality cost
    print(f"\nComputing legality cost...")
    
    # Detailed breakdown
    ch_closure = count_closure_edges(tcg.Ch)
    cv_closure = count_closure_edges(tcg.Cv)
    total_closure = ch_closure + cv_closure
    
    total_emib = len(problem.connection_graph.edges())
    legal_emib = count_legal_emib_edges(tcg, problem, layout)
    illegal_emib = total_emib - legal_emib
    
    emib_closure = count_emib_closure_edges(tcg, problem)
    Pc = emib_closure / total_emib if total_emib > 0 else 0.0
    Pl = illegal_emib / total_emib if total_emib > 0 else 0.0
    
    print(f"  Ch closure edges: {ch_closure} (may include non-EMIB)")
    print(f"  Cv closure edges: {cv_closure}")
    print(f"  Total closure edges: {total_closure}")
    print(f"  ────────────────")
    print(f"  Total EMIB edges: {total_emib}")
    print(f"  EMIB closure edges: {emib_closure} ⚠️ should be 0")
    print(f"  Legal EMIB edges: {legal_emib}")
    print(f"  Illegal EMIB edges: {illegal_emib}")
    print(f"  ────────────────")
    print(f"  Pc (EMIB closure ratio): {Pc:.4f}")
    print(f"  Pl (illegal EMIB ratio): {Pl:.4f}")
    
    cost = cost_legal(tcg, problem, layout, alpha_c=1.0, beta_l=1.0)
    print(f"\n  Clegal = {Pc:.4f} + {Pl:.4f} = {cost:.4f}")
    
    # Try legalization
    print(f"\nTrying to legalize TCG...")
    success, legal_tcg, legal_layout = legalize_tcg(tcg, problem, verbose=False)
    
    if success:
        print(f"✓ Legalization succeeded")
        print(f"\nLayout after legalization:")
        for chip_id, chip in legal_layout.items():
            print(f"  {chip_id}: ({chip.x:.1f}, {chip.y:.1f})")
        
        # Compute cost after legalization
        legal_cost = cost_legal(legal_tcg, problem, legal_layout, alpha_c=1.0, beta_l=1.0)
        
        legal_emib_after = count_legal_emib_edges(legal_tcg, problem, legal_layout)
        illegal_emib_after = total_emib - legal_emib_after
        Pl_after = illegal_emib_after / total_emib if total_emib > 0 else 0.0
        
        print(f"\nAfter legalization:")
        print(f"  Legal EMIB edges: {legal_emib_after}/{total_emib}")
        print(f"  Illegal EMIB edges: {illegal_emib_after}")
        print(f"  Pl (illegal edge ratio): {Pl_after:.4f}")
        print(f"  Clegal = {legal_cost:.4f}")
        print(f"  Cost change: {cost - legal_cost:.4f} ({'decreased' if legal_cost < cost else 'increased'})")
    else:
        print(f"✗ Legalization failed")
    
    # # Test 2: complex 8-chip case
    # print("\n\n" + "=" * 70)
    # print("Test 2: 8-chip case - validate EMIB closure detection")
    # print("=" * 70)
    
    # problem2 = load_problem_from_json("../test_input/8core.json")
    # print(f"Loaded problem: {len(problem2.chiplets)} chiplets, {problem2.connection_graph.number_of_edges()} edges")
    
    # # Test multiple random TCGs
    # print(f"\nTesting EMIB closure edges on 10 random TCGs...")
    # costs = []
    
    # for i in range(1000):
    #     tcg2 = generate_initial_TCG(problem2, seed=None)
    #     layout2 = generate_layout_from_tcg(tcg2, problem2)
        
    #     emib_closure2 = count_emib_closure_edges(tcg2, problem2)
    #     cost2 = cost_legal(tcg2, problem2, layout2, alpha_c=1.0, beta_l=2.0)
    #     costs.append(cost2)
        
    #     legal_count2 = count_legal_emib_edges(tcg2, problem2, layout2)
    #     total_emib2 = len(problem2.connection_graph.edges())
        
    #     print(f"  TCG {i+1}: EMIB closure={emib_closure2}/{total_emib2}, "
    #           f"legal edges={legal_count2}/{total_emib2}, Clegal={cost2:.4f}")
    
    # print(f"\nStatistics:")
    # print(f"  Average cost: {sum(costs)/len(costs):.4f}")
    # print(f"  Min cost: {min(costs):.4f}")
    # print(f"  Max cost: {max(costs):.4f}")
    
    # print("\n" + "=" * 70)
    # print("✓ Test complete")
    # print("=" * 70)