import json
import math
import os
import re
import shutil
from decimal import Decimal, ROUND_HALF_UP

# Grid unit: 0.01 mm (all grid coords are multiples of 0.01)
GRID_MM = 0.01
# Minimum block size (mm) to avoid degenerate blocks
MIN_DIMENSION_MM = 0.01
# Minimum TIM width/height (mm); too small may break HotSpot
MIN_TIM_DIMENSION_MM = 0.02
# Output precision (meters, decimal places)
OUTPUT_DECIMALS = 6
# Authoritative per-chiplet power comes from the benchmark inputs
BENCHMARK_TEST_INPUT_DIR = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
    "benchmark", "test_input")

def round_to_grid_mm(value_mm):
    """Round mm value to 0.01 mm grid (round) and then to 2 decimals to avoid tiny overlaps from float drift."""
    return round(round(float(value_mm) / GRID_MM) * GRID_MM, 2)

def round_half_up_grid_mm(value_mm):
    """Round mm value to the 0.01 mm grid with a consistent half-up rule.

    Input coordinates may sit on a 0.005 mm grid (e.g. x=15.035). Python's
    round() is half-even, so two touching edges at .xx5 can round in opposite
    directions and create a 0.01 mm overlap. Edge quantization uses this rule
    instead so neighbouring edges always agree.
    """
    return float(Decimal(str(value_mm)).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP))

def mm_to_m(value_mm):
    """Convert millimeters to meters, keeping OUTPUT_DECIMALS decimals."""
    return round(float(value_mm) / 1000.0, OUTPUT_DECIMALS)

OVERLAP_TOLERANCE_MM2 = 1e-6
OVERLAP_TOLERANCE_M2 = 1e-12  # Float tolerance in m^2

def _rects_overlap_pair(a, b, tol_area):
    """Return True if two rectangles overlap (overlap area > tol)."""
    ax1, ay1 = a["x"], a["y"]
    ax2, ay2 = a["x"] + a["w"], a["y"] + a["h"]
    bx1, by1 = b["x"], b["y"]
    bx2, by2 = b["x"] + b["w"], b["y"] + b["h"]
    x_ol = max(0, min(ax2, bx2) - max(ax1, bx1))
    y_ol = max(0, min(ay2, by2) - max(ay1, by1))
    return x_ol * y_ol > tol_area

def check_blocks_overlap(block_list, tol_area=OVERLAP_TOLERANCE_MM2):
    """Raise if any overlapping blocks in list; ignore border-touching at float tolerance scale."""
    n = len(block_list)
    for i in range(n):
        for j in range(i + 1, n):
            a, b = block_list[i], block_list[j]
            if _rects_overlap_pair(a, b, tol_area):
                raise ValueError(
                    f"Overlap: {a['name']} vs {b['name']}\n"
                    f"  {a['name']}: x={a['x']}, y={a['y']}, w={a['w']}, h={a['h']}\n"
                    f"  {b['name']}: x={b['x']}, y={b['y']}, w={b['w']}, h={b['h']}"
                )
    print("✅ No overlaps in block list")

def check_no_grid_overlap(chiplet_list, tim_list, unit_m=False):
    """
    After all processing, check grid overlaps between chiplets and between TIM blocks.
    unit_m: True if coordinates are in meters (use m^2 tolerance); False if in millimeters.
    """
    tol = OVERLAP_TOLERANCE_M2 if unit_m else OVERLAP_TOLERANCE_MM2
    # Between chiplets
    for i in range(len(chiplet_list)):
        for j in range(i + 1, len(chiplet_list)):
            a, b = chiplet_list[i], chiplet_list[j]
            if _rects_overlap_pair(a, b, tol):
                raise ValueError(
                    f"Chiplet grid overlap: {a['name']} vs {b['name']}\n"
                    f"  {a['name']}: x={a['x']}, y={a['y']}, w={a['w']}, h={a['h']}\n"
                    f"  {b['name']}: x={b['x']}, y={b['y']}, w={b['w']}, h={b['h']}"
                )
    # Between TIM blocks
    for i in range(len(tim_list)):
        for j in range(i + 1, len(tim_list)):
            a, b = tim_list[i], tim_list[j]
            if _rects_overlap_pair(a, b, tol):
                raise ValueError(
                    f"TIM grid overlap: {a['name']} vs {b['name']}\n"
                    f"  {a['name']}: x={a['x']}, y={a['y']}, w={a['w']}, h={a['h']}\n"
                    f"  {b['name']}: x={b['x']}, y={b['y']}, w={b['w']}, h={b['h']}"
                )
    print("✅ No grid overlap between chiplets or TIM blocks")

