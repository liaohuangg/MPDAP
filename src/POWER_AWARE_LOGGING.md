# Power-Aware Optimization - Enhanced Logging

## 概述
当启用功耗感知优化时，ILP模型构建阶段会输出详细的日志信息，包括高功耗芯粒识别、相互距离约束和中心回避约束的详细信息。

## 输出内容

### 1. 高功耗芯粒识别阶段

**输出标记**: `[POWER_AWARE] Selected high-power chiplets`

显示：
- 选中的高功耗芯粒总数
- 功耗密度阈值（密度 = 功耗 / 面积）

**详细信息**:
```
[POWER_AWARE] Selected high-power chiplets: 5 (density threshold: 1.234567e-02)
[POWER_AWARE] High-power chiplets details:
  - Chiplet 0 (core0): Power=1.200000e+00W, Area=100.00, Density=1.200000e-02W/unit²
  - Chiplet 2 (core2): Power=0.950000e+00W, Area=80.00, Density=1.187500e-02W/unit²
  - Chiplet 4 (core4): Power=0.850000e+00W, Area=75.00, Density=1.133333e-02W/unit²
  - Chiplet 5 (core5): Power=0.800000e+00W, Area=70.00, Density=1.142857e-02W/unit²
  - Chiplet 8 (core8): Power=0.750000e+00W, Area=65.00, Density=1.153846e-02W/unit²
```

**信息含义**:
- `Chiplet ID (芯粒名称)`: 芯粒在模型中的索引和名称
- `Power`: 芯粒的功耗（单位：瓦特）
- `Area`: 芯粒的面积（单位：平方单位）
- `Density`: 功耗密度（功耗/面积）

### 2. 相互距离约束阶段（Mutual Distancing）

**输出标记**: `[POWER_AWARE] Mutual Distancing`

显示：
- 为多少个芯粒对添加了约束
- 每个芯粒对的详细信息

**详细信息**:
```
[POWER_AWARE] Mutual Distancing: Creating constraints for 10 chiplet pairs
  - Pair (0,2): [core0] 1.200000e+00W <-> [core2] 9.500000e-01W, weight=1.140000e+00
  - Pair (0,4): [core0] 1.200000e+00W <-> [core4] 8.500000e-01W, weight=1.020000e+00
  - Pair (0,5): [core0] 1.200000e+00W <-> [core5] 8.000000e-01W, weight=9.600000e-01
  - Pair (0,8): [core0] 1.200000e+00W <-> [core8] 7.500000e-01W, weight=9.000000e-01
  - Pair (2,4): [core2] 9.500000e-01W <-> [core4] 8.500000e-01W, weight=8.075000e-01
  ... (更多芯粒对)
[POWER_AWARE] Mutual Distancing: Added distance constraints for 10 chiplet pairs
```

**信息含义**:
- `Pair (i,j)`: 芯粒对的索引
- `[name] powerW <-> [name] powerW`: 两个芯粒的名称和功耗
- `weight`: 配对权重（= power_i × power_j）
  - 权重越大，两个芯粒的相互吸引力越强（优化器会让它们相距越远）

### 3. 中心回避约束阶段（Central Avoidance）

**输出标记**: `[POWER_AWARE] Central Avoidance`

显示：
- 为多少个高功耗芯粒添加了中心回避约束
- 每个芯粒的详细信息

**详细信息**:
```
[POWER_AWARE] Central Avoidance: Creating away-from-center constraints for 5 high-power chiplets
  - Chiplet 0 (core0): Power=1.200000e+00W, weight=1.440000e+00
  - Chiplet 2 (core2): Power=9.500000e-01W, weight=9.025000e-01
  - Chiplet 4 (core4): Power=8.500000e-01W, weight=7.225000e-01
  - Chiplet 5 (core5): Power=8.000000e-01W, weight=6.400000e-01
  - Chiplet 8 (core8): Power=7.500000e-01W, weight=5.625000e-01
[POWER_AWARE] Central Avoidance: Added away-from-center constraints for 5 high-power chiplets
```

