# Physical Constraints (XDC)

## 📄 File: `XDC_EXAMPLE2.xdc`
This file contains the Xilinx Design Constraints used to map the logical RTL ports to the physical pins on the Artix-7 FPGA board.

### 📍 Constraint Definitions:
* **Timing:** Defines a primary clock (`CLK`) with a period of 10ns (100MHz).
* **Pin Mapping:** * `CLK` is mapped to package pin `W5`.
  * `RESET` is mapped to package pin `U18` (typically a push-button).
  * The `TC` output is mapped to package pin `H1` (routed to a PMOD port as required by the lab specification).
* **I/O Standards:** All utilized pins are configured for the `LVCMOS33` voltage standard.
