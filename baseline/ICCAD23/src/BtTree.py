"""
Binary Tree (BT) Construction Module

Organizes and manages ECGs (Embedded Circuit Groups) in binary tree structure.
- Each node represents an ECG (single-chip or multi-chip)
- Multi-chip ECGs have similarity forests built
- Single-chip ECGs require no special processing
"""

import random
from typing import List, Optional, Dict
from input_ECG import ECG, ECGManager
from chiplet_model import LayoutProblem
from GroupConstrua import SimilarityTree, SimilarityTreeNode, GroupConstrua_full
from BaseDerivation import run_base_derivation


class BTNode:
    """
    BT tree node representing an ECG.
    
    Attributes:
        ecg: ECG object
        is_single_chiplet: Whether this is a single-chip ECG
        similarity_forest: Similarity forest (multi-chip ECGs only)
        left_child, right_child: Child nodes
        node_id: Unique node identifier
    """
    
    _node_counter = 0  # Class variable for unique ID generation
    
    def __init__(self, ecg: ECG, problem: LayoutProblem, 
                 build_similarity_forest: bool = True):
        """
        Initialize BT tree node.
        
        Args:
            ecg: ECG object
            problem: Layout problem (for multi-chip ECGs)
            build_similarity_forest: Whether to build similarity forest
        """
        self.ecg = ecg
        self.is_single_chiplet = len(ecg.chiplets) == 1
        self.similarity_forest: Optional[SimilarityTree] = None
        self.left_child: Optional[BTNode] = None
        self.right_child: Optional[BTNode] = None
        
        # Assign unique ID
        BTNode._node_counter += 1
        self.node_id = BTNode._node_counter
        
        # Build similarity forest for multi-chip ECGs
        if not self.is_single_chiplet and build_similarity_forest:
            self._build_similarity_forest(problem)
    
    def _build_similarity_forest(self, problem: LayoutProblem):
        """
        Build similarity forest for multi-chip ECG.
        
        Process:
        1. Base derivation generates root nodes
        2. GroupConstrua_full builds complete similarity trees
        
        Args:
            problem: Layout problem for this ECG
        """
        try:
            print(f"  Building similarity forest for ECG {self.ecg.id}...")
            
            # Step 1: Base derivation - generate root nodes
            print(f"    Running base derivation...")
            root_nodes = run_base_derivation(
                problem=problem,
                num_runs=30,  # Run 30 SA iterations for diverse root nodes
                min_similarity=0.7,
                max_iterations=5000,
                verbose=False
            )
            
            if len(root_nodes) == 0:
                error_msg = f"Base derivation failed for ECG {self.ecg.id}, cannot build forest"
                print(f"    ✗ {error_msg}")
                print(f"    Program terminated: cannot continue")
                raise RuntimeError(error_msg)
            
            print(f"    Base derivation complete, {len(root_nodes)} root nodes generated")
            
            # Step 2: Build forest using GroupConstrua_full
            print(f"    Running Group Construction...")
            similarity_trees = GroupConstrua_full(
                root_nodes=root_nodes,
                problem=problem,
                num_topologies_to_generate=50,
                children_per_node=2,
                max_iterations_sa=2000,
                alpha_x=1.0,
                beta_y=0.7,
                gamma_s=1.0,
                expected_similarity=0.6,
                verbose=False
            )
            
            # Save all generated trees as forest (list of trees)
            self.similarity_forest = similarity_trees
            
            # Statistics
            total_nodes = sum(len(tree.all_nodes) for tree in similarity_trees)
            print(f"    ✓ Forest built: {len(similarity_trees)} trees, {total_nodes} total nodes")
        
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
        if seed is not None:
            random.seed(seed)
        
        ecg_list = ecg_manager.ecgs
        
        if len(ecg_list) == 0:
            print("Error: No ECGs available for building BT tree")
            return
        
        print("\n" + "="*60)
        print("Building BT Tree")
        print("="*60)
        
        # Create node for each ECG
        ecg_nodes = []
        for ecg in ecg_list:
            sub_problem = ecg_manager.get_ecg_subproblem(ecg.id)
            node = BTNode(ecg, sub_problem, build_similarity_forests)
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