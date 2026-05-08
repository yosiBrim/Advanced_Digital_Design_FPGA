# Lab 05: VHDL Synthesis & FPGA Technology Mapping

## 📌 Overview
This lab shifts the focus from functional verification to **Logic Synthesis**. Using the **Mentor Graphics Precision** synthesizer, the 4-bit and 64-bit counter designs were transformed into a physical netlist targeted for the **Xilinx Artix-7 FPGA** (Device: 15T, Speed Grade: -3).

## 🛠️ Key Concepts Explored
* **Synthesis Flow:** Converting abstract RTL code into a technology-specific gate-level representation (LUTs, Registers).
* **RTL vs. Technology Schematics:** Analyzing the difference between a logical representation of the design and its actual physical mapping on the FPGA fabric.
* **Synthesis Reports Analysis:** * **Area Report:** Inspecting the utilization of CLB resources (Flip-Flops and LUTs).
    * **Timing Report:** Verifying that the design meets the 100MHz clock frequency requirement.
* **Design Scaling:** Comparing the hardware resource consumption of a 4-bit counter versus a 64-bit counter.

## 📂 Directory Structure
* **/rtl**: VHDL source files for the scalable counter designs.
* **/reports**: Critical synthesis outputs including Area, Timing, and Synthesis Logs.
* **/docs**: Lab requirements, tutorials, and the final analytical report.
