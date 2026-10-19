#!/usr/bin/env bash
# Re-run 5 seeds x 4 cases with the same settings as the 3600s batch.
# Four workers run in parallel, one per case; each worker runs seeds 0..4
# sequentially (same as the old per-seed batch order).
set -u
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RL_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${RL_DIR}"

PYTHON_BIN="${PYTHON_BIN:-python}"
TIME_LIMIT_SECONDS="${TIME_LIMIT_SECONDS:-3600}"
EPISODES="${EPISODES:-1000000}"
LOG_INTERVAL="${LOG_INTERVAL:-100}"
SAVE_INTERVAL="${SAVE_INTERVAL:-1000}"
GRID_RESOLUTION="${GRID_RESOLUTION:-auto}"
EXACT_ACTION_SLOTS="${EXACT_ACTION_SLOTS:-50000}"
THERMAL_INTP_SIZE="${THERMAL_INTP_SIZE:-100}"
SEEDS="${SEEDS:-0 1 2 3 4}"
CASE_LIST="${CASE_LIST:-acend910 cpu-dram hp6_m multigpu}"
BASE_PREFIX="${BASE_PREFIX:-rl_5x4_$(date +%Y%m%d_%H%M%S)}"

mkdir -p runs

echo "base_prefix=${BASE_PREFIX}"
echo "cases=${CASE_LIST}"
echo "seeds=${SEEDS}"
echo "time_limit_seconds=${TIME_LIMIT_SECONDS}"
echo "python=${PYTHON_BIN}"

copy_best_outputs() {
    local case_name="$1"
    local seed="$2"
    local run_dir="$3"
    local case_best_dir="runs/${BASE_PREFIX}_seed${seed}/best_layouts/${case_name}"
    mkdir -p "${case_best_dir}"

    local best_json=""
    local best_metrics=""
    local best_png=""
    local best_summary="${run_dir}/best_summary.json"
    local train_log="${run_dir}/train.log"

    if [[ -f "${best_summary}" ]]; then
        best_json="$("${PYTHON_BIN}" - "${best_summary}" <<'PY'
import json, sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    print(json.load(f).get("json", ""))
PY
)"
        best_metrics="$("${PYTHON_BIN}" - "${best_summary}" <<'PY'
import json, sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    print(json.load(f).get("metrics_json", ""))
PY
)"
        best_png="$("${PYTHON_BIN}" - "${best_summary}" <<'PY'
import json, sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    print(json.load(f).get("img", ""))
PY
)"
    else
        best_json="$(find "${run_dir}/results/top_layouts" -maxdepth 1 -type f -name "layout_best_*.json" ! -name "*.metrics.json" 2>/dev/null | sort | tail -n 1)"
        if [[ -n "${best_json}" ]]; then
            best_metrics="${best_json%.json}.metrics.json"
            best_png="${best_json%.json}.png"
        fi
    fi

    [[ -n "${best_json}" && -f "${best_json}" ]] && cp "${best_json}" "${case_best_dir}/best_layout.json"
    [[ -n "${best_metrics}" && -f "${best_metrics}" ]] && cp "${best_metrics}" "${case_best_dir}/best_metrics.json"
    [[ -n "${best_png}" && -f "${best_png}" ]] && cp "${best_png}" "${case_best_dir}/best_layout.png"
    [[ -f "${best_summary}" ]] && cp "${best_summary}" "${case_best_dir}/best_summary.json"
    [[ -f "${train_log}" ]] && cp "${train_log}" "${case_best_dir}/train.log"
    [[ -f "${run_dir}/progress.jsonl" ]] && cp "${run_dir}/progress.jsonl" "${case_best_dir}/progress.jsonl"

    printf "%s\t%s\t%s" \
        "${case_best_dir}/best_layout.json" \
        "${case_best_dir}/best_metrics.json" \
        "${case_best_dir}/best_layout.png"
}

