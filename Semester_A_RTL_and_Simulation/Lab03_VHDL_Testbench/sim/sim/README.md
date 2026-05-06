# Simulation Scripts & Automation

This directory contains the scripts required to execute the VHDL testbench simulation.

## 📂 Automation Files
* **`simulate.do`**: A Tcl script designed for the VHDL-native verification flow.

## ⚙️ Execution Flow
Unlike Lab 02, the script here is simplified and focused on the hierarchy:
1. **Compilation:** Compiles both the RTL (`nnn.vhd`) and the Testbench (`TB_NNN.vhd`) into the `work` library.
2. **Elaboration:** Loads the testbench entity (`TB_NNN`) into the simulator.
3. **Signal Monitoring:** Adds both the testbench-level signals and the internal DUT signals to the wave window for full visibility.
4. **Execution:** Runs the simulation for a fixed duration (300ns), allowing the VHDL code to drive the logic.

## 🚀 Usage
To run the simulation in ModelSim:
```tcl
do simulate.do
