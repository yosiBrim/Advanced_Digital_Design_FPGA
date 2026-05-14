# Lab 08: FPGA Place & Route (Physical Implementation)

## 📌 Overview
This lab demonstrates the physical implementation phase of the FPGA design flow using the **Xilinx Vivado Design Suite**. Starting with a post-synthesis Verilog netlist of a 4-bit down-counter, the project is taken through the complete Place & Route (PnR) pipeline targeting the **Artix-7 (15T)** device.

## 🛠️ Key Engineering Skills Demonstrated
* **Netlist Implementation:** Importing and working with a synthesized gate-level Verilog netlist (`.v`).
* **Physical Constraints:** Utilizing Xilinx Design Constraints (`.xdc`) to define clock periods (10ns/100MHz) and manage input/output delays.
* **I/O Planning:** Mapping logical ports to physical package pins and configuring voltage standards.
* **Timing Closure & Analysis:** * Analyzing the Design Rule Check (DRC) reports.
  * Achieving timing closure on a fast speed grade (`-3`).
  * Investigating and documenting **Timing Violations** (Negative Slack) when targeting a slower speed grade (`-1`).

## 📂 Directory Structure
* **`netlist/`**: Contains the post-synthesis Verilog file (`CNTR.v`).
* **`constraints/`**: Contains the Vivado constraints file (`CNTR.xdc`).
* **`docs/`**: Contains the full lab report with physical device routing visualizations, timing summaries, and violation analysis.
