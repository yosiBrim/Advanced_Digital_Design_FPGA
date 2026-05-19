# RTL Topology: Structural Display Wrapper

This directory stores the synthesizable VHDL source files comprising the expanded hierarchical design.

## 📄 Core Sub-Modules
1. **`Top_level.vhd`**: The structural anchor executing component instantiations and internal signal mapping.
2. **`REAL_CLK.vhd`**: The synchronous core tracking seconds, minutes, and hours (retained from Lab 3).
3. **`BIN_TO_BCD.vhd`**: Combinational logic translation component mapping binary values to individual units/tens lines.
4. **`BINARY_TO_SEGMENT.vhd`**: Standard hex/decimal to 7-segment segment cathode encoder.

## ⚡ Hardware Sub-System Partitioning
To accommodate the physical constraints of the Basys 3 board, the display resources are split as follows:
* **Onboard Display:** Drives 4 digits dedicated to Hours (Tens/Units) and Minutes (Tens/Units), scanning across `BASYS_ANODE_OUT[3:0]` and sharing the 7-bit segment bus.
* **External PMOD Display (SSD):** Drives 2 digits dedicated to Seconds (Tens/Units) utilizing a high-speed cathode selection toggle (`SSD_CATHODE_OUT`) mapped onto the PMOD extension pins.
