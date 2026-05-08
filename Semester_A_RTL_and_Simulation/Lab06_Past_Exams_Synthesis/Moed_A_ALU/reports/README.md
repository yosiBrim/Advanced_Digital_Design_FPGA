# ALU Synthesis Reports (2007 - Moed A)

This directory contains the synthesis results and hardware schematics for the 4-bit Arithmetic Logic Unit (ALU), generated using Mentor Graphics Precision RTL.

## 📄 Included Reports
* **`Area_Report.txt`**: A detailed summary of the hardware resources consumed by the ALU. It highlights the specific number of LUTs required to implement the arithmetic (ADD) and logic (AND, OR, XOR) operations.
* **`RTL_Schematic.png`**: The high-level logical representation of the design. This schematic beautifully illustrates how the VHDL `case` statement is inferred into dedicated arithmetic blocks, logical gates, and an output multiplexer.
* **`Technology_Schematic.png`**: The physical mapping of the logical components to the target FPGA technology primitives.
