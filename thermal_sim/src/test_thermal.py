import argparse
import os
import json
import subprocess
import time

import matplotlib.patches as patches
import matplotlib.pyplot as plt
from matplotlib.patheffects import withStroke
from matplotlib.colors import ListedColormap
from matplotlib.transforms import Bbox
import numpy as np

# 复用 FLP 生成时的布局逻辑，保证芯粒和硅桥的平移方式一致
from gen_flp_trace import (
    load_json_layout,
    build_layout,
    package_layer_side_mm,
    resolve_case_key,
    round_to_grid_mm,
)

def read_flp_blocks(flp_file):
    """
    读取 FLP 文件，返回块名到中心坐标的映射 {(x_center, y_center)}
    FLP 格式: name width height x y [optional...]
    """
    blocks = {}
    if not os.path.exists(flp_file):
        return blocks
    with open(flp_file, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 5:
                name = parts[0]
                w, h, x, y = float(parts[1]), float(parts[2]), float(parts[3]), float(parts[4])
                cx, cy = x + w / 2, y + h / 2
                blocks[name] = (cx, cy)
    return blocks


def read_steady_file(steady_file, flp_file=None):
    """
    读取 HotSpot 的 .steady 文件（格式: name<TAB>temp，两列）
    HotSpot grid 模型输出无坐标，需从 FLP 文件获取块位置进行匹配。
    返回: 模块名称列表, 温度列表, 坐标列表 (x, y)
    """
    names = []
    temps = []
    coords = []
    if not os.path.exists(steady_file):
        print(f"【错误】{steady_file} 文件不存在，请检查HotSpot仿真是否执行成功！")
        return names, temps, coords

    flp_blocks = read_flp_blocks(flp_file) if flp_file else {}

    with open(steady_file, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                name = parts[0]
                temp = float(parts[1])
                # HotSpot 对硅层块加 layer_0_ 前缀，需 strip 后与 FLP 匹配
                base_name = name
                for prefix in ("layer_0_", "hsp_", "hsink_"):
                    if name.startswith(prefix):
                        base_name = name[len(prefix):]
                        break
                if base_name in flp_blocks:
                    names.append(base_name)
                    temps.append(temp)
                    coords.append(flp_blocks[base_name])
                elif not flp_blocks and "layer_0_" in name:
                    base_name = name.replace("layer_0_", "")
                    names.append(base_name)
                    temps.append(temp)
                    coords.append((0.0, 0.0))

    print(f"【成功】读取{len(names)}个芯粒模块的温度数据")
    return names, temps, coords

def read_grid_steady_layer(grid_steady_file, layer_num):
    """
    从 .grid.steady 文件读取指定层的温度数据。
    返回: (temps_list, rows, cols) 或 (None, None, None)
    """
    if not os.path.exists(grid_steady_file):
        print(f"【错误】{grid_steady_file} 不存在")
        return None, None, None
    temps = []
    in_target = False
    with open(grid_steady_file, "r") as f:
        for line in f:
            s = line.strip()
            if s.startswith("Layer "):
                parts = s.split()
                num = int(parts[1].rstrip(":"))
                if num == layer_num:
                    in_target = True
                    continue
                elif in_target:
                    break
            elif in_target and s:
                parts = s.split()
                if len(parts) >= 2:
                    temps.append(float(parts[1]))
    if not temps:
        return None, None, None
    n = len(temps)
    grid_side = int(round(n ** 0.5))
    if grid_side * grid_side != n:
        grid_side = int(n ** 0.5)
    rows = cols = grid_side
    return temps, rows, cols


def read_flp_layout(flp_file):
    """
    读取 FLP 布局，返回 chiplet 和 TIM 块列表（与 view_flp 一致）。
    返回: chiplets [(name, w, h, x, y), ...], tims [(name, w, h, x, y), ...]
    支持新命名方案：单个大写字母为 chiplet (A, B, C...)，T+ 数字为 TIM (T0, T1...)
    """
    chiplets = []
    tims = []
    if not os.path.exists(flp_file):
        return chiplets, tims
    with open(flp_file, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = line.split()
            if len(parts) < 5:
                continue
            name, w, h, x, y = parts[0], float(parts[1]), float(parts[2]), float(parts[3]), float(parts[4])
            # 支持两种命名方案：
            # 旧方案：chipletA, chipletB, TIM0, TIM1
            # 新方案：A, B, C (单个大写字母), T0, T1 (T + 数字)
            if name.startswith("chiplet") or (len(name) == 1 and name.isupper()):
                chiplets.append((name, w, h, x, y))
            elif name.startswith("TIM") or (name.startswith("T") and len(name) > 1 and name[1:].isdigit()):
                tims.append((name, w, h, x, y))
    return chiplets, tims


def read_heat_package_sizes(config_dir):
    """Read heat sink / spreader side from example.config, returned in mm."""
    sink_mm = spreader_mm = None
    config_path = os.path.join(config_dir, "example.config")
    try:
        with open(config_path, "r", encoding="utf-8") as f:
            for line in f:
                parts = line.split()
                if len(parts) >= 2 and parts[0] == "-s_sink":
                    sink_mm = float(parts[1]) * 1000.0
                elif len(parts) >= 2 and parts[0] == "-s_spreader":
                    spreader_mm = float(parts[1]) * 1000.0
    except OSError:
        pass
    return sink_mm, spreader_mm

def read_floorplan_box_mm(flp_path):
    """Read the single Unit box of a layer floorplan, returned in mm."""
    try:
        with open(flp_path, "r", encoding="utf-8") as f:
            for line in f:
                parts = line.split()
                if len(parts) >= 3 and parts[0].startswith("Unit"):
                    return float(parts[1]) * 1000.0, float(parts[2]) * 1000.0
    except OSError:
        pass
    return None


def _bridge_shared_edge(node1, node2, chip_rects):
    """Return (kind, boundary, lo, hi) of the edge shared by two chiplets.

    kind == "LR" for left-right neighbours (vertical shared edge, boundary is
    its x), "UD" for up-down neighbours (horizontal edge, boundary is its y).
    lo/hi is the overlap interval along the edge. None if a chip is missing.
    """
    a, b = chip_rects.get(node1), chip_rects.get(node2)
    if not (a and b):
        return None
    ax0, ay0, aw, ah = a
    bx0, by0, bw, bh = b
    overlap_x = min(ax0 + aw, bx0 + bw) - max(ax0, bx0)
    overlap_y = min(ay0 + ah, by0 + bh) - max(ay0, by0)
    if overlap_y > overlap_x:
        # 左右相邻：共享竖边
        if ax0 <= bx0:
            boundary = (ax0 + aw + bx0) / 2.0
        else:
            boundary = (bx0 + bw + ax0) / 2.0
        return "LR", boundary, max(ay0, by0), min(ay0 + ah, by0 + bh)
    # 上下相邻：共享横边
    if ay0 <= by0:
        boundary = (ay0 + ah + by0) / 2.0
    else:
        boundary = (by0 + bh + ay0) / 2.0
    return "UD", boundary, max(ax0, bx0), min(ax0 + aw, bx0 + bw)


def _benchmark_emib_connections(json_path, chip_rects):
    """Synthesise bridge rectangles for layouts that carry no `connections`.

    RL layouts are exported as {name: {x, y, width, height}} only, so the
    benchmark's EMIB list is the only source of bridge sizes. Each rectangle
    is placed the same way bridge_legality.layout_bridge_rects does it: the
    bridge length runs along the shared edge, 2 * EMIB_bump_width across it,
    centred on the overlap midpoint. Coordinates come from `chip_rects`, which
    are already in the FLP frame (mm), so no extra shift is applied.
    """
    case = resolve_case_key(
        os.path.splitext(os.path.basename(json_path))[0], json_path)
    bench_path = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__)))), "benchmark", "test_input", f"{case}.json")
    if not os.path.exists(bench_path):
        return []
    with open(bench_path, "r", encoding="utf-8") as f:
        bench = json.load(f)

    bridges = []
    for conn in bench.get("connections", []):
        if int(conn.get("wireCount", 1)) <= 255:
            continue
        if str(conn.get("EMIBType", "")).lower() == "interfacec":
            continue
        n1, n2 = conn.get("node1"), conn.get("node2")
        edge = _bridge_shared_edge(n1, n2, chip_rects)
        along = float(conn.get("EMIB_length") or 0.0)
        bump = conn.get("EMIB_bump_width")
        if edge is None or along <= 0.0 or bump is None:
            continue
        kind, boundary, lo, hi = edge
        across = 2.0 * float(bump)
        mid = (lo + hi) / 2.0
        if kind == "LR":
            x, y, w, h = boundary - across / 2.0, mid - along / 2.0, across, along
        else:
            x, y, w, h = mid - along / 2.0, boundary - across / 2.0, along, across
        bridges.append({
            "node1": n1, "node2": n2,
            "x": x, "y": y, "w": w, "h": h,
            "synthetic": True,
        })
    return bridges