def load_reference_power(json_path):
    """Chiplet power from benchmark/test_input/<case>.json, keyed by chiplet name.

    The layout JSONs written by some flows (notably bt_tree) carry power=0 for
    most chiplets, so test_input is the authoritative source. Returns {} when
    no matching test_input file is found, in which case the layout JSON is used.
    """
    candidates = []
    parent = os.path.basename(os.path.dirname(os.path.abspath(json_path)))
    if parent != "placement":
        candidates.append(parent)
    base = os.path.splitext(os.path.basename(json_path))[0]
    candidates.append(re.sub(r"_seed\d+$", "", base))
    for case in candidates:
        ref_path = os.path.join(BENCHMARK_TEST_INPUT_DIR, case + ".json")
        if not os.path.exists(ref_path):
            continue
        with open(ref_path, "r", encoding="utf-8") as f:
            ref = json.load(f)
        powers = {c.get("name"): float(c.get("power", 0.0))
                  for c in ref.get("chiplets", []) if c.get("name")}
        if powers:
            print(f"[gen_flp_trace] Chiplet power from {ref_path}")
            return powers
    return {}

def generate_ptrace_file(chiplet_list, tim_list, json_path, output_ptrace_path, power_key="power"):
    """Generate .ptrace file from test_input power values (chiplet/TIM names aligned)."""
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    reference_power = load_reference_power(json_path)

    power_dict = {}
    if 'chiplets' in data:
        # RL exports chiplets as {name: {...}}; ICCAD23/gurobi as a list.
        chip_records = ([dict(chip, name=chip.get('name', name))
                         for name, chip in data['chiplets'].items()]
                        if isinstance(data['chiplets'], dict)
                        else data['chiplets'])
        for chip in chip_records:
            original_name = chip.get('name')
            if original_name:

                power = float(chip.get(power_key, 0.0))
                if original_name in reference_power:
                    power = reference_power[original_name]
                power_dict[original_name] = power

    all_modules = tim_list + chiplet_list
    power_values = [0.0 if m['name'].startswith('T') and m['name'][1:].isdigit() else power_dict.get(m['name'], 0.0) for m in all_modules]
    module_names = [m['name'] for m in all_modules]
    power_strings = [f"{p:.6f}" for p in power_values]

    with open(output_ptrace_path, 'w', encoding='utf-8') as f:
        f.write(' '.join(module_names) + '\n')
        f.write(' '.join(power_strings) + '\n')
        f.write(' '.join(power_strings) + '\n')

    print(f"✅ Generated .ptrace file: {output_ptrace_path}")
    print(f"📦 File contains power data for {len(all_modules)} modules")

def load_json_layout(json_path):
    """
    1. Extract base data: chiplet name, bottom-left (x,y), width (w), height (h) in mm.
    2. Validate: width/height > 0 and coordinates non-negative.
    """
    json_path = os.path.abspath(os.path.normpath(json_path))
    print(f"[gen_flp_trace] Load JSON: {json_path}")
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    top_bump_pitch = float(data.get("bump pitch", data.get("bump_pitch", 0.0)) or 0.0)
    chiplets = []
    if 'chiplets' not in data:
        raise ValueError("No 'chiplets' field found in JSON")
    # Two export formats: a list of chip dicts with `name`/`x-position`
    # (ICCAD23, gurobi) and a {name: {x, y, width, height}} mapping (RL).
    if isinstance(data['chiplets'], dict):
        chip_records = [dict(chip, name=chip.get('name', name))
                        for name, chip in data['chiplets'].items()]
    else:
        chip_records = data['chiplets']
    for idx, chip in enumerate(chip_records):
        original_name = chip.get('name', chr(65 + idx))
        name = original_name
        x = float(chip.get('x-position', chip.get('x', 0.0)))
        y = float(chip.get('y-position', chip.get('y', 0.0)))
        w = float(chip['width'])
        h = float(chip['height'])
        bump_pitch = float(chip.get("bump pitch", chip.get("bump_pitch", top_bump_pitch)) or 0.0)
        if w <= 0 or h <= 0:
            raise ValueError(f"Chiplet {name}: width/height must be >0, got w={w}, h={h}")
        if bump_pitch:
            original_w = float(chip.get('original_width', w))
            original_h = float(chip.get('original_height', h))
            if 'original_width' in chip or 'original_height' in chip:
                envelope_x = x
                envelope_y = y
                envelope_w = w
                envelope_h = h
            else:
                envelope_x = x - bump_pitch
                envelope_y = y - bump_pitch
                envelope_w = w + 2.0 * bump_pitch
                envelope_h = h + 2.0 * bump_pitch
        else:
            original_w = w
            original_h = h
            envelope_x = x
            envelope_y = y
            envelope_w = w
            envelope_h = h
        if bump_pitch and (original_w <= 0 or original_h <= 0):
            raise ValueError(
                f"Chiplet {name}: original_width/original_height must be >0 when bump pitch is non-zero, "
                f"got original_w={original_w}, original_h={original_h}, bump pitch={bump_pitch}"
            )
        # if x < 0 or y < 0:
        
        chiplets.append({
            'name': name,
            'x': envelope_x,
            'y': envelope_y,
            'w': envelope_w,
            'h': envelope_h,
            'bump_pitch': bump_pitch,
            'original_w': original_w,
            'original_h': original_h,
        })
    if not chiplets:
        raise ValueError("No valid chiplet data in JSON")
    return chiplets


