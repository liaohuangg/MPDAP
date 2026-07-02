#!/bin/bash
set -euo pipefail

usage() {
    cat <<'EOF'
Usage:
  # Specify beta weights
  ./test_parameter.sh <beta_wire> <beta_area> <beta_aspect> <beta_power> [run_all_args...]

  # With no args, iterate over parameter_list in script
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
    "5 6 0.1 0"
    "5 6 0.1 1.7"
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

    local fmt_wire fmt_area fmt_aspect fmt_power suffix output_base
    fmt_wire="$(format_weight "$beta_wire")"
    fmt_area="$(format_weight "$beta_area")"
    fmt_aspect="$(format_weight "$beta_aspect")"
    fmt_power="$(format_weight "$beta_power")"
    suffix="${fmt_wire}_${fmt_area}_${fmt_aspect}_${fmt_power}"
    output_base="${project_root}/output_gurobi_EMIB_chiplet_${suffix}"

    mkdir -p "${output_base}/fig" "${output_base}/lp" "${output_base}/placement" "${output_base}/log"

    export EMIB_BETA_WIRE="$beta_wire"
    export EMIB_BETA_AREA="$beta_area"
    export EMIB_BETA_ASPECT="$beta_aspect"
    export EMIB_BETA_POWER="$beta_power"
    export EMIB_OUTPUT_BASE="$output_base"

    echo "[test_parameter] Beta wire=${beta_wire}, area=${beta_area}, aspect=${beta_aspect}, power=${beta_power}"
    echo "[test_parameter] Output base: ${output_base}"

    "${script_dir}/run_all_tests_EMIB_chiplet.sh" "$@"
}

if [[ $# -ge 4 ]]; then
    run_with_weights "$@"
else
    for entry in "${parameter_list[@]}"; do
        read -r bw ba bas bp <<<"$entry"
        run_with_weights "$bw" "$ba" "$bas" "$bp"
    done
fi
