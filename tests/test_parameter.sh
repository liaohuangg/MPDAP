#!/bin/bash
set -euo pipefail

usage() {
    cat <<'EOF'
Usage:
  # Run one parameter set.
  ./test_parameter.sh <beta_wire> <beta_area> <beta_aspect> <beta_power> \
      [mutual_distancing_enabled central_avoidance_enabled] \
      [--timeout TOTAL_SECONDS] \
      [--stage1 GAP TIME_LIMIT_SECONDS] \
      [--stage2 GAP TIME_LIMIT_SECONDS] \
      [--stage3 GAP [IGNORED_TIME_LIMIT_SECONDS]] \
      [run_all_test_name]

Arguments:
  beta_wire, beta_area, beta_aspect, beta_power
      Objective weights exported as EMIB_BETA_WIRE, EMIB_BETA_AREA,
      EMIB_BETA_ASPECT, and EMIB_BETA_POWER.

  mutual_distancing_enabled, central_avoidance_enabled
      Optional boolean flags for build_placement_ilp_model().
      Accepted values: true/false, 1/0, yes/no. Defaults: true true.

  --timeout TOTAL_SECONDS
      Total wall-clock budget for the three-phase solve. This is passed to
      _run_three_phase_solve(total_time_limit=...). Default: 3600.

  --stage1 GAP TIME_LIMIT_SECONDS
      Phase 1 MIP gap and maximum phase-1 time. Defaults: 0.0 300.

  --stage2 GAP TIME_LIMIT_SECONDS
      Phase 2 MIP gap and maximum phase-2 time. Defaults: 0.3 300.

  --stage3 GAP [IGNORED_TIME_LIMIT_SECONDS]
      Phase 3 MIP gap. Phase 3 time is always the remaining --timeout budget.
      A second value is accepted only for compatibility and is ignored.
      Default gap: 0.8.

  run_all_test_name
      Optional test name forwarded to run_all_tests_EMIB_chiplet.sh, such as
      multigpu. If omitted, run_all_tests_EMIB_chiplet.sh uses its default set.

Examples:
  ./test_parameter.sh 5 6 0.1 1.7 true false \
      --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8 3600

  ./test_parameter.sh 5 6 0.1 1.7 true false \
      --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8 multigpu

  # With no args, iterate over parameter_list in this script.
EOF
}

parameter_list=(
    # "1 2 0.1 0"
    # "1 3 0.1 0"
    # "1 4 0.1 0"
    # "1 5 0.1 0"
    # "2 3 0.1 0"
    # "2 5 0.1 0"
    # "3 4 0.1 0"
    # "3 5 0.1 0"
    # "4 5 0.1 0"
    # "1 6 0.1 0"
    # "1 7 0.1 0"
    # "1 8 0.1 0"
    # "1 9 0.1 0"
    # "2 7 0.1 0"
    # "3 7 0.1 0"
    # "3 8 0.1 0"
    # "4 7 0.1 0"
    # "4 9 0.1 0"
    # "5 6 0.1 1"
    # "5 6 0.1 0.5"
    # "5 6 0.1 1.5"
    # "5 6 0.1 2.5"
    # "5 6 0.1 2.5"
    # "5 6 0.1 2.4"
    # "5 6 0.1 2.3"
    # "5 6 0.1 2.2"
    # "5 6 0.1 2.1"
    # "5 6 0.1 2"
    # "5 6 0.1 1.9"
    # "5 6 0.1 1.8"
    # "5 6 0.1 0 true true --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8"
    "5 6 0.1 0 false false --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8"
    "5 6 0.1 1.7 true true --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8"
    "5 6 0.1 1.7 true false --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8"
    "5 6 0.1 1.7 false true --timeout 3600 --stage1 0.0 300 --stage2 0.3 300 --stage3 0.8"
    # "5 6 0.1 0 false false --timeout 3600 --stage1 0.0 3600 --stage2 0.3 300 --stage3 0.8"
    # "5 6 0.1 0 false false --timeout 3600 --stage1 0.3 3600 --stage2 0.3 300 --stage3 0.8"
    # "5 6 0.1 0"
    # "5 6 0.1 1.6"
    # "5 6 0.1 1.5"
    # "5 6 0.1 1.4"
    # "5 6 0.1 1.3"
    # "5 6 0.1 1.2"
    # "5 6 0.1 1.1"
    # "5 6 0.1 1"
    # "5 6 0.1 0.9"
    # "5 6 0.1 0.8"
    # "5 6 0.1 0.7"
    # "5 6 0.1 0.6"
    # "5 6 0.1 0.5"
    # "5 6 0.1 0.4"
    # "5 6 0.1 0.3"
    # "5 6 0.1 0.2"
    # "5 6 0.1 0.1"

    # "5 7 0.1 0"
    # "2 1 0.1 0"
    # "3 1 0.1 0"
    # "4 1 0.1 0"
    # "5 1 0.1 0"
    # "3 2 0.1 0"
    # "5 2 0.1 0"
    # "4 3 0.1 0"
    # "5 3 0.1 0"
    # "5 4 0.1 0"
    # "6 1 0.1 0"
    # "7 1 0.1 0"
    # "8 1 0.1 0"
    # "9 1 0.1 0"
    # "7 2 0.1 0"
    # "7 3 0.1 0"
    # "8 3 0.1 0"
    # "7 4 0.1 0"
    # "9 4 0.1 0"
    # "6 5 0.1 0"
    # "7 5 0.1 0"
    # "5 6 0.1 0.5"
    #  "5 6 0.1 1"
    #  "5 6 0.1 1.5"
    #  "5 6 0.1 2"
    #  "5 6 0.1 2.5"
    #  "5 6 0.1 3"
    #  "5 6 0.1 3.5"
    #  "5 6 0.1 4"
    #  "5 6 0.1 4.5"
    #  "5 6 0.1 5"
    #  "5 6 0.1 5.5"
    # "1 100 0.1 0"
    # "100 1 0.1 0"
)

