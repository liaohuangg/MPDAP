#!/usr/bin/env python3
"""Check silicon-bridge legality of placement JSONs against test_input.

The RL training loop never legalizes bridges. This script checks, using the
EMIB sizes from benchmark/test_input (not the hard-coded 1x1 in
Bridge_Overlap_Adjustment.py):

  1. every non-interfaceC connection exists in the JSON and its chiplets
     actually share an edge;
  2. the exported EMIB_width / EMIB_length match the benchmark sizes
     (width = across the shared edge, length = along it, for both
     orientations) and the rectangle extents match the rotated position;
  3. the along-edge size fits inside the shared-edge overlap;
  4. the bridge rectangle stays inside the two chiplets along the shared edge;
  5. bridge rectangles do not overlap each other.

Usage:
  python scripts/check_bridge_legality.py                 # default: output_rl
  python scripts/check_bridge_legality.py <file-or-dir> ...
"""
from __future__ import annotations

import argparse
import glob
import itertools
import json
from pathlib import Path
from typing import Dict, List, Optional, Tuple

RL_DIR = Path(__file__).resolve().parent.parent
BENCH_DEFAULT = Path("/root/placement/MPDAP/benchmark/test_input")
EPS = 1e-6
SIZE_TOL = 1e-3
POS_TOL = 1e-4


def load_emib_types(path: Path) -> Dict[str, dict]:
    data = json.loads(path.read_text(encoding="utf-8"))
    return {e["name"]: e for e in data["EMIBTypes"]}


def shared_edge(a: dict, b: dict) -> Optional[Tuple[str, float, float, float]]:
    """Return (kind, boundary, lo, hi) for the shared edge, or None.

    kind='LR' means a vertical shared edge (left/right neighbours);
    kind='UD' means a horizontal shared edge (up/down neighbours).
    lo/hi are the overlap interval along that edge.
    """
    ax0, ay0 = a["x-position"], a["y-position"]
    ax1, ay1 = ax0 + a["width"], ay0 + a["height"]
    bx0, by0 = b["x-position"], b["y-position"]
    bx1, by1 = bx0 + b["width"], by0 + b["height"]

    oy = min(ay1, by1) - max(ay0, by0)
    ox = min(ax1, bx1) - max(ax0, bx0)

    if abs(ax1 - bx0) < EPS and oy > EPS:
        return "LR", ax1, max(ay0, by0), min(ay1, by1)
    if abs(bx1 - ax0) < EPS and oy > EPS:
        return "LR", bx1, max(ay0, by0), min(ay1, by1)
    if abs(ay1 - by0) < EPS and ox > EPS:
        return "UD", ay1, max(ax0, bx0), min(ax1, bx1)
    if abs(by1 - ay0) < EPS and ox > EPS:
        return "UD", by1, max(ax0, bx0), min(ax1, bx1)
    return None


def rect_overlap(r: Tuple[float, float, float, float],
                 s: Tuple[float, float, float, float]) -> Tuple[float, float]:
    dx = min(r[2], s[2]) - max(r[0], s[0])
    dy = min(r[3], s[3]) - max(r[1], s[1])
    return (dx, dy) if dx > EPS and dy > EPS else (0.0, 0.0)


