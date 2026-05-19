# RTL Design: Modulo-100 Synchronous Counter

This directory contains the VHDL source code for the primary control counter.

## 📄 File: `cntr.vhd` (Entity: Q3)
The module implements a 7-bit synchronous counter designed to count from `0` to `99` (Modulo-100). 

### 🛠️ Key Architectural Features:
* **Synchronous Reset:** The reset logic (`RESET = '1'`) is evaluated strictly on the rising edge of the clock, adhering to synchronous design principles.
* **Datapath:** A 7-bit internal vector (`Q(6 downto 0)`) is used to accommodate the maximum value of 99.
* **Control Output (TC):** A Terminal Count signal is generated as a concurrent assignment (`TC <= '1' when Q = 0 else '0'`). It asserts high when the counter rolls over and restarts its cycle.

This counter serves as a fundamental building block for timing and control generation in more complex state machines.
