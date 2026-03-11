#!/usr/bin/env python3
"""
EMIB chiplet layout visualization script (no fixed chiplets).

Extracts data from Gurobi ILP solution and draws:
- Chiplet rectangles (gray, labeled with ID and power)
- Silicon bridge center points (red dots)
- Blue wire connections (path: chiplet 16x16 grid → bridge center → target chiplet grid)

Usage:
  python visualize_emib_layout.py --input <json_path> [--output <png|svg>] [--show]
  Or call run_visualization(...) as a module.
"""
from __future__ import annotations

import argparse
from pathlib import Path
from typing import Dict, List, Tuple, Optional

def draw_from_solution(
    result,
    post: Optional[dict],
    nodes: list,
    edge_map: dict,
    save_path: str,
    title: str = "EMIB Chiplet Layout",
    save_format: str = "png",
    show: bool = False,
    figsize: Tuple[float, float] = (10, 8),
    display_grid_size: Optional[int] = 4,
    ctx=None,
) -> dict:
    """
    Generate layout figure from existing solution (no re-solve).
    When post is None, if ctx is provided and contains EMIB variables, extract bridge positions from ctx.

    Parameters
    ----------
    result : ILPPlacementResult
        Solve result
    post : dict | None
        Return value of run_emib_post_process; can be None
    nodes : list
        Chiplet list
    edge_map : dict
        Edge mapping
    save_path : str
        Image save path
    ctx : optional, ILP context; when post is None, emib_placements are extracted from here

    Returns
    -------
    dict
        Structured output
    """
    from tool import extract_layout_data_for_vis, draw_emib_layout_diagram

    vis_data = extract_layout_data_for_vis(result, post, nodes, edge_map, ctx=ctx)
    return draw_emib_layout_diagram(
        chiplet_layout=vis_data["chiplet_layout"],
        chiplet_dims=vis_data["chiplet_dims"],
        emib_placements=vis_data["emib_placements"],
        emib_connections=vis_data["emib_connections"],
        chiplet_power=vis_data.get("chiplet_power"),
        title=title,
        show_axes=True,
        save_path=save_path,
        save_format=save_format,
        show=show,
        figsize=figsize,
        display_grid_size=display_grid_size,
    )


# Run in thermal-placement project environment (with Gurobi)
def run_visualization(
    input_json_path: str,
    output_path: Optional[str] = None,
    save_format: str = "png",
    show: bool = False,
    title: str = "EMIB Chiplet Layout",
    display_grid_size: Optional[int] = 4,
) -> dict:
    """
    Run full visualization: load JSON → ILP solve → post-process → draw.

    Parameters
    ----------
    input_json_path : str
        Input JSON path (chiplets, connections)
    output_path : str | None
        Output image path; None uses default output_gurobi_compact/fig/<stem>_emib_vis.png
    save_format : str
        Save format, e.g. "png", "svg"
    show : bool
        Whether to show window
    title : str
        Figure title

    Returns
    -------
    dict
        Structured output: emib_coords, wire_start_end, emib_edge_centers
    """
    import sys
    sys.path.insert(0, str(Path(__file__).parent))
    from tool import (
        load_emib_placement_json,
        run_emib_post_process,
        extract_layout_data_for_vis,
        draw_emib_layout_diagram,
    )
    from ilp_method_compact import build_placement_ilp_model
    from ilp_EMIB_search_compact import _solve_once_with_gap

    nodes, edges, edge_map, name_to_idx = load_emib_placement_json(input_json_path)
    min_w = min(float(n.dimensions.get("x", 0)) for n in nodes)
    min_h = min(float(n.dimensions.get("y", 0)) for n in nodes)
    for e in edges:
        e["EMIB_max_width"] = min(e["EMIB_max_width"], min_w, min_h)

    ctx = build_placement_ilp_model(nodes=nodes, edges=edges, verbose=False)
    result = _solve_once_with_gap(ctx=ctx, nodes=nodes, gap=0, time_limit=120)
    if result.status not in ("Optimal", "Feasible"):
        raise RuntimeError(f"ILP solve failed: {result.status}")

    post = run_emib_post_process(ctx=ctx, result=result, nodes=nodes, edge_map=edge_map, name_to_idx=name_to_idx)
    vis_data = extract_layout_data_for_vis(result, post, nodes, edge_map)
    out_path = output_path or str(Path(input_json_path).stem + "_emib_vis." + save_format)
    struct = draw_emib_layout_diagram(
        chiplet_layout=vis_data["chiplet_layout"],
        chiplet_dims=vis_data["chiplet_dims"],
        emib_placements=vis_data["emib_placements"],
        emib_connections=vis_data["emib_connections"],
        chiplet_power=vis_data.get("chiplet_power"),
        title=title,
        show_axes=True,
        save_path=out_path,
        save_format=save_format,
        show=show,
        display_grid_size=4,
    )
    return struct


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="EMIB layout visualization")
    parser.add_argument("--input", "-i", required=True, help="Input JSON path")
    parser.add_argument("--output", "-o", help="Output image path")
    parser.add_argument("--format", "-f", default="png", choices=["png", "svg"], help="Save format")
    parser.add_argument("--show", action="store_true", help="Show figure window")
    parser.add_argument("--title", default="EMIB Chiplet Layout", help="Figure title")
    parser.add_argument(
        "--grid-size", "-g", type=int, default=4,
        help="Wire grid size: 16 for 16x16=256 lines, 4 for 4x4=16 lines (per-block center), default 4",
    )
    args = parser.parse_args()
    run_visualization(
        input_json_path=args.input,
        output_path=args.output,
        save_format=args.format,
        show=args.show,
        title=args.title,
        display_grid_size=args.grid_size,
    )
    print("Visualization done")