def _has_any_overlap(chiplet_list, tol=OVERLAP_TOLERANCE_MM2):
    """Return True if any overlapping pair exists in list."""
    n = len(chiplet_list)
    for i in range(n):
        for j in range(i + 1, n):
            if _rects_overlap_pair(chiplet_list[i], chiplet_list[j], tol):
                return True
    return False


def build_layout(chiplets):
    """
    2. Build new bounding square and 3. snap chiplets to grid + recenter.
    Relative positions are preserved: if rounding introduces overlap, enlarge canvas and re-place all together
    (same shift + rounding), without moving individual blocks independently.
    Returns: (chiplet_list_mm, square_side_mm)
    """
    
    chiplets_grid = []
    for c in chiplets:
        w = round_to_grid_mm(c['w'])
        h = round_to_grid_mm(c['h'])
        w = max(w, MIN_DIMENSION_MM)
        h = max(h, MIN_DIMENSION_MM)
        aligned = c.copy()
        aligned.update({'x': c['x'], 'y': c['y'], 'w': w, 'h': h})
        if aligned.get('bump_pitch', 0.0):
            aligned['bump_pitch'] = round_to_grid_mm(aligned['bump_pitch'])
            aligned['original_w'] = max(round_to_grid_mm(aligned['original_w']), MIN_DIMENSION_MM)
            aligned['original_h'] = max(round_to_grid_mm(aligned['original_h']), MIN_DIMENSION_MM)
        chiplets_grid.append(aligned)
    chiplets = chiplets_grid

    # Quantize the four edges (not x and w independently): inputs may sit on a
    # 0.005 mm grid, and rounding a chip's left edge separately from its
    # neighbour's right edge can create a 0.01 mm overlap. With both edges
    # rounded by the same half-up rule, touching neighbours stay touching.
    for c in chiplets:
        x1 = round_half_up_grid_mm(c['x'])
        x2 = round_half_up_grid_mm(c['x'] + c['w'])
        y1 = round_half_up_grid_mm(c['y'])
        y2 = round_half_up_grid_mm(c['y'] + c['h'])
        c['x'], c['y'] = x1, y1
        c['w'] = max(round_to_grid_mm(x2 - x1), MIN_DIMENSION_MM)
        c['h'] = max(round_to_grid_mm(y2 - y1), MIN_DIMENSION_MM)

    min_x = min(c['x'] for c in chiplets)
    min_y = min(c['y'] for c in chiplets)
    max_x = max(c['x'] + c['w'] for c in chiplets)
    max_y = max(c['y'] + c['h'] for c in chiplets)
    old_cx = (min_x + max_x) / 2.0
    old_cy = (min_y + max_y) / 2.0
    bbox_w = max_x - min_x
    bbox_h = max_y - min_y
    longest_side = round_to_grid_mm(max(bbox_w, bbox_h))

    
    def place_once(side_mm):
        new_cx = side_mm / 2.0
        new_cy = side_mm / 2.0
        # Snap the global shift to the 0.01 mm grid: with a half-grid shift, each
        # chip's left edge rounds independently from its neighbour's right edge,
        # which can turn exactly touching neighbours into a 0.01 mm overlap.
        shift_x = round_to_grid_mm(new_cx - old_cx)
        shift_y = round_to_grid_mm(new_cy - old_cy)
        out = []
        for c in chiplets:
            x_shifted = c['x'] + shift_x
            y_shifted = c['y'] + shift_y
            x_aligned = round_to_grid_mm(x_shifted)
            y_aligned = round_to_grid_mm(y_shifted)
            w, h = c['w'], c['h']
            x_aligned = round_to_grid_mm(max(0, min(x_aligned, side_mm - w)))
            y_aligned = round_to_grid_mm(max(0, min(y_aligned, side_mm - h)))
            placed = c.copy()
            placed.update({'x': x_aligned, 'y': y_aligned, 'w': w, 'h': h})
            out.append(placed)
        return out

    chiplet_list = place_once(longest_side)
    max_expand = 10
    expand_step = round_to_grid_mm(0.02)  

    while _has_any_overlap(chiplet_list) and max_expand > 0:
        longest_side = round_to_grid_mm(longest_side + expand_step)
        chiplet_list = place_once(longest_side)
        max_expand -= 1

    return chiplet_list, longest_side


