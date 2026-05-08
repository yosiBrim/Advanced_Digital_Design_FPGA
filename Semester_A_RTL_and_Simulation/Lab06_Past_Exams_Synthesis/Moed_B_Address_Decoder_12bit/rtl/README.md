# RTL Design: 12-bit Address Decoder (Moed B)

This directory contains the synthesizable VHDL code for a range-based address decoder.

## 📂 Design Files
* **`Address_Decoder.vhd`**: The main module implementing the detection logic.

## 🛠️ Logic Implementation
The decoder monitors a 12-bit address bus and asserts the `Enable` signal only when the address falls within the hex range **[0x300 - 0x310]**.
* **Methodology:** Use of `unsigned` comparisons from the `numeric_std` library to ensure efficient hardware inference.
* **Hardware Mapping:** During synthesis, this logic is typically mapped to a series of comparators and a final AND gate to drive the enable signal.
