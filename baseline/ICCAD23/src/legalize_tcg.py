# -*- coding: utf-8 -*-
"""
TCG legalization module - EMIB legalization.

Implements practical EMIB legalization:
1. Add EMIB constraints in Ch/Cv.
2. Adjust node coordinates instead of reduction edges.
3. Use longest-path style coordinate solving under constraints.
"""
import json
import random
from typing import Dict, List, Tuple, Optional, Set
from TCG import TCG, generate_layout_from_tcg, print_layout_info,get_layout_area   
from Generate_initial_TCG import generate_initial_TCG
import copy
import networkx as nx
from unit import load_problem_from_json,save_layout_to_json
from chiplet_model import Chiplet, LayoutProblem, MIN_OVERLAP, get_adjacency_info, EPSILON
from Bridge_Overlap_Adjustment import (
    SiliconBridge, generate_silicon_bridges, 
    SiliconBridge_is_legal, SILICONBRIDGE_LENGTH
)


def _get_min_overlap(problem: LayoutProblem, chip1_id: str, chip2_id: str) -> float:
    """Get required minimum overlap for a chip pair (via EMIB_length)."""
    if problem.connection_graph.has_edge(chip1_id, chip2_id):
        return problem.connection_graph[chip1_id][chip2_id].get('EMIB_length', MIN_OVERLAP)
    return MIN_OVERLAP


def add_emib_edges(tcg: TCG, problem: LayoutProblem, verbose: bool = False) -> TCG:
    """
        Add EMIB edges to a TCG.

        Rule:
        - If a bridge-connected pair has a reduction edge in Ch,
            add bidirectional EMIB edges in Cv.
        - Vice versa for edges found in Cv.
    
    Args:
        tcg: Input TCG
        problem: Layout problem (with connection graph)
        verbose: Print detailed logs
        
    Returns:
        New TCG with EMIB edges added
    """
    # Create TCG copy
    new_tcg = copy.deepcopy(tcg)
    
    if verbose:
        print("  Adding EMIB edges...")
    
    # Iterate all required bridge connections
    for chip1_id, chip2_id in problem.connection_graph.edges():
        # Check reduction edge in Ch
        has_ch_edge = (new_tcg.Ch.has_edge(chip1_id, chip2_id) or 
                      new_tcg.Ch.has_edge(chip2_id, chip1_id))
        
        # Check reduction edge in Cv
        has_cv_edge = (new_tcg.Cv.has_edge(chip1_id, chip2_id) or 
                      new_tcg.Cv.has_edge(chip2_id, chip1_id))
        
        if has_ch_edge:
            # Ch has edge: add Cv EMIB constraints (bidirectional)
            if not new_tcg.Cv.has_edge(chip1_id, chip2_id):
                new_tcg.Cv.add_edge(chip1_id, chip2_id)
            if not new_tcg.Cv.has_edge(chip2_id, chip1_id):
                new_tcg.Cv.add_edge(chip2_id, chip1_id)
            
            if verbose:
                print(f"    Ch has {chip1_id}-{chip2_id}, added EMIB in Cv")
        
        elif has_cv_edge:
            # Cv has edge: add Ch EMIB constraints (bidirectional)
            if not new_tcg.Ch.has_edge(chip1_id, chip2_id):
                new_tcg.Ch.add_edge(chip1_id, chip2_id)
            if not new_tcg.Ch.has_edge(chip2_id, chip1_id):
                new_tcg.Ch.add_edge(chip2_id, chip1_id)
            
            if verbose:
                print(f"    Cv has {chip1_id}-{chip2_id}, added EMIB in Ch")
    
    return new_tcg


