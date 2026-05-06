# Verification Environment (Testbench)

This directory is the core of Lab 03, representing the shift to VHDL-native verification.

## 📂 Testbench Files
* **`TB_NNN.vhd`**: The top-level verification wrapper.

## 🧪 Verification Strategy
Instead of relying on simulator-specific `force` commands, this testbench uses VHDL's inherent timing capabilities.
* **Component Instantiation:** The `nnn` module is instantiated as a `DUT` (Device Under Test).
* **Signal Mapping:** Internal testbench signals are mapped to the DUT using `port map`.
* **Stimulus Generation:** Logic transitions are defined using the `after` keyword (e.g., `'0' after 50 ns`), creating a precise and repeatable waveform that is independent of the simulator's GUI.