run_case_worker() {
    local case_name="$1"
    local worker_log="runs/${BASE_PREFIX}_${case_name}_worker.log"
    : > "${worker_log}"

    for seed in ${SEEDS}; do
        local run_name="${BASE_PREFIX}_${case_name}_seed${seed}"
        local run_dir="${RL_DIR}/runs/${run_name}"
        local rows_dir="${RL_DIR}/runs/${BASE_PREFIX}_seed${seed}/rows"
        mkdir -p "${rows_dir}" "${run_dir}"

        local seed_log="${run_dir}/batch.log"
        local start_ts end_ts seconds exit_code status
        start_ts="$(date +%s)"

        {
            echo "======================================================================"
            echo "case=${case_name} seed=${seed} run=${run_name}"
            echo "started_at=$(date '+%Y-%m-%d %H:%M:%S')"
            echo "timeout=${TIME_LIMIT_SECONDS}s"
        } | tee -a "${seed_log}" "${worker_log}"

        MPLCONFIGDIR="/tmp/matplotlib-rl-${case_name}-${seed}" \
        timeout --preserve-status --signal=INT --kill-after=30s "${TIME_LIMIT_SECONDS}s" \
            "${PYTHON_BIN}" train.py \
                --name "${run_name}" \
                --json "examples/${case_name}.json" \
                --num_episodes "${EPISODES}" \
                --save_interval "${SAVE_INTERVAL}" \
                --log_interval "${LOG_INTERVAL}" \
                --grid_resolution "${GRID_RESOLUTION}" \
                --exact_action_slots "${EXACT_ACTION_SLOTS}" \
                --thermal_intp_size "${THERMAL_INTP_SIZE}" \
                --seed "${seed}" \
                --use_emib_length_adjacency \
                --enforce_bridge_overlap \
                --skip_thermal_tables \
            2>&1 | tee -a "${seed_log}" "${worker_log}"
        exit_code="${PIPESTATUS[0]}"
        end_ts="$(date +%s)"
        seconds=$((end_ts - start_ts))

        if [[ "${exit_code}" -eq 0 ]]; then
            status="ok"
        elif [[ "${exit_code}" -eq 124 || "${exit_code}" -eq 130 || "${exit_code}" -eq 143 ]]; then
            status="timeout"
        else
            status="failed"
        fi

        local best_paths best_json best_metrics best_png
        best_paths="$(copy_best_outputs "${case_name}" "${seed}" "${run_dir}")"
        best_json="$(printf "%s" "${best_paths}" | cut -f1)"
        best_metrics="$(printf "%s" "${best_paths}" | cut -f2)"
        best_png="$(printf "%s" "${best_paths}" | cut -f3)"

        printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" \
            "${case_name}" "${run_name}" "${status}" "${exit_code}" "${seconds}" \
            "${run_dir}" "${best_json}" "${best_metrics}" "${best_png}" \
            "${run_dir}/train.log" > "${rows_dir}/${case_name}.tsv"

        echo "finished_at=$(date '+%Y-%m-%d %H:%M:%S') status=${status} exit_code=${exit_code} seconds=${seconds}" \
            | tee -a "${seed_log}" "${worker_log}"
    done
}

worker_pids=()
for case_name in ${CASE_LIST}; do
    run_case_worker "${case_name}" &
    worker_pids+=("$!")
    echo "started worker case=${case_name} pid=$!"
done

failed=0
for pid in "${worker_pids[@]}"; do
    if ! wait "${pid}"; then
        failed=$((failed + 1))
    fi
done

# Merge per-case rows into the per-seed summary.tsv the organizer expects.
for seed in ${SEEDS}; do
    seed_dir="runs/${BASE_PREFIX}_seed${seed}"
    summary="${seed_dir}/summary.tsv"
    rows_dir="${seed_dir}/rows"
    printf "case\trun_name\tstatus\texit_code\tseconds\trun_dir\tbest_json\tbest_metrics\tbest_png\ttrain_log\n" > "${summary}"
    for case_name in ${CASE_LIST}; do
        [[ -f "${rows_dir}/${case_name}.tsv" ]] && cat "${rows_dir}/${case_name}.tsv" >> "${summary}"
    done
    {
        echo "batch_name=${BASE_PREFIX}"
        echo "finished_at=$(date '+%Y-%m-%d %H:%M:%S')"
        echo "summary=${summary}"
        cat "${summary}"
    } > "${seed_dir}/batch.log"
done

echo "all workers finished; failed_workers=${failed}"
echo "summary_dirs:"
for seed in ${SEEDS}; do echo "  runs/${BASE_PREFIX}_seed${seed}/summary.tsv"; done
