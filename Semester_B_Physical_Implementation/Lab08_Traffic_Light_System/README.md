# Traffic Light Controller System (Artix-7 FPGA)# Traffic Light Controller System (Artix-7 FPGA)

## 📌 Overview
This directory contains the RTL design, verification environment, and physical implementation files for a fully synchronous Traffic Light Controller. The design is implemented on a **Xilinx Artix-7 FPGA (Basys 3 Board)**. 

The project demonstrates a professional, IP-centric hardware design flow, featuring hierarchical module instantiation, a Moore Finite State Machine (FSM), testbench verification, and Post-Place & Route (PnR) timing analysis.

**Developed by:** Yossi Brim

---

## 🏗️ Hardware Architecture

The system is fully modular, governed by a `Top_level` entity that structurally integrates three main sub-modules:

1. **`Time_Base.vhd`**: Acts as a frequency divider. It takes the 100MHz system clock and counts up to 99,999,999 to generate a precise 1-second enable pulse (`TC_TimeBase`). This ensures the downstream logic operates at a human-readable pace while remaining fully synchronous to the main clock.
2. **`Counters.vhd`**: Driven by the `Time_Base` pulse, this module manages the timing intervals (10 seconds for main lights, 2 seconds for transition lights) and issues an advance signal (`ADV`) to the FSM.
3. **`State_machine.vhd`**: A Moore FSM that handles the core traffic light logic. It evaluates the `ADV` and `CE` signals to transition between four distinct states (`S0`, `S1`, `S2`, `S3`), safely updating the `LIGHT[4:0]` vector and the counter selector `SEL`.

---

## 🚦 FSM State Encoding (Moore)

The FSM design ensures that the outputs depend exclusively on the current state, preventing combinational glitches from propagating to the LEDs.

* **`S0`**: Initial state. `LIGHT` outputs `"01100"`, `SEL` is `'0'`.
* **`S1`**: Transition state. `LIGHT` outputs `"10110"`, `SEL` is `'1'`.
* **`S2`**: Main active state. `LIGHT` outputs `"10001"`, `SEL` is `'0'`.
* **`S3`**: Transition state. `LIGHT` outputs `"10010"`, `SEL` is `'1'`.

---

## 🧪 Verification

A dedicated testbench (`TB_Top_level.vhd`) was developed to stimulate the Top module. It generates a continuous 100MHz clock with a 5ns half-period and drives the system's asynchronous `RESET` sequence to observe state transitions and counter behavior during simulation.

---

## 📊 Physical Implementation & Timing Analysis

The design was successfully synthesized and routed using **Vivado**. 
* **Resource Utilization:** The design is highly optimized, utilizing only a minimal footprint of the Artix-7 resources (41 Flip-Flops and 17 LUTs).
* **Timing Closure:** Post-PnR analysis confirms that the internal core logic successfully meets all Setup and Hold requirements, achieving positive slack across the synchronous paths. 

**Note on I/O Timing:** The timing report indicates a minor setup violation (-0.713ns) strictly isolated to the combinatorial I/O path routing from the internal registers (`LIGHT_reg[1]`) to the physical output buffers (`OBUF`). Because these outputs directly drive human-observable LEDs switching at 1-second and 10-second intervals, this sub-nanosecond I/O delay is functionally negligible and does not impact the reliable operation of the synchronous FSM core.

## 📌 Overview
This directory contains the RTL design, verification environment, and physical implementation files for a fully synchronous Traffic Light Controller. The design is implemented on a **Xilinx Artix-7 FPGA (Basys 3 Board)**. 

The project demonstrates a professional, IP-centric hardware design flow, featuring hierarchical module instantiation, a Moore Finite State Machine (FSM), testbench verification, and Post-Place & Route (PnR) timing analysis.

**Developed by:** Yossi Brim

---

## 🏗️ Hardware Architecture

The system is fully modular, governed by a `Top_level` entity that structurally integrates three main sub-modules:

1. **`Time_Base.vhd`**: Acts as a frequency divider. It takes the 100MHz system clock and counts up to 99,999,999 to generate a precise 1-second enable pulse (`TC_TimeBase`). This ensures the downstream logic operates at a human-readable pace while remaining fully synchronous to the main clock.
2. **`Counters.vhd`**: Driven by the `Time_Base` pulse, this module manages the timing intervals (10 seconds for main lights, 2 seconds for transition lights) and issues an advance signal (`ADV`) to the FSM.
3. **`State_machine.vhd`**: A Moore FSM that handles the core traffic light logic. It evaluates the `ADV` and `CE` signals to transition between four distinct states (`S0`, `S1`, `S2`, `S3`), safely updating the `LIGHT[4:0]` vector and the counter selector `SEL`.

---

## 🚦 FSM State Encoding (Moore)

The FSM design ensures that the outputs depend exclusively on the current state, preventing combinational glitches from propagating to the LEDs.

* **`S0`**: Initial state. `LIGHT` outputs `"01100"`, `SEL` is `'0'`.
* **`S1`**: Transition state. `LIGHT` outputs `"10110"`, `SEL` is `'1'`.
* **`S2`**: Main active state. `LIGHT` outputs `"10001"`, `SEL` is `'0'`.
* **`S3`**: Transition state. `LIGHT` outputs `"10010"`, `SEL` is `'1'`.

---

## 🧪 Verification

A dedicated testbench (`TB_Top_level.vhd`) was developed to stimulate the Top module. It generates a continuous 100MHz clock with a 5ns half-period and drives the system's asynchronous `RESET` sequence to observe state transitions and counter behavior during simulation.

---

## 📊 Physical Implementation & Timing Analysis

The design was successfully synthesized and routed using **Vivado**. 
* **Resource Utilization:** The design is highly optimized, utilizing only a minimal footprint of the Artix-7 resources (41 Flip-Flops and 17 LUTs).
* **Timing Closure:** Post-PnR analysis confirms that the internal core logic successfully meets all Setup and Hold requirements, achieving positive slack across the synchronous paths. 

**Note on I/O Timing:** The timing report indicates a minor setup violation (-0.713ns) strictly isolated to the combinatorial I/O path routing from the internal registers (`LIGHT_reg[1]`) to the physical output buffers (`OBUF`). Because these outputs directly drive human-observable LEDs switching at 1-second and 10-second intervals, this sub-nanosecond I/O delay is functionally negligible and does not impact the reliable operation of the synchronous FSM core.