def split_bump_pitch_blocks(chiplet_list_mm):
    """Split wrapped chiplet envelopes into original chiplet core plus four Ubump ring blocks."""
    out = []
    ubump_idx = 0
    for chip in chiplet_list_mm:
        pitch = round_to_grid_mm(chip.get('bump_pitch', 0.0) or 0.0)
        if pitch <= 0:
            out.append(chip)
            continue

        x = chip['x']
        y = chip['y']
        w = chip['w']
        h = chip['h']
        core_w = max(round_to_grid_mm(chip.get('original_w', w - 2.0 * pitch)), MIN_DIMENSION_MM)
        core_h = max(round_to_grid_mm(chip.get('original_h', h - 2.0 * pitch)), MIN_DIMENSION_MM)
        core_x = round_to_grid_mm(x + pitch)
        core_y = round_to_grid_mm(y + pitch)
        right_x = round_to_grid_mm(core_x + core_w)
        top_y = round_to_grid_mm(core_y + core_h)
        ring_span_w = round_to_grid_mm(core_w + pitch)
        ring_span_h = round_to_grid_mm(core_h + pitch)

        ring_rects = [
            (x, y, ring_span_w, pitch),
            (x, core_y, pitch, ring_span_h),
            (right_x, y, pitch, ring_span_h),
            (core_x, top_y, ring_span_w, pitch),
        ]
        for bx, by, bw, bh in ring_rects:
            if bw >= MIN_DIMENSION_MM and bh >= MIN_DIMENSION_MM:
                out.append({
                    'name': f"Ubump_{ubump_idx}",
                    'x': round_to_grid_mm(bx),
                    'y': round_to_grid_mm(by),
                    'w': round_to_grid_mm(bw),
                    'h': round_to_grid_mm(bh),
                    'specific_heat': 1.75E+06,
                    'thermal_resistivity': 0.01,
                })
                ubump_idx += 1

        out.append({
            'name': chip['name'],
            'x': core_x,
            'y': core_y,
            'w': core_w,
            'h': core_h,
        })
    return out


def _rects_overlap(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2):
    """Check if axis-aligned rectangles overlap."""
    return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1

def _can_merge_h(a, b):
    """Horizontally mergeable: same y, same h, adjacent left/right."""
    (ax, ay, aw, ah), (bx, by, bw, bh) = a, b
    if abs(ay - by) >= 1e-9 or abs(ah - bh) >= 1e-9:
        return False
    if abs((ax + aw) - bx) < 1e-9:
        return (ax, ay, aw + bw, ah)
    if abs((bx + bw) - ax) < 1e-9:
        return (bx, by, aw + bw, ah)
    return False

def _can_merge_v(a, b):
    """Vertically mergeable: same x, same w, adjacent up/down."""
    (ax, ay, aw, ah), (bx, by, bw, bh) = a, b
    if abs(ax - bx) >= 1e-9 or abs(aw - bw) >= 1e-9:
        return False
    if abs((ay + ah) - by) < 1e-9:
        return (ax, ay, aw, ah + bh)
    if abs((by + bh) - ay) < 1e-9:
        return (ax, by, aw, ah + bh)
    return False

def _merge_adjacent_rects(rects):
    """Merge adjacent rectangles into larger ones to minimize TIM block count."""
    if not rects:
        return []
    lst = [(r['x'], r['y'], r['w'], r['h']) for r in rects]
    while True:
        merged_any = False
        for i in range(len(lst)):
            for j in range(i + 1, len(lst)):
                a, b = lst[i], lst[j]
                m = _can_merge_h(a, b) or _can_merge_v(a, b)
                if m:
                    lst[i] = m
                    lst.pop(j)
                    merged_any = True
                    break
            if merged_any:
                break
        if not merged_any:
            break
    return lst


GRID_MM = 0.01
MIN_DIMENSION_MM = 0.01
OVERLAP_TOLERANCE_MM2 = 1e-6

def round_to_grid_mm(value_mm):
    """Snap mm values to 0.01 mm grid and round to 2 decimals to avoid float drift."""
    return round(round(float(value_mm) / GRID_MM) * GRID_MM, 2)

def _rects_overlap(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2):
    """Check if axis-aligned rectangles intersect (any overlap)."""
    return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1

def _rect_fully_outside(rect, chiplet):
    """Check if a small rectangle lies entirely outside a chiplet (no overlap)."""
    rx1, ry1, rx2, ry2 = rect
    cx1, cy1 = chiplet['x'], chiplet['y']
    cx2, cy2 = chiplet['x'] + chiplet['w'], chiplet['y'] + chiplet['h']
    
    return (rx2 <= cx1) or (rx1 >= cx2) or (ry2 <= cy1) or (ry1 >= cy2)

def _can_merge_h(a, b):
    """Horizontally mergeable: same y, same h, edges touching left/right."""
    (ax, ay, aw, ah), (bx, by, bw, bh) = a, b
    if abs(ay - by) >= 1e-9 or abs(ah - bh) >= 1e-9:
        return False
    if abs((ax + aw) - bx) < 1e-9:
        return (ax, ay, aw + bw, ah)
    if abs((bx + bw) - ax) < 1e-9:
        return (bx, by, aw + bw, ah)
    return False

def _can_merge_v(a, b):
    """Vertically mergeable: same x, same w, edges touching up/down."""
    (ax, ay, aw, ah), (bx, by, bw, bh) = a, b
    if abs(ax - bx) >= 1e-9 or abs(aw - bw) >= 1e-9:
        return False
    if abs((ay + ah) - by) < 1e-9:
        return (ax, ay, aw, ah + bh)
    if abs((by + bh) - ay) < 1e-9:
        return (ax, by, aw, ah + bh)
    return False

