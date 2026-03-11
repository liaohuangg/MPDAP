import os
import json
import math
from glob import glob

# ==============================
# Config: root dir (single placement dir under project)
# ==============================
# Placement dir to process
ROOT_DIR = "/root/placement/thermal-placement/output_gurobi_EMIB_chiplet_5_6_01_0"

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
def calculate_total_wirelength(data):
    chip_dict = {chip["name"]: chip for chip in data["chiplets"]}
    total_wirelength = 0.0

    # Try to load matching test_input file
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
    Results written to json_file.
    """
    results = []

    placement_dir = os.path.join(root_dir, "placement")
    if not os.path.exists(placement_dir):
        print(f"[Warning] placement dir not found: {placement_dir}")
    else:
        json_files = glob(os.path.join(placement_dir, "*.json"))

        for jf in json_files:
            with open(jf, "r") as f_json:
                data = json.load(f_json)
                data["file_name"] = os.path.basename(jf)  # For test_input lookup

            wirelength = calculate_total_wirelength(data)
            area, aspect_ratio = calculate_area_and_aspect_ratio(data)

            record = {
                "folder": os.path.basename(root_dir),
                "file": os.path.basename(jf),
                "wirelength": round(wirelength, 2),
                "area": round(area, 2),
                "aspect_ratio": round(aspect_ratio, 3),
            }
            results.append(record)

            print(
                f"Processed {jf}: "
                f"wirelength={record['wirelength']}, "
                f"area={record['area']}, "
                f"aspect_ratio={record['aspect_ratio']}"
            )

    with open(json_file, "w") as f_out:
        json.dump(results, f_out, indent=4)

    print(f"\nAll results saved to {json_file}")

# ==============================
# Run
# ==============================
if __name__ == "__main__":
    process_all_placements(ROOT_DIR, JSON_OUTPUT)
