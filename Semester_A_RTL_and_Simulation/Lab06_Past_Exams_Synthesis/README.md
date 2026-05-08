# Lab 06: Combinational Logic Synthesis (Past Exams)

## 📌 Overview
This repository section contains solutions to four architectural design questions taken from final academic exams. Each sub-project involves designing a specific combinational logic block in VHDL and taking it through the synthesis flow using Mentor Graphics Precision.

## 🛠️ Components Designed
This lab serves as a mini-library of standard digital components:
1. **Arithmetic Logic Unit (ALU):** A 4-bit ALU supporting ADD, AND, OR, and XOR operations (Moed A).
2. **Range Address Decoder:** A 12-bit decoder that activates an enable signal for a specific memory mapped range `[x"300" - x"310"]` (Moed B).
3. **Magnitude Comparator:** A 4-bit comparator with active-low outputs for Equal (EQ), Greater Than (GT), and Less Than (LT) conditions (Moed C).
4. **Pattern Detector / Address Decoder:** A 4-bit decoder designed to detect specific address patterns (`0101` or `1010`) (Moed D).

## 📂 Directory Structure
Each sub-directory contains its respective VHDL source code (`rtl/`) and the synthesis results (`reports/`), including RTL and Technology schematics.
