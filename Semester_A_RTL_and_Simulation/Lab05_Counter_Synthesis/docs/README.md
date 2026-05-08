# Lab 05 Documentation: Synthesis & Resource Analysis

This directory contains the formal requirements, preparation exercises, and the final synthesis report for the Counter Synthesis lab. 

## 📁 Included Documents

* **`Ex05-Counter_Synthesis.pdf`**: The official lab specifications, detailing the target FPGA device (Xilinx Artix-7 15T) and the required synthesis constraints (100MHz clock frequency).
* **`Lab05_Preparation_Work.pdf`**: Pre-lab analysis of the VHDL code, identifying the inferred hardware components (e.g., deducing the number of Flip-Flops and LUTs required before running the synthesizer).
* **`Lab05_Final_Summary_Report.pdf`**: The comprehensive final submission.

## 🎯 Report Highlights
The final report encapsulates the core deliverables of a hardware engineer's synthesis flow:
1. **RTL Schematics:** Visual representation of the logical components (Counters, Comparators).
2. **Technology Schematics:** The physical mapping to Xilinx Artix-7 primitives (FDCE registers, LUT4).
3. **Area Reports:** A detailed breakdown of the logic resources consumed by both the 4-bit and 64-bit counter variations.
4. **Timing Reports:** Verification that the synthesized design successfully meets the 100MHz (10ns period) timing constraints without setup/hold violations.
