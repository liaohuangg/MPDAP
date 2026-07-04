import json
import sys
from pathlib import Path
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

# ======================
# 参数读取（手动填写）
# ======================
# 填总路径：该目录下每个 .json 都会画图
json_path = r"E:\chip\iamge\output_gurobi_EMIB_chiplet_5_6_01_0\placement"

# 输出目录手动填写（必填）
output_dir = "E:\\chip\\iamge\\plot_5_6_01_0"

# test_input 根目录：用于补充 interfaceC 连接
TEST_INPUT_DIR = r"E:\chip\iamge\output\thermal-placement-main\thermal-placement-main\benchmark\test_input"

if len(sys.argv) >= 2:
    json_path = sys.argv[1]
if len(sys.argv) >= 3:
    output_dir = sys.argv[2]
if len(sys.argv) >= 4:
    TEST_INPUT_DIR = sys.argv[3]

# ======================
# 样式配置
# ======================
CHIPLET_BORDER_COLOR = "black"
CHIPLET_BORDER_WIDTH = 1.5
CHIPLET_FILL_COLOR = (226 / 255, 240 / 255, 217 / 255)      # RGB(226,240,217)
EMIB_BUMP_COLOR = (248 / 255, 203 / 255, 173 / 255)         # RGB(248,203,173)
CENTER_DOT_COLOR = (165 / 255, 165 / 255, 165 / 255)        # RGB(165,165,165)
CENTER_DOT_SIZE = 36
LINK_LINE_COLOR = (237 / 255, 125 / 255, 49 / 255)          # RGB(237,125,49)
INTERFACEC_LINE_COLOR = (157 / 255, 195 / 255, 230 / 255)   # RGB(157,195,230)
LINK_LINE_WIDTH = 1.8
SHORT_DASH_STYLE = (0, (1.5, 1.5))
CHIPLET_LABEL_FONTSIZE = 16
AXIS_LABEL_FONTSIZE = 22
AXIS_TICK_FONTSIZE = 18


def _r3(v):
    return round(float(v), 3)


def pick_label_position(x, y, w, h, avoid_points):
    # 在芯粒内部四个角附近选一个点，尽量远离硅桥中心和连线端点
    margin_x = max(0.15, w * 0.08)
    margin_y = max(0.15, h * 0.08)
    candidates = [
        (x + margin_x, y + h - margin_y, "left", "top"),       # 左上
        (x + w - margin_x, y + h - margin_y, "right", "top"),   # 右上
        (x + margin_x, y + margin_y, "left", "bottom"),         # 左下
        (x + w - margin_x, y + margin_y, "right", "bottom"),    # 右下
    ]

    if not avoid_points:
        return candidates[0]

    best = candidates[0]
    best_score = -1.0
    for cx, cy, ha, va in candidates:
        score = min((cx - px) ** 2 + (cy - py) ** 2 for px, py in avoid_points)
        if score > best_score:
            best_score = score
            best = (cx, cy, ha, va)
    return best


