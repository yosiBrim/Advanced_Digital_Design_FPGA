# Semester B: Physical Implementation & Timing Closure

## 🎯 Semester Objectives
This phase marks the transition from theoretical VHDL code to physical silicon. The objective was to take the IP blocks designed in Semester A, integrate them into complex systems, and deploy them onto the **Xilinx Artix-7 FPGA (Basys 3 Board)**.

Working with physical hardware required addressing real-world VLSI challenges: mapping I/O pins, defining clock constraints (XDC files), analyzing synthesis utilization reports, and dealing with propagation delays (Setup/Hold times).

## 📈 Chronological Progression

1. **Clock Generation & Division:** Taking the Basys 3's onboard 100MHz clock and designing synchronous clock dividers to create human-readable time bases without creating "derived clocks" that ruin timing analysis.
2. **Seven-Segment Display Controller:** Driving physical displays using Time-Division Multiplexing (TDM) to control 4 digits using only a single set of 8 cathode pins.
3. **Digital Clock Integration:** Combining counters with the Seven-Segment controller to build a fully functional physical stopwatch/clock.
4. **The Capstone Project - Traffic Light System:** A complete, multi-module system featuring a Time Base, cascaded Counters, and a Moore FSM to control a realistic traffic light sequence.

## 🛠️ Key VLSI/FPGA Takeaways
* **Implementation Flow:** Mastering the Vivado pipeline: RTL Analysis -> Synthesis -> Place & Route (Implementation) -> Bitstream Generation.
* **Constraints (XDC):** Mapping physical pins and defining clock frequencies (`create_clock`).
* **Timing Analysis:** Reading and analyzing Post-PnR Timing Reports to ensure positive slack for Setup and Hold requirements.
* **Gate-Level Simulation:** Understanding the difference between functional simulation and Post-Synthesis/Post-PnR simulations containing real physical delays (SDF).
