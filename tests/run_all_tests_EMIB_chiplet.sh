#!/bin/bash
#
# Batch test script: run batch_test_solutions_EMIB_chiplet.py on all JSON files under benchmark/test_input
#
# Usage:
#     ./run_all_tests_EMIB.sh [test_name]   # run single test
#     ./run_all_tests_EMIB.sh               # run all tests when no arg

OUTPUT_BASE="${EMIB_OUTPUT_BASE:-../output_gurobi_EMIB_chiplet}"
log_dir="$OUTPUT_BASE/log"
fig_dir="$OUTPUT_BASE/fig"

# Create log dir if not exists
mkdir -p "$log_dir"

if [ $# -gt 0 ]; then
    case "$1" in
        # "acend910")
        #     if [ -f "$log_dir/acend910.log" ]; then rm -f "$log_dir/acend910.log"; fi
        #     touch "$log_dir/acend910.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files acend910.json > "$log_dir/acend910.log" 2>&1
        #     echo "acend910.log solve done"
        #     ;;
        # "cpu-dram")
        #     if [ -f "$log_dir/cpu-dram.log" ]; then rm -f "$log_dir/cpu-dram.log"; fi
        #     touch "$log_dir/cpu-dram.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files cpu-dram.json > "$log_dir/cpu-dram.log" 2>&1
        #     echo "cpu-dram.log solve done"
        #     ;;
        # "hp11_m")
        #     if [ -f "$log_dir/hp11_m.log" ]; then rm -f "$log_dir/hp11_m.log"; fi
        #     touch "$log_dir/hp11_m.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files hp11_m.json > "$log_dir/hp11_m.log" 2>&1
        #     echo "hp11_m.log solve done"
        #     ;;
        # "hp6_m")
        #     if [ -f "$log_dir/hp6_m.log" ]; then rm -f "$log_dir/hp6_m.log"; fi
        #     touch "$log_dir/hp6_m.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files hp6_m.json > "$log_dir/hp6_m.log" 2>&1
        #     echo "hp6_m.log solve done"
        #     ;;
        # "hp8_m")
        #     if [ -f "$log_dir/hp8_m.log" ]; then rm -f "$log_dir/hp8_m.log"; fi
        #     touch "$log_dir/hp8_m.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files hp8_m.json > "$log_dir/hp8_m.log" 2>&1
        #     echo "hp8_m.log solve done"
        #     ;;
        "multigpu")
            if [ -f "$log_dir/multigpu.log" ]; then rm -f "$log_dir/multigpu.log"; fi
            touch "$log_dir/multigpu.log"
            python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files multigpu.json > "$log_dir/multigpu.log" 2>&1
            echo "multigpu.log solve done"
            ;;
        # "xerox6_m")
        #     if [ -f "$log_dir/xerox6_m.log" ]; then rm -f "$log_dir/xerox6_m.log"; fi
        #     touch "$log_dir/xerox6_m.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files xerox6_m.json > "$log_dir/xerox6_m.log" 2>&1
        #     echo "xerox6_m.log solve done"
        #     ;;
        # "xerox7_m")
        #     if [ -f "$log_dir/xerox7_m.log" ]; then rm -f "$log_dir/xerox7_m.log"; fi
        #     touch "$log_dir/xerox7_m.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files xerox7_m.json > "$log_dir/xerox7_m.log" 2>&1
        #     echo "xerox7_m.log solve done"
        #     ;;
        # "xerox8_m")
        #     if [ -f "$log_dir/xerox8_m.log" ]; then rm -f "$log_dir/xerox8_m.log"; fi
        #     touch "$log_dir/xerox8_m.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files xerox8_m.json > "$log_dir/xerox8_m.log" 2>&1
        #     echo "xerox8_m.log solve done"
        #     ;;
        # "sys_micro150")
        #     if [ -f "$log_dir/sys_micro150.log" ]; then rm -f "$log_dir/sys_micro150.log"; fi
        #     touch "$log_dir/sys_micro150.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files sys_micro150.json > "$log_dir/sys_micro150.log" 2>&1
        #     echo "sys_micro150.log solve done"
        #     ;;
        # "syn1")
        #     if [ -f "$log_dir/syn1.log" ]; then rm -f "$log_dir/syn1.log"; fi
        #     touch "$log_dir/syn1.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn1.json > "$log_dir/syn1.log" 2>&1
        #     echo "syn1.log solve done"
        #     ;;
        # "syn2")
        #     if [ -f "$log_dir/syn2.log" ]; then rm -f "$log_dir/syn2.log"; fi
        #     touch "$log_dir/syn2.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn2.json > "$log_dir/syn2.log" 2>&1
        #     echo "syn2.log solve done"
        #     ;;
        # "syn3")
        #     if [ -f "$log_dir/syn3.log" ]; then rm -f "$log_dir/syn3.log"; fi
        #     touch "$log_dir/syn3.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn3.json > "$log_dir/syn3.log" 2>&1
        #     echo "syn3.log solve done"
        #     ;;
        # "syn4")
        #     if [ -f "$log_dir/syn4.log" ]; then rm -f "$log_dir/syn4.log"; fi
        #     touch "$log_dir/syn4.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn4.json > "$log_dir/syn4.log" 2>&1
        #     echo "syn4.log solve done"
        #     ;;
        # "syn5")
        #     if [ -f "$log_dir/syn5.log" ]; then rm -f "$log_dir/syn5.log"; fi
        #     touch "$log_dir/syn5.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn5.json > "$log_dir/syn5.log" 2>&1
        #     echo "syn5.log solve done"
        #     ;;
        # "syn6")
        #     if [ -f "$log_dir/syn6.log" ]; then rm -f "$log_dir/syn6.log"; fi
        #     touch "$log_dir/syn6.log"
        #     python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn6.json > "$log_dir/syn6.log" 2>&1
        #     echo "syn6.log solve done"
        #     ;;
        *)
            echo "Error: unknown test name: $1"
            echo ""
            echo "Available tests:"
            echo "  acend910, cpu-dram, hp11_m, hp6_m, hp8_m, multigpu,"
            echo "  xerox6_m, xerox7_m, xerox8_m,"
            echo "  syn1, syn2, syn3, syn4, syn5, syn6"
            exit 1
            ;;
    esac
