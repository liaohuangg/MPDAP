#!/usr/bin/env bash
set -u
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RL_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${RL_DIR}"

DEFAULT_PYTHON="/home/user/miniconda3/envs/chipdiffusion/bin/python"
if [[ -x "${DEFAULT_PYTHON}" ]]; then
    PYTHON_BIN="${PYTHON_BIN:-${DEFAULT_PYTHON}}"
else
    PYTHON_BIN="${PYTHON_BIN:-python}"
fi

TIME_LIMIT_SECONDS="${TIME_LIMIT_SECONDS:-3600}"
EPISODES="${EPISODES:-1000000}"
LOG_INTERVAL="${LOG_INTERVAL:-100}"
SAVE_INTERVAL="${SAVE_INTERVAL:-1000}"
GRID_RESOLUTION="${GRID_RESOLUTION:-auto}"
EXACT_ACTION_SLOTS="${EXACT_ACTION_SLOTS:-50000}"
THERMAL_INTP_SIZE="${THERMAL_INTP_SIZE:-100}"
RUN_PREFIX="${RUN_PREFIX:-allcases_3600s_$(date +%Y%m%d_%H%M%S)}"
SKIP_THERMAL_TABLES="${SKIP_THERMAL_TABLES:-0}"
FORCE_THERMAL_TABLES="${FORCE_THERMAL_TABLES:-0}"
MPLCONFIGDIR="${MPLCONFIGDIR:-/tmp/matplotlib-${USER:-user}}"
export MPLCONFIGDIR

mkdir -p runs
mkdir -p "${MPLCONFIGDIR}"

BATCH_DIR="${RL_DIR}/runs/${RUN_PREFIX}"
BEST_DIR="${BATCH_DIR}/best_layouts"
BATCH_LOG="${BATCH_DIR}/batch.log"
SUMMARY="${BATCH_DIR}/summary.tsv"

mkdir -p "${BEST_DIR}"

{
    echo "batch_name=${RUN_PREFIX}"
    echo "started_at=$(date '+%Y-%m-%d %H:%M:%S')"
    echo "python=${PYTHON_BIN}"
    echo "time_limit_seconds=${TIME_LIMIT_SECONDS}"
    echo "episodes=${EPISODES}"
    echo "log_interval=${LOG_INTERVAL}"
    echo "save_interval=${SAVE_INTERVAL}"
    echo "grid_resolution=${GRID_RESOLUTION}"
    echo "exact_action_slots=${EXACT_ACTION_SLOTS}"
    echo "thermal_intp_size=${THERMAL_INTP_SIZE}"
    echo "skip_thermal_tables=${SKIP_THERMAL_TABLES}"
    echo "force_thermal_tables=${FORCE_THERMAL_TABLES}"
    echo "case_names=${CASE_NAMES:-ALL}"
    echo "mplconfigdir=${MPLCONFIGDIR}"
    echo "batch_dir=${BATCH_DIR}"
    echo "best_dir=${BEST_DIR}"
    echo
} | tee "${BATCH_LOG}"

printf "case\trun_name\tstatus\texit_code\tseconds\trun_dir\tbest_json\tbest_metrics\tbest_png\ttrain_log\n" > "${SUMMARY}"

if [[ -n "${CASE_NAMES:-}" ]]; then
    CASE_FILES=()
    for case_name in ${CASE_NAMES//,/ }; do
        case_name="${case_name%.json}"
        CASE_FILES+=("examples/${case_name}.json")
    done
else
    mapfile -t CASE_FILES < <(find examples -maxdepth 1 -type f -name "*.json" | sort)
fi

if [[ "${#CASE_FILES[@]}" -eq 0 ]]; then
    echo "No cases found under ${RL_DIR}/examples" | tee -a "${BATCH_LOG}"
    exit 1
fi

copy_best_outputs() {
    local case_name="$1"
    local run_dir="$2"
    local case_best_dir="${BEST_DIR}/${case_name}"
    mkdir -p "${case_best_dir}"

    local best_json=""
    local best_metrics=""
    local best_png=""
    local best_summary="${run_dir}/best_summary.json"
    local train_log="${run_dir}/train.log"
    local progress="${run_dir}/progress.jsonl"

    if [[ -f "${best_summary}" ]]; then
        best_json="$("${PYTHON_BIN}" - "${best_summary}" <<'PY'
import json
import sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    data = json.load(f)
print(data.get("json", ""))
PY
)"
        best_metrics="$("${PYTHON_BIN}" - "${best_summary}" <<'PY'
import json
import sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    data = json.load(f)
print(data.get("metrics_json", ""))
PY
)"
        best_png="$("${PYTHON_BIN}" - "${best_summary}" <<'PY'
