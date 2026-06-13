#!/bin/bash
# Usage: ./gen.sh [benchmark_output_dir]
#   - No argument: auto-discover and process matching output directories based on OUTPUT_BASE_DIR
#   - With argument: process only the specified output directory, e.g. /root/placement/MPDAP/output_central_EMIB_chiplet_5_6_01_08
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Force a non-interactive matplotlib backend for batch thermal plotting.
export MPLBACKEND=Agg
OUTPUT_BASE_DIR="$SCRIPT_DIR/../../output_central_EMIB_chiplet"
CONFIG_DIR="$(cd "$SCRIPT_DIR/../config" && pwd)"
CONFIG_SUM_DIR="$SCRIPT_DIR/../config_sum"

if [ -n "$1" ]; then
    INPUT_BENCH_DIR="$(cd "$1" 2>/dev/null && pwd)"
    if [ -z "$INPUT_BENCH_DIR" ] || [ ! -d "$INPUT_BENCH_DIR" ]; then
        echo "Error: specified output directory does not exist: $1"
        exit 1
    fi
    BENCHMARK_DIRS=("$INPUT_BENCH_DIR")
else
    OUTPUT_BASE_NAME="$(basename "$OUTPUT_BASE_DIR")"
    BENCHMARK_DIRS=($(ls -d "$OUTPUT_BASE_DIR"_* 2>/dev/null | sort))

    if [ ${#BENCHMARK_DIRS[@]} -eq 0 ]; then
        if [ -d "$OUTPUT_BASE_DIR" ]; then
            BENCHMARK_DIRS=("$OUTPUT_BASE_DIR")
        else
            echo "Error: no ${OUTPUT_BASE_NAME} output directories found"
            exit 1
        fi
    fi
fi

echo "The following directories will be processed:"
for dir in "${BENCHMARK_DIRS[@]}"; do
    echo "  - $dir"
done
echo "Total directories: ${#BENCHMARK_DIRS[@]}"
echo ""

# Process each benchmark output directory one by one
bench_index=0
TARGET_ROOT_DIR=""
for bench_dir in "${BENCHMARK_DIRS[@]}"; do
    [ -d "$bench_dir" ] || continue
    bench_dir="$(cd "$bench_dir" && pwd)"
    bench_index=$((bench_index + 1))
    
    dir_name=$(basename "$bench_dir")
    target_config_dir="$CONFIG_SUM_DIR/config_${dir_name}"
    TARGET_ROOT_DIR="$target_config_dir"
    mkdir -p "$target_config_dir"
    
    echo "========================================="
    echo "Start processing directory ${bench_index}/${#BENCHMARK_DIRS[@]}"
    echo "Benchmark directory: $bench_dir"
    echo "Output directory: $target_config_dir"
    echo "========================================="

    PLACEMENT_DIR="$bench_dir/placement"
    
    if [ ! -d "$PLACEMENT_DIR" ]; then
        echo "Warning: $PLACEMENT_DIR does not exist, skipping"
        continue
    fi
    
    JSON_LIST=("$PLACEMENT_DIR"/*.json)
    
    if [ ${#JSON_LIST[@]} -eq 0 ] || [ ! -f "${JSON_LIST[0]}" ]; then
        echo "Warning: no JSON files found in $PLACEMENT_DIR, skipping"
        continue
    fi
    
    echo "Found ${#JSON_LIST[@]} JSON files to process"
    echo "JSON directory: $PLACEMENT_DIR"
    
    echo "Steps 1/2/3: generate configs for each case, copy them to the final directory, and run thermal simulation..."
    PLACEMENT_DIR_ABS="$(cd "$PLACEMENT_DIR" && pwd)"
    for json_path in "${JSON_LIST[@]}"; do
        [ -f "$json_path" ] || continue
        json_abs="$(cd "$(dirname "$json_path")" && pwd)/$(basename "$json_path")"
        base=$(basename "$json_path" .json)
        src_cfg_dir="$CONFIG_DIR/${base}_config"
        dst_cfg_dir="$target_config_dir/${base}_config"

        echo "  - Processing: $(basename "$json_path")"
        python3 "$SCRIPT_DIR/gen_flp_trace.py" --json_path "$json_abs"

        if [ ! -d "$src_cfg_dir" ]; then
            echo "Warning: config directory $src_cfg_dir was not generated, skipping this case"
            continue
        fi

        rm -rf "$dst_cfg_dir"
        cp -a "$src_cfg_dir" "$dst_cfg_dir"

        rm -rf "$dst_cfg_dir/output"
        mkdir -p "$dst_cfg_dir/output"

        echo "    Config directory: $dst_cfg_dir"
        echo "    Start thermal simulation: $base"
        python3 "$SCRIPT_DIR/test_thermal.py" --config_dir "$dst_cfg_dir" --placement_dir "$PLACEMENT_DIR_ABS"
    done
    
    case_count=$(find "$target_config_dir" -mindepth 1 -maxdepth 1 -type d -name '*_config' 2>/dev/null | wc -l)
    echo "Finished processing $dir_name"
    echo "  - Generated case config directories: $case_count"
    echo ""
done

echo "========================================="
echo "All processing completed."
if [ ${#BENCHMARK_DIRS[@]} -eq 1 ]; then
    echo "Results saved in: $TARGET_ROOT_DIR"
else
    echo "Results saved in: $CONFIG_SUM_DIR"
fi
echo "Processed directory list:"
for dir in "${BENCHMARK_DIRS[@]}"; do
    echo "  - $(basename "$dir")"
done
echo "========================================="

# Show the final directory structure summary
if [ ${#BENCHMARK_DIRS[@]} -eq 1 ] && [ -d "$TARGET_ROOT_DIR" ]; then
    echo ""
    echo "Summary directory structure:"
    ls -la "$TARGET_ROOT_DIR"
    
    echo ""
    echo "File counts for each config directory:"
    for subdir in "$TARGET_ROOT_DIR"/*; do
        if [ -d "$subdir" ]; then
            file_count=$(find "$subdir" -type f 2>/dev/null | wc -l)
            echo "  - $(basename "$subdir"): $file_count files"
        fi
    done
fi
