"""Chiplet layout visualizer: reads layout.json and saves a PNG."""

import json
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.patches import Rectangle
import random
from typing import List, Dict, Tuple

# 配置字体
plt.rcParams['font.sans-serif'] = ['Arial', 'Helvetica', 'DejaVu Sans', 'Liberation Sans', 'sans-serif']
plt.rcParams['axes.unicode_minus'] = False


def load_layout_from_json(json_file: str) -> List[Dict]:
    """Load chiplet list from a JSON layout file."""
    with open(json_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return data.get('chiplets', [])


def generate_color(chip_id: str) -> Tuple[float, float, float]:
    """Return a deterministic RGB color for the given chip ID."""
    random.seed(hash(chip_id))
    r = random.uniform(0.3, 0.9)
    g = random.uniform(0.3, 0.9)
    b = random.uniform(0.3, 0.9)
    
    return (r, g, b)


def visualize_layout(chiplets: List[Dict], output_file: str = 'layout_visualization.png'):
    """Visualize chiplet layout and save as a PNG image."""
    if not chiplets:
        print("Error: no chiplet data")
        return
    
    x_min = min(chip['x'] for chip in chiplets)
    y_min = min(chip['y'] for chip in chiplets)
    x_max = max(chip['x'] + chip['width'] for chip in chiplets)
    y_max = max(chip['y'] + chip['height'] for chip in chiplets)
    
    margin = max((x_max - x_min), (y_max - y_min)) * 0.1
    
    fig, ax = plt.subplots(1, 1, figsize=(12, 10))
    
    for chip in chiplets:
        x, y = chip['x'], chip['y']
        width, height = chip['width'], chip['height']
        chip_id = chip['id']
        
        color = generate_color(chip_id)
        
        edge_color = 'black'
        edge_width = 2
        alpha = 0.6
        
        rect = Rectangle(
            (x, y), width, height,
            linewidth=edge_width,
            edgecolor=edge_color,
            facecolor=color,
            alpha=alpha,
            label=chip_id
        )
        ax.add_patch(rect)
        
        center_x = x + width / 2
        center_y = y + height / 2
        ax.text(
            center_x, center_y, chip_id,
            ha='center', va='center',
            fontsize=12, fontweight='bold',
            color='black',
            bbox=dict(boxstyle='round,pad=0.3', facecolor='white', alpha=0.8)
        )
        
        size_text = f"{width}x{height}"
        ax.text(
            center_x, y - 1,
            size_text,
            ha='center', va='top',
            fontsize=9,
            color='darkblue'
        )
        
        coord_text = f"({x:.1f}, {y:.1f})"
        ax.text(
            x, y + height + 0.5,
            coord_text,
            ha='left', va='bottom',
            fontsize=8,
            color='darkgreen'
        )
    
    ax.set_xlim(x_min - margin, x_max + margin)
    ax.set_ylim(y_min - margin, y_max + margin)
    ax.set_aspect('equal')
    ax.grid(True, alpha=0.3, linestyle='--')
    ax.set_xlabel('X Coordinate', fontsize=12)
    ax.set_ylabel('Y Coordinate', fontsize=12)
    
    title = f'Chiplet Layout Visualization ({len(chiplets)} chiplets)'
    ax.set_title(title, fontsize=14, fontweight='bold')
    
    legend_text = 'Legend:\n'
    legend_text += '• Black border = Chiplet boundary\n'
    legend_text += '• Semi-transparent fill = Chiplet area'
    
    ax.text(
        0.02, 0.98, legend_text,
        transform=ax.transAxes,
        fontsize=10,
        verticalalignment='top',
        bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.8)
    )
    
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"\n[OK] Layout saved to: {output_file}")
    print(f"  - Chiplets: {len(chiplets)}")
    print(f"  - Size: {x_max - x_min:.1f} x {y_max - y_min:.1f}")
    print(f"  - Area: {(x_max - x_min) * (y_max - y_min):.1f}")
    
    plt.close()


if __name__ == "__main__":
    import sys
    
    json_file = '../output/layout.json'
    output_file = '../output/layout_visualization.png'
    
    if len(sys.argv) > 1:
        json_file = sys.argv[1]
    if len(sys.argv) > 2:
        output_file = sys.argv[2]
    
    print("Chiplet Layout Visualizer")
    print("=" * 60)
    print(f"Input:  {json_file}")
    print(f"Output: {output_file}")
    print("=" * 60)
    
    try:
        chiplets = load_layout_from_json(json_file)
        
        if not chiplets:
            print("\nError: no chiplet data in JSON (missing 'chiplets' field)")
            sys.exit(1)
        
        print(f"\nLoaded {len(chiplets)} chiplets:")
        for chip in chiplets:
            print(f"  - {chip['id']}: {chip['width']}x{chip['height']} @ ({chip['x']}, {chip['y']})")
        
        visualize_layout(chiplets, output_file)
        
    except FileNotFoundError:
        print(f"\nError: file not found '{json_file}'")
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f"\nError: invalid JSON - {e}")
        sys.exit(1)
    except Exception as e:
        print(f"\nError: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
