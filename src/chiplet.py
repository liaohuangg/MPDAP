# Colored version
import json
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import Normalize, PowerNorm, LinearSegmentedColormap
import matplotlib.cm as cm
from matplotlib.patches import Rectangle

# ======================
# 1. Read JSON file
# ======================
json_path = "E:\\chip\\image\\cpu-dram.json"
with open(json_path, "r", encoding="utf-8") as f:
    data = json.load(f)

powers = [c["power"] for c in data["chiplets"]]
min_power = 0
max_power = max(powers)

# Color map: blue -> green -> yellow -> orange -> red
colors = [
    (0, 0, 1),      # Blue - lowest power
    (0, 1, 1),      # Cyan
    (0, 1, 0),      # Green
    (1, 1, 0),      # Yellow
    (1, 0.5, 0),    # Orange
    (1, 0, 0)       # Red - highest power
]

# Custom gradient colormap
custom_cmap = LinearSegmentedColormap.from_list('power_gradient', colors, N=256)
norm = Normalize(vmin=min_power, vmax=max_power)

fig, ax = plt.subplots(figsize=(12, 9))

# ============================================
# 2. Get layout (no rotation, bottom-left coords, draw by width/height)
# ============================================

def _r3(v):
    return round(float(v), 3)

# Chiplet bounding box
all_x = [c["x-position"] for c in data["chiplets"]]
all_y = [c["y-position"] for c in data["chiplets"]]
all_w = [c["width"] for c in data["chiplets"]]
all_h = [c["height"] for c in data["chiplets"]]

# Chiplet bounding box (excluding EMIB)
all_left = all_x
all_bot = all_y
all_right = [x + w for x, w in zip(all_x, all_w)]
all_top = [y + h for y, h in zip(all_y, all_h)]

bbox_min_x = min(all_left)
bbox_min_y = min(all_bot)
bbox_max_x = max(all_right)
bbox_max_y = max(all_top)
bbox_w = bbox_max_x - bbox_min_x
bbox_h = bbox_max_y - bbox_min_y
# Longest side as bounding box side (3 decimal places), layout centered
side = _r3(max(bbox_w, bbox_h))
center_x = (bbox_min_x + bbox_max_x) / 2
center_y = (bbox_min_y + bbox_max_y) / 2
x_min = _r3(center_x - side / 2)
x_max = _r3(center_x + side / 2)
y_min = _r3(center_y - side / 2)
y_max = _r3(center_y + side / 2)

# ============================================
# 3. Interpolate color at each point
# ============================================

# Get each chiplet center and power
chip_centers = []
chip_powers = []

for c in data["chiplets"]:
    x = c["x-position"]
    y = c["y-position"]
    w = c["width"]
    h = c["height"]
    # Center
    cx = x + w/2
    cy = y + h/2
    
    chip_centers.append([cx, cy])
    chip_powers.append(c["power"])

chip_centers = np.array(chip_centers)
chip_powers = np.array(chip_powers)

# Adjust grid resolution by layout size
min_size = min(min(all_w), min(all_h))
grid_spacing = max(min_size / 10, 1.0)

# Grid point counts
grid_x = int((x_max - x_min) / grid_spacing)
grid_y = int((y_max - y_min) / grid_spacing)

# Reasonable resolution
grid_x = min(max(grid_x, 100), 300)
grid_y = min(max(grid_y, 100), 300)

print(f"Grid resolution: {grid_x} x {grid_y}")

# Create grid
x_grid = np.linspace(x_min, x_max, grid_x)
y_grid = np.linspace(y_min, y_max, grid_y)
X, Y = np.meshgrid(x_grid, y_grid)

# Initialize interpolation weight field
heat_field = np.zeros_like(X)

# Vectorized computation
print("Computing interpolation...")

# Precompute distances from all grid points to all chiplet centers
for i in range(grid_y):
    # Points in current row
    points = np.column_stack([X[i, :], Y[i, :]])
    
    # Distance to all chiplet centers
    distances_sq = np.sum((points[:, np.newaxis, :] - chip_centers[np.newaxis, :, :])**2, axis=2)
    distances = np.sqrt(distances_sq)
    
    # Avoid division by zero
    distances = np.maximum(distances, 0.1)
    
    # Weights: inverse distance squared
    weights = 1.0 / (distances**2)
    
    # Normalize weights
    weights_sum = np.sum(weights, axis=1, keepdims=True)
    weights = weights / weights_sum
    
    # Interpolated power
    heat_field[i, :] = np.sum(chip_powers[np.newaxis, :] * weights, axis=1)

print("Interpolation completed.")

# ============================================
# 4. Show continuous gradient heatmap
# ============================================

# Gradient heatmap over canvas
heatmap = ax.imshow(heat_field, 
                   extent=[x_min, x_max, y_min, y_max],
                   origin='lower',
                   cmap=custom_cmap,
                   norm=norm,
                   interpolation='bilinear',
                   aspect='equal',
                   zorder=1)