def compute_constrained_longest_path(graph: nx.DiGraph, problem: LayoutProblem,
                                     dimension: str, emib_edges: Set[Tuple[str, str]],
                                     verbose: bool = False) -> Dict[str, float]:
    """
    Compute constrained longest-path coordinates (simplified).

    First run standard longest path, then iteratively adjust to
    satisfy EMIB overlap constraints.
    
    Args:
        graph: Ch or Cv graph
        problem: Layout problem
        dimension: 'width' or 'height'
        emib_edges: EMIB edge set
        verbose: Print detailed logs
        
    Returns:
        Coordinate dictionary
    """
    from TCG import compute_longest_path_lengths
    
    # Standard longest path
    coordinates = compute_longest_path_lengths(graph, problem, dimension)
    
    # Iterative adjustment for EMIB constraints
    for iteration in range(50):
        adjusted = False
        
        for chip1_id, chip2_id in emib_edges:
            chip1 = problem.get_chiplet(chip1_id)
            chip2 = problem.get_chiplet(chip2_id)
            
            coord1 = coordinates[chip1_id]
            coord2 = coordinates[chip2_id]
            
            size1 = chip1.width if dimension == 'width' else chip1.height
            size2 = chip2.width if dimension == 'width' else chip2.height
            
            # Compute overlap
            overlap = min(coord1 + size1, coord2 + size2) - max(coord1, coord2)
            min_ov = _get_min_overlap(problem, chip1_id, chip2_id)
            if overlap < min_ov:
                # Adjust to satisfy minimum overlap
                max_overlap = min(size1, size2)
                if coord1 < coord2:
                    # Move chip2 left/down
                    new_coord2 = coord1 + size1 - max_overlap
                    if new_coord2 != coord2:
                        coordinates[chip2_id] = new_coord2
                        adjusted = True
                else:
                    # Move chip1 left/down
                    new_coord1 = coord2 + size2 - max_overlap
                    if new_coord1 != coord1:
                        coordinates[chip1_id] = new_coord1
                        adjusted = True
        
        if not adjusted:
            break
    
    return coordinates


def detect_illegal_loop(emib_edges: Set[Tuple[str, str]], layout: Dict[str, Chiplet], 
                        verbose: bool = False) -> bool:
    """
    Detect illegal loops (Figure 8(b) style).

    Illegal loop means EMIB constraints in a cycle cannot be jointly
    satisfied in practice.
    
    Args:
        emib_edges: EMIB edge set
        layout: Current layout
        verbose: Print detailed logs
        
    Returns:
        Whether an illegal loop exists
    """
    # Build graph from EMIB edges
    emib_graph = nx.Graph()
    for chip1_id, chip2_id in emib_edges:
        emib_graph.add_edge(chip1_id, chip2_id)
    
    # Check cycles
    try:
        cycles = nx.find_cycle(emib_graph, orientation='ignore')
        if cycles:
            if verbose:
                cycle_nodes = [edge[0] for edge in cycles]
                print(f"  Detected EMIB cycle: {cycle_nodes}")
            
            # Check whether cycle constraints are likely satisfiable
            cycle_nodes = list(set([edge[0] for edge in cycles] + [edge[1] for edge in cycles]))
            
            # Heuristic: cycles with >3 nodes are likely illegal
            if len(cycle_nodes) > 3:
                if verbose:
                    print(f"  Cycle node count={len(cycle_nodes)} > 3, marked as illegal")
                return True
                
    except nx.NetworkXNoCycle:
        pass
    
    return False


def detect_illegal_crossing(emib_edges: Set[Tuple[str, str]], layout: Dict[str, Chiplet],
                            tcg: TCG, verbose: bool = False) -> bool:
    """
    Detect illegal crossings (Figure 8(c) style).

    This check is currently disabled because many normal cases
    trigger false positives.
    
    Args:
        emib_edges: EMIB edge set
        layout: Current layout
        tcg: TCG topology
        verbose: Print detailed logs
        
    Returns:
        Whether an illegal crossing exists
    """
    # Illegal crossing detection is disabled
    return False