def _bridge_center_offset(x, y, w, h, edge):
    """Distance between the bridge centre and the shared edge, across the edge.

    Both exporters compute the bridge bottom-left so that the bridge centre
    sits exactly on the shared edge *in the correct orientation*; only the
    width/length fields differ in meaning. So the orientation whose centre
    lands on the edge is the right one.
    """
    kind, boundary, _, _ = edge
    center = x + w / 2.0 if kind == "LR" else y + h / 2.0
    return abs(center - boundary)


def _emib_rect(x, y, w, h, node1, node2, chip_rects, bump_width=None):
    """Orient the EMIB so it straddles the edge shared by its two chiplets.

    The result files use two different conventions:
      * tool.py (exp / parameter_result): EMIB_width/EMIB_length are already
        the final x/y extents and (x, y) is the final bottom-left;
      * RL / bt_tree: EMIB_width/EMIB_length are the raw across-gap /
        along-edge sizes and (x, y) is the unrotated bottom-left, so an
        up-down pair needs the two dimensions swapped.
    Rather than assume either, keep the orientation whose centre lies on the
    shared edge. Left-right neighbours use a vertical shared edge (the bridge
    crosses in x), up-down neighbours a horizontal one (crosses in y).

    The across-gap size is always drawn as 2 * EMIB_bump_width (the two bump
    rows sit either side of the shared edge), regardless of which of
    EMIB_width/EMIB_length the exporter put it in; the along-edge size keeps
    the stored value. The bridge stays centred on the shared edge.
    """
    edge = _bridge_shared_edge(node1, node2, chip_rects)
    if edge is None:
        return x, y, w, h
    if _bridge_center_offset(x, y, h, w, edge) < _bridge_center_offset(x, y, w, h, edge):
        x, y, w, h = x, y, h, w
    if bump_width is not None and float(bump_width) > 0.0:
        kind, boundary, _, _ = edge
        half = float(bump_width)
        if kind == "LR":
            x, w = boundary - half, 2.0 * half
        else:
            y, h = boundary - half, 2.0 * half
    return x, y, w, h


