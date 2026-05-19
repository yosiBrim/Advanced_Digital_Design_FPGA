# Verification: Clock Cascading & Multiplexing

This directory contains the simulation environment used to verify the timekeeping accuracy and display logic.

## 🔬 Simulation Flow
* **Rollover Verification:** Testing the boundary conditions to ensure that when Seconds reach 59, the next clock tick resets Seconds to 0 and increments Minutes to 1.
* **Multiplexer Timing:** Verifying that the high-speed scanning logic correctly cycles through the `Anode` selection signals while presenting the corresponding decoded segment data on the `Cathode` bus.
