#!/usr/bin/env python3
import os
import json
from glob import glob


def main():
    base_dir = os.path.join(
        os.path.dirname(__file__),
        "..",
        "benchmark",
        "test_input",
    )
    base_dir = os.path.abspath(base_dir)

    print(f"Stats directory: {base_dir}")

    json_files = sorted(glob(os.path.join(base_dir, "*.json")))
    if not json_files:
        print("No JSON files found.")
        return

    print(f"{'file':30s}  {'#chiplets':>10s}  {'#interfaceB':>12s}")
    print("-" * 60)

    for path in json_files:
        with open(path, "r") as f:
            data = json.load(f)

        chiplets = data.get("chiplets", [])
        conns = data.get("connections", [])
        num_chiplets = len(chiplets)
        num_interface_b = sum(
            1 for c in conns if c.get("EMIBType") == "interfaceB"
        )

        print(
            f"{os.path.basename(path):30s}  "
            f"{num_chiplets:10d}  "
            f"{num_interface_b:12d}"
        )


if __name__ == "__main__":
    main()