format_weight() {
    local raw="$1"
    local sign=""
    if [[ "$raw" == -* ]]; then
        sign="m"
        raw="${raw#-}"
    fi

    if [[ "$raw" == *.* ]]; then
        local int_part="${raw%%.*}"
        local frac_part="${raw#*.}"
        local combined="${int_part}${frac_part}"
        if [[ -z "$int_part" || "$int_part" == "0" ]]; then
            combined="0${frac_part}"
        fi
    else
        combined="$raw"
    fi

    combined="${combined//./}"
    [[ -z "$combined" ]] && combined="0"
    echo "${sign}${combined}"
}

is_bool_arg() {
    case "$1" in
        true|false|TRUE|FALSE|True|False|1|0|yes|no|YES|NO|Yes|No)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

normalize_bool() {
    case "$1" in
        true|TRUE|True|1|yes|YES|Yes)
            echo "true"
            ;;
        false|FALSE|False|0|no|NO|No)
            echo "false"
            ;;
        *)
            echo "Error: expected boolean true/false, got '$1'" >&2
            exit 1
            ;;
    esac
}

format_bool() {
    case "$(normalize_bool "$1")" in
        true)
            echo "1"
            ;;
        false)
            echo "0"
            ;;
    esac
}

is_number() {
    [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]
}

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(cd "${script_dir}/.." && pwd)"