# ============================================
# 5. Draw chiplet outlines and labels (name only, no power)
# ============================================

for idx, c in enumerate(data["chiplets"]):
    x = c["x-position"]
    y = c["y-position"]
    w = c["width"]
    h = c["height"]
    # Center
    cx = x + w/2
    cy = y + h/2
    
    # Chiplet border
    rect = Rectangle(
        (x, y), w, h,
        edgecolor="#222222",
        facecolor="none", 
        linewidth=1.0,       
        zorder=2,
        alpha=0.8,
        linestyle='-'
    )
    ax.add_patch(rect)
    
    # Small marker at center
    ax.plot(cx, cy, 'o', color='white', markersize=3, 
            markeredgecolor='black', markeredgewidth=0.5,
            zorder=3, alpha=0.9)

    # Show chiplet name only
    # Text color from background at label position
    x_idx = int((cx - x_min) / (x_max - x_min) * (grid_x - 1))
    y_idx = int((cy - y_min) / (y_max - y_min) * (grid_y - 1))
    x_idx = np.clip(x_idx, 0, grid_x - 1)
    y_idx = np.clip(y_idx, 0, grid_y - 1)
    
    # Background color
    bg_value = heat_field[y_idx, x_idx]
    bg_color = custom_cmap(norm(bg_value))[:3]
    
    # Text color by background brightness
    brightness = np.mean(bg_color)
    text_color = 'white' if brightness < 0.6 else 'black'
    
    # Font size by chiplet size
    text_size = min(10, max(6, min(w, h) * 1.0))
    
    # Chiplet name label
    ax.text(
        cx, cy, c['name'],
        ha="center", va="center",
        fontsize=text_size, weight="bold", zorder=3,
        color=text_color
    )

# ============================================
# 6. Draw EMIB
# ============================================

for conn in data["connections"]:
    if conn.get("EMIBType") == "interfaceC":
        continue

    x = conn["EMIB-x-position"]
    y = conn["EMIB-y-position"]
    w = conn["EMIB_width"]
    h = conn["EMIB_length"]

    rect = Rectangle((x, y), w, h,
                     facecolor="#FF7777", edgecolor="#CC5555",
                     linewidth=0.4, alpha=0.6, zorder=2)
    ax.add_patch(rect)

# ============================================
# 7. Colorbar
# ============================================

sm = cm.ScalarMappable(cmap=custom_cmap, norm=norm)
sm.set_array([])
cbar = plt.colorbar(sm, ax=ax, pad=0.02, fraction=0.046)
cbar.set_label("Power (W)", fontsize=11, weight='bold')

# Colorbar ticks
cbar.ax.yaxis.set_ticks_position('left')
tick_positions = np.linspace(min_power, max_power, 6)
cbar.ax.set_yticks(tick_positions)
cbar.ax.set_yticklabels([f"{pos:.1f}" for pos in tick_positions])

# ============================================
# 8. Figure settings
# ============================================

ax.set_aspect("equal")
ax.set_xlim(x_min, x_max)
ax.set_ylim(y_min, y_max)
ax.set_xlabel("X Position", fontsize=11)
ax.set_ylabel("Y Position", fontsize=11)
ax.set_title("Chiplet Power Distribution", 
            fontsize=13, weight='bold', pad=15)

# Axes
ax.tick_params(axis='both', which='both', labelsize=9)
for spine in ax.spines.values():
    spine.set_color('#555555')
    spine.set_linewidth(0.6)

plt.tight_layout()
plt.show()

# ============================================
# 9. Console statistics
# ============================================

print("\n" + "=" * 70)
print("CHIPLET POWER DISTRIBUTION")
print("=" * 70)

# Sorted by power
sorted_chiplets = sorted(data["chiplets"], key=lambda x: x["power"], reverse=True)
print("\nPower Ranking:")
print("-" * 50)
for i, c in enumerate(sorted_chiplets, 1):
    power_percent = (c["power"] / max_power) * 100
    # Color indicator
    if power_percent > 80:
        color_ind = "🔴"
    elif power_percent > 60:
        color_ind = "🟠"
    elif power_percent > 40:
        color_ind = "🟡"
    elif power_percent > 20:
        color_ind = "🟢"
    else:
        color_ind = "🔵"
    
    print(f"{i:2d}. {color_ind} {c['name']:<12} : {c['power']:>6.1f} W ({power_percent:>5.1f}%)")

print("-" * 50)
total_power = sum(c["power"] for c in data["chiplets"])
avg_power = total_power / len(data["chiplets"])
print(f"Total Power   : {total_power:.1f} W")
print(f"Average Power : {avg_power:.1f} W")
print(f"Max Power     : {max_power:.1f} W")
print(f"Min Power     : {min(powers):.1f} W")
print("=" * 70)