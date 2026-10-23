import os
import json
import math
from decimal import Decimal, ROUND_HALF_UP
from glob import glob

# ==============================
# Config: root dir (single placement dir under project)
# ==============================
# Placement dir to process
ROOT_DIR = "/root/placement/MPDAP/experiment_result/output_gurobi_EMIB_chiplet_5_6_01_0_md0_ca0"

# Output to same dir
OUTPUT_DIR = ROOT_DIR
JSON_OUTPUT = os.path.join(OUTPUT_DIR, "placement_results.json")

# test_input root: benchmark/test_input in project
TEST_INPUT_DIR = os.path.join(
    os.path.dirname(__file__),
    "..",
    "benchmark",
    "test_input",
)

# Create output dir if needed
os.makedirs(OUTPUT_DIR, exist_ok=True)

# ==============================
# Config: grid size
# ==============================
GRID_SIZE = 16

# ==============================
# Precision helpers
# ==============================
# AR and SAR are both stored with 3 decimals.  Rounding goes through Decimal
# with ROUND_HALF_UP so a trailing 5 does not fall to the even digit the way
# Python's round() would.
AR_DIGITS = 3
SAR_DIGITS = 3


def round_half_up(value, digits):
    if value is None:
        return None
    quantum = Decimal(1).scaleb(-digits)
    return float(Decimal(str(value)).quantize(quantum, rounding=ROUND_HALF_UP))


def compute_sar(aspect_ratio, digits=SAR_DIGITS):
    """SAR = max(AR, 1/AR) - 1, evaluated on the unrounded aspect ratio.

    The ratio is taken straight from the bounding box (width / height), put
    through the formula, and only the result is rounded to ``digits``.  The
    stored ``aspect_ratio`` is a 3-decimal presentation of the same ratio, so
    feeding it back in would shift SAR in the 3rd digit around AR ~ 0.44
    (dSAR/dAR = 1 + 1/AR^2): raw 0.44362 -> 1.254, rounded 0.444 -> 1.252.
    """
    if not aspect_ratio:
        return 0.0
    return round_half_up(max(aspect_ratio, 1.0 / aspect_ratio) - 1.0, digits)

# ==============================
# Generate grid points
# ==============================
def get_grid_points(chip):
    x_min = chip["x-position"]
    y_min = chip["y-position"]
    width = chip["width"]
    height = chip["height"]

    x_max = x_min + width
    y_max = y_min + height

    points = []
    for i in range(GRID_SIZE):
        for j in range(GRID_SIZE):
            x = x_min + (x_max - x_min) * (i + 0.5) / GRID_SIZE
            y = y_min + (y_max - y_min) * (j + 0.5) / GRID_SIZE
            points.append((x, y))
    return points

# ==============================
# Compute total wirelength
# ==============================
def calculate_total_wirelength(data, test_file_name=None):
    chip_dict = {chip["name"]: chip for chip in data["chiplets"]}
    total_wirelength = 0.0

    # Try to load matching test_input file
    if test_file_name is None:
        test_file_name = os.path.basename(data.get("file_name", ""))
    test_json_path = os.path.join(TEST_INPUT_DIR, test_file_name)
    test_connections_dict = {}
    test_connections = []
    if os.path.exists(test_json_path):
        with open(test_json_path, "r") as f_test:
            test_data = json.load(f_test)
            test_connections = test_data.get("connections", [])
            for conn in test_connections:
                key = tuple(sorted([conn["node1"], conn["node2"]]))
                test_connections_dict[key] = conn

    for conn in data["connections"]:
        chip1 = chip_dict[conn["node1"]]
        chip2 = chip_dict[conn["node2"]]
        EMIBType = conn.get("EMIBType", "interfaceB")
        key = tuple(sorted([conn["node1"], conn["node2"]]))

        wire_count = conn.get("wireCount")
        if wire_count is None and key in test_connections_dict:
            wire_count = test_connections_dict[key].get("wireCount", 1)
        if wire_count is None:
            wire_count = 1

        if EMIBType == "interfaceC":
            x1_center = chip1["x-position"] + chip1["width"] / 2
            y1_center = chip1["y-position"] + chip1["height"] / 2
            x2_center = chip2["x-position"] + chip2["width"] / 2
            y2_center = chip2["y-position"] + chip2["height"] / 2
            manhattan_distance = abs(x1_center - x2_center) + abs(y1_center - y2_center)
            total_wirelength += manhattan_distance * wire_count
            continue

        grid1 = get_grid_points(chip1)
        grid2 = get_grid_points(chip2)

        lines_per_point = wire_count / 256

        bridge_center_x = conn.get("EMIB-x-position", 0) + conn.get("EMIB_width", 0) / 2
        bridge_center_y = conn.get("EMIB-y-position", 0) + conn.get("EMIB_length", 0) / 2

        for (x, y) in grid1:
            total_wirelength += math.sqrt((x - bridge_center_x) ** 2 + (y - bridge_center_y) ** 2) * lines_per_point
        for (x, y) in grid2:
            total_wirelength += math.sqrt((x - bridge_center_x) ** 2 + (y - bridge_center_y) ** 2) * lines_per_point

    for conn in test_connections:
        if conn.get("EMIBType") != "interfaceC":
            continue
        key = tuple(sorted([conn["node1"], conn["node2"]]))
        if key in [tuple(sorted([c["node1"], c["node2"]])) for c in data["connections"]]:
            continue
        chip1 = chip_dict[conn["node1"]]
        chip2 = chip_dict[conn["node2"]]
        wire_count = conn.get("wireCount", 1)

        x1_center = chip1["x-position"] + chip1["width"] / 2
        y1_center = chip1["y-position"] + chip1["height"] / 2
        x2_center = chip2["x-position"] + chip2["width"] / 2
        y2_center = chip2["y-position"] + chip2["height"] / 2
        manhattan_distance = abs(x1_center - x2_center) + abs(y1_center - y2_center)
        total_wirelength += manhattan_distance * wire_count

    return total_wirelength

