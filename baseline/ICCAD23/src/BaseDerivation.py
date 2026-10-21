import sys
import os
import random
import time
from typing import List, Dict, Optional, Tuple

from unit import load_problem_from_json, calculate_layout_utilization
from Generate_initial_TCG import generate_initial_TCG
from TCG import TCG, generate_layout_from_tcg
from Legality_optimized_SA import cost_legal, SA_1
from GroupConstrua import SimilarityTreeNode, compute_similarity
from chiplet_model import Chiplet, LayoutProblem
from bridge_legality import make_bridge_checker


# Layer 1 stops collecting roots here. Every root becomes one layer-2 tree,
# and a low SA temperature can turn dozens of legal layouts into dozens of
# distinct roots; beyond this count the extra trees mostly repeat topologies
# the group-construction step already covers, at a full tree-build cost each.
MAX_ROOT_NODES = 10

# Paper §III-B4 repeats MST-based partitioning "until a sufficient number of
# bases are obtained"; the number of attempts is not the stopping rule. Since
# one attempt often yields no base, `num_runs` is treated as a per-base budget:
# the loop keeps generating initial topologies for up to
# `num_runs * BASE_DERIVATION_ATTEMPT_FACTOR` attempts, stopping earlier once
# MAX_ROOT_NODES bases exist. The absolute cap keeps a case whose topologies
# almost never legalize from running forever.
BASE_DERIVATION_ATTEMPT_FACTOR = 4
BASE_DERIVATION_ATTEMPT_CAP = 150


