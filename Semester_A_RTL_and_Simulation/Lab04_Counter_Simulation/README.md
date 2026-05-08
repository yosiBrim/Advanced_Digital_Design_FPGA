# Lab 04: Synchronous Logic & Counter Simulation

## 📌 Overview
This lab introduces synchronous RTL design through the implementation and verification of a **4-bit Free-Running Up-Counter**. The exercise highlights the fundamentals of clock-driven sequential logic, reset strategies, and Terminal Count (TC) generation.

## 🛠️ Key Concepts Explored
* **Synchronous Reset:** Implementing an active-high reset that evaluates exclusively on the rising edge of the clock, preventing metastability and ensuring clean state transitions.
* **Terminal Count (TC):** Generating a synchronous flag when the counter reaches its maximum value (`1111` in binary / 15 in decimal), a critical technique for cascading counters without clock-dividers.
* **Testbench Clock Generation:** Writing a VHDL testbench that generates a continuous 5MHz clock stimulus (200ns period) to drive the sequential logic.
* **Simulation Analysis:** Utilizing ModelSim to analyze waveform behaviors, specifically observing the delay between the reset signal assertion and the actual counter clearance (due to synchronous behavior).

## 📂 Directory Structure
* **/rtl**: Contains `cntr.vhd`, the synthesizable 4-bit counter module.
* **/tb**: Contains `tb_cntr.vhd`, the verification environment generating the 5MHz clock and reset sequence.
* **/sim**: Contains the `wave.do` script for automated compilation and waveform formatting.
* **/docs**: Lab requirements and the final submitted report.
