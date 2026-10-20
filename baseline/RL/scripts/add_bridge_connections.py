#!/usr/bin/env python3
"""Backfill EMIB bridge geometry into RL layout JSONs.

RL's training-time dump (train.py) used to write only

    {"chiplets": {id: {x, y, width, height}}}

so the exported solutions carried no bridge information, while bt_tree
solutions store a `connections` block with the bridge position and rotation.
This script rebuilds that block from the benchmark's EMIB specs and the chip
positions, using the same schema (unit.bridge_connection_records):

    EMIB_width      size across the shared edge (2 * EMIB_bump_width)
    EMIB_length     size along the shared edge
    EMIB-rotation   1 = left/right neighbours (vertical edge), 0 = up/down
    EMIB-x/y        lower-left corner of the bridge rectangle

Usage:
    python3 scripts/add_bridge_connections.py DIR_OR_FILE [DIR_OR_FILE ...]
    python3 scripts/add_bridge_connections.py --overwrite DIR
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from types import SimpleNamespace

SCRIPT_DIR = Path(__file__).resolve().parent
RL_DIR = SCRIPT_DIR.parent
sys.path.insert(0, str(RL_DIR))

from chiplet_model import Chiplet          # noqa: E402
from unit import bridge_connection_records  # noqa: E402

BENCH = RL_DIR.parent.parent / "benchmark" / "test_input"


def case_of(path: Path):
    """Case name from the path.

    `experiment_result/output_rl/<case>/...` and the run directories
    `runs/<prefix>_<case>_seed<N>/...` both carry it; the latter needs the
    prefix stripped (`rl_emib_hard_20261019_1744_hp6_m_seed2` -> hp6_m).
    """
    cases = {p.stem for p in BENCH.glob("*.json")}
    if path.parent.name in cases:
        return path.parent.name
    if path.stem in cases:
        return path.stem
    for part in (p.name for p in path.parents):
        m = re.match(r"^(.+)_seed\d+$", part)
        if not m:
            continue
        prefix = m.group(1)
        for case in sorted(cases, key=len, reverse=True):
            if prefix == case or prefix.endswith("_" + case):
                return case
    return None


def chips_of(data: dict) -> dict:
    records = data.get("chiplets")
    if isinstance(records, dict):
        items = [(name, c) for name, c in records.items()]
    else:
        items = [(c.get("name"), c) for c in (records or [])]
    chips = {}
    for name, c in items:
        if not name:
            continue
        chips[name] = Chiplet(
            name,
            float(c["width"]),
            float(c["height"]),
            float(c.get("x", c.get("x-position", 0.0))),
            float(c.get("y", c.get("y-position", 0.0))),
        )
    return chips


def process(path: Path, overwrite: bool) -> str:
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("connections") and not overwrite:
        return "already has connections (use --overwrite)"
    case = case_of(path)
    if case is None:
        return f"cannot infer benchmark case for {path}"
    bench = json.loads((BENCH / f"{case}.json").read_text(encoding="utf-8"))
    problem = SimpleNamespace(all_connections=bench.get("connections", []))
    records = bridge_connection_records(chips_of(data), problem)
    data["connections"] = records
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n",
                    encoding="utf-8")
    return f"{len(records)} bridges"


def collect(paths):
    files = []
    for p in paths:
        p = Path(p)
        if p.is_dir():
            files.extend(sorted(f for f in p.glob("*.json")
                                if not f.name.endswith(".metrics.json")))
        elif p.is_file():
            files.append(p)
        else:
            print(f"warning: {p} does not exist")
    return files


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("paths", nargs="+")
    ap.add_argument("--overwrite", action="store_true",
                    help="replace an existing connections block")
    args = ap.parse_args()

    for path in collect(args.paths):
        try:
            print(f"{path}: {process(path, args.overwrite)}")
        except Exception as exc:
            print(f"{path}: FAILED: {exc}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