def _merge_adjacent_rects(rects):
    """Iteratively merge adjacent rectangles until no more merges are possible."""
    if not rects:
        return []
    lst = [(r['x'], r['y'], r['w'], r['h']) for r in rects]
    while True:
        merged_any = False
        for i in range(len(lst)):
            for j in range(i + 1, len(lst)):
                a, b = lst[i], lst[j]
                merged = _can_merge_h(a, b) or _can_merge_v(a, b)
                if merged:
                    lst[i] = merged
                    lst.pop(j)
                    merged_any = True
                    break
            if merged_any:
                break
        if not merged_any:
            break
    return lst

def _is_pure_blank_rect(rect_x1, rect_y1, rect_x2, rect_y2, chiplet_list):
    """Check whether rect formed by cut lines is pure blank (no chiplet covering it)."""
    for chip in chiplet_list:
        c_x1, c_y1 = chip['x'], chip['y']
        c_x2, c_y2 = chip['x'] + chip['w'], chip['y'] + chip['h']
        
        
        inter_x1 = max(rect_x1, c_x1)
        inter_y1 = max(rect_y1, c_y1)
        inter_x2 = min(rect_x2, c_x2)
        inter_y2 = min(rect_y2, c_y2)
        
        
        if (inter_x2 - inter_x1) > 1e-9 and (inter_y2 - inter_y1) > 1e-9:
            return False
    return True

def _try_merge_rects(rect1, rect2):
    """
    Try to merge two rectangles:
    1. Horizontal merge: same y/height, touching left/right edges
    2. Vertical merge: same x/width, touching top/bottom edges
    Return merged rectangle tuple, or None if merge not possible
    """
    (x1, y1, w1, h1), (x2, y2, w2, h2) = rect1, rect2
    
    
    eps = 1e-9
    
    
    if abs(y1 - y2) < eps and abs(h1 - h2) < eps:
        if abs((x1 + w1) - x2) < eps:
            return (x1, y1, w1 + w2, h1)
        if abs((x2 + w2) - x1) < eps:
            return (x2, y2, w1 + w2, h2)
    
    
    if abs(x1 - x2) < eps and abs(w1 - w2) < eps:
        if abs((y1 + h1) - y2) < eps:
            return (x1, y1, w1, h1 + h2)
        if abs((y2 + h2) - y1) < eps:
            return (x1, y2, w1, h1 + h2)
    
    
    return None

def _merge_all_possible_rects(rect_list):
    """
    Full iterative merge until no rectangles can be merged
    Input: list of blank rects [(x,y,w,h), ...]
    Output: merged rectangles (minimal count)
    """
    if not rect_list:
        return []
    
    
    current_rects = rect_list.copy()
    
    
    while True:
        merged = False
        new_rects = []
        
        merged_indices = set()
        
        
        for i in range(len(current_rects)):
            if i in merged_indices:
                continue
            
            current = current_rects[i]
            found_merge = False
            
            
            for j in range(i + 1, len(current_rects)):
                if j in merged_indices:
                    continue
                
                merged_rect = _try_merge_rects(current, current_rects[j])
                if merged_rect:
                    
                    new_rects.append(merged_rect)
                    merged_indices.add(i)
                    merged_indices.add(j)
                    found_merge = True
                    merged = True
                    break
            
            
            if not found_merge:
                new_rects.append(current)
        
        
        current_rects = new_rects
        if not merged:
            break
    
    return current_rects

