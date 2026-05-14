# Physical & Timing Constraints (XDC)

This directory contains the design constraints required for accurate physical implementation on Xilinx hardware.

## 📄 Files
* **`CNTR.xdc`**: The Xilinx Design Constraints file.

## 🛠️ Constraint Details
The file defines critical parameters for the implementation tool:
1. **Timing Constraints**: Defines the primary clock (`CLK`) with a period of **10ns (100MHz)**.
2. **I/O Delays**: Specifies 0ns input/output delays to test the design's raw performance.
3. **Pin Mapping**: (Optional/Placeholder) Ready for physical pin assignments to map logical ports to the Artix-7 package pins.

Properly defined constraints are essential for achieving **Timing Closure** and ensuring the design operates reliably at the target frequency.