def _plot_bridge_rects(chiplets, json_basename, layout_json, placement_dir):
    """EMIB bridge rectangles (mm, plot coordinates) for the layer-2 map.

    Returns a list of (x, y, w, h).  The chiplet shift that gen_flp_trace
    applied to build the FLP is re-derived here so the bridges land on the
    same coordinates as the chip rectangles.
    """
    if not json_basename:
        return []
    try:
        script_dir = os.path.dirname(os.path.abspath(__file__))
        # 优先使用外部传入的 placement_dir（对应当前处理的 output_gurobi_EMIB_chiplet_* 目录）
        if placement_dir:
            json_dir = os.path.normpath(placement_dir)
        else:
            # 兼容旧用法：默认从 output_gurobi_EMIB_chiplet_5_6_01_0/placement 读取 JSON
            root_dir = os.path.normpath(os.path.join(script_dir, "..", ".."))
            json_dir = os.path.join(root_dir, "output_gurobi_EMIB_chiplet_5_6_01_0", "placement")
        # bt_tree / RL 的解文件名（solution_..._cost_...）与配置名不同，
        # 批处理时通过 layout_json 直接指定实际使用的布局文件。
        json_path = (os.path.normpath(layout_json) if layout_json
                     else os.path.join(json_dir, f"{json_basename}.json"))
        if not os.path.exists(json_path):
            print(f"[警告] 未找到 placement JSON：{json_path}，跳过 EMIB 绘制")
            return []
        with open(json_path, "r", encoding="utf-8") as f:
            placement_data = json.load(f)

        # 用 gen_flp_trace 的逻辑重新算一遍 Chiplet 平移，以获得与 FLP 一致的平移量
        try:
            orig_chiplets = load_json_layout(json_path)  # 原始 JSON 布局（mm）
            shifted_chiplets, layout_side = build_layout(orig_chiplets)  # 平移 + 居中后的布局（mm）
            # gen_flp_trace 还会把整个布局平移到该 case 最大 interposer 方块的中心，
            # 硅桥必须叠加同一段偏移，否则会整体偏离芯片。
            case_key = resolve_case_key(json_basename, json_path)
            package_side = max(
                package_layer_side_mm(case_key, layout_side), layout_side)
            center_offset = round_to_grid_mm((package_side - layout_side) / 2.0)
            # 计算全局平移量（理论上每个芯粒的 shift_x / shift_y 都相同，这里取平均更鲁棒）
            dx_list = []
            dy_list = []
            orig_by_name = {c["name"]: c for c in orig_chiplets}
            shifted_by_name = {c["name"]: c for c in shifted_chiplets}
            for name, oc in orig_by_name.items():
                sc = shifted_by_name.get(name)
                if not sc:
                    continue
                dx_list.append(sc["x"] - oc["x"])
                dy_list.append(sc["y"] - oc["y"])
            shift_x = sum(dx_list) / len(dx_list) if dx_list else 0.0
            shift_y = sum(dy_list) / len(dy_list) if dy_list else 0.0
            shift_x += center_offset
            shift_y += center_offset
        except Exception as e:
            print(f"[警告] 计算 Chiplet 平移量失败，硅桥不做平移: {e}")
            shift_x = shift_y = 0.0

        # 芯粒矩形（mm），用于判断每座硅桥该横放还是竖放
        chip_rects = {n: (cx, cy, cw, ch) for n, cw, ch, cx, cy in chiplets}
        connections = placement_data.get("connections", [])
        if not connections:
            # RL 布局文件只有芯粒坐标，没有 connections；按 benchmark
            # 的 EMIB 规格在共享边上补出硅桥矩形。
            connections = _benchmark_emib_connections(json_path, chip_rects)

        rects = []
        for conn in connections:
            emib_type = conn.get("EMIBType")
            if emib_type == "interfaceC":
                continue
            if emib_type not in ("interfaceA", "interfaceB", None):
                continue
            if conn.get("synthetic"):
                rect_x, rect_y = conn["x"], conn["y"]
                rect_w, rect_h = conn["w"], conn["h"]
            else:
                x = conn.get("EMIB-x-position", 0.0)
                y = conn.get("EMIB-y-position", 0.0)
                w = conn.get("EMIB_width", 0.0)
                h = conn.get("EMIB_length", 0.0)
                # JSON 里的 EMIB 坐标和尺寸已经是 mm，这里叠加与 Chiplet 相同的平移量，保证相对位置一致
                x_mm, y_mm = float(x) + shift_x, float(y) + shift_y
                w_mm, h_mm = float(w), float(h)
                if w_mm <= 0.0 or h_mm <= 0.0:
                    continue
                # 硅桥方向由两侧芯粒的共享边决定（结果文件里两种导出约定
                # 混用：ILP 的 x/y 已含旋转，RL 的 x/y 未含旋转）。
                rect_x, rect_y, rect_w, rect_h = _emib_rect(
                    x_mm, y_mm, w_mm, h_mm,
                    conn.get("node1"), conn.get("node2"), chip_rects,
                    conn.get("EMIB_bump_width"))
            rects.append((rect_x, rect_y, rect_w, rect_h))
        return rects
    except Exception as e:
        print(f"[警告] 解析/绘制 EMIB 硅桥失败：{e}")
        return []


# 标签之间至少留出的空隙（mm），避免两行文字在视觉上连成一片。
LABEL_GAP = 0.25


def _rect_overlap_area(a, b):
    dx = min(a[2], b[2]) - max(a[0], b[0])
    dy = min(a[3], b[3]) - max(a[1], b[1])
    return dx * dy if dx > 0.0 and dy > 0.0 else 0.0


