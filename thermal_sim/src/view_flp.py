import matplotlib.pyplot as plt
import matplotlib.patches as patches
import os

# Use a font that supports Unicode (for labels, if any)
plt.rcParams['font.sans-serif'] = ['sans-serif']
# Ensure minus signs render correctly with chosen font
plt.rcParams['axes.unicode_minus'] = False


flp_file_path = "/mnt/d/thermal-placement/thermal_sim/config/sys_micro150_config/sys_micro150.flp"  
save_fig_path = "/mnt/d/thermal-placement/thermal_sim/config/sys_micro150_config/sys_micro150.png"  
fig_size = (12, 10)  
font_size = 8        


def read_flp(flp_path):
    """Read FLP file and return parsed chiplet and TIM blocks."""
    chiplets = []  # Chiplet blocks
    tims = []      # TIM blocks
    if not os.path.exists(flp_path):
        raise FileNotFoundError(f"FLP file not found: {flp_path}")
    
    with open(flp_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):

                continue
            parts = line.split()
            name = parts[0]
            w = float(parts[1])  # width (m)
            h = float(parts[2])  # height (m)
            x = float(parts[3])  # x (m)
            y = float(parts[4])  # y (m)
            # Convert to mm for plotting
            w, h, x, y = w * 1000, h * 1000, x * 1000, y * 1000
            
            
            
            
            if name.startswith("chiplet") or (len(name) == 1 and name.isupper()):
                chiplets.append((name, w, h, x, y))
            elif name.startswith("TIM") or (name.startswith("T") and len(name) > 1 and name[1:].isdigit()):
                tims.append((name, w, h, x, y))
    return chiplets, tims


def plot_layout(chiplets, tims):
    """Plot chiplet/TIM layout from FLP data."""
    all_blocks = chiplets + tims
    if not all_blocks:
        return
    min_x = min(x for _, _, _, x, _ in all_blocks)
    min_y = min(y for _, _, _, _, y in all_blocks)
    max_x = max(x + w for _, w, _, x, _ in all_blocks)
    max_y = max(y + h for _, _, h, _, y in all_blocks)
    bbox_w = max_x - min_x
    bbox_h = max_y - min_y

    # Create figure/axes
    fig, ax = plt.subplots(figsize=fig_size)
    
    ax.set_xlabel("X Coordinate (mm)", fontsize=12)
    ax.set_ylabel("Y Coordinate (mm)", fontsize=12)
    ax.set_title("Chiplet Layout (FLP File)", fontsize=14, fontweight='bold')
    # Equal aspect ratio
    ax.set_aspect('equal')

    # Show overall bounding box in mm
    ax.text(0.02, 0.98, f'BBox: W={bbox_w:.3f}mm  H={bbox_h:.3f}mm',
            transform=ax.transAxes, fontsize=11, color='green', fontweight='bold', va='top')

    # Draw chiplet rectangles
    for name, w, h, x, y in chiplets:
        # Chiplet rectangle patch
        rect = patches.Rectangle((x, y), w, h, linewidth=1, edgecolor='black', 
                                 facecolor='skyblue', alpha=0.7, label='chiplet' if not ax.get_legend_handles_labels()[0] else "")
        ax.add_patch(rect)
        
        cx = x + w/2
        cy = y + h/2
        ax.text(cx, cy, name, ha='center', va='center', fontsize=font_size, fontweight='bold')

    
    for name, w, h, x, y in tims:
        rect = patches.Rectangle((x, y), w, h, linewidth=1, edgecolor='red', 
                                 facecolor='lightgray', alpha=0.7, label='TIM' if not ax.get_legend_handles_labels()[0] else "")
        ax.add_patch(rect)
        
        cx = x + w/2
        cy = y + h/2
        ax.text(cx, cy, name, ha='center', va='center', fontsize=font_size, color='red')

    
    ax.legend(loc='upper right', fontsize=10)
    
    ax.autoscale()
    
    plt.tight_layout()
    plt.savefig(save_fig_path, dpi=300, bbox_inches='tight')
    plt.close()
    print("DEBUG")


if __name__ == "__main__":
    
    flp_file_path = "/mnt/d/thermal-placement/thermal_sim/config/sys_micro150_config/sys_micro150.flp"
    try:
        chiplets, tims = read_flp(flp_file_path)
        if not chiplets and not tims:
            print("DEBUG")
        else:
            plot_layout(chiplets, tims)
    except Exception as e:
        print("DEBUG")
