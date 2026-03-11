import sys
import os
import random
import time
from typing import List, Dict, Tuple

from unit import load_problem_from_json, calculate_layout_utilization
from Generate_initial_TCG import generate_initial_TCG
from TCG import TCG, generate_layout_from_tcg
from Legality_optimized_SA import cost_legal, SA_1
from GroupConstrua import SimilarityTreeNode, compute_similarity
from chiplet_model import Chiplet, LayoutProblem


def run_base_derivation(problem: LayoutProblem, 
                        num_runs: int = 100,
                        min_similarity: float = 0.4,
                        max_iterations: int = 50000,
                        initial_temp: float = 200.0,
                        cooling_rate: float = 0.98,
                        alpha_c: float = 1.0,
                        beta_l: float = 0.3,
                        verbose: bool = True) -> List[SimilarityTreeNode]:
    """
    Base Derivation: Run SA multiple times and select diverse legal solutions as forest root nodes.
    
    Handles three cases:
    1. Initial layout is legal: save as root node directly
    2. Initial layout illegal but legalization succeeds: save unique solutions as root nodes
    3. No legal solution found: discard
    """
    if verbose:
        print("="*80)
        print("Base Derivation - build similarity forest")
        print("="*80)
        print(f"Problem size: {len(problem.chiplets)} chiplets, {problem.connection_graph.number_of_edges()} connections")
        print(f"Runs: {num_runs}")
        print(f"Similarity threshold: {min_similarity} (save as new root only if below this value)")
        print(f"SA params: max_iter={max_iterations}, T0={initial_temp}, cooling={cooling_rate}")
        print("="*80 + "\n")
    
    root_nodes: List[SimilarityTreeNode] = []  # Forest root nodes
    total_legal_solutions = 0  # Total legal solutions found
    
    for run_idx in range(num_runs):
        if verbose:
            print(f"\n{'─'*80}")
            print(f"Run {run_idx + 1}/{num_runs}")
            print(f"{'─'*80}")
        
        # Set random seed
        seed = int(time.time() * 1000) % 100000 + run_idx
        random.seed(seed)
        
        if verbose:
            print(f"Random seed: {seed}")
        
        # Generate initial TCG
        tcg = generate_initial_TCG(problem, seed=seed)
        layout = generate_layout_from_tcg(tcg, problem)
        
        # Calculate initial cost
        initial_cost = cost_legal(tcg, problem, layout, alpha_c, beta_l)
        
        if verbose:
            print(f"Initial cost: {initial_cost:.4f}")
        
        # Case 1: Initial layout is already legal
        if abs(initial_cost) < 1e-6:
            if verbose:
                print("✓ Initial layout is legal (Case 1)")
            
            # Use layout utilization as cost (negative: higher is better)
            utilization, _, _, _, _ = calculate_layout_utilization(layout)
            cost = -utilization
            
            # Check if unique compared to existing root nodes
            is_unique = _is_unique_solution(layout, root_nodes, min_similarity, verbose)
            
            if is_unique:
                node = SimilarityTreeNode(
                    tcg=tcg,
                    layout=layout,
                    parent=None,
                    similarity_to_parent=None,
                    cost=cost
                )
                root_nodes.append(node)
                total_legal_solutions += 1
                
                if verbose:
                    print(f"  → Saved as root node #{len(root_nodes)} (utilization={utilization:.2f}%)")
            else:
                if verbose:
                    print(f"  → Too similar to existing root nodes, discarded")
            
            continue
        
        # Initial layout illegal, run SA to find legal solutions
        if verbose:
            print(f"Initial layout illegal, running SA...")
        
        start_time = time.time()
        legal_tcgs, legal_layouts, final_cost = SA_1(
            tcg, problem,
            max_iterations=max_iterations,
            initial_temp=initial_temp,
            cooling_rate=cooling_rate,
            alpha_c=alpha_c,
            beta_l=beta_l,
            use_legalize=True,
            verbose=False
        )
        elapsed_time = time.time() - start_time
        
        num_legal = len(legal_tcgs)
        
        if verbose:
            print(f"SA completed: found {num_legal} legal solutions in {elapsed_time:.2f}s")
        
        # Case 3: No legal solution found
        if num_legal == 0:
            if verbose:
                print("✗ No legal solution found (Case 3), discarded")
            continue
        
        # Case 2: Found legal solutions
        if verbose:
            print(f"✓ Found {num_legal} legal solutions (Case 2)")
        
        total_legal_solutions += num_legal
        
        # Process first legal solution
        first_layout = legal_layouts[0]
        first_tcg = legal_tcgs[0]
        utilization, _, _, _, _ = calculate_layout_utilization(first_layout)
        cost = -utilization
        
        # Check if first solution is unique
        is_unique = _is_unique_solution(first_layout, root_nodes, min_similarity, verbose)
        
        if is_unique:
            node = SimilarityTreeNode(
                tcg=first_tcg,
                layout=first_layout,
                parent=None,
                similarity_to_parent=None,
                cost=cost
            )
            root_nodes.append(node)
            
            if verbose:
                print(f"  Solution 1: saved as root node #{len(root_nodes)} (utilization={utilization:.2f}%)")
        else:
            if verbose:
                print(f"  Solution 1: too similar to existing root nodes, discarded")
        
        # Process remaining solutions: save only if unique
        added_count = 1 if is_unique else 0
        skipped_count = 0 if is_unique else 1
        
        for idx in range(1, num_legal):
            layout_i = legal_layouts[idx]
            tcg_i = legal_tcgs[idx]
            
            # Check uniqueness
            is_unique = _is_unique_solution(layout_i, root_nodes, min_similarity, verbose=False)
            
            if is_unique:
                utilization, _, _, _, _ = calculate_layout_utilization(layout_i)
                cost = -utilization
                
                node = SimilarityTreeNode(
                    tcg=tcg_i,
                    layout=layout_i,
                    parent=None,
                    similarity_to_parent=None,
                    cost=cost
                )
                root_nodes.append(node)
                added_count += 1
                
                if verbose and added_count <= 5:  # Print first 5 only
                    print(f"  Solution {idx+1}: saved as root node #{len(root_nodes)} (utilization={utilization:.2f}%)")
            else:
                skipped_count += 1
        
        if verbose:
            print(f"  → Added {added_count} root nodes, skipped {skipped_count} similar solutions")
    
    # Final statistics
    if verbose:
        print("\n" + "="*80)
        print("Base Derivation completed")
        print("="*80)
        print(f"Total runs: {num_runs}")
        print(f"Total legal solutions found: {total_legal_solutions}")
        print(f"Forest root node count: {len(root_nodes)}")
        print(f"Similarity threshold: {min_similarity}")
        
        if len(root_nodes) > 0:
            print(f"\nRoot node details:")
            for i, node in enumerate(root_nodes):
                utilization, _, _, _, _ = calculate_layout_utilization(node.layout)
                print(f"  Root node #{i+1}: utilization={utilization:.2f}%")
        
        print("="*80)
    
    return root_nodes


