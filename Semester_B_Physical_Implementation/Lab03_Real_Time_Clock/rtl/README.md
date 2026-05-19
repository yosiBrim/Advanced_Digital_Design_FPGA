# RTL Design: Hierarchical Real-Time Clock

This directory contains the VHDL source code for the RTC and its sub-modules.

## 🛠️ Architectural Breakdown
1.  **Time Base Generator:** Divides the 100MHz system clock down to a precise 1Hz tick to drive the seconds counter.
2.  **Cascaded Time Counters:** * **Seconds:** Modulo-60 counter, enabled by the 1Hz tick.
    * **Minutes:** Modulo-60 counter, enabled by the Seconds TC.
    * **Hours:** Modulo-24 counter, enabled by the Minutes TC.
3.  **Display Multiplexer:** Uses a faster time-base (e.g., 1kHz) to scan through the 4 digits (Anodes) of the 7-segment display, feeding the appropriate time value (Cathodes) through a Binary-to-7-Segment decoder.
