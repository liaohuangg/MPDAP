# EMIB_MP_thermal_placement

## Prerequisites

Before using this project, you need to install the **Gurobi** optimization solver. Please follow the steps below to install Gurobi:

- Gurobi Official Website: [https://www.gurobi.com/](https://www.gurobi.com/)

## Running EMIB_MP_thermal_placement

### Generating Layout Files

1. Configure the `parameter_list` in the `EMIB_MP_thermal_placement-main/tests/test_parameter.sh` file.
2. Run the `test_parameter.sh` script, which will solve for the corresponding layout files based on the configuration. These files will be stored in directories corresponding to the parameters, with paths like `output_gurobi_EMIB_chiplet_*_*_*_*`.

### Configuring the Thermal Simulation Environment

1. Compile the **HotSpot** simulation tool. You can refer to the `EMIB_MP_thermal_placement-main/thermal_sim/HotSpot/README.md` file for instructions, or visit [HotSpot Wiki - Getting Started](https://github.com/uvahotspot/HotSpot/wiki/Getting-Started) for more information.

### Running the Thermal Simulation

1. Run the `EMIB_MP_thermal_placement-main/thermal_sim/src/gen.sh` script to perform the thermal simulation.
2. The script will generate `config` files for all layout files, and the results will be stored in the `config_sum` folder, with filenames in the format `config_*_*_*_*`.
3. You can view the corresponding simulation results in `config_sum/config_*_*_*_*/***_config/output`.

