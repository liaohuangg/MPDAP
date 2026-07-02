import argparse
import os
import json
import subprocess
import time

import matplotlib.patches as patches
import matplotlib.pyplot as plt
from matplotlib.patheffects import withStroke
from matplotlib.colors import ListedColormap
import numpy as np

# 复用 FLP 生成时的布局逻辑，保证芯粒和硅桥的平移方式一致
from gen_flp_trace import load_json_layout, build_layout

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


def plot_grid_layer2_thermal_map(
    flp_file,
    grid_steady_file,
    output_image,
    json_basename=None,
    placement_dir=None,
    layer_num=2,
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

    fig, ax = plt.subplots(1, figsize=(10, 8))
    im = ax.imshow(
        temps_c,
        cmap=cmap,
        extent=(0, total_width, 0, total_length),
        origin="lower",
        aspect="auto",
    )
    max_c = float(np.max(temps_c))
    avg_c = float(np.mean(temps_c))
    im.set_clim(np.min(temps_c), max_c)
    cbar = fig.colorbar(im, ax=ax)
    # 与 EMIBplot.py 保持相近：轴标签 18，刻度 14
    cbar.set_label("Temperature (°C)", fontsize=18)
    cbar.ax.tick_params(labelsize=14)
    ax.set_title(
        f"Layer {layer_num} Grid Thermal Map (Max = {max_c:.2f} °C, AVG = {avg_c:.2f} °C)",
        fontsize=18,
    )
    ax.set_xlabel("X (mm)", fontsize=18)
    ax.set_ylabel("Y (mm)", fontsize=18)
    ax.tick_params(axis="both", labelsize=14)
    ax.set_xlabel("X (mm)")
    ax.set_ylabel("Y (mm)")

    # 叠加 chiplet 框及名称和功耗（facecolor='none' 保持热图可见）
    for name, w, h, x, y in chiplets:
        rect = patches.Rectangle((x, y), w, h, linewidth=1.5, edgecolor="black", facecolor="none")
        ax.add_patch(rect)
        cx, cy = x + w / 2, y + h / 2
        # 名称和功耗统一在芯粒中心，使用两行文本，保证完全居中
        power = power_dict.get(name, 0.0)
        power_text = f"{power:.2f}W" if power > 0 else ""
        if power_text:
            label = f"{name}\n{power_text}"
        else:
            label = name
        ax.text(
            cx,
            cy,
            label,
            ha="center",
            va="center",
            fontsize=14,
            fontweight="bold",
            color="white",
            linespacing=1.2,
            path_effects=[withStroke(linewidth=2, foreground="black")],
        )
    # 叠加 TIM 框及名称（可选，红色边框）
    for name, w, h, x, y in tims:
        rect = patches.Rectangle((x, y), w, h, linewidth=1, edgecolor="red", facecolor="none", alpha=0.7)
        ax.add_patch(rect)
        cx, cy = x + w / 2, y + h / 2
        ax.text(cx, cy, name, ha="center", va="center", fontsize=12, color="white",
                path_effects=[withStroke(linewidth=1, foreground="black")])

    # 叠加 EMIB 硅桥（只画 EMIBType 为 interfaceA / interfaceB 的，跳过 interfaceC，显示在最上层）
    if json_basename:
        try:
            script_dir = os.path.dirname(os.path.abspath(__file__))
            # 优先使用外部传入的 placement_dir（对应当前处理的 output_gurobi_EMIB_chiplet_* 目录）
            if placement_dir:
                json_dir = os.path.normpath(placement_dir)
            else:
                # 兼容旧用法：默认从 output_gurobi_EMIB_chiplet_5_6_01_0/placement 读取 JSON
                root_dir = os.path.normpath(os.path.join(script_dir, "..", ".."))
                json_dir = os.path.join(root_dir, "output_gurobi_EMIB_chiplet_5_6_01_0", "placement")
            json_path = os.path.join(json_dir, f"{json_basename}.json")
            if os.path.exists(json_path):
                with open(json_path, "r", encoding="utf-8") as f:
                    placement_data = json.load(f)

                # 用 gen_flp_trace 的逻辑重新算一遍 Chiplet 平移，以获得与 FLP 一致的平移量
                try:
                    orig_chiplets = load_json_layout(json_path)  # 原始 JSON 布局（mm）
                    shifted_chiplets, _ = build_layout(orig_chiplets)  # 平移 + 居中后的布局（mm）
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
                except Exception as e:
                    print(f"[警告] 计算 Chiplet 平移量失败，硅桥不做平移: {e}")
                    shift_x = shift_y = 0.0

                for conn in placement_data.get("connections", []):
                    emib_type = conn.get("EMIBType")
                    if emib_type == "interfaceC":
                        continue
                    if emib_type not in ("interfaceA", "interfaceB", None):
                        continue
                    x = conn.get("EMIB-x-position", 0.0)
                    y = conn.get("EMIB-y-position", 0.0)
                    w = conn.get("EMIB_width", 0.0)
                    h = conn.get("EMIB_length", 0.0)
                    # JSON 里的 EMIB 坐标和尺寸已经是 mm，这里叠加与 Chiplet 相同的平移量，保证相对位置一致
                    x_mm, y_mm = float(x) + shift_x, float(y) + shift_y
                    w_mm, h_mm = float(w), float(h)
                    if w_mm <= 0.0 or h_mm <= 0.0:
                        continue
                    # 硅桥颜色改回浅肉色 RGB(251,229,214)
                    emib_color = (251 / 255.0, 229 / 255.0, 214 / 255.0)
                    rect = patches.Rectangle(
                        (x_mm, y_mm),
                        w_mm,
                        h_mm,
                        linewidth=1.0,
                        edgecolor="black",
                        facecolor=emib_color,
                        alpha=0.95,
                        zorder=5,  # 硅桥放在最上层
                    )
                    ax.add_patch(rect)
            else:
                print(f"[警告] 未找到 placement JSON：{json_path}，跳过 EMIB 绘制")
        except Exception as e:
            print(f"[警告] 解析/绘制 EMIB 硅桥失败：{e}")

    out_dir = os.path.dirname(output_image)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    plt.tight_layout()
    plt.savefig(output_image, dpi=300, bbox_inches="tight", facecolor="white")
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
    args = parser.parse_args()

    config_dir = os.path.normpath(os.path.abspath(args.config_dir))
    placement_dir = (
        os.path.normpath(os.path.abspath(args.placement_dir))
        if args.placement_dir
        else None
    )

    # 从目录名推导 json 基准名：acend910_config -> acend910
    dir_basename = os.path.basename(config_dir)
    if not dir_basename.endswith("_config"):
        print("【错误】config_dir 应以 _config 结尾，如 acend910_config")
        exit(1)
    json_basename = dir_basename[:-7]  # 去掉 "_config"

    steady_file, grid_steady_file = run_hotspot_simulation(config_dir, json_basename)
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
    )