def get_tim_blocks(chiplet_list_mm, square_side_mm):
    """
    Final TIM generation logic:
    1. Natural boundaries cut smallest blank rects (edges flush to chiplets/bbox).
    2. Iterative merges to minimize TIM count.
    3. Fill all blanks with minimal TIM rectangles.
    Input/output unit: mm
    """
    
    x_edges = {round_to_grid_mm(0.0), round_to_grid_mm(square_side_mm)}
    y_edges = {round_to_grid_mm(0.0), round_to_grid_mm(square_side_mm)}
    
    for chip in chiplet_list_mm:
        x_edges.add(round_to_grid_mm(chip['x']))
        x_edges.add(round_to_grid_mm(chip['x'] + chip['w']))
        y_edges.add(round_to_grid_mm(chip['y']))
        y_edges.add(round_to_grid_mm(chip['y'] + chip['h']))
    
    
    x_edges_sorted = sorted(list(x_edges))
    y_edges_sorted = sorted(list(y_edges))

    
    
    eps = 1e-6
    raw_blank_rects = []
    for i in range(len(x_edges_sorted) - 1):
        rect_x1 = x_edges_sorted[i]
        rect_x2 = x_edges_sorted[i+1]
        rect_w = rect_x2 - rect_x1
        rect_w = round_to_grid_mm(rect_w)
        at_x_boundary = rect_x1 <= eps or rect_x2 >= square_side_mm - eps
        if rect_w < MIN_TIM_DIMENSION_MM and not at_x_boundary:
            continue
        
        for j in range(len(y_edges_sorted) - 1):
            rect_y1 = y_edges_sorted[j]
            rect_y2 = y_edges_sorted[j+1]
            rect_h = rect_y2 - rect_y1
            rect_h = round_to_grid_mm(rect_h)
            at_y_boundary = rect_y1 <= eps or rect_y2 >= square_side_mm - eps
            if rect_h < MIN_TIM_DIMENSION_MM and not at_y_boundary:
                continue
            
            
            if _is_pure_blank_rect(rect_x1, rect_y1, rect_x2, rect_y2, chiplet_list_mm):
                raw_blank_rects.append((rect_x1, rect_y1, rect_w, rect_h))

    
    merged_rects = _merge_all_possible_rects(raw_blank_rects)

    
    tim_blocks = []
    for idx, (x, y, w, h) in enumerate(merged_rects):
        tim_blocks.append({
            'name': f"T{idx}",
            'x': round_to_grid_mm(x),
            'y': round_to_grid_mm(y),
            'w': round_to_grid_mm(w),
            'h': round_to_grid_mm(h),
            'specific_heat': 2523888.888888889,
            'thermal_resistivity': 0.014130946773433819
        })

    
    tim_total_area = sum(t['w'] * t['h'] for t in tim_blocks)
    chip_total_area = sum(c['w'] * c['h'] for c in chiplet_list_mm)
    frame_total_area = square_side_mm * square_side_mm
    area_diff = abs((tim_total_area + chip_total_area) - frame_total_area)
    
    if area_diff > OVERLAP_TOLERANCE_MM2 * 100:
        print("area_diff > OVERLAP_TOLERANCE_MM2 * 100")
    else:
        print("area_diff <= OVERLAP_TOLERANCE_MM2 * 100")
        
    return tim_blocks

def _rects_overlap(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2):
    """Check if axis-aligned rectangles overlap."""
    return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1

def _can_merge_h(a, b):
    """Horizontally mergeable: same y, same h, adjacent left/right."""
    (ax, ay, aw, ah), (bx, by, bw, bh) = a, b
    if abs(ay - by) >= 1e-9 or abs(ah - bh) >= 1e-9:
        return False
    if abs((ax + aw) - bx) < 1e-9:
        return (ax, ay, aw + bw, ah)
    if abs((bx + bw) - ax) < 1e-9:
        return (bx, by, aw + bw, ah)
    return False

def _can_merge_v(a, b):
    """Vertically mergeable: same x, same w, adjacent up/down."""
    (ax, ay, aw, ah), (bx, by, bw, bh) = a, b
    if abs(ax - bx) >= 1e-9 or abs(aw - bw) >= 1e-9:
        return False
    if abs((ay + ah) - by) < 1e-9:
        return (ax, ay, aw, ah + bh)
    if abs((by + bh) - ay) < 1e-9:
        return (ax, by, aw, ah + bh)
    return False


# 每种 case 在所有方法（bt_tree / RL / gurobi 参数扫描）解中的最大 interposer size（mm）。
# 统计口径：experiment_result + parameter_result；排除以下不可行/预览产物：
#   experiment_result/output_gurobi_EMIB_chiplet_5_6_01_17_md1_ca0/placement/multigpu.json
#   experiment_result/result_process（预览输入目录）
#   parameter_result/output_gurobi_EMIB_chiplet_5_6_01_24、..._25（整个目录）
# 数值与 thermal_sim/thermal_pkg.txt 的 [Combined maximum and thermal config] 一致。
CASE_MAX_INTERPOSER_MM = {
    "acend910": 55.15,
    "cpu-dram": 43.00,
    "hp11_m": 63.84,
    "hp6_m": 53.04,
    "hp8_m": 53.20,
    "multigpu": 48.40,
    "syn1": 40.00,
    "syn5": 34.00,
}
# 规则：heat spreader = heat sink = 该 case 所有方法解的最大 interposer size。
# 需加 0.2 mm 余量：若封装边长与布局最长边严格相等，芯片边恰好落在 HotSpot
# 网格单元的边界上，仿真会输出全 -nan 的温度场。
HEAT_SPREADER_SCALE = 1.0
HEAT_SINK_SCALE = 1.0
HEAT_PACKAGE_MARGIN_MM = 0.2


def get_case_key(json_basename):
    """bt_tree/RL 的解按 <case>_seed<NN>.json 命名，查表时去掉 seed 后缀。"""
    case_key = json_basename or ""
    m = re.match(r"^(.*)_seed\d+$", case_key)
    if m:
        case_key = m.group(1)
    return case_key


def resolve_case_key(name, source_path=None):
    """Look up the case name used by the package-size tables.

    Solution files come in two naming schemes: `<case>_seed<NN>` (older runs)
    and bt_tree/RL's `solution_<i>_seed<NN>_cost_...` / `..._reward_...`,
    where the case name survives only in the parent directory
    (`.../output_bt_tree/hp8_m/`). Try the stem, then the parent directory.
    """
    key = get_case_key(name)
    if key in CASE_MAX_INTERPOSER_MM:
        return key
    if source_path:
        parent = os.path.basename(os.path.dirname(os.path.abspath(source_path)))
        if parent in CASE_MAX_INTERPOSER_MM:
            return parent
    return key


