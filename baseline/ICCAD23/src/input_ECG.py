"""
ECG (Embedded Circuit Group) generation module.

Input is a set of chiplets and their connection graph.
An ECG is a connected subgraph of chiplets (bridge-connectable group).
This module detects all ECGs from input JSON and prints summary info.
"""

import networkx as nx
from typing import List, Dict, Set, Tuple
from unit import load_problem_from_json
from chiplet_model import LayoutProblem, Chiplet


class ECG:
    """
    ECG (Embedded Circuit Group).

    Represents a connected chiplet subgraph.
    """
    
    def __init__(self, ecg_id: int):
        """Initialize an ECG with a unique ID."""
        self.id = ecg_id
        self.chiplets: Set[str] = set()  # Chiplet IDs in this ECG
        self.internal_connections: List[Tuple[str, str]] = []  # Internal ECG edges
        
    def add_chiplet(self, chiplet_id: str):
        """Add a chiplet ID to this ECG."""
        self.chiplets.add(chiplet_id)
    
    def add_connection(self, chip1_id: str, chip2_id: str):
        """Add an internal ECG connection."""
        if chip1_id in self.chiplets and chip2_id in self.chiplets:
            self.internal_connections.append((chip1_id, chip2_id))
    
    def __repr__(self) -> str:
        return f"ECG(id={self.id}, chiplets={self.chiplets}, connections={len(self.internal_connections)})"


class ECGManager:
    """
    ECG manager.

    Builds ECGs from a `LayoutProblem` and manages related queries.
    """
    
    def __init__(self, problem: LayoutProblem):
        """Initialize ECG manager from a layout problem."""
        self.problem = problem
        self.ecgs: List[ECG] = []
        self.inter_ecg_connections: List[Tuple[int, int]] = []  # Inter-ECG edges
        self._generate_ecgs()
    
    def _generate_ecgs(self):
        """
        Generate ECGs (connected components) from connection graph.
        """
        # Find connected components (each component is one ECG)
        connected_components = list(nx.connected_components(self.problem.connection_graph))
        
        # Create one ECG per component
        for ecg_id, component in enumerate(connected_components):
            ecg = ECG(ecg_id)
            
            # Add chiplets to ECG
            for chiplet_id in component:
                ecg.add_chiplet(chiplet_id)
            
            # Add internal ECG edges
            for chip1_id, chip2_id in self.problem.connection_graph.edges():
                if chip1_id in component and chip2_id in component:
                    ecg.add_connection(chip1_id, chip2_id)
            
            self.ecgs.append(ecg)
        
        # Note: under current connected-component definition,
        # different ECGs have no direct cross-ECG edges.
    
    def get_ecg_count(self) -> int:
        """Return ECG count."""
        return len(self.ecgs)
    
    def get_ecg(self, ecg_id: int) -> ECG:
        """Get ECG by ID."""
        if 0 <= ecg_id < len(self.ecgs):
            return self.ecgs[ecg_id]
        return None
    
    def get_chiplet_ecg_mapping(self) -> Dict[str, int]:
        """
        Get mapping from chiplet ID to ECG ID.
        """
        mapping = {}
        for ecg in self.ecgs:
            for chiplet_id in ecg.chiplets:
                mapping[chiplet_id] = ecg.id
        return mapping
    
    def print_summary(self):
        """Print ECG summary."""
        print("\n" + "="*60)
        print("ECG Summary")
        print("="*60)
        print(f"Detected {self.get_ecg_count()} ECG(s)\n")
        
        for ecg in self.ecgs:
            print(f"ECG {ecg.id}:")
            print(f"  - Chiplet count: {len(ecg.chiplets)}")
            print(f"  - Chiplet list: {sorted(ecg.chiplets)}")
            print(f"  - Internal edge count: {len(ecg.internal_connections)}")
            
            # Compute total area and power for this ECG
            total_area = 0.0
            total_power = 0.0
            for chiplet_id in ecg.chiplets:
                chiplet = self.problem.chiplets[chiplet_id]
                total_area += chiplet.width * chiplet.height
                total_power += chiplet.power
            
            print(f"  - Total area: {total_area:.2f}")
            print(f"  - Total power: {total_power:.2f}W")
            print()
        
        if len(self.inter_ecg_connections) > 0:
            print(f"Inter-ECG edge count: {len(self.inter_ecg_connections)}")
            for ecg1_id, ecg2_id in self.inter_ecg_connections:
                print(f"  - ECG {ecg1_id} <-> ECG {ecg2_id}")
        else:
            print("Note: all ECGs are independent (no cross-ECG edges)")
        
        print("="*60 + "\n")
    
    def get_ecg_subproblem(self, ecg_id: int) -> LayoutProblem:
        """
        Create a standalone `LayoutProblem` for one ECG.
        """
        ecg = self.get_ecg(ecg_id)
        if ecg is None:
            return None
        
        sub_problem = LayoutProblem()
        
        # Add chiplets
        for chiplet_id in ecg.chiplets:
            chiplet = self.problem.chiplets[chiplet_id]
            sub_problem.add_chiplet(chiplet)
        
        # Add internal edges
        for chip1_id, chip2_id in ecg.internal_connections:
            sub_problem.add_connection(chip1_id, chip2_id)
        
        return sub_problem


def main():
    """Main demo for ECG manager usage."""
    # Load problem
    json_path = "../../../benchmark/test_input/syn5.json"
    problem = load_problem_from_json(json_path)
    
    # Build ECG manager and generate ECGs
    ecg_manager = ECGManager(problem)
    
    # Print summary
    ecg_manager.print_summary()
    
    # Get chiplet-to-ECG mapping
    mapping = ecg_manager.get_chiplet_ecg_mapping()
    print("Chiplet to ECG mapping:")
    for chiplet_id, ecg_id in sorted(mapping.items()):
        print(f"  {chiplet_id} -> ECG {ecg_id}")
    print()
    
    # Example: create one subproblem per ECG
    print("Creating standalone subproblems for each ECG:")
    for i in range(ecg_manager.get_ecg_count()):
        sub_problem = ecg_manager.get_ecg_subproblem(i)
        print(f"  ECG {i}: {len(sub_problem.chiplets)} chiplets, "
              f"{sub_problem.connection_graph.number_of_edges()} connections")


if __name__ == "__main__":
    main()
