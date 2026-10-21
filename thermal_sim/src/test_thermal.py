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
    CASE_MAX_INTERPOSER_MM,
    load_json_layout,
    build_layout,
    package_square_side_mm,
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


# 标签之间至少留出的空隙（mm），避免两行文字在画布上连成片。
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

    bridge_rects holds EMIB bridges as (x, y, w, h) in mm, the same form as
    the chip rectangles; inside everything is converted to
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
    """Layer 2 网格热图：网格温度 + 芯粒框 + 名称/功耗 + EMIB 硅桥。

    出图统一走 generate_grid_heatmaps_with_bridge.plot_heatmap（字体、版面、
    硅桥朝向、标签避让都只有那一份实现）。
    """
    # 延迟导入：generate_grid_heatmaps_with_bridge 模块级依赖本模块的
    # _place_chip_labels / _emib_rect，模块级导入会形成循环。
    from generate_grid_heatmaps_with_bridge import plot_heatmap

    json_path = None
    if layout_json:
        json_path = os.path.normpath(layout_json)
    elif json_basename:
        if placement_dir:
            json_dir = os.path.normpath(placement_dir)
        else:
            root_dir = os.path.normpath(os.path.join(
                os.path.dirname(os.path.abspath(__file__)), "..", ".."))
            json_dir = os.path.join(root_dir,
                                    "output_gurobi_EMIB_chiplet_5_6_01_0",
                                    "placement")
        candidate = os.path.join(json_dir, f"{json_basename}.json")
        json_path = candidate if os.path.exists(candidate) else None

    plot_heatmap(flp_file, grid_steady_file, output_image, layer_num, json_path)


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
        f"-detailed_3D off "
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
    parser.add_argument(
        '--no-plot',
        action='store_true',
        help='只跑 HotSpot，不画热图（批处理改由 generate_grid_heatmaps_with_bridge.py 出图）',
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

    if args.no_plot:
        print("已指定 --no-plot，跳过热图绘制")
        exit(0)

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
