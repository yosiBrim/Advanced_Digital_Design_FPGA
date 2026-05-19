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


graph TD
    %% הגדרת סגנונות חזותיים
    classDef top_level fill:#f9f,stroke:#333,stroke-width:2s;
    classDef internal fill:#e1f5fe,stroke:#0277bd,stroke-width:1px;
    classDef ports fill:#fff,stroke:#333,stroke-dasharray: 5 5;

    %% ישות ה-Top Level (המכלול)
    subgraph Top_Level_Entity [Top_Level.vhd - Structural Wrapper]
        direction TB

        %% פינים חיצוניים (Inputs/Outputs)
        CLK_IN(100MHz CLK In):::ports
        RST_IN(Async RESET In):::ports
        LEDS_OUT(LIGHT[4:0] LED Output):::ports

        %% רכיבים פנימיים
        TB[Time_Base.vhd<br/>(Frequency Divider)]:::internal
        CNT[Counters.vhd<br/>(Interval Manager)]:::internal
        FSM[State_machine.vhd<br/>(Moore FSM Logic)]:::internal

        %% חיווט פנימי וזרימת נתונים
        CLK_IN ==> TB
        CLK_IN ==> FSM
        CLK_IN ==> CNT
        RST_IN ==> TB
        RST_IN ==> FSM

        TB -- "TC_TimeBase (1s Pulse)" --> CNT
        CNT -- "ADV (Advance Signal)" --> FSM
        FSM -- "SEL (Interval Select)" --> CNT
        
        %% חיבור לפלט
        FSM ==> LEDS_OUT
    end

    %% הערות הסבר
    linkStyle 7,8,9,10 stroke-width:2px,fill:none,stroke:red;
