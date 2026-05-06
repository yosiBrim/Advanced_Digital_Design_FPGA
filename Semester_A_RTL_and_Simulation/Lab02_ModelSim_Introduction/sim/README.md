# Simulation Automation (ModelSim DO Scripts)

This directory contains the automation scripts for Lab 02. The use of `.do` files (Tcl scripts) ensures that the simulation environment is repeatable, consistent, and efficient.

## 📁 File Descriptions
* **`nnn.do`**: A Tcl script that automates the entire simulation lifecycle for the Inverter (DUT).

## 🛠️ The Simulation Flow
The script executes the following industry-standard sequence:
1. **Library Creation (`vlib`)**: Initializes the `work` library directory.
2. **Mapping (`vmap`)**: Connects the logical `work` library to the physical directory.
3. **Compilation (`vcom`)**: Compiles the VHDL source code from the `../rtl/` directory.
4. **Initialization (`vsim`)**: Loads the compiled entity into the simulator with optimization visibility.
5. **Waveform Setup (`add wave`)**: Automatically adds the relevant signals to the Wave window.
6. **Stimulus Execution (`force` & `run`)**: Drives the inputs with specific logic values and advances simulation time.
7. **Verification (`examine`)**: Outputs signal values directly to the transcript for quick debugging.

## 🚀 How to Run
To execute the automated simulation:
1. Open ModelSim.
2. Change the directory to this `sim` folder.
3. In the ModelSim transcript, type:
   ```tcl
   do nnn.do
