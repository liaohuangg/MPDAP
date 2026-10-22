"""
Binary Tree (BT) Construction Module

Organizes and manages ECGs (Embedded Circuit Groups) in binary tree structure.
- Each node represents an ECG (single-chip or multi-chip)
- Multi-chip ECGs have similarity forests built
- Single-chip ECGs require no special processing
"""

import random
import time
from typing import List, Optional, Dict
from input_ECG import ECG, ECGManager
from chiplet_model import LayoutProblem
from GroupConstrua import SimilarityTree, SimilarityTreeNode, GroupConstrua_full
from BaseDerivation import run_base_derivation


# Layer 1 (base derivation) attempts per ECG. Each attempt is a fresh TCG plus
# a legality SA, and it costs what it costs: a case that cannot find a legal
# layout within these attempts fails the whole run, so this number is a build
# success rate knob before it is a speed knob.
#
# It is a cap on *attempts*, not on root nodes. One attempt returns every
# distinct legal layout its SA visited and all of them are kept, so the forest
# comes out wider than this number (ascend910 seed 1, measured at base 10:
# 10 attempts -> 51 roots, so at base 30 it is at least that wide).
#
# It is NOT a clean search-budget knob, though. `run_base_derivation` seeds the
# *global* RNG (`BaseDerivation.py:58`), so the position that stream is left in
# depends on how much these attempts consumed -- and both the tree topology
# (`BtTree.py` random.shuffle) and layer 2 (`GroupConstrua.py`, whose neighbour
# generator draws from the same stream) run afterwards. Raising this therefore
# reshuffles the tree, not just widens the forest. Measured on multigpu over
# 5 seeds x base 10/30/50: the per-ECG derivation seeds are identical at all
# three bases, yet the tree shape differs at every base in every seed. So
# comparing two bases is confounded -- the difference includes "a different tree
# was built" -- and it can go either way (cpu-dram seed 3 is worse at 50 than
# at 30). Only a single ECG's derivation roots are monotone in this number.
BASE_DERIVATION_RUNS = 30


