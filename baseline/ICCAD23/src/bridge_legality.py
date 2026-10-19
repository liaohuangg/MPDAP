"""Silicon-bridge (EMIB) legality checks for ICCAD23 layouts.

Placement legality (`cost_legal`) says nothing about the physical bridge
rectangles, so a layout could pass the BT-tree search and still have two
bridges sitting on top of each other. This module supplies the gate the
pipeline now applies at every admission point: `SA_1` and `run_base_derivation`
(layer 1), `SA_neighbor_generation` (layer 2) and `overall_sa` (layer 3) all
reject layouts for which `layout_bridges_legal` is false, so a tree node or a
saved solution always has non-overlapping bridges.

This module checks the real geometry, using the per-edge EMIB sizes from the
benchmark (the same convention the RL exporter and its checker use):

    along the shared edge : L = EMIB_length of the connection
    across the boundary   : W = 2 * EMIB_bump_width   (touching chiplets, gap=0)
    position              : centred on the shared boundary, at the midpoint of
                            the shared-edge overlap (matches get_bridge_center)

For every EMIB connection (wireCount > 255, not interfaceC) it verifies:

  1. the two chiplets still share an edge, and L fits inside that overlap;
  2. the bridge rectangle stored in the solution JSON matches the geometry
     recomputed from the chiplet positions (ICCAD23's own export convention:
     EMIB-rotation = 1 for a left/right (vertical) shared edge, 0 for up/down);
  3. no two bridge rectangles overlap.

Usage (from anywhere):
    python src/bridge_legality.py                 # default: ICCAD23/result
    python src/bridge_legality.py path/to/dir ... # files or directories

Exit code is 1 when any checked solution fails.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

ICCAD23_DIR = Path(__file__).resolve().parent.parent
BENCH_DEFAULT = ICCAD23_DIR.parent.parent / "benchmark" / "test_input"
RESULT_DEFAULT = ICCAD23_DIR / "result"

EPS = 1e-6
SIZE_TOL = 1e-3
POS_TOL = 1e-4
MIN_OVERLAP = 1.0
EMIB_WIRECOUNT_THRESHOLD = 255   # same cut-off as load_problem_from_json

Rect = Tuple[float, float, float, float]


# ---------------------------------------------------------------------------
# Geometry helpers
# ---------------------------------------------------------------------------

def _chip_geometry(chip) -> Rect:
    """Return (x, y, w, h) for a layout Chiplet or an exported JSON chip dict."""
    if isinstance(chip, dict):
        x = float(chip.get("x-position", chip.get("x", 0.0)))
        y = float(chip.get("y-position", chip.get("y", 0.0)))
        return x, y, float(chip["width"]), float(chip["height"])
    return float(chip.x), float(chip.y), float(chip.width), float(chip.height)


def _chip_id(chip) -> str:
    return chip["name"] if isinstance(chip, dict) else chip.id


def shared_edge(a, b) -> Optional[Tuple[str, float, float, float]]:
    """Return (kind, boundary, lo, hi) for the shared edge, or None.

    kind='LR' means a vertical shared edge (left/right neighbours) at
    x=boundary; kind='UD' means a horizontal one (up/down neighbours) at
    y=boundary.  lo/hi are the overlap interval along that edge.
    """
    ax, ay, aw, ah = _chip_geometry(a)
    bx, by, bw, bh = _chip_geometry(b)
    ax1, ay1 = ax + aw, ay + ah
    bx1, by1 = bx + bw, by + bh

    oy = min(ay1, by1) - max(ay, by)
    ox = min(ax1, bx1) - max(ax, bx)

    if abs(ax1 - bx) < EPS and oy > EPS:
        return "LR", ax1, max(ay, by), min(ay1, by1)
    if abs(bx1 - ax) < EPS and oy > EPS:
        return "LR", bx1, max(ay, by), min(ay1, by1)
    if abs(ay1 - by) < EPS and ox > EPS:
        return "UD", ay1, max(ax, bx), min(ax1, bx1)
    if abs(by1 - ay) < EPS and ox > EPS:
        return "UD", by1, max(ax, bx), min(ax1, bx1)
    return None


def rect_overlap(r: Rect, s: Rect) -> Tuple[float, float]:
    """Overlap extents (dx, dy); (0, 0) when the rectangles only touch."""
    dx = min(r[2], s[2]) - max(r[0], s[0])
    dy = min(r[3], s[3]) - max(r[1], s[1])
    return (dx, dy) if dx > EPS and dy > EPS else (0.0, 0.0)


# ---------------------------------------------------------------------------
# Bridge specifications
# ---------------------------------------------------------------------------

def bridge_specs(connections: Iterable[dict],
                 emib_types: Optional[Dict[str, dict]] = None) -> List[dict]:
    """Build the required bridge list from benchmark-style connections.

    Only EMIB links (wireCount > 255) get a physical bridge; interfaceC is
    excluded because it is not bridge-backed (same rule as the RL checker).
    """
    specs = []
    for conn in connections:
        if int(conn.get("wireCount", 1)) <= EMIB_WIRECOUNT_THRESHOLD:
            continue
        etype = str(conn.get("EMIBType", "interfaceB"))
        if etype.lower() == "interfacec":
            continue

        iface = (emib_types or {}).get(etype, {})
        along = conn.get("EMIB_length")
        if along is None:
            linear = float(iface.get("LinearIODensity", 300.0))
            along = float(conn.get("wireCount", 1)) / linear
        bump = conn.get("EMIB_bump_width")
        if bump is None:
            linear = float(iface.get("LinearIODensity", 300.0))
            area = float(iface.get("AreaIODensity", 300.0))
            bump = linear / area

        specs.append({
            "node1": conn["node1"],
            "node2": conn["node2"],
            "type": etype,
            "along": float(along),
            "across": 2.0 * float(bump),
        })
    return specs


def bridge_specs_from_problem(problem) -> List[dict]:
    """Bridge list straight from a loaded LayoutProblem (all_connections)."""
    return bridge_specs(getattr(problem, "all_connections", []))


def load_emib_types(path: Path) -> Dict[str, dict]:
    data = json.loads(Path(path).read_text(encoding="utf-8"))
    return {e["name"]: e for e in data.get("EMIBTypes", [])}


# ---------------------------------------------------------------------------
# The check
# ---------------------------------------------------------------------------

def _expected_stored(kind: str, boundary: float, lo: float, hi: float,
                     along: float, across: float) -> dict:
    """Bridge fields as written by unit.save_result for ICCAD23.

    unit.save_result uses EMIB-rotation 1 for left/right adjacency and 0 for
    up/down; EMIB_width always holds the across-boundary size, EMIB_length the
    along-edge size, and the stored position is the rectangle's lower-left
    corner.
    """
    mid = (lo + hi) / 2.0
    if kind == "LR":
        rotation = 1
        x = boundary - across / 2.0
        y = mid - along / 2.0
    else:
        rotation = 0
        x = mid - along / 2.0
        y = boundary - across / 2.0
    return {
        "rotation": rotation,
        "width": across,
        "length": along,
        "x": x,
        "y": y,
    }


def layout_bridge_rects(chips: Dict[str, object],
                        specs: List[dict]) -> Tuple[List[dict], List[str]]:
    """Physical bridge rectangles implied by a layout.

    Returns `(bridges, errors)`. Each bridge is a dict with

        name      "A-F"
        node1/2   the two chip ids
        rect      (x0, y0, x1, y1)
        kind      'LR' (vertical shared edge) or 'UD' (horizontal)
        boundary  the shared boundary coordinate
        lo, hi    the shared-edge overlap interval
        along     EMIB_length -- laid ALONG the shared edge
        across    2 * EMIB_bump_width -- laid ACROSS the shared edge
        rotation  1 for LR, 0 for UD (ICCAD23's export convention)

    Up/down neighbours get a rotated rectangle: the along-edge length runs in
    x and the across-gap width in y. Left/right neighbours keep the along-edge
    length in y. Callers that only draw can ignore `errors`; callers that judge
    must not -- an error means the layout has no valid bridge geometry.
    """
    bridges: List[dict] = []
    errors: List[str] = []
    for spec in specs:
        n1, n2 = spec["node1"], spec["node2"]
        name = f"{n1}-{n2}"
        if n1 not in chips or n2 not in chips:
            errors.append(f"{name}: chiplet missing from layout")
            continue

        edge = shared_edge(chips[n1], chips[n2])
        if edge is None:
            errors.append(f"{name}: chiplets do not share an edge "
                          f"(no bridge possible)")
            continue

        kind, boundary, lo, hi = edge
        shared = hi - lo
        along, across = spec["along"], spec["across"]

        if along > shared + SIZE_TOL:
            errors.append(
                f"{name}: bridge along-edge {along:g} exceeds shared overlap "
                f"{shared:g} by {along - shared:.4f}")

        mid = (lo + hi) / 2.0
        if kind == "LR":
            rot = 1
            rect = (boundary - across / 2.0, mid - along / 2.0,
                    boundary + across / 2.0, mid + along / 2.0)
        else:
            rot = 0
            rect = (mid - along / 2.0, boundary - across / 2.0,
                    mid + along / 2.0, boundary + across / 2.0)

        bridges.append({
            "name": name,
            "node1": n1,
            "node2": n2,
            "rect": rect,
            "kind": kind,
            "boundary": boundary,
            "lo": lo,
            "hi": hi,
            "along": along,
            "across": across,
            "rotation": rot,
        })
    return bridges, errors


def bridge_conflicts(bridges: List[dict]) -> List[dict]:
    """Pairs of bridge rectangles that overlap with positive area."""
    conflicts = []
    for b1, b2 in itertools.combinations(bridges, 2):
        dx, dy = rect_overlap(b1["rect"], b2["rect"])
        if dx > 0.0 and dy > 0.0:
            conflicts.append({
                "pair": (b1["name"], b2["name"]),
                "dx": dx,
                "dy": dy,
                "area": dx * dy,
            })
    return conflicts


def layout_bridges_legal(layout: Dict[str, object],
                         specs: List[dict]) -> bool:
    """True when every required bridge fits its shared edge and none overlap.

    This is the gate the BT-tree pipeline applies while it builds the forest
    and walks it: a layout that passes `cost_legal` can still have two
    bridges lying on top of each other, and such a node is not a legal node.
    """
    bridges, errors = layout_bridge_rects(layout, specs)
    if errors:
        return False
    return not bridge_conflicts(bridges)


def make_bridge_checker(problem) -> "callable":
    """Build a reusable `layout -> bool` predicate for one problem.

    The bridge specs depend only on the benchmark, so they are computed once
    and reused across the thousands of layouts a tree build evaluates.
    """
    specs = bridge_specs_from_problem(problem)
    if not specs:
        return lambda layout: True

    def check(layout: Dict[str, object]) -> bool:
        return layout_bridges_legal(layout, specs)

    return check


def check_layout(chips: Dict[str, object],
                 specs: List[dict],
                 stored_connections: Optional[List[dict]] = None) -> dict:
    """Check one layout against the required bridges.

    `chips` maps chip id -> Chiplet or exported chip dict.
    `stored_connections` is the solution JSON's "connections" list; when given,
    the stored bridge metadata is compared against the recomputed geometry.
    """
    bridges, errors = layout_bridge_rects(chips, specs)
    stored = {}
    if stored_connections is not None:
        for conn in stored_connections:
            stored[frozenset((conn.get("node1"), conn.get("node2")))] = conn

    for bridge in bridges:
        n1, n2 = bridge["node1"], bridge["node2"]
        name = bridge["name"]
        kind = bridge["kind"]
        boundary, lo, hi = bridge["boundary"], bridge["lo"], bridge["hi"]
        along, across = bridge["along"], bridge["across"]

        if stored_connections is None:
            continue
        key = frozenset((n1, n2))
        entry = stored.get(key)
        if entry is None:
            errors.append(f"{name}: required bridge missing from solution JSON")
            continue

        want = _expected_stored(kind, boundary, lo, hi, along, across)
        got_rot = int(entry.get("EMIB-rotation", -1))
        if got_rot != want["rotation"]:
            errors.append(
                f"{name}: EMIB-rotation={got_rot} but {kind} needs "
                f"{want['rotation']}")
        got_w = float(entry.get("EMIB_width", 0.0))
        got_l = float(entry.get("EMIB_length", 0.0))
        if abs(got_w - want["width"]) > SIZE_TOL:
            errors.append(f"{name}: EMIB_width {got_w:g} != {want['width']:g}")
        if abs(got_l - want["length"]) > SIZE_TOL:
            errors.append(f"{name}: EMIB_length {got_l:g} != {want['length']:g}")
        gx = float(entry.get("EMIB-x-position", 0.0))
        gy = float(entry.get("EMIB-y-position", 0.0))
        if abs(gx - want["x"]) > POS_TOL or abs(gy - want["y"]) > POS_TOL:
            errors.append(
                f"{name}: stored bridge origin ({gx:.4f}, {gy:.4f}) != "
                f"expected ({want['x']:.4f}, {want['y']:.4f})")

    conflicts = []
    for b1, b2 in itertools.combinations(bridges, 2):
        name1, r1 = b1["name"], b1["rect"]
        name2, r2 = b2["name"], b2["rect"]
        dx, dy = rect_overlap(r1, r2)
        if dx > 0.0 and dy > 0.0:
            conflicts.append({
                "pair": (name1, name2),
                "dx": dx,
                "dy": dy,
                "area": dx * dy,
            })
            errors.append(f"{name1} x {name2}: bridge overlap "
                          f"{dx:.4f} x {dy:.4f} = {dx * dy:.4f}")

    return {
        "errors": errors,
        "bridge_count": len(bridges),
        "overlap_pairs": len(conflicts),
        "overlap_area": sum(c["area"] for c in conflicts),
        "conflicts": conflicts,
        "legal": not errors,
    }


def check_problem_layout(layout: Dict[str, object], problem) -> dict:
    """Convenience wrapper for in-process callers (batch_test's save_solution)."""
    return check_layout(layout, bridge_specs_from_problem(problem))


# ---------------------------------------------------------------------------
# File-level CLI
# ---------------------------------------------------------------------------

def infer_case(path: Path, bench_dir: Path) -> Optional[str]:
    """Case name of a solution file, looking through `prev_*` archive dirs."""
    for parent in path.resolve().parents:
        if parent == bench_dir.resolve():
            break
        if (bench_dir / f"{parent.name}.json").is_file():
            return parent.name
    return None


def check_file(path: Path, bench_dir: Path,
               emib_types: Dict[str, dict]) -> Tuple[List[str], dict]:
    case = infer_case(path, bench_dir)
    if case is None:
        return [f"cannot infer benchmark case for {path}"], {}
    bench = json.loads((bench_dir / f"{case}.json").read_text(encoding="utf-8"))
    data = json.loads(path.read_text(encoding="utf-8"))

    chips = {c["name"]: c for c in data.get("chiplets", [])}
    specs = bridge_specs(bench.get("connections", []), emib_types)
    report = check_layout(chips, specs,
                          stored_connections=data.get("connections", []))
    report["case"] = case
    return report["errors"], report


def collect_paths(args: List[str]) -> List[Path]:
    paths: List[Path] = []
    for arg in args:
        p = Path(arg)
        if p.is_dir():
            paths.extend(sorted(p.glob("**/solution_*.json")))
        elif p.is_file():
            paths.append(p)
        else:
            print(f"warning: {arg} does not exist, skipped")
    return paths


def main(argv: Optional[List[str]] = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("paths", nargs="*", help="solution JSON files or dirs")
    ap.add_argument("--bench", default=str(BENCH_DEFAULT))
    ap.add_argument("--emib", default=str(BENCH_DEFAULT / "EMIB.json"))
    args = ap.parse_args(argv)

    bench_dir = Path(args.bench)
    paths = collect_paths(args.paths or [str(RESULT_DEFAULT)])
    if not paths:
        print("no solution JSON found")
        return 1
    emib_types = load_emib_types(Path(args.emib))

    bad_files = 0
    total_conflicts = 0
    conflict_files = 0
    for path in paths:
        errors, report = check_file(path, bench_dir, emib_types)
        if errors:
            bad_files += 1
            total_conflicts += report.get("overlap_pairs", 0)
            if report.get("overlap_pairs", 0):
                conflict_files += 1
            print(f"FAIL {path}")
            for err in errors:
                print(f"  - {err}")

    print(f"\nChecked {len(paths)} solution file(s): "
          f"{len(paths) - bad_files} legal, {bad_files} illegal")
    print(f"Files with bridge-bridge overlap: {conflict_files} "
          f"({total_conflicts} conflicting bridge pair(s))")
    return 1 if bad_files else 0


if __name__ == "__main__":
    raise SystemExit(main())