import json
import sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    data = json.load(f)
print(data.get("img", ""))
PY
)"
    else
        best_json="$(find "${run_dir}/results/top_layouts" -maxdepth 1 -type f -name "layout_best_*.json" ! -name "*.metrics.json" 2>/dev/null | sort | tail -n 1)"
        if [[ -n "${best_json}" ]]; then
            best_metrics="${best_json%.json}.metrics.json"
            best_png="${best_json%.json}.png"
        fi
    fi

    if [[ -n "${best_json}" && -f "${best_json}" ]]; then
        cp "${best_json}" "${case_best_dir}/best_layout.json"
    fi
    if [[ -n "${best_metrics}" && -f "${best_metrics}" ]]; then
        cp "${best_metrics}" "${case_best_dir}/best_metrics.json"
    fi
    if [[ -n "${best_png}" && -f "${best_png}" ]]; then
        cp "${best_png}" "${case_best_dir}/best_layout.png"
    fi
    if [[ -f "${best_summary}" ]]; then
        cp "${best_summary}" "${case_best_dir}/best_summary.json"
    fi
    if [[ -f "${train_log}" ]]; then
        cp "${train_log}" "${case_best_dir}/train.log"
    fi
    if [[ -f "${progress}" ]]; then
        cp "${progress}" "${case_best_dir}/progress.jsonl"
    fi

    printf "%s\t%s\t%s" \
        "${case_best_dir}/best_layout.json" \
        "${case_best_dir}/best_metrics.json" \
        "${case_best_dir}/best_layout.png"
}

total="${#CASE_FILES[@]}"
index=0
failed=0

for case_json in "${CASE_FILES[@]}"; do
    index=$((index + 1))
    case_name="$(basename "${case_json}" .json)"
    run_name="${RUN_PREFIX}_${case_name}"
    run_dir="${RL_DIR}/runs/${run_name}"
    train_log="${run_dir}/train.log"

    if [[ ! -f "${case_json}" ]]; then
        echo "[${index}/${total}] case=${case_name} skipped: file not found: ${case_json}" | tee -a "${BATCH_LOG}"
        printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" \
            "${case_name}" "${run_name}" "skipped_missing" "0" "0" "${run_dir}" "" "" "" "${train_log}" \
            >> "${SUMMARY}"
        continue
    fi

    if ! "${PYTHON_BIN}" - "${case_json}" <<'PY'
import json
import sys
with open(sys.argv[1], "r", encoding="utf-8") as f:
    data = json.load(f)
sys.exit(0 if (data.get("chiplets") or data.get("dies")) else 1)
PY
    then
        echo "[${index}/${total}] case=${case_name} skipped: JSON has no chiplets/dies schema" | tee -a "${BATCH_LOG}"
        printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" \
            "${case_name}" "${run_name}" "skipped_schema" "0" "0" "${run_dir}" "" "" "" "${train_log}" \
            >> "${SUMMARY}"
        continue
    fi

    cmd=(
        "${PYTHON_BIN}" train.py
        --name "${run_name}"
        --json "${case_json}"
        --num_episodes "${EPISODES}"
        --save_interval "${SAVE_INTERVAL}"
        --log_interval "${LOG_INTERVAL}"
        --grid_resolution "${GRID_RESOLUTION}"
        --exact_action_slots "${EXACT_ACTION_SLOTS}"
        --thermal_intp_size "${THERMAL_INTP_SIZE}"
    )

    if [[ "${SKIP_THERMAL_TABLES}" == "1" ]]; then
        cmd+=(--skip_thermal_tables)
    fi
    if [[ "${FORCE_THERMAL_TABLES}" == "1" ]]; then
        cmd+=(--force_thermal_tables)
    fi

    echo "======================================================================" | tee -a "${BATCH_LOG}"
    echo "[${index}/${total}] case=${case_name} run=${run_name}" | tee -a "${BATCH_LOG}"
    echo "timeout=${TIME_LIMIT_SECONDS}s" | tee -a "${BATCH_LOG}"
    echo "command: ${cmd[*]}" | tee -a "${BATCH_LOG}"
    start_ts="$(date +%s)"

    timeout --preserve-status --signal=INT --kill-after=30s "${TIME_LIMIT_SECONDS}s" "${cmd[@]}" 2>&1 | tee -a "${BATCH_LOG}"
    exit_code="${PIPESTATUS[0]}"
    end_ts="$(date +%s)"
    seconds=$((end_ts - start_ts))

    if [[ "${exit_code}" -eq 0 ]]; then
        status="ok"
    elif [[ "${exit_code}" -eq 124 || "${exit_code}" -eq 130 || "${exit_code}" -eq 143 ]]; then
        status="timeout"
    else
        status="failed"
        failed=$((failed + 1))
    fi

    best_paths="$(copy_best_outputs "${case_name}" "${run_dir}")"
    best_json="$(printf "%s" "${best_paths}" | cut -f1)"
    best_metrics="$(printf "%s" "${best_paths}" | cut -f2)"
    best_png="$(printf "%s" "${best_paths}" | cut -f3)"

    printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" \
        "${case_name}" "${run_name}" "${status}" "${exit_code}" "${seconds}" "${run_dir}" \
        "${best_json}" "${best_metrics}" "${best_png}" "${train_log}" \
        >> "${SUMMARY}"

    echo "[${index}/${total}] status=${status} exit_code=${exit_code} seconds=${seconds}" | tee -a "${BATCH_LOG}"
    echo "best_dir=${BEST_DIR}/${case_name}" | tee -a "${BATCH_LOG}"
done

{
    echo
    echo "finished_at=$(date '+%Y-%m-%d %H:%M:%S')"
    echo "summary=${SUMMARY}"
    echo "batch_log=${BATCH_LOG}"
    echo "best_dir=${BEST_DIR}"
    echo "failed=${failed}"
} | tee -a "${BATCH_LOG}"

if [[ "${failed}" -ne 0 ]]; then
    exit 1
fi
