#!/bin/bash
# TODO: add English comment
# TODO: add English comment
# TODO: add English comment
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# TODO: add English comment
OUTPUT_BASE_DIR="$SCRIPT_DIR/../../output_gurobi_EMIB_chiplet"
CONFIG_DIR="$(cd "$SCRIPT_DIR/../config" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/../data/output"
CONFIG_SUM_DIR="$SCRIPT_DIR/../config_sum"

# TODO: add English comment
mkdir -p "$CONFIG_SUM_DIR"

# TODO: add English comment
BENCHMARK_DIRS=($(ls -d "$OUTPUT_BASE_DIR"_* 2>/dev/null | sort))

# TODO: add English comment
if [ ${#BENCHMARK_DIRS[@]} -eq 0 ]; then
    if [ -d "$OUTPUT_BASE_DIR" ]; then
        BENCHMARK_DIRS=("$OUTPUT_BASE_DIR")
    else
echo "DEBUG"
        exit 1
    fi
fi

echo "DEBUG"
for dir in "${BENCHMARK_DIRS[@]}"; do
    echo "  - $dir"
done
echo "DEBUG"
echo ""

# TODO: add English comment
if [ -n "$1" ]; then
    # TODO: add English comment
echo "DEBUG"
    exit 1
fi

# TODO: add English comment
for bench_dir in "${BENCHMARK_DIRS[@]}"; do
    [ -d "$bench_dir" ] || continue
    bench_dir="$(cd "$bench_dir" && pwd)"
    
    # TODO: add English comment
    dir_name=$(basename "$bench_dir")
    suffix=""
    if [[ "$dir_name" == "output_gurobi_EMIB_chiplet" ]]; then
        suffix="default"
    else
        suffix="${dir_name#output_gurobi_EMIB_chiplet_}"
    fi
    
    echo "========================================="
echo "DEBUG"
echo "DEBUG"
echo "DEBUG"
    echo "========================================="
    
    # TODO: add English comment
    target_config_dir="$CONFIG_SUM_DIR/config_$suffix"
    mkdir -p "$target_config_dir"
    
    # TODO: add English comment
    PLACEMENT_DIR="$bench_dir/placement"
    
    if [ ! -d "$PLACEMENT_DIR" ]; then
echo "DEBUG"
        continue
    fi
    
    # TODO: add English comment
    JSON_LIST=("$PLACEMENT_DIR"/*.json)
    
    # TODO: add English comment
    if [ ${#JSON_LIST[@]} -eq 0 ] || [ ! -f "${JSON_LIST[0]}" ]; then
echo "DEBUG"
        continue
    fi
    
echo "DEBUG"
echo "DEBUG"
    
    # TODO: add English comment
echo "DEBUG"
    for json_path in "${JSON_LIST[@]}"; do
        [ -f "$json_path" ] || continue
        json_abs="$(cd "$(dirname "$json_path")" && pwd)/$(basename "$json_path")"
echo "DEBUG"
        python3 "$SCRIPT_DIR/gen_flp_trace.py" --json_path "$json_abs"
    done
    
    # TODO: add English comment
echo "DEBUG"
    PLACEMENT_DIR_ABS="$(cd "$PLACEMENT_DIR" && pwd)"
    for json_path in "${JSON_LIST[@]}"; do
        [ -f "$json_path" ] || continue
        base=$(basename "$json_path" .json)
        cfg_dir="$CONFIG_DIR/${base}_config"
        rm -rf "$cfg_dir/output"
        mkdir -p "$cfg_dir/output"
echo "DEBUG"
        python3 "$SCRIPT_DIR/test_thermal.py" --config_dir "$cfg_dir" --placement_dir "$PLACEMENT_DIR_ABS"
    done
    
    # TODO: add English comment
echo "DEBUG"
    if [ -d "$CONFIG_DIR" ]; then
        # TODO: add English comment
        cp -r "$CONFIG_DIR"/* "$target_config_dir"/ 2>/dev/null
echo "DEBUG"
        
        # TODO: add English comment
        if [ -d "$target_config_dir" ]; then
            file_count=$(find "$target_config_dir" -type f 2>/dev/null | wc -l)
echo "DEBUG"
        fi
    else
echo "DEBUG"
    fi
    
echo "DEBUG"
    echo ""
    
    # TODO: add English comment
    # rm -rf "$CONFIG_DIR"/*
    
done

echo "========================================="
echo "DEBUG"
echo "DEBUG"
echo "DEBUG"
for dir in "${BENCHMARK_DIRS[@]}"; do
    echo "  - $(basename "$dir")"
done
echo "========================================="

# TODO: add English comment
if [ -d "$CONFIG_SUM_DIR" ]; then
    echo ""
echo "DEBUG"
    ls -la "$CONFIG_SUM_DIR"
    
    # TODO: add English comment
    echo ""
echo "DEBUG"
    for subdir in "$CONFIG_SUM_DIR"/*; do
        if [ -d "$subdir" ]; then
            file_count=$(find "$subdir" -type f 2>/dev/null | wc -l)
echo "DEBUG"
        fi
    done
fi