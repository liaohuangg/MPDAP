#!/usr/bin/env python3
"""Rewrite RL solution JSONs in bt_tree format, with bridges from training config.

The RL solutions under `experiment_result/output_rl` were dumped as

    {"chiplets": {id: {x, y, width, height}}, "wirelength": ..., ...}

while bt_tree writes

    {"chiplets": [{name, x-position, y-position, width, height, rotation, power}, ...],
     "connections": [...], "wirelength": ..., "area": ..., "aspect_ratio": ...,
     "interposer_size": ..., "SAR": ...}

This script converts the former to the latter and fills `connections` with the
bridge geometry the placement environment itself enforced.  The env is rebuilt
from the run's own `config.json` (`env_kwargs`: min_overlap,
use_emib_length_adjacency, interfacec_emib_overlap, ...), so the emitted
bridges are exactly the rectangles the bridge-overlap gate used during
training -- not a separately re-derived copy.

Usage:
    python3 scripts/rewrite_solutions_bt_format.py --dry-run
    python3 scripts/rewrite_solutions_bt_format.py [DIR_OR_FILE ...]
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
RL_DIR = SCRIPT_DIR.parent
sys.path.insert(0, str(RL_DIR))

from chiplet_model import Chiplet                 # noqa: E402
from env import create_env_from_json              # noqa: E402

MPDAP_DIR = RL_DIR.parent.parent
BENCH = MPDAP_DIR / "benchmark" / "test_input"
RUNS = RL_DIR / "runs"

METRIC_KEYS = ("wirelength", "area", "aspect_ratio", "interposer_size", "SAR")


def case_of(path: Path, cases):
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


def seed_of(path: Path):
    for part in [path.name] + [p.name for p in path.parents]:
        m = re.search(r"(?:^|_)seed(\d+)", part)
        if m:
            return int(m.group(1))
    return None


def chips_of(data):
    records = data.get("chiplets")
    if isinstance(records, dict):
        items = list(records.items())
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


def find_run_config(path: Path, case: str, seed, chips):
    """Locate the config.json of the run that produced this solution."""
    # 1. inside a run directory: .../runs/<run>/...
    for parent in path.parents:
        cfg = parent / "config.json"
        if cfg.is_file() and parent.parent == RUNS:
            return cfg

    # 2. runs/<prefix>_<case>_seed<N>/config.json, preferring a run whose
    #    exported best layout is this very solution.
    candidates = []
    for cfg in sorted(RUNS.glob("*/config.json")):
        run_dir = cfg.parent
        m = re.match(r"^(.+)_seed(\d+)$", run_dir.name)
        if not m:
            continue
        prefix, run_seed = m.group(1), int(m.group(2))
        if not (prefix == case or prefix.endswith("_" + case)):
            continue
        if seed is not None and run_seed != seed:
            continue
        candidates.append(cfg)
    if not candidates:
        return None
    if len(candidates) == 1:
        return candidates[0]
    for cfg in candidates:
        for best in (cfg.parent / "results" / "top_layouts").glob("*.json"):
            try:
                other = chips_of(json.loads(best.read_text(encoding="utf-8")))
            except (OSError, ValueError, KeyError):
                continue
            if other and set(other) == set(chips) and all(
                abs(other[n].x - chips[n].x) < 1e-9
                and abs(other[n].y - chips[n].y) < 1e-9
                and abs(other[n].width - chips[n].width) < 1e-9
                and abs(other[n].height - chips[n].height) < 1e-9
                for n in chips
            ):
                return cfg
    return candidates[0]


def bt_chiplets(chips, bench_order):
    order = [n for n in bench_order if n in chips]
    order += sorted(n for n in chips if n not in order)
    return [{
        "name": name,
        "x-position": float(chips[name].x),
        "y-position": float(chips[name].y),
        "width": float(chips[name].width),
        "height": float(chips[name].height),
        "rotation": 0,
        "power": 0.0,
    } for name in order]


def process(path: Path, cases, dry_run: bool) -> str:
    data = json.loads(path.read_text(encoding="utf-8"))
    case = case_of(path, cases)
    if case is None:
        return "cannot infer benchmark case"
    bench = json.loads((BENCH / f"{case}.json").read_text(encoding="utf-8"))

    chips = chips_of(data)
    seed = seed_of(path)
    cfg_path = find_run_config(path, case, seed, chips)
    if cfg_path is None:
        return f"no run config found (case={case} seed={seed})"
    cfg = json.loads(cfg_path.read_text(encoding="utf-8"))
    env = create_env_from_json(str(BENCH / f"{case}.json"),
                               **cfg.get("env_kwargs", {}))
    connections = env.bridge_connection_records(chips)

    bench_order = [c.get("name") for c in bench.get("chiplets", [])]
    out = {
        "chiplets": bt_chiplets(chips, bench_order),
        "connections": connections,
    }
    for key in METRIC_KEYS:
        if key in data:
            out[key] = data[key]
    for key, value in data.items():
        if key not in out and key != "chiplets":
            out[key] = value

    if not dry_run:
        path.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n",
                        encoding="utf-8")
    return (f"{len(connections)} bridges from {cfg_path.parent.name}"
            f" (dry-run)" if dry_run else
            f"{len(connections)} bridges from {cfg_path.parent.name}")


def collect(paths):
    files = []
    for p in paths:
        p = Path(p)
        if p.is_dir():
            files.extend(sorted(f for f in p.glob("**/*.json")
                                if not f.name.endswith(".metrics.json")))
        elif p.is_file():
            files.append(p)
        else:
            print(f"warning: {p} does not exist")
    return files


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("paths", nargs="*",
                    default=[str(MPDAP_DIR / "experiment_result" / "output_rl")])
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    cases = {p.stem for p in BENCH.glob("*.json")}
    for path in collect(args.paths):
        try:
            print(f"{path}: {process(path, cases, args.dry_run)}")
        except Exception as exc:
            print(f"{path}: FAILED: {exc}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
