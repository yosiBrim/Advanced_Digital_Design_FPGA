# Lab 02: Introduction to Logic Simulation (ModelSim)

## 📌 Overview
This lab introduces the standard industry workflow for logic simulation using **Mentor Graphics ModelSim**. The focus was shifted from syntax (Lab 01) to functional verification, using a simple Inverter (NOT gate) as the Design Under Test (DUT).

## 🛠️ Key Concepts Explored
* **Simulation Flow:** Mastering the `vlib` -> `vmap` -> `vcom` -> `vsim` sequence.
* **Signal Manipulation:** Using `force` and `run` commands to drive inputs and observe outputs.
* **Automation:** Writing and executing `.do` scripts to ensure repeatable and efficient simulation runs.
* **Debugging Tools:** Utilizing both the **Wave window** for visual timing analysis and the **Transcript/Examine** commands for immediate value verification.

## 📂 Design Description
The DUT (`nnn.vhd`) is a basic combinational inverter:
* **Input A:** Logic signal.
* **Output Y:** Inverted logic signal (NOT A).

## 🧪 Simulation Logic
The simulation validates the inverter's Truth Table:
1. Force `A = 1` -> Verify `Y = 0`.
2. Force `A = 0` -> Verify `Y = 1`.
These steps were automated using the `nnn.do` script, allowing for rapid verification of the logic.
