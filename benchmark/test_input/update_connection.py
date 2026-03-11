#!/usr/bin/env python3
"""
通过命令行参数指定 JSON 文件，更新 connections 中的 EMIBType、EMIB_length、max_Reach_length 字段。
支持两种输入格式：
  1. 对象格式：{"node1": "A", "node2": "B", "wireCount": 200, "EMIBType": "interfaceA"}
  2. 数组格式（兼容旧版）：["A", "B", 200, 1] 会转换为对象格式

通过 -t MIN MAX EMIBType 指定范围：wireCount 在 (MIN, MAX) 内（大于 MIN 且小于 MAX）的边标注为对应的 EMIBType。
根据 EMIB.json 中对应接口的 LinearIODensity、max_Reach_length、AreaIODensity：
  - EMIB_length = wireCount / LinearIODensity
  - EMIB_max_width = max_Reach_length - 2 * (wireCount / AreaIODensity) / EMIB_length
  - EMIB_bump_width = (wireCount / AreaIODensity) / EMIB_length
"""
import argparse
import json
from pathlib import Path


def load_emib_types(emib_json_path: Path) -> dict:
    """从 EMIB.json 加载接口类型映射：name -> {LinearIODensity, max_Reach_length, AreaIODensity, ...}。仅读取 LinearIODensity。"""
    with open(emib_json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    emib_types = {}
    for item in data.get('EMIBTypes', []):
        name = item.get('name')
        if name:
            linear_io = item.get('LinearIODensity', 1)
            emib_types[name] = {
                'LinearIODensity': float(linear_io),
                'max_Reach_length': float(item.get('max_Reach_length', 5)),
                'AreaIODensity': float(item.get('AreaIODensity', 80)),
            }
    return emib_types


def update_connections(
    file_path: Path,
    ranges: list[tuple[float, float, str]],
    emib_types: dict,
) -> bool:
    """
    根据 wireCount 所在范围，更新每条连接的 EMIBType、EMIB_length、EMIB_max_width、EMIB_bump_width。
    ranges: [(min1, max1, type1), ...]，wireCount 满足 min < wireCount < max 时标注为对应 type。
    从 emib_types 中查找接口的 LinearIODensity、max_Reach_length、AreaIODensity：
      EMIB_length = wireCount / LinearIODensity
      EMIB_max_width = max_Reach_length - 2 * (wireCount / AreaIODensity) / EMIB_length
      EMIB_bump_width = (wireCount / AreaIODensity) / EMIB_length
    不在范围内则跳过，保持原样不改动。
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    if 'connections' not in data:
        print(f"  {file_path.name}: 没有 connections 字段，跳过")
        return False

    updated = False
    new_connections = []

    for conn in data['connections']:
        wire_count = None
        node1, node2 = None, None

        # 对象格式：{node1, node2, wireCount, EMIBType} 或含 from/to/IOwire 的变体
        if isinstance(conn, dict):
            wire_count = conn.get('wireCount') or conn.get('IOwire')
            node1 = conn.get('node1') or conn.get('from')
            node2 = conn.get('node2') or conn.get('to')
        # 数组格式：[src, dst, weight] 或 [src, dst, weight, conn_type]
        elif isinstance(conn, list) and len(conn) >= 3:
            node1, node2 = str(conn[0]), str(conn[1])
            wire_count = conn[2] if isinstance(conn[2], (int, float)) else None

        if wire_count is None or node1 is None or node2 is None:
            new_connections.append(conn)
            continue

        wire_count = float(wire_count)
        emib_type = None
        for lo, hi, typ in ranges:
            if lo < wire_count < hi:  # 大于 MIN 且小于 MAX
                emib_type = typ
                break

        if emib_type is None:
            # 不在范围内，跳过，保持原样
            new_connections.append(conn)
            continue

        # 从 EMIB.json 查找对应接口
        iface = emib_types.get(emib_type)
        if not iface:
            print(f"  警告: EMIB.json 中未找到接口 {emib_type}，跳过该连接")
            new_connections.append(conn)
            continue

        linear_io = iface['LinearIODensity']
        max_reach = iface['max_Reach_length']
        area_io_density = iface['AreaIODensity']
        emib_length = wire_count / linear_io if linear_io > 0 else 0.0
        emib_max_width = max_reach - 2 * (wire_count / area_io_density) / emib_length if emib_length > 0 else max_reach
        emib_bump_width = (wire_count / area_io_density) / emib_length if emib_length > 0 and area_io_density > 0 else 0.0

        # 在范围内，统一输出为对象格式，包含 EMIB_length、EMIB_max_width、EMIB_bump_width
        new_conn = {
            "node1": node1,
            "node2": node2,
            "wireCount": int(wire_count),
            "EMIBType": emib_type,
            "EMIB_length": round(emib_length, 4),
            "EMIB_max_width": round(emib_max_width, 4),
            "EMIB_bump_width": round(emib_bump_width, 4),
        }
        new_connections.append(new_conn)
        updated = True

    if updated:
        data['connections'] = new_connections
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
        print(f"  {file_path.name}: 已更新")
        return True
    else:
        print(f"  {file_path.name}: 无需更新（可能格式不匹配）")
        return False


def main():
    parser = argparse.ArgumentParser(
        description='根据 wireCount 所在范围，更新 JSON 中 connections 的 EMIBType。'
        '用法：-t 200 1000 interfaceA -t 0 199 interfaceB 表示 [200,1000]->interfaceA，[0,199]->interfaceB。',
    )
    parser.add_argument(
        '--files', '-f',
        nargs='+',
        metavar='FILE',
        help='要更新的 JSON 文件名（可多个）。相对路径相对于脚本所在目录；也可写绝对路径',
    )
    parser.add_argument(
        '-t', '--range',
        action='append',
        nargs=3,
        metavar=('MIN', 'MAX', 'EMIBType'),
        dest='ranges',
        help='范围：MIN < wireCount < MAX 则 EMIBType=EMIBType。不在范围内则跳过不改动。可多次指定，如 -t 201 1500 interfaceB -t 0 201 interfaceC',
    )
    parser.add_argument(
        '--emib', '-e',
        type=str,
        default='EMIB.json',
        help='EMIB 接口定义 JSON 路径（相对脚本目录，默认: EMIB.json）',
    )
    args = parser.parse_args()

    # 解析范围
    ranges_list: list[tuple[float, float, str]] = []
    if args.ranges:
        for r in args.ranges:
            lo, hi, typ = float(r[0]), float(r[1]), r[2]
            ranges_list.append((lo, hi, typ))

    if not ranges_list:
        parser.error('必须至少指定一个范围 -t MIN MAX EMIBType，例如 -t 201 1500 interfaceB -t 0 201 interfaceC')

    base_dir = Path(__file__).parent.resolve()

    # 加载 EMIB.json
    emib_path = base_dir / args.emib if not Path(args.emib).is_absolute() else Path(args.emib)
    if not emib_path.exists():
        parser.error(f'EMIB 文件不存在: {emib_path}')
    emib_types = load_emib_types(emib_path)

    if args.files:
        paths = []
        for name in args.files:
            p = Path(name)
            if not p.is_absolute():
                p = (base_dir / p).resolve()
            if not p.exists():
                print(f"  警告: 文件不存在，跳过: {name}")
                continue
            if p.suffix.lower() != '.json':
                print(f"  警告: 非 JSON 文件，跳过: {name}")
                continue
            paths.append(p)
        json_files = paths
        print(f"指定了 {len(json_files)} 个 JSON 文件")
    else:
        all_json = sorted(base_dir.glob('*.json'))
        json_files = [p for p in all_json if p.name != 'EMIB.json']
        print(f"未指定 --files，处理当前目录下 {len(json_files)} 个 JSON 文件（排除 EMIB.json）")

    print(f"范围: {ranges_list}, EMIB: {emib_path.name}\n")

    updated_count = 0
    for json_file in json_files:
        if update_connections(json_file, ranges=ranges_list, emib_types=emib_types):
            updated_count += 1

    print(f"\n完成！共更新了 {updated_count} 个文件")


if __name__ == '__main__':
    main()