class BTNode:
    """
    BT tree node representing an ECG.

    Attributes:
        ecg: ECG object
        is_single_chiplet: Whether this is a single-chip ECG
        similarity_forest: Similarity forest (multi-chip ECGs only)
        left_child, right_child: Child nodes
        node_id: Unique node identifier
        timing: Seconds spent building this node's forest, per layer
        phase_stats: Counters of those same layers
    """

    _node_counter = 0  # Class variable for unique ID generation

    def __init__(self, ecg: ECG, problem: LayoutProblem,
                 build_similarity_forest: bool = True,
                 seed: Optional[int] = None,
                 timing_sink: Optional[Dict[str, float]] = None,
                 stats_sink: Optional[Dict] = None):
        """
        Initialize BT tree node.

        Args:
            ecg: ECG object
            problem: Layout problem (for multi-chip ECGs)
            build_similarity_forest: Whether to build similarity forest
            seed: Seed for this node's similarity forest. None continues the
                caller's RNG stream instead of reseeding.
            timing_sink: Optional dict owned by the caller. Each layer adds its
                seconds to `<layer>_seconds` here as soon as it is done, so the
                cost of a layer survives even if a later step fails hard.
            stats_sink: Optional dict owned by the caller, filled per layer
                with `<layer>_stats` (runs, candidates, iterations, ...).
        """
        self.ecg = ecg
        self.is_single_chiplet = len(ecg.chiplets) == 1
        self.similarity_forest: Optional[SimilarityTree] = None
        self.left_child: Optional[BTNode] = None
        self.right_child: Optional[BTNode] = None

        # Per-node breakdown of the build-time annealing layers:
        #   layer 1 = base derivation      (legality only: Pc / Pl)
        #   layer 2 = group construction   (shape + similarity: Px / Py / Ps)
        # Both stay 0.0 for a single-chiplet ECG, which needs no forest.
        # Layer 3 (real quality: A / WL / R) is the main SA and runs later, so
        # it is measured by the caller, not here.
        self.timing: Dict[str, float] = {'layer1': 0.0, 'layer2': 0.0}
        self.phase_stats: Dict[str, Dict] = {}
        self._timing_sink = timing_sink
        self._stats_sink = stats_sink

        # Assign unique ID
        BTNode._node_counter += 1
        self.node_id = BTNode._node_counter

        # Build similarity forest for multi-chip ECGs
        if not self.is_single_chiplet and build_similarity_forest:
            self._build_similarity_forest(problem, seed=seed)

    def _record_layer(self, layer: str, seconds: float, stats: Dict):
        """Store one layer's wall clock + counters, and forward them to the sink.

        The sink belongs to the tree, so the seconds are already safely out of
        this node by the time the next layer can raise.
        """
        self.timing[layer] = seconds
        self.phase_stats[layer] = stats
        if self._timing_sink is not None:
            key = f'{layer}_seconds'
            self._timing_sink[key] = self._timing_sink.get(key, 0.0) + seconds
        if self._stats_sink is not None:
            merged = self._stats_sink.setdefault(f'{layer}_stats', {})
            for name, value in stats.items():
                if isinstance(value, (int, float)) and not isinstance(value, bool):
                    merged[name] = merged.get(name, 0) + value
                else:
                    merged.setdefault(name, value)

    def _build_similarity_forest(self, problem: LayoutProblem,
                                 seed: Optional[int] = None):
        """
        Build similarity forest for multi-chip ECG.

        Process:
        1. Base derivation generates root nodes
        2. GroupConstrua_full builds complete similarity trees

        Args:
            problem: Layout problem for this ECG
            seed: Seed handed to `run_base_derivation` (None = continue the
                caller's RNG stream)
        """
        try:
            print(f"  Building similarity forest for ECG {self.ecg.id}...")
            
            # Step 1: Base derivation - generate root nodes (layer 1)
            print(f"    Running base derivation...")
            layer1_stats: Dict = {}
            layer1_start = time.time()
            try:
                root_nodes = run_base_derivation(
                    problem=problem,
                    num_runs=BASE_DERIVATION_RUNS,
                    min_similarity=0.7,
                    max_iterations=5000,
                    verbose=False,
                    seed=seed,
                    stats=layer1_stats
                )
            finally:
                # Timed in `finally` on purpose: a derivation that finds nothing
                # is exactly the case whose layer-1 cost must reach the log.
                self._record_layer('layer1', time.time() - layer1_start, layer1_stats)

            if len(root_nodes) == 0:
                error_msg = f"Base derivation failed for ECG {self.ecg.id}, cannot build forest"
                print(f"    ✗ {error_msg}")
                print(f"    Program terminated: cannot continue")
                raise RuntimeError(error_msg)
            
            print(f"    Base derivation complete, {len(root_nodes)} root nodes generated")
            
            # Step 2: Build forest using GroupConstrua_full (layer 2)
            print(f"    Running Group Construction...")
            layer2_stats: Dict = {}
            layer2_start = time.time()
            try:
                similarity_trees = GroupConstrua_full(
                    root_nodes=root_nodes,
                    problem=problem,
                    # 100 legal variants (neighbours) per tree -- back to the
                    # value used before the base/width experiment. Layer 2 no
                    # longer ranks candidates, so a tree is a diverse
                    # legal-variant pool; layer 3 does the ranking on the real
                    # objective. The pool is capped by the space rather than by
                    # this number: a 4-chiplet ECG has only ~15 mutually
                    # distinct legal layouts, so part of a request for 100 is
                    # duplicates (and duplicates do re-weight the pool layer 3
                    # samples from).
                    num_topologies_to_generate=100,
                    children_per_node=2,
                    max_iterations_sa=2000,
                    alpha_x=1.0,
                    beta_y=0.7,
                    gamma_s=1.0,
                    expected_similarity=0.6,
                    verbose=False,
                    stats=layer2_stats
                )
            finally:
                self._record_layer('layer2', time.time() - layer2_start, layer2_stats)

            # Save all generated trees as forest (list of trees)
            self.similarity_forest = similarity_trees
            
            # Statistics
            total_nodes = sum(len(tree.all_nodes) for tree in similarity_trees)
            print(f"    ✓ Forest built: {len(similarity_trees)} trees, {total_nodes} total nodes "
                  f"(layer 1 {self.timing['layer1']:.2f}s, layer 2 {self.timing['layer2']:.2f}s)")
        
        except RuntimeError as e:
            # Base derivation failure - re-raise to terminate
            print(f"    ✗ Forest build failed: {str(e)}")
            import traceback
            traceback.print_exc()
            raise
        except Exception as e:
            # Other exceptions (e.g., GroupConstrua failure) - can continue
            print(f"    ✗ Forest build failed: {str(e)}")
            import traceback
            traceback.print_exc()
            self.similarity_forest = None
    
    def is_leaf(self) -> bool:
        """Check if this is a leaf node."""
        return self.left_child is None and self.right_child is None
    
    def get_depth(self) -> int:
        """Get depth of subtree rooted at this node."""
        if self.is_leaf():
            return 1
        
        left_depth = self.left_child.get_depth() if self.left_child else 0
        right_depth = self.right_child.get_depth() if self.right_child else 0
        
        return 1 + max(left_depth, right_depth)
    
    def __repr__(self) -> str:
        ecg_type = "single" if self.is_single_chiplet else "multi"
        if self.similarity_forest:
            if isinstance(self.similarity_forest, list):
                forest_info = f"forest({len(self.similarity_forest)} trees)"
            else:
                forest_info = "forest(1 tree)"
        else:
            forest_info = "none"
        return (f"BTNode(id={self.node_id}, ECG={self.ecg.id}, "
                f"type={ecg_type}, forest={forest_info})")