def package_layer_side_mm(json_basename, layout_side_mm):
    """TIM / Substrate / C4-underfill 层的边长（mm）。

    已知 case：用该 case 所有方法解中的最大 interposer 尺寸；
    未知 case：退回布局尺寸（旧行为）。
    """
    max_interposer_mm = CASE_MAX_INTERPOSER_MM.get(get_case_key(json_basename))
    if max_interposer_mm is None:
        return layout_side_mm
    return max_interposer_mm


def heat_sink_sizes_m(json_basename, bbox_longest_side=None):
    """返回 (s_spreader, s_sink)，单位米。

    已知 case：spreader = sink = 该 case 所有方法解的最大 interposer + 0.2 mm。
    未知 case：退回旧规则（布局最长边向上取整到 1 mm 再加 1 mm）。
    """
    max_interposer_mm = CASE_MAX_INTERPOSER_MM.get(get_case_key(json_basename))
    if max_interposer_mm is not None:
        side_mm = max_interposer_mm + HEAT_PACKAGE_MARGIN_MM
        spreader = HEAT_SPREADER_SCALE * side_mm / 1000.0
        sink = HEAT_SINK_SCALE * side_mm / 1000.0
        return spreader, sink
    if bbox_longest_side is None:
        return None, None
    val = math.ceil(bbox_longest_side * 1000) / 1000 + 0.001
    return val, val