def _place_chip_labels(ax, fig, chiplets, power_dict, bridge_rects,
                       fontsize=14, pad=0.12, power_fmt="{:.2f}W", stroke=2,
                       bridge_clear=0.0):
    """Place each chip's name inside its rectangle, power centred below it.

    The name and the power are two separate texts so the name can stay inside
    the chip while the power line (directly below the name, on the same
    vertical axis) is allowed to hang past the chip border when the chip is
    shallower than the two lines together.

    For every chip the name slides over a 9x5 grid of anchors crossed with the
    nine alignments (top-left first) and the placement with the least overlap
    against other labels, the EMIB bridges and the chip border wins: the name
    prefers staying inside its own chip, while neither text may really
    overlap another label or a bridge.  Font size stays fixed and the power
    line never moves away from the name's centre axis.

    bridge_clear inflates every EMIB bridge rect by that many mm while
    scoring, so the labels keep a visible gap to the bridge instead of merely
    not touching it (strokes and antialiasing bleed past the text bbox).

    bridge_rects holds EMIB bridges as (x, y, w, h) in mm, the same form
    _plot_bridge_rects returns; inside everything is converted to
    (x0, y0, x1, y1) so it can be compared with the text boxes.
    """
    # 调用方给的是 (x, y, w, h)，重叠判断一律用角点 (x0, y0, x1, y1)。
    bridge_rects = [(bx, by, bx + bw, by + bh) for bx, by, bw, bh in bridge_rects]
    label_items = []
    for name, w, h, x, y in chiplets:
        power = power_dict.get(name, 0.0)
        name_txt = ax.text(
            x + w / 2.0,
            y + h / 2.0,
            name,
            ha="center",
            va="center",
            fontsize=fontsize,
            fontweight="bold",
            color="white",
            zorder=20,
            path_effects=[withStroke(linewidth=stroke, foreground="black")],
        )
        power_txt = None
        if power > 0:
            power_txt = ax.text(
                x + w / 2.0,
                y + h / 2.0,
                power_fmt.format(power),
                ha="center",
                va="top",
                fontsize=fontsize,
                fontweight="bold",
                color="white",
                zorder=20,
                path_effects=[withStroke(linewidth=stroke, foreground="black")],
            )
        label_items.append((name_txt, power_txt, (x, y, w, h)))

    fig.canvas.draw()
    renderer = fig.canvas.get_renderer()

    def measure(txt):
        bb = txt.get_window_extent(renderer=renderer)
        (x0, y0) = ax.transData.inverted().transform((bb.x0, bb.y0))
        (x1, y1) = ax.transData.inverted().transform((bb.x1, bb.y1))
        return abs(x1 - x0), abs(y1 - y0)

    sizes = []
    for name_txt, power_txt, _ in label_items:
        sizes.append((measure(name_txt),
                      measure(power_txt) if power_txt is not None else None))

    POWER_GAP = 0.06
    # 功耗行默认挂在名称正下方。下方被硅桥/别的标签堵死时允许翻到名称
    # 正上方；只有翻面能省下 ≥0.2mm² 的桥重叠才值得（2e5 对 1e6/mm²）。
    POWER_FLIP = 2e5
    # 描边（path_effects linewidth=stroke）不在文本 bbox 内：每侧半个描边
    # 约合 0.04mm/pt，按这个余量外扩保证可见轮廓也在芯粒上。
    NAME_STROKE = 0.04 * stroke

    def candidates(x, y, w, h, tw, th, tpw, tph):
        """(name anchor, ha, va, name bbox, power bbox, power pos, power va).

        The name may slide anywhere over the chip: a 9x5 grid of anchors
        (left..right x top..bottom) crossed with the nine alignments, top-left
        first.  The power text is centred on the name's vertical axis with a
        small gap, below it by preference and above it as a fallback, so it
        moves together with the name.
        """

        def make(ax, ay, ha, va, side):
            if ha == "left":
                x0, x1 = ax, ax + tw
            elif ha == "right":
                x0, x1 = ax - tw, ax
            else:
                x0, x1 = ax - tw / 2.0, ax + tw / 2.0
            if va == "top":
                y0, y1 = ay - th, ay
            elif va == "bottom":
                y0, y1 = ay, ay + th
            else:
                y0, y1 = ay - th / 2.0, ay + th / 2.0
            name_bb = (x0, y0, x1, y1)
            power_bb = None
            ppos = pva = None
            if tpw is not None:
                cx = (x0 + x1) / 2.0
                if side == "above":
                    py = y1 + POWER_GAP
                    power_bb = (cx - tpw / 2.0, py, cx + tpw / 2.0, py + tph)
                    ppos, pva = (cx, py), "bottom"
                else:
                    py = y0 - POWER_GAP
                    power_bb = (cx - tpw / 2.0, py - tph, cx + tpw / 2.0, py)
                    ppos, pva = (cx, py), "top"
            return ((ax, ay), ha, va, name_bb, power_bb, ppos, pva)

        aligns = [("left", "top"), ("right", "top"), ("center", "top"),
                  ("left", "center"), ("right", "center"), ("center", "center"),
                  ("left", "bottom"), ("right", "bottom"), ("center", "bottom")]
        # 锚点至少要内缩一个描边余量，否则最靠边的候选也会让可见轮廓
        # 越出芯粒（窄条芯粒上这一点点就足以把名字挤出边界）。
        inset = max(pad, NAME_STROKE)
        xs = [x + inset + (w - 2.0 * inset) * i / 16.0 for i in range(17)]
        ys = [y + h - inset - (h - 2.0 * inset) * j / 6.0 for j in range(7)]
        out = []
        for side in ("below", "above"):
            for ha, va in aligns:
                for ay in ys:
                    for ax in xs:
                        out.append(make(ax, ay, ha, va, side))
        return out

    placed = []          # (owner index, bbox) for every placed name/power box
    chosen = {}          # owner index -> (pos, ha, va, nbb, pbb)
    # 硅桥按 bridge_clear 外扩后再判重叠：文字的实际墨迹（描边）比 bbox
    # 大一圈，贴着桥边放看上去就是压上了。
    bridge_boxes = [_inflate(r, bridge_clear) for r in bridge_rects]
    (ax_x0, ax_x1), (ax_y0, ax_y1) = ax.get_xlim(), ax.get_ylim()
    ax_rect = (ax_x0, ax_y0, ax_x1, ax_y1)
    # 先摆最受约束的芯粒（名号几乎顶满芯粒高度的薄芯粒），把它们的
    # 名字和功耗先钉住，空间宽松的大芯粒再绕开它们摆。
    order = sorted(
        range(len(label_items)),
        key=lambda i: (label_items[i][2][3] - sizes[i][0][1],
                       label_items[i][2][2] * label_items[i][2][3]),
    )
    # 多轮坐标下降：每轮把每个标签拿起来重新摆一次（看到其他所有标签
    # 的当前位置），前一轮留下的冲突可以在后一轮被别的芯粒让开。
    for _sweep in range(10):
        for i in order:
            name_txt, power_txt, (x, y, w, h) = label_items[i]
            nsize, psize = sizes[i]
            chip_rect = (x, y, x + w, y + h)
            other_chips = [(ox, oy, ox + ow, oy + oh)
                           for _, ow, oh, ox, oy in chiplets
                           if (ox, oy, ow, oh) != (x, y, w, h)]
            ntw, nth = nsize
            if psize is not None:
                tpw, tph = psize
            else:
                tpw = tph = None
            occupied = [b for owner, b in placed if owner != i]
            best = None
            for index, (pos, ha, va, nbb, pbb, ppos, pva) in enumerate(
                    candidates(x, y, w, h, ntw, nth, tpw, tph)):
                boxes = [nbb] + ([pbb] if pbb is not None else [])
                # 真实重叠是硬约束：宁可把标签挤出去，也不能压到别的标签或
                # 硅桥。留 0.25mm 空隙的那一档是软约束，权重低一档。
                real_label = sum(_rect_overlap_area(b, p)
                                 for b in boxes for p in occupied)
                real_bridge = sum(_rect_overlap_area(b, r)
                                  for b in boxes for r in bridge_boxes)
                label_gap = sum(_rect_overlap_area(_inflate(b, LABEL_GAP), p)
                                for b in boxes for p in occupied)
                bridge_gap = sum(_rect_overlap_area(_inflate(b, LABEL_GAP), r)
                                 for b in boxes for r in bridge_boxes)
                # 芯粒名必须落在芯粒上：按描边后的可见范围（文字框外扩
                # STROKE）判断，权重高于一切，名字宁可不避让也要留在芯粒内。
                # 功耗行跟随名称，允许垂到芯粒外。
                name_vis = _inflate(nbb, NAME_STROKE)
                name_out = _area(name_vis) - _rect_overlap_area(name_vis, chip_rect)
                power_out = (0.0 if pbb is None else
                             _area(pbb) - _rect_overlap_area(pbb, chip_rect))
                chip_overlap = sum(_rect_overlap_area(b, c)
                                   for b in boxes for c in other_chips)
                outside_canvas = sum(_area(b) - _rect_overlap_area(b, ax_rect)
                                     for b in boxes)
                # 功耗行优先放在名称下方，翻到上方要额外付一笔。
                power_flip = POWER_FLIP if pva == "bottom" else 0.0
                penalty = (1e8 * name_out + 1e7 * real_label + 1e6 * real_bridge
                           + 2000.0 * label_gap + 1000.0 * bridge_gap
                           + power_flip
                           + 10.0 * power_out + 100.0 * chip_overlap
                           + 50.0 * outside_canvas + 1e-6 * index)
                if best is None or penalty < best[0]:
                    best = (penalty, pos, ha, va, nbb, pbb, ppos, pva)
                if penalty < 1e-9:
                    break
            _, pos, ha, va, nbb, pbb, ppos, pva = best
            name_txt.set_position(pos)
            name_txt.set_ha(ha)
            name_txt.set_va(va)
            if power_txt is not None and pbb is not None:
                power_txt.set_position(ppos)
                power_txt.set_ha("center")
                power_txt.set_va(pva)
            chosen[i] = (nbb, pbb)
            placed = [(owner, b) for owner, b in placed if owner != i]
            placed.append((i, nbb))
            if pbb is not None:
                placed.append((i, pbb))

    # 最终冲突检查（此时所有标签都已经过四轮互相避让）
    if os.environ.get("LABEL_DEBUG"):
        for i, (nbb, pbb) in chosen.items():
            nm = label_items[i][0].get_text()
            rect = label_items[i][2]
            print(f"    DUMP {nm:3s} chip={tuple(round(v, 2) for v in rect)} "
                  f"name={tuple(round(v, 2) for v in nbb)} "
                  f"power={None if pbb is None else tuple(round(v, 2) for v in pbb)}")
    for i, (nbb, pbb) in chosen.items():
        name_txt, power_txt, (x, y, w, h) = label_items[i]
        chip_rect = (x, y, x + w, y + h)
        boxes = [nbb] + ([pbb] if pbb is not None else [])
        occupied = [b for owner, b in placed if owner != i]
        real_label_overlap = sum(_rect_overlap_area(b, p)
                                 for b in boxes for p in occupied)
        real_bridge_overlap = sum(_rect_overlap_area(b, r)
                                  for b in boxes for r in bridge_rects)
        name_vis = _inflate(nbb, NAME_STROKE)
        name_vis_out = _area(name_vis) - _rect_overlap_area(name_vis, chip_rect)
        if name_vis_out > 1e-6:
            print(f"[警告] 标签 {name_txt.get_text()} 的名称未完全落在芯粒上"
                  f"（越界 {name_vis_out:.3f} mm²）")
        if real_label_overlap > 1e-6 or real_bridge_overlap > 1e-6:
            parts = []
            if real_label_overlap > 1e-6:
                parts.append("其他标签")
            if real_bridge_overlap > 1e-6:
                parts.append("EMIB 硅桥")
            print(f"[警告] 标签 {name_txt.get_text()} 仍与"
                  f"{'、'.join(parts)}重叠 "
                  f"{real_label_overlap + real_bridge_overlap:.3f} mm²")
            if os.environ.get("LABEL_DEBUG"):
                for owner, b in placed:
                    if owner == i:
                        continue
                    for my in boxes:
                        a = _rect_overlap_area(my, b)
                        if a > 1e-9:
                            oc = chiplets[owner]
                            print(f"    DEBUG {name_txt.get_text()} box={tuple(round(v,2) for v in my)}"
                                  f" x {oc[0]} box={tuple(round(v,2) for v in b)}"
                                  f" = {a:.3f}")
                print(f"    DEBUG chip={tuple(round(v,2) for v in chip_rect)}")


