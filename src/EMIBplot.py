import json
import sys
from pathlib import Path
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
from matplotlib.colors import LinearSegmentedColormap, Normalize

# ======================
# Parameter reading
# ======================
if len(sys.argv) >= 2:
    json_path = sys.argv[1]
else:
    json_path = "acend910.json"

output_dir = sys.argv[2] if len(sys.argv) >= 3 else str(Path(json_path).parent)
Path(output_dir).mkdir(parents=True, exist_ok=True)

with open(json_path, "r", encoding="utf-8") as f:
    data = json.load(f)

# ======================
# Bounding box (centered)
# ======================
def _r3(v):
    return round(float(v), 3)

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
# Drawing
# ======================
fig, ax = plt.subplots(figsize=(8, 6))

# Unified chiplet and silicon bridge border: black, same line width
BORDER_COLOR = "black"
BORDER_WIDTH = 1.5

# Chiplet border style
CHIPLET_BORDER_COLOR = BORDER_COLOR
CHIPLET_BORDER_WIDTH = BORDER_WIDTH
# Unified chiplet and bridge fill colors
CHIPLET_FILL_COLOR = (222/255, 235/255, 247/255)   # RGB(222,235,247)
EMIB_BUMP_COLOR = (251/255, 229/255, 214/255)      # RGB(251,229,214)

chiplet_dict = {}
for c in data["chiplets"]:
    x = c["x-position"]
    y = c["y-position"]
    w = c["width"]
    h = c["height"]

    # Unified chiplet fill (no power-based gradient)
    power_val = c.get("power", 0)

    rect = Rectangle(
        (x, y),
        w,
        h,
        edgecolor=CHIPLET_BORDER_COLOR,
        facecolor=CHIPLET_FILL_COLOR,
        linewidth=CHIPLET_BORDER_WIDTH,
    )
    ax.add_patch(rect)

    # Label chiplet ID and power (unit W)
    if power_val:
        label = f"{c['name']}\n{power_val} W"
    else:
        label = c["name"]
    ax.text(
        x + w / 2,
        y + h / 2,
        label,
        ha="center",
        va="center",
        fontsize=10,
        weight="bold",
        color="#333333"
    )

    chiplet_dict[c["name"]] = (x, y, w, h)

# ==== Draw EMIB silicon bridges ====
for conn in data["connections"]:
    if conn.get("EMIBType") == "interfaceC":
        continue

    x = conn.get("EMIB-x-position", 0)
    y = conn.get("EMIB-y-position", 0)
    w = conn.get("EMIB_width", 0)
    h = conn.get("EMIB_length", 0)

    rect = Rectangle(
        (x, y),
        w,
        h,
        facecolor=EMIB_BUMP_COLOR,
        edgecolor=BORDER_COLOR,
        linewidth=BORDER_WIDTH,
    )
    ax.add_patch(rect)

# ======================
# Display settings
# ======================
ax.set_aspect("equal")
ax.set_xlim(x_min, x_max)
ax.set_ylim(y_min, y_max)

# Axis labels with units (larger font)
ax.set_xlabel("X (mm)", fontsize=18)
ax.set_ylabel("Y (mm)", fontsize=18)
ax.tick_params(axis="both", which="major", labelsize=14)

# JSON filename for output (not used as figure title)
base_name = Path(json_path).stem

ax.set_facecolor("#F5F5F5")
fig.patch.set_facecolor("white")

plt.tight_layout()

# ======================
# Save PNG and SVG
# ======================
out_path_png = Path(output_dir) / f"{base_name}_layout.png"
out_path_svg = Path(output_dir) / f"{base_name}_layout.svg"

plt.savefig(out_path_png, dpi=150, bbox_inches="tight")
plt.savefig(out_path_svg, dpi=300, bbox_inches="tight")  # Vector format keeps dpi
plt.close(fig)

print(f"Saved PNG: {out_path_png}")
print(f"Saved SVG: {out_path_svg}")
print("Figure generation done")