def copy_config_templates(template_dir, target_dir, json_basename=None,
                          bbox_longest_side=None, case_key=None):
    """Copy config templates and patch -s_sink/-s_spreader and floorplan reference."""
    files = ["example.config", "example.lcf", "example.materials"]
    for fname in files:
        src = os.path.join(template_dir, fname)
        dst = os.path.join(target_dir, fname)
        if os.path.exists(src):
            shutil.copy2(src, dst)
            os.chmod(dst, 0o755)
            
    
    spreader_m, sink_m = heat_sink_sizes_m(case_key or json_basename,
                                           bbox_longest_side)
    if spreader_m is not None:
        spreader_str = f"{spreader_m:.6f}"
        sink_str = f"{sink_m:.6f}"
        config_path = os.path.join(target_dir, "example.config")
        if os.path.exists(config_path):
            with open(config_path, 'r', encoding='utf-8') as f:
                content = f.read()
            content = re.sub(r"(-s_sink\s+)[\d.e+-]+", rf"\g<1>{sink_str}", content)
            content = re.sub(r"(-s_spreader\s+)[\d.e+-]+", rf"\g<1>{spreader_str}", content)
            with open(config_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
    
    if json_basename is not None:
        lcf_path = os.path.join(target_dir, "example.lcf")
        if os.path.exists(lcf_path):
            with open(lcf_path, 'r', encoding='utf-8') as f:
                content = f.read()
            content = content.replace("floorplan0.flp", f"{json_basename}_sub.flp")
            content = content.replace("floorplan2.flp", f"{json_basename}.flp")
            content = content.replace("floorplan1.flp", f"{json_basename}_C4.flp")
            with open(lcf_path, 'w', encoding='utf-8') as f:
                f.write(content)
            

def blocks_mm_to_m(blocks):
    """Convert block list from mm to m (for FLP output)."""
    out = []
    for b in blocks:
        o = b.copy()
        o['x'] = mm_to_m(o['x'])
        o['y'] = mm_to_m(o['y'])
        o['w'] = mm_to_m(o['w'])
        o['h'] = mm_to_m(o['h'])
        out.append(o)
    return out

def generate_sub_flp_file(square_side_m, json_basename, output_dir):
    """Generate bounding-box-only FLP (Unit0, square side in m)."""
    output_path = os.path.join(output_dir, f"{json_basename}_sub.flp")
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("# HotSpot floorplan file (sub: outer bounding box)\n")
        f.write("# Format: <unit> <width> <height> <x> <y>\n")
        f.write("# Unit: meters\n\n")
        f.write(f"Unit0\t{square_side_m:.6f}\t{square_side_m:.6f}\t0.000000\t0.000000\n")
    

def generate_C4_flp_file(square_side_m, json_basename, output_dir):
    """Generate bounding-box-only FLP (Unit0, square side in m)."""
    output_path = os.path.join(output_dir, f"{json_basename}_C4.flp")
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("# HotSpot floorplan file (sub: outer bounding box)\n")
        f.write("# Format: <unit> <width> <height> <x> <y>\n")
        f.write("# Unit: meters\n\n")
        f.write(f"Unit0\t{square_side_m:.6f}\t{square_side_m:.6f}\t0.000000\t0.000000\t2523888.888888889\t0.014130946773433819\n")
    

def generate_flp_file(chiplet_list_m, tim_list_m, output_flp_path):
    """Generate final FLP (chiplet+TIM, in m, with thermal properties)."""
    with open(output_flp_path, 'w', encoding='utf-8') as f:
        f.write("# HotSpot floorplan file (chiplet + TIM)\n")
        f.write("# Format: <unit> <w> <h> <x> <y> [specific-heat] [thermal-resistivity]\n")
        f.write("# Unit: meters\n\n")
        for chip in chiplet_list_m:
            
            f.write(
                f"{chip['name']} {chip['w']:.6f} {chip['h']:.6f} "
                f"{chip['x']:.6f} {chip['y']:.6f} "
                f"1.75E+06 0.01\n"
            )
        for tim in tim_list_m:
            f.write(
                f"{tim['name']} {tim['w']:.6f} {tim['h']:.6f} "
                f"{tim['x']:.6f} {tim['y']:.6f} "
                f"{tim['specific_heat']} {tim['thermal_resistivity']}\n"
            )
    
    

def main(json_path, output_flp_path=None, output_ptrace_path=None,
         output_dir=None, name=None):
    """
    Main: generate FLP according to new spec
    1. Extract and validate base data
    2. New bounding square (max side, origin at (0,0))
    3. Chiplet grid alignment + centering (0.01 mm)
    4. TIM split + merge
    5. Convert mm->m and write outputs

    `output_dir` overrides the default `config/<name>_config` target and
    `name` overrides the file stem, so parallel batch runs can write unique
    directories without racing on a shared `config/<case>_config`.
    """
    json_basename = name or os.path.splitext(os.path.basename(json_path))[0]
    case_key = resolve_case_key(json_basename, json_path)
    script_dir = os.path.dirname(os.path.abspath(__file__))
    config_dir = os.path.normpath(os.path.join(script_dir, "..", "config"))
    output_config_dir = (os.path.abspath(output_dir) if output_dir
                         else os.path.join(config_dir, f"{json_basename}_config"))
    os.makedirs(output_config_dir, exist_ok=True)

    if output_flp_path is None:
        output_flp_path = os.path.join(output_config_dir, f"{json_basename}.flp")
    if output_ptrace_path is None:
        output_ptrace_path = os.path.join(output_config_dir, f"{json_basename}.ptrace")

    
    chiplets = load_json_layout(json_path)
    

    
    chiplet_envelope_list_mm, square_side_mm = build_layout(chiplets)

    # 封装层（TIM / Substrate / C4-underfill）统一使用该 case 所有方法解中的
    # 最大 interposer 尺寸；芯片布局在这个更大的方块内居中。HotSpot 要求
    # 各层 floorplan 的宽高一致，因此 chip 层的外框同样取该尺寸，芯片内容
    # 仍按布局大小、居中放置。
    package_side_mm = max(
        package_layer_side_mm(case_key, square_side_mm), square_side_mm)
    center_offset_mm = round_to_grid_mm((package_side_mm - square_side_mm) / 2.0)
    if center_offset_mm > 0:
        for b in chiplet_envelope_list_mm:
            b['x'] = round_to_grid_mm(b['x'] + center_offset_mm)
            b['y'] = round_to_grid_mm(b['y'] + center_offset_mm)

    chiplet_list_mm = split_bump_pitch_blocks(chiplet_envelope_list_mm)

    check_blocks_overlap(chiplet_list_mm)


    tim_list_mm = get_tim_blocks(chiplet_list_mm, package_side_mm)
    all_blocks_mm = chiplet_list_mm + tim_list_mm
    check_blocks_overlap(all_blocks_mm)


    chiplet_list_m = blocks_mm_to_m(chiplet_list_mm)
    tim_list_m = blocks_mm_to_m(tim_list_mm)
    package_side_m = mm_to_m(package_side_mm)


    template_dir = os.path.join(config_dir, "template_config")
    if os.path.isdir(template_dir):

        copy_config_templates(template_dir, output_config_dir, json_basename,
                              package_side_m, case_key=case_key)
    else:
        print("DEBUG")

    generate_flp_file(chiplet_list_m, tim_list_m, output_flp_path)
    generate_ptrace_file(chiplet_list_m, tim_list_m, json_path, output_ptrace_path)
    generate_sub_flp_file(package_side_m, json_basename, output_config_dir)
    generate_C4_flp_file(package_side_m, json_basename, output_config_dir)

    
    check_no_grid_overlap(chiplet_list_m, tim_list_m, unit_m=True)

    

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description='Generate HotSpot input files from chiplet layout (shrink/resolve overlaps, keep coordinates).')
    parser.add_argument('--json_path', type=str, required=True, help='Input JSON layout path (mm units)')
    parser.add_argument('--output_flp', type=str, default=None, help='Output .flp path (default auto-generated)')
    parser.add_argument('--output_ptrace', type=str, default=None, help='Output .ptrace path (default auto-generated)')
    parser.add_argument('--config_dir', type=str, default=None,
                        help='Output config directory (default config/<name>_config)')
    parser.add_argument('--name', type=str, default=None,
                        help='Output file stem (default: input JSON stem)')
    args = parser.parse_args()
    main(args.json_path, args.output_flp, args.output_ptrace,
         output_dir=args.config_dir, name=args.name)
