# RTL (Register-Transfer Level) Source Files

This directory contains the synthesizable VHDL modules that construct the Real-Time Clock system:

* **`Top_level.vhd`**: The structural wrapper that instantiates all sub-modules and handles the dynamic display multiplexing for the 7-segment displays.
* **`REAL_CLK.vhd`**: The core timing engine with cascading counters (Hours, Minutes, Seconds) and a synchronous data load mechanism.
* **`DECODER.vhd`**: Address decoder mapping 2-bit switch inputs to the target time counter.
* **`BIN_TO_BD.vhd`**: Combinational logic converting 6-bit binary time values into two 4-bit BCD digits.
* **`BINARY_TO_7SEGMENT.vhd` & `BINARY_TO_7SEGMENT_SSD.vhd`**: Display decoders translating BCD values into physical 7-segment LED signals.