# ==============================
# Compute bounding rect area and aspect ratio
# ==============================
def calculate_area_and_aspect_ratio(data):
    chiplets = data["chiplets"]
    min_x = float("inf")
    min_y = float("inf")
    max_x = float("-inf")
    max_y = float("-inf")

    for chip in chiplets:
        x_min = chip["x-position"]
        y_min = chip["y-position"]
        x_max = x_min + chip["width"]
        y_max = y_min + chip["height"]

        min_x = min(min_x, x_min)
        min_y = min(min_y, y_min)
        max_x = max(max_x, x_max)
        max_y = max(max_y, y_max)

    total_width = max_x - min_x
    total_height = max_y - min_y
    area = total_width * total_height
    aspect_ratio = total_width / total_height if total_height != 0 else 0

    return area, aspect_ratio

# ==============================
# Main: walk placement dir and save JSON (wirelength, area, aspect_ratio only)
# ==============================
def process_all_placements(root_dir, json_file):
    """
    Process placement dir under root_dir:
        root_dir/
            placement/*.json
    Each layout gets its 3-decimal aspect ratio and the SAR derived from it
    written back; json_file is then updated with the same two fields.

    Records already present in json_file are updated in place instead of being
    rebuilt, so fields this script does not compute (interposer_size,
    max_temperature, avg_temperature, ...) survive a rerun.
    """
    placement_dir = os.path.join(root_dir, "placement")
    if not os.path.exists(placement_dir):
        print(f"[Warning] placement dir not found: {placement_dir}")
        return

    existing = {}
    if os.path.exists(json_file):
        with open(json_file, "r") as f_old:
            for record in json.load(f_old):
                existing[record.get("file")] = record

    results = []
    for jf in sorted(glob(os.path.join(placement_dir, "*.json"))):
        name = os.path.basename(jf)
        with open(jf, "r") as f_json:
            data = json.load(f_json)

        wirelength = calculate_total_wirelength(data, name)
        area, aspect_ratio = calculate_area_and_aspect_ratio(data)
        ar = round_half_up(aspect_ratio, AR_DIGITS)
        sar = compute_sar(aspect_ratio)

        # Write the two metrics back into the layout itself.
        data["aspect_ratio"] = ar
        data["SAR"] = sar
        with open(jf, "w") as f_json:
            json.dump(data, f_json, indent=2, ensure_ascii=False)

        record = existing.get(name) or {
            "folder": os.path.basename(root_dir),
            "file": name,
        }
        record.setdefault("wirelength", round(wirelength, 2))
        record.setdefault("area", round(area, 2))
        record["aspect_ratio"] = ar
        record["SAR"] = sar
        results.append(record)

        print(
            f"Processed {jf}: "
            f"wirelength={record['wirelength']}, "
            f"area={record['area']}, "
            f"aspect_ratio={ar}, "
            f"SAR={sar}"
        )

    with open(json_file, "w") as f_out:
        json.dump(results, f_out, indent=4)

    print(f"\nAll results saved to {json_file}")

# ==============================
# Run
# ==============================
if __name__ == "__main__":
    process_all_placements(ROOT_DIR, JSON_OUTPUT)