def run_base_derivation(problem: LayoutProblem,
                        num_runs: int = 100,
                        min_similarity: float = 0.4,
                        max_iterations: int = 50000,
                        initial_temp: Optional[float] = None,
                        cooling_rate: float = 0.98,
                        alpha_c: float = 1.0,
                        beta_l: float = 0.3,
                        verbose: bool = True,
                        seed: Optional[int] = None,
                        stats: Optional[Dict] = None) -> List[SimilarityTreeNode]:
    """
    Base Derivation: Run SA multiple times and select diverse legal solutions as forest root nodes.

    Handles three cases:
    1. Initial layout is legal: save as root node directly
    2. Initial layout illegal but legalization succeeds: save unique solutions as root nodes
    3. No legal solution found: discard

    Args:
        initial_temp: Starting SA temperature. `None` (the default) picks a
            value matched to the cost scale: `cost_legal` is a ratio in
            [0, alpha_c + beta_l], so one violated EMIB edge moves the cost by
            `beta_l / n_emib`. Taking half of that quantum as T makes a
            single-edge uphill move cost 2T, so it is accepted with
            probability exp(-2) ~ 0.14: SA still crosses plateaus but is
            pulled downhill instead of wandering. The former flat 200.0 was
            ~5000x the cost quantum on cpu-dram, so every move was accepted
            and the 5000-iteration budget was a pure random walk.
        seed: Seed for the whole derivation. When given, the global RNG is
            seeded once here and all attempts draw from that one stream, so the
            derivation is reproducible. When None, the caller's current RNG
            stream is used as-is (no reseeding), which is what makes an outer
            seed the single source of randomness.
        num_runs: Per-base attempt budget, not the stopping rule. The loop runs
            up to `num_runs * BASE_DERIVATION_ATTEMPT_FACTOR` attempts and stops
            as soon as MAX_ROOT_NODES bases are obtained (paper §III-B4).
        stats: Optional dict filled in with what this layer did (runs, how
            many of them were already legal, how many SA_1 calls ran and how
            long they took). This is layer 1 of the pipeline -- it only ever
            looks at legality (Pc/Pl), never at area, wirelength or ratio.
    """
    # Scale the starting temperature to the cost quantum. Computed before the
    # verbose banner so the log reports the value SA_1 actually uses.
    if initial_temp is None:
        n_emib = problem.connection_graph.number_of_edges()
        initial_temp = 0.5 * beta_l / max(1, n_emib)

    # Paper §III-B4: keep partitioning until enough bases exist. `num_runs` is
    # the per-base budget, and the absolute cap bounds a pathological case.
    max_attempts = min(num_runs * BASE_DERIVATION_ATTEMPT_FACTOR,
                       BASE_DERIVATION_ATTEMPT_CAP)

    if verbose:
        print("="*80)
        print("Base Derivation - build similarity forest")
        print("="*80)
        print(f"Problem size: {len(problem.chiplets)} chiplets, {problem.connection_graph.number_of_edges()} connections")
        print(f"Runs: up to {max_attempts} attempts, stopping at {MAX_ROOT_NODES} bases")
        print(f"Similarity threshold: {min_similarity} (save as new root only if below this value)")
        print(f"SA params: max_iter={max_iterations}, T0={initial_temp}, cooling={cooling_rate}")
        print("="*80 + "\n")
    
    # Single seeding point: every run below draws from this one stream, so the
    # whole derivation is a pure function of `seed` and nothing time-based.
    if seed is not None:
        random.seed(seed)
        if verbose:
            print(f"Random seed: {seed}")

    root_nodes: List[SimilarityTreeNode] = []  # Forest root nodes
    total_legal_solutions = 0  # Total legal solutions found

    # Bridge gate for every node admitted to the forest: a layout whose EMIB
    # bridges overlap (or do not fit their shared edge) is not a legal node,
    # no matter what cost_legal says.
    bridge_ok = make_bridge_checker(problem)

    # Counters of this layer, handed back through `stats` at the end.
    layer_stats: Dict = {
        'runs': max_attempts,          # safety bound on attempts (paper: stop at enough bases)
        'already_legal_runs': 0,       # Case 1: no SA needed at all
        'sa_runs': 0,                  # Case 2/3: SA_1 was actually run
        'legal_solutions': 0,          # legal TCGs SA_1 produced (before dedup)
        'bridge_rejected': 0,          # candidates dropped for overlapping bridges
        'sa_seconds': 0.0,             # wall clock inside SA_1
        'pc_restarts': 0,              # SA_1 walks abandoned by the Pc >= lc rule
        'root_nodes': 0,               # survived the similarity filter
    }

    def _publish():
        layer_stats['root_nodes'] = len(root_nodes)
        layer_stats['legal_solutions'] = total_legal_solutions
        if stats is not None:
            stats.update(layer_stats)

    for run_idx in range(max_attempts):
        if len(root_nodes) >= MAX_ROOT_NODES:
            if verbose:
                print(f"\nRoot node cap ({MAX_ROOT_NODES}) reached after "
                      f"{run_idx} attempt(s), stopping")
            break

        if verbose:
            print(f"\n{'─'*80}")
            print(f"Run {run_idx + 1}/{max_attempts}")
            print(f"{'─'*80}")

        # Generate initial TCG (no reseed here: keeps drawing from the stream above)
        tcg = generate_initial_TCG(problem)
        layout = generate_layout_from_tcg(tcg, problem)
        
        # Calculate initial cost
        initial_cost = cost_legal(tcg, problem, layout, alpha_c, beta_l)
        
        if verbose:
            print(f"Initial cost: {initial_cost:.4f}")
        
        # Case 1: Initial layout is already legal (placement + bridges)
        if abs(initial_cost) < 1e-6 and bridge_ok(layout):
            layer_stats['already_legal_runs'] += 1
            if verbose:
                print("✓ Initial layout is legal (Case 1)")
            
            # Use layout utilization as cost (negative: higher is better)
            utilization, _, _, _, _ = calculate_layout_utilization(layout)
            cost = -utilization
            
            # Check if unique compared to existing root nodes
            is_unique = _is_unique_solution(layout, root_nodes, min_similarity, verbose)
            
            if is_unique and len(root_nodes) < MAX_ROOT_NODES:
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
            if abs(initial_cost) < 1e-6:
                print("Initial layout is placement-legal but its bridges overlap, running SA...")
            else:
                print(f"Initial layout illegal, running SA...")

        layer_stats['sa_runs'] += 1
        start_time = time.time()
        sa_stats: Dict = {}
        legal_tcgs, legal_layouts, final_cost = SA_1(
            tcg, problem,
            max_iterations=max_iterations,
            initial_temp=initial_temp,
            cooling_rate=cooling_rate,
            alpha_c=alpha_c,
            beta_l=beta_l,
            use_legalize=True,
            verbose=False,
            # Paper §III-B5: a topology with Pc >= lc is abandoned and MST-based
            # partitioning is run again instead of annealing a hopeless region.
            repartition=lambda: generate_initial_TCG(problem),
            stats=sa_stats
        )
        layer_stats['pc_restarts'] += sa_stats.get('pc_restarts', 0)
        elapsed_time = time.time() - start_time
        layer_stats['sa_seconds'] += elapsed_time

        # Defensive re-check: only bridge-legal layouts may become tree nodes.
        keep = [i for i in range(len(legal_tcgs)) if bridge_ok(legal_layouts[i])]
        if len(keep) < len(legal_tcgs):
            layer_stats['bridge_rejected'] += len(legal_tcgs) - len(keep)
        legal_tcgs = [legal_tcgs[i] for i in keep]
        legal_layouts = [legal_layouts[i] for i in keep]

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
        
        if is_unique and len(root_nodes) < MAX_ROOT_NODES:
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
            if len(root_nodes) >= MAX_ROOT_NODES:
                break

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
        print(f"Total attempts allowed: {max_attempts}")
        print(f"Total legal solutions found: {total_legal_solutions}")
        print(f"Forest root node count: {len(root_nodes)}")
        print(f"Similarity threshold: {min_similarity}")
        
        if len(root_nodes) > 0:
            print(f"\nRoot node details:")
            for i, node in enumerate(root_nodes):
                utilization, _, _, _, _ = calculate_layout_utilization(node.layout)
                print(f"  Root node #{i+1}: utilization={utilization:.2f}%")
        
        print("="*80)

    _publish()
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
