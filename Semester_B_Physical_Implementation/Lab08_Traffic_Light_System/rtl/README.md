# RTL (Register-Transfer Level) Source Files

This directory contains the synthesizable VHDL modules that construct the Traffic Light Controller system:

* **`Top_level.vhd`**: The structural top-level entity integrating the timing, counting, and state machine modules.
* **`Time_Base.vhd`**: A frequency divider converting the 100MHz system clock into 1-second pulses.
* **`Counters.vhd`**: Manages the 10-second and 2-second timing intervals and generates advance (`ADV`) signals.
* **`State_machine.vhd`**: A Moore FSM governing the state transitions and controlling the traffic light outputs.