def _area(bb):
    return max(0.0, bb[2] - bb[0]) * max(0.0, bb[3] - bb[1])


def _inflate(bb, margin):
    return (bb[0] - margin, bb[1] - margin, bb[2] + margin, bb[3] + margin)


def save_square(fig, output_image, dpi=300):
    """把当前 figure 存成严格 1:1 的 PNG。

    先量出实内容（坐标轴 + colorbar + 标题 + 注释）的 tight 边界，再把短的
    一边对称补白到与长边等长，这样既不会裁掉 colorbar / 注释，最终像素宽高
    也完全相等。
    """
    fig.canvas.draw()
    tight = fig.get_tightbbox(fig.canvas.get_renderer())
    side = max(tight.width, tight.height)
    cx = (tight.x0 + tight.x1) / 2.0
    cy = (tight.y0 + tight.y1) / 2.0
    square = Bbox.from_extents(cx - side / 2.0, cy - side / 2.0,
                               cx + side / 2.0, cy + side / 2.0)
    fig.savefig(output_image, dpi=dpi, bbox_inches=square, facecolor="white")


def plot_grid_layer2_thermal_map(
    flp_file,
    grid_steady_file,
    output_image,
    json_basename=None,
    placement_dir=None,
    layer_num=2,
    layout_json=None,
):
    """
    读取 .grid.steady 中 Layer 2 的数据，绘制网格热图，并叠加 chiplet 框、名称和功耗。
    颜色映射和 HotSpot 自带的 `grid_thermal_map.pl` 保持一致（红-黄-绿-青-蓝，越热越红）。
    """
    # 从 ptrace 文件读取功耗数据
    power_dict = {}
    ptrace_file = flp_file.replace('.flp', '.ptrace')
    if os.path.exists(ptrace_file):
        try:
            with open(ptrace_file, 'r', encoding='utf-8') as f:
                lines = f.readlines()
            if len(lines) >= 2:
                names = lines[0].strip().split()
                powers = lines[1].strip().split()
                if len(names) == len(powers):
                    for name, power_str in zip(names, powers):
                        try:
                            power_dict[name] = float(power_str)
                        except ValueError:
                            pass
        except Exception as e:
            print(f"[警告]读取ptrace文件失败: {e}")
    
    temps, rows, cols = read_grid_steady_layer(grid_steady_file, layer_num)
    if not temps or rows is None:
        print(f"【错误】无法读取 Layer {layer_num} 温度数据")
        return

    # HotSpot 输出为绝对温度(K)，与 grid_thermal_map.pl 一致，这里转换为摄氏度用于着色和显示
    temps = np.array(temps).reshape(rows, cols)
    # 为了让物理布局的“上方”在图像上也显示在上方，这里先对矩阵做一次上下翻转
    temps = np.flipud(temps)
    temps_c = temps - 273.15
    chiplets, tims = read_flp_layout(flp_file)
    # 将坐标从米转换为毫米
    chiplets = [(n, w*1000, h*1000, x*1000, y*1000) for n, w, h, x, y in chiplets]
    tims = [(n, w*1000, h*1000, x*1000, y*1000) for n, w, h, x, y in tims]
    all_blocks = chiplets + tims
    # 热图范围取封装层（_sub.flp，与 TIM/Substrate/C4-underfill 同尺寸）的方块；
    # 芯片布局居中显示在这个范围内。文件缺失时才退回块的外接范围。
    pkg_dir = os.path.dirname(os.path.abspath(flp_file))
    flp_base = os.path.splitext(os.path.basename(flp_file))[0]
    pkg_box = (read_floorplan_box_mm(os.path.join(pkg_dir, flp_base + "_sub.flp"))
               or read_floorplan_box_mm(os.path.join(pkg_dir, flp_base + "_C4.flp")))
    if pkg_box is not None:
        total_width, total_length = pkg_box
    else:
        total_width = total_length = 0.0
        for _, w, h, x, y in all_blocks:
            total_width = max(total_width, x + w)
            total_length = max(total_length, y + h)
        if total_width <= 0 or total_length <= 0:
            total_width = total_length = max(0.01, 0.05)

    # 构造与 grid_thermal_map.pl 相同的 21 级 RGB 调色板。
    # 注意：matplotlib 中 vmin 映射到调色板第 0 个颜色、vmax 映射到最后一个颜色，
    # 为了让“高温=红、低温=蓝”，这里将原始（红→蓝）序列反转成（蓝→红）。
    palette_rgb = [
        (255, 0, 0),
        (255, 51, 0),
        (255, 102, 0),
        (255, 153, 0),
        (255, 204, 0),
        (255, 255, 0),
        (204, 255, 0),
        (153, 255, 0),
        (102, 255, 0),
        (51, 255, 0),
        (0, 255, 0),
        (0, 255, 51),
        (0, 255, 102),
        (0, 255, 153),
        (0, 255, 204),
        (0, 255, 255),
        (0, 204, 255),
        (0, 153, 255),
        (0, 102, 255),
        (0, 51, 255),
        (0, 0, 255),
    ]
    # 反转顺序：低温用蓝色，高温用红色
    palette_rgb = list(reversed(palette_rgb))
    palette_norm = [(r / 255.0, g / 255.0, b / 255.0) for r, g, b in palette_rgb]
    cmap = ListedColormap(palette_norm, name="hotspot_grid_palette")

    # 正方形出图：画布取 1:1，坐标框再锁定为正方形（set_box_aspect(1)）。
    # extent 仍是真实物理尺寸，aspect="auto" 让温度矩阵铺满正方框，
    # 不因为中介层不是 1:1 而在面板里留出空白。
    fig, ax = plt.subplots(1, figsize=(10, 10))
    im = ax.imshow(
        temps_c,
        cmap=cmap,
        extent=(0, total_width, 0, total_length),
        origin="lower",
        aspect="auto",
    )
    ax.set_box_aspect(1)
    max_c = float(np.max(temps_c))
    avg_c = float(np.mean(temps_c))
    im.set_clim(np.min(temps_c), max_c)
    cbar = fig.colorbar(im, ax=ax)
    # 与 EMIBplot.py 保持相近：轴标签 18，刻度 14
    cbar.set_label("Temperature (°C)", fontsize=18)
    cbar.ax.tick_params(labelsize=14)
    ax.set_title(
        f"MaxT = {max_c:.2f} °C, AvgT = {avg_c:.2f} °C",
        fontsize=18,
    )
    ax.set_xlabel("X (mm)", fontsize=18)
    ax.set_ylabel("Y (mm)", fontsize=18)
    ax.tick_params(axis="both", labelsize=14)
    ax.set_xlabel("X (mm)")
    ax.set_ylabel("Y (mm)")

    # 图下方小字注明各层尺寸（mm）：芯片布局、TIM/Substrate/C4-underfill、热沉、均热板
    size_caption = None
    if chiplets:
        chip_min_x = min(x for _, _, _, x, _ in chiplets)
        chip_min_y = min(y for _, _, _, _, y in chiplets)
        chip_max_x = max(x + w for _, w, _, x, _ in chiplets)
        chip_max_y = max(y + h for _, _, h, _, y in chiplets)
        layout_w = chip_max_x - chip_min_x
        layout_h = chip_max_y - chip_min_y
        sink_mm, spreader_mm = read_heat_package_sizes(pkg_dir)
        size_parts = [
            f"Chip layout: {layout_w:.2f} × {layout_h:.2f} mm (centered)"
        ]
        if pkg_box is not None:
            size_parts.append(
                f"TIM / Substrate / C4-underfill: {pkg_box[0]:.2f} × {pkg_box[1]:.2f} mm")
        if spreader_mm is not None:
            size_parts.append(f"Heat spreader: {spreader_mm:.2f} mm")
        if sink_mm is not None:
            size_parts.append(f"Heat sink: {sink_mm:.2f} mm")
        size_caption = "   |   ".join(size_parts)

    # 只绘制芯粒：TIM（T*）块的轮廓与标签不再显示。硅桥先算出来，名称/功耗
    # 标签再避开它们摆放（优先芯粒左上角，其次右上角，最后才回落到中心）。
    bridge_rects = _plot_bridge_rects(chiplets, json_basename,
                                     layout_json, placement_dir)
    for name, w, h, x, y in chiplets:
        rect = patches.Rectangle((x, y), w, h, linewidth=1.5, edgecolor="black",
                                 facecolor="none", zorder=6)
        ax.add_patch(rect)
    _place_chip_labels(ax, fig, chiplets, power_dict, bridge_rects)

    # 叠加 EMIB 硅桥（只画 EMIBType 为 interfaceA / interfaceB 的，跳过 interfaceC）
    emib_color = (251 / 255.0, 229 / 255.0, 214 / 255.0)
    for rect_x, rect_y, rect_w, rect_h in bridge_rects:
        ax.add_patch(patches.Rectangle(
            (rect_x, rect_y),
            rect_w,
            rect_h,
            linewidth=1.0,
            edgecolor="black",
            facecolor=emib_color,
            alpha=0.95,
            zorder=5,
        ))

    out_dir = os.path.dirname(output_image)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    plt.tight_layout()
    if size_caption:
        # 图注紧贴 X 轴标签下方，而不是钉在画布底边。正方形画布里钉底边会
        # 在坐标轴和图注之间留下一条很大的空白。
        fig.canvas.draw()
        xlabel_bbox = ax.xaxis.label.get_window_extent(fig.canvas.get_renderer())
        caption_y = fig.transFigure.inverted().transform(
            (0, xlabel_bbox.y0))[1] - 0.012
        fig.text(0.5, caption_y, size_caption, ha="center", va="top",
                 fontsize=9)
    save_square(fig, output_image)
    plt.close()
    print(f"【成功】Layer {layer_num} 网格热图已保存至：{output_image}")


