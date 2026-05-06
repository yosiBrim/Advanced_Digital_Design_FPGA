# Lab 03: VHDL Testbenches & Industry Standard Verification

## 📌 Overview
This lab marks a critical transition in the verification workflow. We shift from using simulator-specific commands (like ModelSim's `force`) to writing native **VHDL Testbenches**. This is the industry standard approach, ensuring that verification environments are portable, powerful, and simulator-agnostic.

## 🛠️ Key Concepts Explored
* **Device Under Test (DUT):** Instantiating the RTL component (`nnn.vhd`) inside an empty testbench entity.
* **Stimulus Generation:** Using VHDL timing controls (e.g., the `after` keyword) to generate waveforms directly within the language.
* **Component Mapping:** Mapping internal testbench signals to the DUT's ports.
* **Script Evolution:** Modifying `.do` scripts so they only compile and run the testbench, delegating all logic driving to the VHDL code.

## 📂 Design Structure
* **/rtl**: Contains the `nnn.vhd` Inverter module (reused from Lab 02).
* **/tb**: Contains the `TB_NNN.vhd` testbench, injecting a 200ns toggling stimulus.
* **/sim**: Contains the updated `simulate.do` script that compiles the hierarchy and executes the testbench.