class BinaryTree:
    """
    Binary Tree for organizing ECGs.
    
    Attributes:
        root: Tree root node
        all_nodes: List of all nodes
    """
    
    def __init__(self):
        """Initialize BT tree."""
        self.root: Optional[BTNode] = None
        self.all_nodes: List[BTNode] = []
        # How many times this tree has been built. A caller logs it after the SA
        # run: it is 1 for a normal run, and still being 1 then is the evidence
        # that annealing perturbs the tree but never rebuilds it.
        self.build_count: int = 0
        # Build-time layers, summed over every ECG node (see BTNode.timing):
        #   layer1_seconds: base derivation   -- legality only (Pc / Pl)
        #   layer2_seconds: group construction -- shape + similarity (Px/Py/Ps)
        # Layer 3 (A / WL / R) is the main SA and is timed by the caller.
        self.timing: Dict[str, float] = {'layer1_seconds': 0.0, 'layer2_seconds': 0.0}
        # Counters of both layers, summed the same way.
        self.phase_stats: Dict[str, Dict] = {}
    
    def build_from_ecgs(self, ecg_manager: ECGManager, 
                       build_similarity_forests: bool = True,
                       seed: Optional[int] = None):
        """
        Build BT tree from ECG manager.
        
        Algorithm:
        1. Randomly select root ECG
        2. Randomly distribute remaining ECGs to left/right subtrees
        3. Recursively build subtrees
        
        Args:
            ecg_manager: ECG manager
            build_similarity_forests: Whether to build forests for multi-chip ECGs
            seed: Random seed
        """
        self.build_count += 1
        self.timing = {'layer1_seconds': 0.0, 'layer2_seconds': 0.0}
        self.phase_stats = {}

        if seed is not None:
            random.seed(seed)

        ecg_list = ecg_manager.ecgs
        
        if len(ecg_list) == 0:
            print("Error: No ECGs available for building BT tree")
            return
        
        print("\n" + "="*60)
        print("Building BT Tree")
        print("="*60)
        
        # Create node for each ECG. The similarity forests are built right
        # here, so each ECG gets its own stream derived from the master seed:
        # reproducible from `seed` alone, and not shared between ECGs (or
        # between different master seeds).
        seed_rng = random.Random(seed) if seed is not None else None
        ecg_nodes = []
        for ecg in ecg_list:
            sub_problem = ecg_manager.get_ecg_subproblem(ecg.id)
            node_seed = seed_rng.randrange(1 << 31) if seed_rng is not None else None
            # Both sinks live on the tree, so the seconds each layer burned are
            # recorded even when a hard failure below kills the run.
            node = BTNode(ecg, sub_problem, build_similarity_forests, seed=node_seed,
                          timing_sink=self.timing, stats_sink=self.phase_stats)
            ecg_nodes.append(node)
            self.all_nodes.append(node)
        
        # Randomly select root
        random.shuffle(ecg_nodes)
        self.root = ecg_nodes[0]
        remaining_nodes = ecg_nodes[1:]
        
        print(f"\nSelected ECG {self.root.ecg.id} as root")
        
        # Recursively build tree
        self._build_tree_recursive(self.root, remaining_nodes)
        
        print("\n✓ BT tree built")
        print("="*60)
    
    def get_build_timing(self) -> Dict:
        """Build-time layer split of the forest construction (seconds + counters).

        Layer 1 (base derivation) optimizes legality only; layer 2 (group
        construction) optimizes shape + similarity only. The caller adds the
        third layer (the main SA: area / wirelength / ratio) from its own clock.
        """
        layer1 = self.timing.get('layer1_seconds', 0.0)
        layer2 = self.timing.get('layer2_seconds', 0.0)
        return {
            'layer1_seconds': layer1,
            'layer2_seconds': layer2,
            'build_seconds': layer1 + layer2,
            'build_count': self.build_count,
            'layer1_stats': self.phase_stats.get('layer1_stats', {}),
            'layer2_stats': self.phase_stats.get('layer2_stats', {}),
        }

    def _build_tree_recursive(self, parent: BTNode, remaining: List[BTNode]):
        """
        Recursively build binary tree.
        
        Args:
            parent: Parent node
            remaining: Remaining nodes to assign
        """
        if len(remaining) == 0:
            return
        
        # Randomly select left child
        if len(remaining) > 0:
            left_node = remaining.pop(random.randint(0, len(remaining) - 1))
            parent.left_child = left_node
            
            # Assign half of remaining to left subtree
            left_remaining = []
            if len(remaining) > 0:
                split_point = random.randint(0, len(remaining))
                left_remaining = remaining[:split_point]
                remaining = remaining[split_point:]
            
            self._build_tree_recursive(left_node, left_remaining)
        
        # Assign rest to right subtree
        if len(remaining) > 0:
            right_node = remaining.pop(random.randint(0, len(remaining) - 1))
            parent.right_child = right_node
            self._build_tree_recursive(right_node, remaining)
    
    def print_tree_structure(self):
        """Print BT tree structure."""
        print("\n" + "="*60)
        print("BT Tree Structure")
        print("="*60)
        
        if self.root is None:
            print("Tree is empty")
            return
        
        self._print_node(self.root, "", True)
        
        print("\n" + "-"*60)
        print("Statistics:")
        print(f"  Total nodes: {len(self.all_nodes)}")
        print(f"  Tree depth: {self.root.get_depth()}")
        
        single_count = sum(1 for node in self.all_nodes if node.is_single_chiplet)
        multi_count = len(self.all_nodes) - single_count
        forest_count = sum(1 for node in self.all_nodes if node.similarity_forest is not None)
        
        print(f"  Single-chip ECG nodes: {single_count}")
        print(f"  Multi-chip ECG nodes: {multi_count}")
        print(f"  Nodes with forests: {forest_count}")
        print("="*60 + "\n")
    
    def _print_node(self, node: BTNode, prefix: str, is_tail: bool):
        """
        Recursively print nodes in tree format.
        
        Args:
            node: Current node
            prefix: Prefix string
            is_tail: Whether this is tail node
        """
        # Node info
        ecg_type = "single" if node.is_single_chiplet else "multi"
        chiplet_count = len(node.ecg.chiplets)
        
        forest_info = ""
        if node.similarity_forest:
            if isinstance(node.similarity_forest, list):
                # Forest is list of trees
                total_nodes = sum(len(tree.all_nodes) for tree in node.similarity_forest)
                forest_info = f" [forest: {len(node.similarity_forest)} trees, {total_nodes} nodes]"
            else:
                # Single tree
                stats = node.similarity_forest.get_tree_statistics()
                forest_info = f" [forest: 1 tree, {stats['total_nodes']} nodes]"
        
        # Print current node
        connector = "└── " if is_tail else "├── "
        print(f"{prefix}{connector}ECG{node.ecg.id} ({ecg_type}, {chiplet_count} chips){forest_info}")
        
        # Prepare prefix for children
        extension = "    " if is_tail else "│   "
        new_prefix = prefix + extension
        
        # Recursively print children
        children = []
        if node.left_child:
            children.append(('L', node.left_child))
        if node.right_child:
            children.append(('R', node.right_child))
        
        for i, (direction, child) in enumerate(children):
            is_last = (i == len(children) - 1)
            self._print_node(child, new_prefix, is_last)
    
    def get_statistics(self) -> Dict:
        """
        Get BT tree statistics.
        
        Returns:
            Dict with node count, depth, ECG type distribution, etc.
        """
        if self.root is None:
            return {
                'total_nodes': 0,
                'max_depth': 0,
                'single_chiplet_ecgs': 0,
                'multi_chiplet_ecgs': 0,
                'forests_built': 0
            }
        
        single_count = sum(1 for node in self.all_nodes if node.is_single_chiplet)
        multi_count = len(self.all_nodes) - single_count
        forest_count = sum(1 for node in self.all_nodes if node.similarity_forest is not None)
        
        return {
            'total_nodes': len(self.all_nodes),
            'max_depth': self.root.get_depth(),
            'single_chiplet_ecgs': single_count,
            'multi_chiplet_ecgs': multi_count,
            'forests_built': forest_count
        }


def main():
    """Main function demonstrating BT tree usage."""
    from unit import load_problem_from_json
    
    # Load problem
    json_path = "../../../benchmark/test_input/syn1.json"
    print(f"Loading problem: {json_path}")
    problem = load_problem_from_json(json_path)
    
    # Create ECG manager
    ecg_manager = ECGManager(problem)
    ecg_manager.print_summary()
    
    # Build BT tree
    bt_tree = BinaryTree()
    bt_tree.build_from_ecgs(ecg_manager, build_similarity_forests=True, seed=42)
    
    # Print tree structure
    bt_tree.print_tree_structure()
    
    # Print statistics
    stats = bt_tree.get_statistics()
    print("Detailed statistics:")
    for key, value in stats.items():
        print(f"  {key}: {value}")


if __name__ == "__main__":
    main()