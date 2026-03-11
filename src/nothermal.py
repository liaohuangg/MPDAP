# No-coloring version
import json
import sys
from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

# ======================
# 1. Read JSON file
# ======================
if len(sys.argv) >= 2:
    json_path = sys.argv[1]
else:
    json_path = "acend910.json"

output_dir = sys.argv[2] if len(sys.argv) >= 3 else str(Path(json_path).parent)

with open(json_path, "r", encoding="utf-8") as f:
    data = json.load(f)

# ======================
# 2. Compute bounding box and center (no rotation, coordinates are bottom-left)
# ======================
def _r3(v):
    return round(float(v), 3)

# Chiplet bounding box (excluding EMIB)
all_left = [c["x-position"] for c in data["chiplets"]]
all_bot = [c["y-position"] for c in data["chiplets"]]
all_right = [c["x-position"] + c["width"] for c in data["chiplets"]]
all_top = [c["y-position"] + c["height"] for c in data["chiplets"]]

bbox_min_x, bbox_min_y = min(all_left), min(all_bot)
bbox_max_x, bbox_max_y = max(all_right), max(all_top)
bbox_w = bbox_max_x - bbox_min_x
bbox_h = bbox_max_y - bbox_min_y
side = _r3(max(bbox_w, bbox_h))
center_x = (bbox_min_x + bbox_max_x) / 2
center_y = (bbox_min_y + bbox_max_y) / 2
x_min = _r3(center_x - side / 2)
x_max = _r3(center_x + side / 2)
y_min = _r3(center_y - side / 2)
y_max = _r3(center_y + side / 2)

# ======================
# 3. Start drawing
# ======================
fig, ax = plt.subplots(figsize=(8, 6))

# Define colors
CHIPLET_BORDER_COLOR = "#808080"  # Light gray border
CHIPLET_BORDER_WIDTH = 1.5        # Border line width
EMIB_BUMP_COLOR = "#FFA500"       # Orange (silicon bridge)

# ---- Draw chiplets ----
chiplet_dict = {}
for c in data["chiplets"]:
    x = c["x-position"]
    y = c["y-position"]
    w = c["width"]
    h = c["height"]
    rect = Rectangle(
        (x, y),
        w,
        h,
        edgecolor=CHIPLET_BORDER_COLOR,
        facecolor="none",
        linewidth=CHIPLET_BORDER_WIDTH
    )
    ax.add_patch(rect)

    # Label chiplet ID and power
    power_val = c.get("power", 0)
    label = f"{c['name']}\n{power_val}" if power_val else c["name"]
    ax.text(
        x + w / 2,
        y + h / 2,
        label,
        ha="center",
        va="center",
        fontsize=10,
        weight="bold",
        color="#333333"  # Dark gray text
    )

    chiplet_dict[c["name"]] = (x, y, w, h)

# ---- Draw EMIB ----
for conn in data["connections"]:
    if conn["EMIBType"] == "interfaceC":
        continue

    x = conn["EMIB-x-position"]
    y = conn["EMIB-y-position"]
    w = conn["EMIB_width"]
    h = conn["EMIB_length"]
    # rotation = conn.get("EMIB-rotation", 0)
    # if rotation == 1:
    #     w, h = h, w  # Swap width/height when rotated

    rect = Rectangle(
        (x, y), w, h,
        facecolor=EMIB_BUMP_COLOR,
        edgecolor="black",
        linewidth=0.5,
    )
    ax.add_patch(rect)

# ======================
# 4. Display settings (centered)
# ======================
ax.set_aspect("equal")
ax.set_xlim(x_min, x_max)
ax.set_ylim(y_min, y_max)
ax.set_xlabel("X", fontsize=12)
ax.set_ylabel("Y", fontsize=12)
ax.set_title("Chiplet  Layout", fontsize=14, fontweight="bold")

# Lighter background for better contrast
ax.set_facecolor("#F5F5F5")
fig.patch.set_facecolor("white")

# Grid lines removed

plt.tight_layout()

# Save figure to output_dir (no plt.show to avoid blocking batch processing)
base_name = Path(json_path).stem
out_path = Path(output_dir) / f"{base_name}_layout.png"
plt.savefig(out_path, dpi=150, bbox_inches="tight")
print(f"Saved: {out_path}")
plt.close(fig)
