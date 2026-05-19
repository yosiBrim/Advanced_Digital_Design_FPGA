# RTL Design: Programmable Time Base

## 📄 File: `cntr_prog.vhd`
This directory contains the VHDL source code for a 16-bit programmable frequency divider.

### 🛠️ Architectural Details
Unlike a hard-coded counter, this design implements dynamic frequency control by separating the datapath into two distinct components:
1.  **Load Register:** A 16-bit register controlled by a synchronous `LOAD` enable signal. It captures the target counting threshold from the `DATA` bus.
2.  **Comparator & Counter:** A 16-bit synchronous counter that increments until it matches the `LOADED_DATA` register, at which point it asserts the Terminal Count (`TC`) pulse for one clock cycle and resets.