def check_file(path: Path, bench_dir: Path,
               emib_types: Dict[str, dict]) -> List[str]:
    case = path.parent.name
    bench_path = bench_dir / f"{case}.json"
    if not bench_path.is_file():
        return [f"missing benchmark file {bench_path}"]

    data = json.loads(path.read_text(encoding="utf-8"))
    bench = json.loads(bench_path.read_text(encoding="utf-8"))
    chips = {c["name"]: c for c in data["chiplets"]}
    conns = {frozenset((c["node1"], c["node2"])): c
             for c in data.get("connections", [])}
    errors: List[str] = []

    expected = {}
    for conn in bench.get("connections", []):
        etype = conn.get("EMIBType", "interfaceB")
        if etype == "interfaceC":
            continue
        key = frozenset((conn["node1"], conn["node2"]))
        iface = emib_types.get(etype)
        if iface is None:
            errors.append(f"{conn['node1']}-{conn['node2']}: unknown EMIBType {etype}")
            continue
        along = float(conn.get("wireCount", 1)) / float(iface["LinearIODensity"])
        bump = float(iface["LinearIODensity"]) / float(iface["AreaIODensity"])
        expected[key] = (etype, along, bump)

    bridges = []
    for key, (etype, along, bump) in expected.items():
        n1, n2 = sorted(key)
        name = f"{n1}-{n2}"
        if key not in conns:
            errors.append(f"{name}: required bridge missing from JSON")
            continue
        e = conns[key]
        edge = shared_edge(chips[n1], chips[n2])
        if edge is None:
            errors.append(f"{name}: chiplets no longer share an edge")
            continue
        kind, boundary, lo, hi = edge
        gap = 0.0
        across = gap + 2.0 * bump
        shared = hi - lo

        want_rot = 1 if kind == "LR" else 0
        if int(e.get("EMIB-rotation", -1)) != want_rot:
            errors.append(
                f"{name}: EMIB-rotation={e.get('EMIB-rotation')} but {kind} needs {want_rot}")

        # unit.save_result keeps EMIB_width = across and EMIB_length = along
        # for BOTH orientations; only the rectangle's extents swap.
        want_w, want_l = across, along
        got_w = float(e.get("EMIB_width", 0.0))
        got_l = float(e.get("EMIB_length", 0.0))
        if abs(got_w - want_w) > SIZE_TOL or abs(got_l - want_l) > SIZE_TOL:
            errors.append(
                f"{name}: (EMIB_width, EMIB_length) = ({got_w:g}, {got_l:g}) "
                f"!= expected ({want_w:g}, {want_l:g}) for {kind}")

        if along > shared + SIZE_TOL:
            errors.append(
                f"{name}: along-edge {along:g} > shared overlap {shared:g} "
                f"(short by {along - shared:.4f})")

        x, y = float(e["EMIB-x-position"]), float(e["EMIB-y-position"])
        w, l = got_w, got_l
        # LR: width lies in x, length in y.  UD: the rectangle is rotated, so
        # the length lies in x and the width in y.
        if kind == "LR":
            rect = (x, y, x + w, y + l)
            center_across = x + w / 2.0
            along_lo, along_hi = y, y + l
        else:
            rect = (x, y, x + l, y + w)
            center_across = y + w / 2.0
            along_lo, along_hi = x, x + l

        # Centre must sit on the shared edge in the across direction.
        if abs(center_across - boundary) > POS_TOL:
            errors.append(f"{name}: bridge centre is not on the shared boundary")

        # Along the edge the bridge must stay inside the overlap interval.
        if along_lo < lo - POS_TOL or along_hi > hi + POS_TOL:
            errors.append(
                f"{name}: bridge [{along_lo:.4f}, {along_hi:.4f}] exceeds "
                f"shared interval [{lo:.4f}, {hi:.4f}]")

        bridges.append((name, rect))

    for (n1, r1), (n2, r2) in itertools.combinations(bridges, 2):
        dx, dy = rect_overlap(r1, r2)
        if dx > 0.0 and dy > 0.0:
            errors.append(f"{n1} x {n2}: bridge overlap {dx:.4f} x {dy:.4f} = {dx * dy:.4f}")

    return errors


def collect_paths(args: List[str]) -> List[Path]:
    if not args:
        args = [str(Path("/root/placement/MPDAP/experiment_result/output_rl"))]
    paths: List[Path] = []
    for arg in args:
        p = Path(arg)
        if p.is_dir():
            paths.extend(sorted(p.glob("**/solution_*.json")))
        else:
            paths.extend(sorted(Path(x) for x in glob.glob(arg)))
    return paths


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("paths", nargs="*", help="solution JSON files or directories")
    ap.add_argument("--bench", default=str(BENCH_DEFAULT))
    ap.add_argument("--emib", default=str(BENCH_DEFAULT / "EMIB.json"))
    args = ap.parse_args()

    paths = collect_paths(args.paths)
    if not paths:
        print("no solution JSON found")
        return 1
    emib_types = load_emib_types(Path(args.emib))

    bad_files = 0
    for path in paths:
        errors = check_file(path, Path(args.bench), emib_types)
        if errors:
            bad_files += 1
            print(f"FAIL {path}")
            for err in errors:
                print(f"  - {err}")
        else:
            print(f"OK   {path}")

    print(f"\n{len(paths) - bad_files}/{len(paths)} legal, {bad_files} illegal")
    return 0 if bad_files == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