def plot_thermal_map(names, temps, coords, output_image="thermal_map.png"):
    """
    绘制热分布图，保存高清图片（兼容自定义输出路径）
    """
    if not temps or not coords:
        print("【错误】无有效温度数据，无法绘制热分布图！")
        return
    # 将坐标从米转换为毫米
    x = [c[0] * 1000 for c in coords]
    y = [c[1] * 1000 for c in coords]
    temps = np.array(temps)

    plt.figure(figsize=(12, 9))
    scatter = plt.scatter(x, y, c=temps, cmap='hot', s=300, edgecolors='white', alpha=0.8)
    cbar = plt.colorbar(scatter, shrink=0.8)
    cbar.set_label('Temperature (°C)', fontsize=12, rotation=270, labelpad=25)
    cbar.ax.tick_params(labelsize=10)
    plt.title('Chiplet Thermal Distribution Map (HotSpot 3D Grid Simulation)', fontsize=16, pad=20)
    plt.xlabel('X Coordinate (mm)', fontsize=14)
    plt.ylabel('Y Coordinate (mm)', fontsize=14)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    plt.grid(True, linestyle='--', alpha=0.5, color='gray')

    out_dir = os.path.dirname(output_image)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    plt.savefig(output_image, dpi=300, bbox_inches='tight', facecolor='white')
    plt.close()
    print(f"【成功】热分布图已保存至：{output_image}")