if [[ $# -gt 0 && $# -lt 4 ]]; then
    usage
    exit 1
fi

run_with_weights() {
    local beta_wire="$1"
    local beta_area="$2"
    local beta_aspect="$3"
    local beta_power="$4"
    shift 4 || true

    local mutual_distancing_enabled="true"
    local central_avoidance_enabled="true"
    if [[ $# -ge 2 ]] && is_bool_arg "$1" && is_bool_arg "$2"; then
        mutual_distancing_enabled="$(normalize_bool "$1")"
        central_avoidance_enabled="$(normalize_bool "$2")"
        shift 2 || true
    elif [[ $# -ge 1 ]] && is_bool_arg "$1"; then
        echo "Error: mutual_distancing_enabled and central_avoidance_enabled must be provided together." >&2
        usage
        exit 1
    fi

    unset EMIB_SOLVER_TIMEOUT
    unset EMIB_SOLVER_STAGE1_GAP
    unset EMIB_SOLVER_STAGE1_TIME
    unset EMIB_SOLVER_STAGE2_GAP
    unset EMIB_SOLVER_STAGE2_TIME
    unset EMIB_SOLVER_STAGE3_GAP

    local forwarded_args=()
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --timeout)
                if [[ $# -lt 2 ]]; then
                    echo "Error: --timeout requires one value." >&2
                    exit 1
                fi
                export EMIB_SOLVER_TIMEOUT="$2"
                shift 2
                ;;
            --stage1)
                if [[ $# -lt 3 ]]; then
                    echo "Error: --stage1 requires GAP and TIME_LIMIT." >&2
                    exit 1
                fi
                export EMIB_SOLVER_STAGE1_GAP="$2"
                export EMIB_SOLVER_STAGE1_TIME="$3"
                shift 3
                ;;
            --stage2)
                if [[ $# -lt 3 ]]; then
                    echo "Error: --stage2 requires GAP and TIME_LIMIT." >&2
                    exit 1
                fi
                export EMIB_SOLVER_STAGE2_GAP="$2"
                export EMIB_SOLVER_STAGE2_TIME="$3"
                shift 3
                ;;
            --stage3)
                if [[ $# -lt 2 ]]; then
                    echo "Error: --stage3 requires GAP." >&2
                    exit 1
                fi
                export EMIB_SOLVER_STAGE3_GAP="$2"
                shift 2
                if [[ $# -gt 0 && "$1" != --* ]] && is_number "$1"; then
                    # Accepted for compatibility; stage 3 uses remaining timeout.
                    shift
                fi
                ;;
            *)
                forwarded_args+=("$1")
                shift
                ;;
        esac
    done

    local fmt_wire fmt_area fmt_aspect fmt_power fmt_mutual fmt_central suffix output_base
    fmt_wire="$(format_weight "$beta_wire")"
    fmt_area="$(format_weight "$beta_area")"
    fmt_aspect="$(format_weight "$beta_aspect")"
    fmt_power="$(format_weight "$beta_power")"
    fmt_mutual="$(format_bool "$mutual_distancing_enabled")"
    fmt_central="$(format_bool "$central_avoidance_enabled")"
    suffix="${fmt_wire}_${fmt_area}_${fmt_aspect}_${fmt_power}_md${fmt_mutual}_ca${fmt_central}"
    output_base="${project_root}/output_gurobi_EMIB_chiplet_${suffix}"

    mkdir -p "${output_base}/fig" "${output_base}/lp" "${output_base}/placement" "${output_base}/log"

    export EMIB_BETA_WIRE="$beta_wire"
    export EMIB_BETA_AREA="$beta_area"
    export EMIB_BETA_ASPECT="$beta_aspect"
    export EMIB_BETA_POWER="$beta_power"
    export EMIB_MUTUAL_DISTANCING_ENABLED="$mutual_distancing_enabled"
    export EMIB_CENTRAL_AVOIDANCE_ENABLED="$central_avoidance_enabled"
    export EMIB_OUTPUT_BASE="$output_base"

    echo "[test_parameter] Beta wire=${beta_wire}, area=${beta_area}, aspect=${beta_aspect}, power=${beta_power}"
    echo "[test_parameter] Mutual distancing=${mutual_distancing_enabled}, central avoidance=${central_avoidance_enabled}"
    echo "[test_parameter] Solver timeout=${EMIB_SOLVER_TIMEOUT:-3600}, stage1=${EMIB_SOLVER_STAGE1_GAP:-0.0}/${EMIB_SOLVER_STAGE1_TIME:-300}, stage2=${EMIB_SOLVER_STAGE2_GAP:-0.3}/${EMIB_SOLVER_STAGE2_TIME:-300}, stage3=${EMIB_SOLVER_STAGE3_GAP:-0.8}/remaining"
    echo "[test_parameter] Output base: ${output_base}"

    "${script_dir}/run_all_tests_EMIB_chiplet.sh" "${forwarded_args[@]}"
}

if [[ $# -ge 4 ]]; then
    run_with_weights "$@"
else
    for entry in "${parameter_list[@]}"; do
        read -r -a params <<<"$entry"
        run_with_weights "${params[@]}"
    done
fi