**信息含义**:
- `Chiplet ID (芯粒名称)`: 芯粒索引和名称
- `Power`: 芯粒功耗（瓦特）
- `weight`: 配置权重（= power²）
  - 权重越大，芯粒被推离中心的力量越强

## 工作原理

### Mutual Distancing（相互距离）
- 为高功耗芯粒对添加距离约束
- 优化器会最大化高功耗芯粒之间的距离
- 目的：减少高功耗芯粒间的热耦合，降低局部过热

### Central Avoidance（中心回避）
- 为高功耗芯粒添加远离中心的约束
- 优化器会将高功耗芯粒推向芯片边缘
- 目的：减少中心区域的热积累

## 启用/禁用功耗感知优化

在代码中通过参数控制：

```python
ctx = build_placement_ilp_model(
    nodes=nodes,
    edges=edges,
    ...
    power_aware_enabled=True,              # 启用功耗感知
    mutual_distancing_enabled=True,        # 启用相互距离约束
    central_avoidance_enabled=True,        # 启用中心回避约束
)
```

或通过环境变量控制权重：

```bash
export EMIB_BETA_POWER=1.0      # 功耗感知项的权重
```

## 日志文件输出

所有这些日志都会被输出到标准输出（stdout），可以通过重定向捕捉到日志文件：

```bash
python3 script.py > build.log 2>&1
```

## 示例完整日志

```
[POWER_AWARE] Mutual Distancing: ENABLED
[POWER_AWARE] Central Avoidance: ENABLED
[POWER_AWARE] Power Aware Optimization: ENABLED

[POWER_AWARE] Selected high-power chiplets: 3 (density threshold: 1.500000e-02)
[POWER_AWARE] High-power chiplets details:
  - Chiplet 1 (A53_0): Power=2.000000e+00W, Area=150.00, Density=1.333333e-02W/unit²
  - Chiplet 3 (A72_0): Power=3.000000e+00W, Area=200.00, Density=1.500000e-02W/unit²
  - Chiplet 5 (GPU): Power=2.500000e+00W, Area=180.00, Density=1.388889e-02W/unit²

[POWER_AWARE] Mutual Distancing: Creating constraints for 3 chiplet pairs
  - Pair (1,3): [A53_0] 2.000000e+00W <-> [A72_0] 3.000000e+00W, weight=6.000000e+00
  - Pair (1,5): [A53_0] 2.000000e+00W <-> [GPU] 2.500000e+00W, weight=5.000000e+00
  - Pair (3,5): [A72_0] 3.000000e+00W <-> [GPU] 2.500000e+00W, weight=7.500000e+00
[POWER_AWARE] Mutual Distancing: Added distance constraints for 3 chiplet pairs

[POWER_AWARE] Central Avoidance: Creating away-from-center constraints for 3 high-power chiplets
  - Chiplet 1 (A53_0): Power=2.000000e+00W, weight=4.000000e+00
  - Chiplet 3 (A72_0): Power=3.000000e+00W, weight=9.000000e+00
  - Chiplet 5 (GPU): Power=2.500000e+00W, weight=6.250000e+00
[POWER_AWARE] Central Avoidance: Added away-from-center constraints for 3 high-power chiplets
```

## 调试技巧

1. **找出哪些芯粒被标记为高功耗**: 查看 `High-power chiplets details` 部分
2. **检查约束对数**:
   - Mutual Distancing 显示有多少个芯粒对被约束
   - Central Avoidance 显示有多少个芯粒被约束
3. **分析功耗权重**:
   - Mutual Distancing 的权重 = 芯粒1功耗 × 芯粒2功耗
   - Central Avoidance 的权重 = 芯粒功耗²
   - 权重越大，约束影响越大

## 性能影响

- 每个 Mutual Distancing 约束对添加 ~10 个额外变量
- 每个 Central Avoidance 约束添加 ~8 个额外变量
- 增加的约束数量会增加模型求解时间

可以通过只启用一种策略或调整权重来平衡性能和热管理效果。