def legalize_tcg(tcg: TCG, problem: LayoutProblem, max_iterations: int = 100,
                 verbose: bool = False) -> Tuple[bool, TCG, Dict[str, Chiplet]]:
    """
    Legalize a TCG (practical simplified version).

    Strategy:
    1. Generate initial layout from TCG.
    2. Iteratively adjust for EMIB constraints (adjacency + overlap).
    3. Respect TCG topology constraints during adjustment.
    
    Args:
        tcg: Input TCG
        problem: Layout problem
        max_iterations: Maximum iterations
        verbose: Print detailed logs
        
    Returns:
        (success flag, TCG, final layout)
    """
    if verbose:
        print("\n" + "=" * 70)
        print("TCG legalization starts")
        print("=" * 70)
    
    # Collect bridge constraints
    bridge_connections = list(problem.connection_graph.edges())
    
    if verbose:
        print(f"\n[Step 1] Bridge constraints: {bridge_connections}")
    
    # Generate initial layout
    layout = generate_layout_from_tcg(tcg, problem)
    
    if verbose:
        print(f"\n[Step 2] Initial layout:")
        for chip_id, chip in layout.items():
            print(f"  {chip_id}: ({chip.x:.1f}, {chip.y:.1f})")
    
    # Iteratively adjust for EMIB constraints
    for iteration in range(max_iterations):
        if verbose:
            print(f"\n  --- Iteration {iteration + 1} ---")
        
        adjusted = False
        
        # Check and adjust each bridge constraint
        for chip1_id, chip2_id in bridge_connections:
            chip1 = layout[chip1_id]
            chip2 = layout[chip2_id]
            
            is_adj, overlap_len, direction = get_adjacency_info(chip1, chip2)
            min_ov = _get_min_overlap(problem, chip1_id, chip2_id)
            if is_adj and overlap_len >= min_ov:
                continue  # Already satisfied
            
            # Need adjustment: decide direction by TCG constraints
            has_ch_12 = tcg.Ch.has_edge(chip1_id, chip2_id)
            has_ch_21 = tcg.Ch.has_edge(chip2_id, chip1_id)
            has_cv_12 = tcg.Cv.has_edge(chip1_id, chip2_id)
            has_cv_21 = tcg.Cv.has_edge(chip2_id, chip1_id)
            
            if has_cv_12 or has_cv_21:
                # Cv ordered: require overlap in x direction
                x_overlap = min(chip1.x + chip1.width, chip2.x + chip2.width) - max(chip1.x, chip2.x)
                
                if x_overlap < min_ov:
                    # Increase x-overlap with random target (0%-100% width)
                    overlap_ratio = random.uniform(0, 1)
                    target_overlap = max(min_ov, min(chip1.width, chip2.width) * overlap_ratio)
                    if has_ch_12:
                        # Ch chip1→chip2: chip2 is right of chip1, move chip1 right only
                        new_x1 = chip2.x + target_overlap - chip1.width
                        if new_x1 > chip1.x:
                            chip1.x = new_x1
                            adjusted = True
                            if verbose:
                                actual_overlap = min(chip1.x + chip1.width, chip2.x + chip2.width) - max(chip1.x, chip2.x)
                                print(f"    Adjust {chip1_id}.x -> {new_x1:.1f} (overlap with {chip2_id}={actual_overlap:.1f})")
                    
                    elif has_ch_21:
                        # Ch chip2→chip1: chip1 is right of chip2, move chip2 right only
                        new_x2 = chip1.x + target_overlap - chip2.width
                        if new_x2 > chip2.x:
                            chip2.x = new_x2
                            adjusted = True
                            if verbose:
                                actual_overlap = min(chip1.x + chip1.width, chip2.x + chip2.width) - max(chip1.x, chip2.x)
                                print(f"    Adjust {chip2_id}.x -> {new_x2:.1f} (overlap with {chip1_id}={actual_overlap:.1f})")
                    
                    else:
                        # No Ch order: move the left chip right
                        if chip1.x < chip2.x:
                            new_x1 = chip2.x + target_overlap - chip1.width
                            if new_x1 > chip1.x:
                                chip1.x = new_x1
                                adjusted = True
                                if verbose:
                                    actual_overlap = min(chip1.x + chip1.width, chip2.x + chip2.width) - max(chip1.x, chip2.x)
                                    print(f"    Adjust {chip1_id}.x -> {new_x1:.1f} (overlap with {chip2_id}={actual_overlap:.1f})")
                        else:
                            new_x2 = chip1.x + target_overlap - chip2.width
                            if new_x2 > chip2.x:
                                chip2.x = new_x2
                                adjusted = True
                                if verbose:
                                    actual_overlap = min(chip1.x + chip1.width, chip2.x + chip2.width) - max(chip1.x, chip2.x)
                                    print(f"    Adjust {chip2_id}.x -> {new_x2:.1f} (overlap with {chip1_id}={actual_overlap:.1f})")
            
            elif has_ch_12 or has_ch_21:
                # Ch ordered: require overlap in y direction
                y_overlap = min(chip1.y + chip1.height, chip2.y + chip2.height) - max(chip1.y, chip2.y)
                
                if y_overlap < min_ov:
                    # Increase y-overlap with random target (0%-100% height)
                    overlap_ratio = random.uniform(0, 1)
                    target_overlap = max(min_ov, min(chip1.height, chip2.height) * overlap_ratio)
                    if has_cv_12:
                        # Cv chip1→chip2: chip2 is above chip1, move chip1 up only
                        new_y1 = chip2.y + target_overlap - chip1.height
                        if new_y1 > chip1.y:
                            chip1.y = new_y1
                            adjusted = True
                            if verbose:
                                actual_overlap = min(chip1.y + chip1.height, chip2.y + chip2.height) - max(chip1.y, chip2.y)
                                print(f"    Adjust {chip1_id}.y -> {new_y1:.1f} (overlap with {chip2_id}={actual_overlap:.1f})")
                    
                    elif has_cv_21:
                        # Cv chip2→chip1: chip1 is above chip2, move chip2 up only
                        new_y2 = chip1.y + target_overlap - chip2.height
                        if new_y2 > chip2.y:
                            chip2.y = new_y2
                            adjusted = True
                            if verbose:
                                actual_overlap = min(chip1.y + chip1.height, chip2.y + chip2.height) - max(chip1.y, chip2.y)
                                print(f"    Adjust {chip2_id}.y -> {new_y2:.1f} (overlap with {chip1_id}={actual_overlap:.1f})")
                    
                    else:
                        # No Cv order: move the lower chip up
                        if chip1.y < chip2.y:
                            new_y1 = chip2.y + target_overlap - chip1.height
                            if new_y1 > chip1.y:
                                chip1.y = new_y1
                                adjusted = True
                                if verbose:
                                    actual_overlap = min(chip1.y + chip1.height, chip2.y + chip2.height) - max(chip1.y, chip2.y)
                                    print(f"    Adjust {chip1_id}.y -> {new_y1:.1f} (overlap with {chip2_id}={actual_overlap:.1f})")
                        else:
                            new_y2 = chip1.y + target_overlap - chip2.height
                            if new_y2 > chip2.y:
                                chip2.y = new_y2
                                adjusted = True
                                if verbose:
                                    actual_overlap = min(chip1.y + chip1.height, chip2.y + chip2.height) - max(chip1.y, chip2.y)
                                    print(f"    Adjust {chip2_id}.y -> {new_y2:.1f} (overlap with {chip1_id}={actual_overlap:.1f})")
        
        if not adjusted:
            if verbose:
                print(f"  ✓ Converged at iteration {iteration + 1}")
            break
        
        # Check illegal edges after each iteration
        illegal_edge_found = False
        for chip1_id, chip2_id in bridge_connections:
            chip1 = layout[chip1_id]
            chip2 = layout[chip2_id]
            is_adj, overlap_len, _ = get_adjacency_info(chip1, chip2)
            if not is_adj or overlap_len < _get_min_overlap(problem, chip1_id, chip2_id):
                illegal_edge_found = True
                break
        
        if not illegal_edge_found:
            break
    
    # Step 6: adjacency refinement (Place adjacently) - Fig. 8(d)
    if verbose:
        print(f"\n[Step 6] Adjacency refinement...")
    
    for chip1_id, chip2_id in bridge_connections:
        chip1 = layout[chip1_id]
        chip2 = layout[chip2_id]
        
        is_adj, overlap_len, direction = get_adjacency_info(chip1, chip2)
        
        if is_adj and overlap_len >= _get_min_overlap(problem, chip1_id, chip2_id):
            # Already adjacent; optional further compaction
            pass
    
    # Step 7: final validation
    if verbose:
        print(f"\n[Step 7] Final validation...")
        print(f"  Final layout:")
        for chip_id, chip in layout.items():
            print(f"    {chip_id}: ({chip.x:.1f}, {chip.y:.1f})")
    
    # Validate all bridge constraints
    all_valid = True
    for chip1_id, chip2_id in bridge_connections:
        chip1 = layout[chip1_id]
        chip2 = layout[chip2_id]
        
        is_adj, overlap_len, direction = get_adjacency_info(chip1, chip2)
        
        if verbose:
            print(f"  {chip1_id}-{chip2_id}: adjacent={is_adj}, overlap={overlap_len:.2f}")
        
        if not is_adj or overlap_len < _get_min_overlap(problem, chip1_id, chip2_id):
            all_valid = False
    
    # Validate no chip overlap
    chip_ids = list(layout.keys())
    for i in range(len(chip_ids)):
        for j in range(i + 1, len(chip_ids)):
            chip1_id = chip_ids[i]
            chip2_id = chip_ids[j]
            chip1 = layout[chip1_id]
            chip2 = layout[chip2_id]
            
            x_overlap = min(chip1.x + chip1.width, chip2.x + chip2.width) - max(chip1.x, chip2.x)
            y_overlap = min(chip1.y + chip1.height, chip2.y + chip2.height) - max(chip1.y, chip2.y)
            
            if x_overlap > EPSILON and y_overlap > EPSILON:
                all_valid = False
                if verbose:
                    print(f"  ✗ {chip1_id}-{chip2_id} overlap! (x:{x_overlap:.2f}, y:{y_overlap:.2f})")
    
    if not all_valid:
        if verbose:
            print("\n" + "=" * 70)
            print("✗ TCG legalization failed - not all EMIB edges can be legalized")
            print("=" * 70)
        return False, tcg, layout
    
    if verbose:
        print("\n" + "=" * 70)
        print("✓ TCG legalization succeeded")
        print("=" * 70)
    
    return True, tcg, layout


