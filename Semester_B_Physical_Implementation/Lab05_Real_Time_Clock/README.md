# Real-Time Digital Clock & 7-Segment Multiplexing (Artix-7 FPGA)

## 📌 Overview
This directory contains the RTL design, verification environment, and physical implementation of a fully functional Real-Time Digital Clock. The design is targeted for the **Xilinx Artix-7 FPGA (Basys 3 Board)** and interfaces with both the onboard 7-segment displays and an external PmodSSD module.

The project demonstrates advanced hierarchical VHDL design, dynamic display multiplexing, Binary-to-BCD conversion, and asynchronous user-input handling for time presetting.

**Developed by:** Yossi Brim

---

## 🏗️ Hardware Architecture & Hierarchy

The system is highly modular, heavily utilizing component instantiation within a `Top_level` entity to cleanly separate timing, logic, and I/O routing tasks:

1. **`REAL_CLK.vhd`**: The core timing engine. It generates a 1Hz timebase from the 100MHz system clock and manages the cascading counters for Seconds (0-59), Minutes (0-59), and Hours (0-23). It also handles the synchronous `LOAD` command to preset the clock from external switch inputs.
2. **`DECODER.vhd`**: A combinational address decoder that translates a 2-bit switch input into active-high select signals (`SEL_HOURS`, `SEL_MINUTES`, `SEL_SECONDS`), directing the preset data to the correct counter.
3. **`BIN_TO_BD.vhd`**: A pure combinational Binary-to-BCD converter. It transforms the binary counter values into separated Most Significant (MS) and Least Significant (LS) decimal digits for the display interface.
4. **`BINARY_TO_7SEGMENT.vhd` & `BINARY_TO_7SEGMENT_SSD.vhd`**: Dedicated decoders that map the BCD values to the active-low physical segment patterns required by the displays.
5. **Top-Level Display Multiplexer**: The `Top_level` module contains a fast-running 2-bit counter (acting as a refresh frequency generator) to dynamically multiplex the 7-segment anodes and cathodes, achieving persistence of vision (POV) without visible flicker.

---

## 🎛️ Physical Implementation & User Interface

The system is fully deployed on hardware with a comprehensive user interface mapped via XDC constraints:
* **Clock & Reset**: Driven by the Basys 3 100MHz oscillator and a debounced push-button.
* **Time Presetting**: The user configures the desired time using 6 Data switches, 2 Address switches, and a `LOAD` push-button.
* **Display Output**: The Minutes and Seconds are multiplexed on the onboard 4-digit 7-segment display, while the Hours are multiplexed on an external 2-digit PmodSSD module.
* **Simulation Modes**: A `TestMode` switch allows the timebase to bypass the 100,000,000 divisor, enabling rapid simulation of the entire 24-hour cycle in ModelSim.