def draw_one_json(current_json_path: Path, output_path: Path):
    with open(current_json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    test_input_path = Path(TEST_INPUT_DIR) / current_json_path.name
    test_input_data = {}
    if test_input_path.exists():
        with open(test_input_path, "r", encoding="utf-8") as f:
            test_input_data = json.load(f)

    all_left = [c["x-position"] for c in data["chiplets"]]
    all_bot = [c["y-position"] for c in data["chiplets"]]
    all_right = [c["x-position"] + c["width"] for c in data["chiplets"]]
    all_top = [c["y-position"] + c["height"] for c in data["chiplets"]]

    bbox_min_x, bbox_min_y = min(all_left), min(all_bot)
    bbox_max_x, bbox_max_y = max(all_right), max(all_top)
    bbox_w = bbox_max_x - bbox_min_x
    bbox_h = bbox_max_y - bbox_min_y
    side = _r3(max(bbox_w, bbox_h))
    shift_x = -bbox_min_x + (side - bbox_w) / 2
    shift_y = -bbox_min_y + (side - bbox_h) / 2
    x_min, x_max = 0, side
    y_min, y_max = 0, side

    fig, ax = plt.subplots(figsize=(8, 6))
    chiplet_dict = {}

    # 先收集每个芯粒应避开的点（硅桥中心、interfaceC 对端芯粒中心）
    label_avoid_points = {c["name"]: [] for c in data["chiplets"]}
    for conn in data["connections"]:
        if conn.get("EMIBType") == "interfaceC":
            continue
        node1 = conn.get("node1")
        node2 = conn.get("node2")
        if node1 not in label_avoid_points or node2 not in label_avoid_points:
            continue
        bx = conn.get("EMIB-x-position", 0) + conn.get("EMIB_width", 0) / 2
        by = conn.get("EMIB-y-position", 0) + conn.get("EMIB_length", 0) / 2
        label_avoid_points[node1].append((bx, by))
        label_avoid_points[node2].append((bx, by))

    for conn in test_input_data.get("connections", []):
        if conn.get("EMIBType") != "interfaceC":
            continue
        node1 = conn.get("node1")
        node2 = conn.get("node2")
        if node1 not in chiplet_dict or node2 not in chiplet_dict:
            continue
        x1, y1, w1, h1 = chiplet_dict[node1]
        x2, y2, w2, h2 = chiplet_dict[node2]
        c1x, c1y = x1 + w1 / 2, y1 + h1 / 2
        c2x, c2y = x2 + w2 / 2, y2 + h2 / 2
        label_avoid_points[node1].append((c2x, c2y))
        label_avoid_points[node2].append((c1x, c1y))

    for c in data["chiplets"]:
        x = c["x-position"] + shift_x
        y = c["y-position"] + shift_y
        w = c["width"]
        h = c["height"]
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
        ax.plot(
            x + w / 2,
            y + h / 2,
            marker="o",
            markersize=CENTER_DOT_SIZE ** 0.5,
            color=CENTER_DOT_COLOR,
            markeredgewidth=0,
        )

        label_x, label_y, label_ha, label_va = pick_label_position(
            x, y, w, h, label_avoid_points.get(c["name"], [])
        )
        label = f"{c['name']}" if power_val else c["name"]
        ax.text(
            label_x,
            label_y,
            label,
            ha=label_ha,
            va=label_va,
            fontsize=CHIPLET_LABEL_FONTSIZE,
            weight="bold",
            color="#333333",
        )
        chiplet_dict[c["name"]] = (x, y, w, h)

    # 画 EMIB 硅桥和两条连到桥中心的虚线
    for conn in data["connections"]:
        if conn.get("EMIBType") == "interfaceC":
            continue

        node1 = conn.get("node1")
        node2 = conn.get("node2")
        if node1 not in chiplet_dict or node2 not in chiplet_dict:
            continue

        x = conn.get("EMIB-x-position", 0) + shift_x
        y = conn.get("EMIB-y-position", 0) + shift_y
        w = conn.get("EMIB_width", 0)
        h = conn.get("EMIB_length", 0)
        bridge_center_x = x + w / 2
        bridge_center_y = y + h / 2

        x1, y1, w1, h1 = chiplet_dict[node1]
        x2, y2, w2, h2 = chiplet_dict[node2]
        chip1_center_x = x1 + w1 / 2
        chip1_center_y = y1 + h1 / 2
        chip2_center_x = x2 + w2 / 2
        chip2_center_y = y2 + h2 / 2

        ax.plot(
            [chip1_center_x, bridge_center_x],
            [chip1_center_y, bridge_center_y],
            linestyle=SHORT_DASH_STYLE,
            color=LINK_LINE_COLOR,
            linewidth=LINK_LINE_WIDTH,
        )
        ax.plot(
            [chip2_center_x, bridge_center_x],
            [chip2_center_y, bridge_center_y],
            linestyle=SHORT_DASH_STYLE,
            color=LINK_LINE_COLOR,
            linewidth=LINK_LINE_WIDTH,
        )

        rect = Rectangle(
            (x, y),
            w,
            h,
            facecolor=EMIB_BUMP_COLOR,
            edgecolor=CHIPLET_BORDER_COLOR,
            linewidth=CHIPLET_BORDER_WIDTH,
        )
        ax.add_patch(rect)
        ax.plot(
            bridge_center_x,
            bridge_center_y,
            marker="o",
            markersize=CENTER_DOT_SIZE ** 0.5,
            color=CENTER_DOT_COLOR,
            markeredgewidth=0,
        )

    # 画 interfaceC 直连虚线（来自 TEST_INPUT 同名文件）
    seen_pairs = set()
    for conn in test_input_data.get("connections", []):
        if conn.get("EMIBType") != "interfaceC":
            continue
        node1 = conn.get("node1")
        node2 = conn.get("node2")
        if node1 not in chiplet_dict or node2 not in chiplet_dict:
            continue
        pair_key = tuple(sorted([node1, node2]))
        if pair_key in seen_pairs:
            continue
        seen_pairs.add(pair_key)

        x1, y1, w1, h1 = chiplet_dict[node1]
        x2, y2, w2, h2 = chiplet_dict[node2]
        chip1_center_x = x1 + w1 / 2
        chip1_center_y = y1 + h1 / 2
        chip2_center_x = x2 + w2 / 2
        chip2_center_y = y2 + h2 / 2

        ax.plot(
            [chip1_center_x, chip2_center_x],
            [chip1_center_y, chip2_center_y],
            linestyle=SHORT_DASH_STYLE,
            color=INTERFACEC_LINE_COLOR,
            linewidth=LINK_LINE_WIDTH,
        )

    ax.set_aspect("equal")
    ax.set_xlim(x_min, x_max)
    ax.set_ylim(y_min, y_max)
    ax.set_xlabel("X (mm)", fontsize=AXIS_LABEL_FONTSIZE)
    ax.set_ylabel("Y (mm)", fontsize=AXIS_LABEL_FONTSIZE)
    ax.tick_params(axis="both", which="major", labelsize=AXIS_TICK_FONTSIZE)
    background_color = (166 / 255, 166 / 255, 166 / 255)  # RGB(166,166,166)
    ax.set_facecolor(background_color)
    fig.patch.set_facecolor("white")
    plt.tight_layout()

    base_name = current_json_path.stem
    out_path_png = output_path / f"{base_name}_layout.png"
    out_path_svg = output_path / f"{base_name}_layout.svg"
    plt.savefig(out_path_png, dpi=150, bbox_inches="tight")
    plt.savefig(out_path_svg, dpi=300, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved PNG: {out_path_png}")
    print(f"Saved SVG: {out_path_svg}")


if not output_dir.strip():
    raise ValueError("请先在脚本中填写 output_dir 路径。")

json_root = Path(json_path)
if not json_root.exists() or not json_root.is_dir():
    raise ValueError(f"json_path 不是有效目录: {json_root}")

output_path = Path(output_dir)
output_path.mkdir(parents=True, exist_ok=True)

json_files = sorted(json_root.glob("*.json"))
if not json_files:
    raise ValueError(f"目录下没有找到 json 文件: {json_root}")

for jf in json_files:
    draw_one_json(jf, output_path)

print("图片批量生成完成")