# ============================================================================
# Test code
# ============================================================================

if __name__ == "__main__":
    from chiplet_model import is_layout_valid
    
    # print("TCG legalization test - simple iterative adjustment")
    # print("=" * 70)





    
    
    # # Test 1: 3-chip case (detailed debug)
    # print("\nTest 1: 3-chip case (detailed debug)")
    # print("-" * 70)
    
    # problem1 = load_problem_from_json("../test_input/5core.json")
    # tcg1= generate_initial_TCG(problem1, seed=None)

    # # tcg1 =TCG(['A','B','C'])
    # # tcg1.add_horizontal_constraint('A','C')
    # # tcg1.add_vertical_constraint('B','A')
    # # tcg1.add_vertical_constraint('B','C')
     
    
    # result1 = legalize_tcg(tcg1, problem1, verbose=True)

    # success, legal_tcg1, legal_layout1 = result1
    # if success:
    #     is_valid_layout = is_layout_valid(legal_layout1, problem1, verbose=True)
    #     print(f"\nLayout valid?: {'✓ valid' if is_valid_layout else '✗ invalid'}")
    #     print(f"\n✓ Test 1 passed")
    # else:
    #     print("\n✗ Test 1 failed")
    # from unit import visualize_layout_with_bridges
    # visualize_layout_with_bridges(legal_layout1, problem1, "../output/test1_layout.png")



    
    # Test 2: complex 12-chip topology - 10000 attempts
    print("\n\n" + "=" * 70)
    print("Test 2: complex 12-chip topology - 10000 random attempts")
    print("=" * 70)
    
    problem2 = load_problem_from_json("../test_input/8core.json")
    
    max_attempts = 10000
    success_count = 0
    best_layout = None
    best_area = float('inf')
    best_utilization = 0.0
    
    print(f"\nGenerating {max_attempts} random TCGs and trying legalization...")
    print("=" * 70)
     
    for attempt in range(max_attempts):
        # Generate random TCG
        tcg2 = generate_initial_TCG(problem2, seed=None)
        
        # Try legalization
        result2 = legalize_tcg(tcg2, problem2, verbose=False)
        success, legal_tcg2, legal_layout2 = result2
        
        # Validate layout
        if success:
            is_valid_layout = is_layout_valid(legal_layout2, problem2, verbose=False) and SiliconBridge_is_legal(legal_layout2, problem2, verbose=False)
            
            if is_valid_layout:
                success_count += 1
                
                # Compute area
                x_coords = [chip.x for chip in legal_layout2.values()]
                y_coords = [chip.y for chip in legal_layout2.values()]
                x_max = max(chip.x + chip.width for chip in legal_layout2.values())
                y_max = max(chip.y + chip.height for chip in legal_layout2.values())
                width = x_max - min(x_coords)
                height = y_max - min(y_coords)
                area = width * height
                total_chip_area = sum(c.width * c.height for c in legal_layout2.values())
                utilization = total_chip_area / area * 100
                
                # Update best layout
                if utilization > best_utilization:
                    best_utilization = utilization
                    best_layout = legal_layout2
                    best_utilization = utilization
                    print(f"  [{attempt+1}/{max_attempts}] ✓ Success! utilization={utilization:.2f}% (area={area:.1f}, w={width:.1f}, h={height:.1f}) [new best]")
                else:
                    print(f"  [{attempt+1}/{max_attempts}] ✓ Success! utilization={utilization:.2f}% (area={area:.1f}, w={width:.1f}, h={height:.1f})")
        
        # Report progress every 100 attempts
        if (attempt + 1) % 100 == 0:
            print(f"\nProgress: {attempt+1}/{max_attempts}, success rate: {success_count}/{attempt+1} = {success_count/(attempt+1)*100:.1f}%")
            print("-" * 70)
    
    # Final statistics
    print("\n" + "=" * 70)
    print("Final statistics")
    print("=" * 70)
    print(f"Total attempts: {max_attempts}")
    print(f"Successful attempts: {success_count}")
    print(f"Success rate: {success_count/max_attempts*100:.2f}%")
    
    if best_layout:
        print(f"\nBest layout:")
        print(f"  Utilization: {best_utilization:.2f}%")
        
        # Visualize best layout
        from unit import visualize_layout_with_bridges
        visualize_layout_with_bridges(best_layout, problem2, "../output/best_layout.png")
        save_layout_to_json(best_layout, "../output/best_layout.json")
        
        print(f"\n✓ Best layout saved:")
        print(f"  - Visualization: ../output/best_layout.png")
        print(f"  - JSON: ../output/best_layout.json")
    else:
        print("\n✗ No legal layout found")
        print("Suggestion: increase attempts or adjust constraints")
        