def run_hotspot_simulation(config_dir, json_basename):
    """
    执行 HotSpot 热仿真（参考 example3/run.sh）。
    所有配置文件在 config/{json名称}_config/ 下：
    - example.config, example.lcf, example.materials
    - {json名称}.ptrace, {json名称}.flp, {json名称}_sub.flp
    在 config_dir 下创建 output 子目录，将 .steady 和 .grid.steady 输出到该目录。
    :param config_dir: 配置目录路径（如 config/acend910_config）
    :param json_basename: JSON 基准名（如 acend910）
    :return: (steady_file, grid_steady_file) 或 (None, None)
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    hotspot_bin = os.path.join(script_dir, "..", "HotSpot", "hotspot")
    config_dir = os.path.normpath(os.path.abspath(config_dir))

    example_config = os.path.join(config_dir, "example.config")
    example_lcf = os.path.join(config_dir, "example.lcf")
    example_materials = os.path.join(config_dir, "example.materials")
    ptrace_file = os.path.join(config_dir, f"{json_basename}.ptrace")

    output_dir = os.path.join(config_dir, "output")
    os.makedirs(output_dir, exist_ok=True)
    steady_file = os.path.join(output_dir, f"{json_basename}.steady")
    grid_steady_file = os.path.join(output_dir, f"{json_basename}.grid.steady")

    check_files = [hotspot_bin, example_config, example_lcf, example_materials, ptrace_file]
    for f in check_files:
        if not os.path.exists(f):
            print(f"【错误】关键文件不存在 -> {f}")
            return None, None

    cmd = (
        f"{hotspot_bin} "
        f"-c example.config "
        f"-f {json_basename}.flp "
        f"-p {json_basename}.ptrace "
        f"-steady_file output/{json_basename}.steady "
        f"-grid_steady_file output/{json_basename}.grid.steady "
        f"-model_type grid "
        f"-detailed_3D on "
        f"-grid_layer_file example.lcf "
        f"-materials_file example.materials"
    )
    print(cmd)
    print(f"\n===== 开始HotSpot热仿真 =====")
    print(f"配置目录：{config_dir}")
    print(f"输出目录：{output_dir}")
    tmr_start = time.time()
    proc = subprocess.run(cmd, shell=True, cwd=config_dir, timeout=300)
    tmr_end = time.time()
    print(f"===== 热仿真执行完成，耗时：{round(tmr_end - tmr_start, 2)} 秒 =====\n")

    if proc.returncode != 0:
        print(f"【错误】HotSpot 执行失败 (returncode={proc.returncode})")
        return None, None
    return steady_file, grid_steady_file


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='HotSpot热仿真+芯粒热分布图绘制。配置文件在 config/{json名称}_config/ 下，输出在 output 子目录。'
    )
    parser.add_argument(
        '--config_dir',
        type=str,
        required=True,
        help='配置目录路径，如 config/acend910_config',
    )
    parser.add_argument(
        '--placement_dir',
        type=str,
        required=False,
        help='对应 JSON 布局所在的 placement 目录，如 output_gurobi_EMIB_chiplet_x_x_x_x/placement',
    )
    parser.add_argument(
        '--layout_json',
        type=str,
        required=False,
        help='实际参与仿真的布局 JSON 路径（文件名与配置名不同时使用；用于 EMIB 叠加）',
    )
    parser.add_argument(
        '--plot-only',
        action='store_true',
        help='复用已有的 .grid.steady，只重绘热图（不跑 HotSpot）',
    )
    args = parser.parse_args()

    config_dir = os.path.normpath(os.path.abspath(args.config_dir))
    placement_dir = (
        os.path.normpath(os.path.abspath(args.placement_dir))
        if args.placement_dir
        else None
    )
    layout_json = (
        os.path.normpath(os.path.abspath(args.layout_json))
        if args.layout_json
        else None
    )

    # 从目录名推导 json 基准名：acend910_config -> acend910
    dir_basename = os.path.basename(config_dir)
    if not dir_basename.endswith("_config"):
        print("【错误】config_dir 应以 _config 结尾，如 acend910_config")
        exit(1)
    json_basename = dir_basename[:-7]  # 去掉 "_config"

    if args.plot_only:
        grid_steady_file = os.path.join(
            config_dir, "output", f"{json_basename}.grid.steady")
        if not os.path.exists(grid_steady_file):
            print(f"【错误】找不到已有的 {grid_steady_file}，无法只重绘")
            exit(1)
    else:
        steady_file, grid_steady_file = run_hotspot_simulation(
            config_dir, json_basename)
        if not steady_file:
            print("【错误】热仿真执行失败，程序退出！")
            exit(1)

    output_dir = os.path.join(config_dir, "output")
    flp_file = os.path.join(config_dir, f"{json_basename}.flp")

    # Layer 2 网格热图（含 chiplet 框、名称、功耗和 EMIB 硅桥）
    layer2_image = os.path.join(output_dir, f"{json_basename}_layer2_grid_thermal.png")
    plot_grid_layer2_thermal_map(
        flp_file,
        grid_steady_file,
        layer2_image,
        json_basename=json_basename,
        placement_dir=placement_dir,
        layer_num=2,
        layout_json=layout_json,
    )
