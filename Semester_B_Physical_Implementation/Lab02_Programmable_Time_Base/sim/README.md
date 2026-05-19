# Verification: Dynamic Load Simulation

## 📄 File: `cntr_prog_tb.vhd`
This testbench validates the dynamic behavior of the programmable time base.

### 🔬 Simulation Flow
1.  **Phase 1 (High Frequency):** The `LOAD` signal is asserted to latch the value `10` into the data register. The simulation runs until 4 sequential `TC` pulses are generated.
2.  **Phase 2 (Lower Frequency):** Without resetting the system, a new value of `100` is loaded, demonstrating the on-the-fly frequency scaling capability. The simulator captures the wider gaps between the subsequent `TC` pulses.
