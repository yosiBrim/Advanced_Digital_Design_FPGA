# Verification Environment: Counter Testbench

This directory contains the simulation environment and waveform logs used to verify the functional correctness of the Modulo-100 counter.

## 📄 File: `cntr_tb.vhd` (Entity: TB_Q3)
The testbench instantiates the Device Under Test (DUT - `Q3`) and stimulates its inputs to verify rollover and synchronous reset behavior.

### 🔬 Simulation Parameters:
* **Clock Generation:** The clock (`TB_CLK`) is toggled every `5 ms`, creating a clock period of `10 ms` (100 Hz frequency).
* **Reset Sequence:** An initial reset pulse (`TB_RESET`) is driven high and then released after `7 ms` to ensure the DUT starts from a known state of `0`.
* **Waveform Logs:** `vsim.wlf` and related files contain the Mentor Graphics ModelSim/Questa trace data, confirming the `TC` assertion exactly when `Q=0`.
