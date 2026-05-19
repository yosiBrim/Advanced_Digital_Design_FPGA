# Lab 01: Programmable vs. Hard-coded Counter Control

## 📌 Overview
This lab marks the beginning of Semester B, focusing on advanced control mechanisms using counters. The objective is to design and verify a versatile counter module that can operate in both hard-coded and programmable modes, serving as a fundamental controller for hardware-based state machines.

## 🛠️ Design & Methodology
* **RTL Design:** Developed a modular VHDL counter (`cntr.vhd`) capable of handling specific control sequences.
* **Verification:** Built a comprehensive testbench (`cntr_tb.vhd`) to validate timing accuracy and terminal count (TC) logic.
* **Synthesis:** Processed the design through Precision RTL to ensure hardware interpretability and initial area estimation.

## 📂 Directory Structure
* **`rtl/`**: VHDL source code of the counter logic.
* **`sim/`**: Simulation environment, including testbench and waveform logs.
* **`reports/`**: Synthesis logs and resource utilization data.
* **`docs/`**: Course syllabus and lab introductory requirements.
