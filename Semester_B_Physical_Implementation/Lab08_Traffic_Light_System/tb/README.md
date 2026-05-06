# Verification Environment (Testbenches)

This directory contains the verification suite for the Traffic Light Controller. 

* **`TB_Top_level.vhd`**: Instantiates the Device Under Test (DUT), generates a continuous 100MHz clock stimulus, and manages the asynchronous reset sequence. This testbench is designed to validate the FSM state transitions, the clock divider accuracy, and the overall counter behavior during functional simulation.
