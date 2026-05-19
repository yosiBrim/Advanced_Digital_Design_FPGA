# Advanced Digital Design & FPGA Implementation (VHDL)

## 📌 Overview
This repository serves as a comprehensive portfolio of an Advanced Digital Design project, detailing the evolution of hardware design from theoretical RTL coding and functional simulation to full physical implementation on a **Xilinx Artix-7 FPGA (Basys 3 Board)**. 

**Developed by:** Yossi Brim

## 👨‍💻 About the Developer
I am a final-year Electronics Engineering student with a strong focus on board design, VLSI, and FPGA development. Alongside my hardware engineering pursuits, I am a 3rd Dan black belt and a 10-time former national karate champion. I bring the same extreme discipline, strategic focus, and dedication to excellence from the tatami to my RTL design and verification processes.

## 🛠️ Technology Stack & Tools
* **Hardware Description Language:** VHDL (IEEE 1164 Standard)
* **EDA Tools:** Xilinx Vivado, Mentor Graphics ModelSim / Questa
* **Target Hardware:** Digilent Basys 3 Trainer Board (Xilinx Artix-7 XC7A35T)
* **Core Concepts:** RTL Design, Testbench Verification (V&V), FSM Design (Moore/Mealy), Timing Constraints (XDC), Synthesis, Place & Route (PnR), Gate-Level Simulation.

## 📂 Repository Architecture

This repository is divided into two main phases, reflecting the chronological progression of the project from logic design to physical silicon deployment.

### [Phase 1: Semester A - RTL Design & Functional Simulation](./Semester_A_RTL_and_Simulation)
Focused on mastering VHDL syntax, building fundamental digital IP blocks, and developing robust testbenches for functional verification. No physical hardware constraints were applied at this stage; the focus was strictly on architectural correctness and logic simulation.

### [Phase 2: Semester B - Physical Implementation & Timing Closure](./Semester_B_Physical_Implementation)
Transitioned the RTL IPs into physical hardware. This phase covers handling physical FPGA constraints (XDC), dealing with propagation delays, Post-PnR simulations, and final Bitstream generation. The culmination of this phase is a fully functional, physically deployed **Traffic Light Controller**.