else
    # No arg: run all tests
    # if [ -f "$log_dir/acend910.log" ]; then rm -f "$log_dir/acend910.log"; fi
    # touch "$log_dir/acend910.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files acend910.json > "$log_dir/acend910.log" 2>&1
    # echo "acend910.log solve done"
    
    # if [ -f "$log_dir/cpu-dram.log" ]; then rm -f "$log_dir/cpu-dram.log"; fi
    # touch "$log_dir/cpu-dram.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files cpu-dram.json > "$log_dir/cpu-dram.log" 2>&1
    # echo "cpu-dram.log solve done"
    
    # if [ -f "$log_dir/hp6_m.log" ]; then rm -f "$log_dir/hp6_m.log"; fi
    # touch "$log_dir/hp6_m.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files hp6_m.json > "$log_dir/hp6_m.log" 2>&1
    # echo "hp6_m.log solve done"
    
    # if [ -f "$log_dir/hp8_m.log" ]; then rm -f "$log_dir/hp8_m.log"; fi
    # touch "$log_dir/hp8_m.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files hp8_m.json > "$log_dir/hp8_m.log" 2>&1
    # echo "hp8_m.log solve done"
    
    # if [ -f "$log_dir/multigpu.log" ]; then rm -f "$log_dir/multigpu.log"; fi
    # touch "$log_dir/multigpu.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files multigpu.json > "$log_dir/multigpu.log" 2>&1
    # echo "multigpu.log solve done"
    
    # if [ -f "$log_dir/xerox6_m.log" ]; then rm -f "$log_dir/xerox6_m.log"; fi
    # touch "$log_dir/xerox6_m.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files xerox6_m.json > "$log_dir/xerox6_m.log" 2>&1
    # echo "xerox6_m.log solve done"
    
    # if [ -f "$log_dir/xerox7_m.log" ]; then rm -f "$log_dir/xerox7_m.log"; fi
    # touch "$log_dir/xerox7_m.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files xerox7_m.json > "$log_dir/xerox7_m.log" 2>&1
    # echo "xerox7_m.log solve done"
    
    # if [ -f "$log_dir/xerox8_m.log" ]; then rm -f "$log_dir/xerox8_m.log"; fi
    # touch "$log_dir/xerox8_m.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files xerox8_m.json > "$log_dir/xerox8_m.log" 2>&1
    # echo "xerox8_m.log solve done"

    # if [ -f "$log_dir/hp11_m.log" ]; then rm -f "$log_dir/hp11_m.log"; fi
    # touch "$log_dir/hp11_m.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files hp11_m.json > "$log_dir/hp11_m.log" 2>&1
    # echo "hp11_m.log solve done"

    # if [ -f "$log_dir/sys_micro150.log" ]; then rm -f "$log_dir/sys_micro150.log"; fi
    # touch "$log_dir/sys_micro150.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files sys_micro150.json > "$log_dir/sys_micro150.log" 2>&1
    # echo "sys_micro150.log solve done"

    # if [ -f "$log_dir/syn1.log" ]; then rm -f "$log_dir/syn1.log"; fi
    # touch "$log_dir/syn1.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn1.json > "$log_dir/syn1.log" 2>&1
    # echo "syn1.log solve done"

    if [ -f "$log_dir/syn2.log" ]; then rm -f "$log_dir/syn2.log"; fi
    touch "$log_dir/syn2.log"
    python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn2.json > "$log_dir/syn2.log" 2>&1
    echo "syn2.log solve done"

    # if [ -f "$log_dir/syn3.log" ]; then rm -f "$log_dir/syn3.log"; fi
    # touch "$log_dir/syn3.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn3.json > "$log_dir/syn3.log" 2>&1
    # echo "syn3.log solve done"

    # if [ -f "$log_dir/syn4.log" ]; then rm -f "$log_dir/syn4.log"; fi
    # touch "$log_dir/syn4.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn4.json > "$log_dir/syn4.log" 2>&1
    # echo "syn4.log solve done"

    # if [ -f "$log_dir/syn5.log" ]; then rm -f "$log_dir/syn5.log"; fi
    # touch "$log_dir/syn5.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn5.json > "$log_dir/syn5.log" 2>&1
    # echo "syn5.log solve done"

    # if [ -f "$log_dir/syn6.log" ]; then rm -f "$log_dir/syn6.log"; fi
    # touch "$log_dir/syn6.log"
    # python3 batch_test_solutions_EMIB_chiplet.py --min-shared-length 1.5  --files syn6.json > "$log_dir/syn6.log" 2>&1
    # echo "syn6.log solve done"
fi