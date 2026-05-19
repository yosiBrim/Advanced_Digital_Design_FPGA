# Lab 03: Real-Time Clock & 7-Segment Display Controller

## 📌 Overview
This lab demonstrates a complete hierarchical digital system: a fully functional Real-Time Clock (RTC). The design steps down a high-frequency system clock (100MHz) to a 1Hz time base, cascades multiple modulo counters to track seconds, minutes, and hours, and utilizes a time-multiplexed controller to drive a 4-digit 7-segment display on the Artix-7 FPGA.

## ⚙️ Engineering Highlights
* **Hierarchical Design:** Integrating multiple sub-modules (Time Base, Modulo Counters, Bin27Seg Decoder) into a unified Top-Level entity.
* **Cascaded Counters:** Implementing a synchronous daisy-chain of counters where the Terminal Count (TC) of the seconds counter acts as the enable for the minutes counter, and so forth.
* **Time-Multiplexed Display:** Designing a high-speed scanner that cycles through the 4 anodes of the 7-segment display, allowing 4 distinct digits to be perceived simultaneously by the human eye using only one 8-bit cathode bus.

## 📂 Directory Structure
* **`rtl/`**: VHDL sources for the top-level clock and its sub-modules.
* **`sim/`**: Testbench for verifying cascading rollovers and multiplexer timing.
* **`constraints/`**: XDC file mapping logic to the physical 7-segment display.
* **`reports/`**: Implementation views and hierarchical schematics.
* **`docs/`**: Lab specifications and the final submission report.