def _is_unique_solution(layout: Dict[str, Chiplet], 
                        root_nodes: List[SimilarityTreeNode],
                        min_similarity: float,
                        verbose: bool = False) -> bool:
    """
    Check if layout is unique (similarity < threshold with all existing root nodes).
    """
    if len(root_nodes) == 0:
        return True
    
    for root_node in root_nodes:
        similarity = compute_similarity(layout, root_node.layout)
        
        if verbose:
            print(f"    Similarity to root #{root_node.node_id}: {similarity:.4f}")
        
        if similarity >= min_similarity:
            return False
    
    return True


# ============================================================================
# Test Code
# ============================================================================

if __name__ == "__main__":
    print("Base Derivation Module Test\n")
    
    print("="*80)
    print("Test Case: 10 Chiplet System")
    print("="*80)
    
    problem = load_problem_from_json("../../../benchmark/test_input/cpu-dram.json")
    root_nodes = run_base_derivation(
        problem=problem,
        num_runs=5,  # Run 5 times
        min_similarity=0.6,  # Similarity threshold
        max_iterations=30000,  # Max SA iterations
        initial_temp=150.0,
        cooling_rate=0.98,
        alpha_c=1.0,
        beta_l=10.0,
        verbose=True
    )
    
    print(f"\nFinal result: built forest with {len(root_nodes)} root nodes")
    # Save layout images for all root nodes
    for i, root in enumerate(root_nodes):
        from unit import visualize_layout_with_bridges, save_layout_image
        image_path = f"../output/BaseDerivation/root_node_{i+1}_layout.png"
        save_layout_image(root.layout, problem, image_path)
        print(f"  Root node #{i+1} layout saved: {image_path}")
 
    
    # Verify: ensure all root nodes have similarity below threshold
    if len(root_nodes) > 1:
        print(f"\nVerifying similarity between root nodes:")
        for i in range(len(root_nodes)):
            for j in range(i + 1, len(root_nodes)):
                sim = compute_similarity(root_nodes[i].layout, root_nodes[j].layout)
                print(f"  Root #{i+1} vs Root #{j+1}: similarity={sim:.4f}")
                
                if sim >= 0.7:
                    print(f"   Similarity too high")
    
    print("\nTest completed")
