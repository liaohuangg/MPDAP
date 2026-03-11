"""
Load chiplet and connection info from test input JSON into ChipletNode objects and edge list.

Expected format:
- Input JSON has `chiplets` and `connections`
- `chiplets`: array of objects with `name`, `width`, `height`
- `connections`: array of `[src, dst]` or `[src, dst, {weight: ...}]`
"""

import json
from pathlib import Path
from typing import List, Tuple, Dict, Any, Optional

from tool import ChipletNode


def load_test_input_json(json_path: str) -> Dict[str, Any]:
    """
    Load test input JSON file.

    Parameters
    ----------
    json_path : str
        Path to JSON file

    Returns
    -------
    dict
        Dict with `chiplets` and `connections`
    """
    path = Path(json_path)
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    return data


def build_chiplet_nodes_from_json(json_data: Dict[str, Any]) -> List[ChipletNode]:
    """
    Build list of ChipletNode from JSON data.

    Parameters
    ----------
    json_data : dict
        Dict with `chiplets` key

    Returns
    -------
    List[ChipletNode]
    """
    nodes = []
    
    for chiplet_info in json_data.get("chiplets", []):
        name = chiplet_info.get("name", "")
        width = chiplet_info.get("width", 0.0)
        height = chiplet_info.get("height", 0.0)
        
        # dimensions: x=width, y=height
        dimensions = {
            "x": width,
            "y": height
        }
        
        node = ChipletNode(
            name=name,
            dimensions=dimensions,
            phys=[],   # No phys in test input
            power=0.0  # No power in test input
        )
        nodes.append(node)
    
    return nodes


def build_edges_from_json(json_data: Dict[str, Any]) -> List[Tuple[str, str]]:
    """
    Build edge list from JSON data.

    Parameters
    ----------
    json_data : dict
        Dict with `connections` key

    Returns
    -------
    List[Tuple[str, str]]
        List of (src, dst)
    """
    edges = []
    
    for conn in json_data.get("connections", []):
        if len(conn) >= 2:
            src = conn[0]
            dst = conn[1]
            edges.append((src, dst))
    
    return edges


def load_test_case(json_path: str) -> Tuple[List[ChipletNode], List[Tuple[str, str]]]:
    """
    Load chiplets and connections from test input JSON.

    Parameters
    ----------
    json_path : str
        Path to JSON file

    Returns
    -------
    Tuple[List[ChipletNode], List[Tuple[str, str]]]
        (chiplet nodes, edge list)
    """
    json_data = load_test_input_json(json_path)
    nodes = build_chiplet_nodes_from_json(json_data)
    edges = build_edges_from_json(json_data)
    
    return nodes, edges


if __name__ == "__main__":
    # Test: load 5core.json
    test_file = Path(__file__).parent.parent / "baseline" / "ICCAD23" / "test_input" / "5core.json"
    nodes, edges = load_test_case(str(test_file))
    
    print(f"Loaded {len(nodes)} chiplets:")
    for node in nodes:
        print(f"  {node.name}: {node.dimensions.get('x', 0)} x {node.dimensions.get('y', 0)}")
    
    print(f"\nLoaded {len(edges)} edges:")
    for src, dst in edges:
        print(f"  {src} -> {dst}")

