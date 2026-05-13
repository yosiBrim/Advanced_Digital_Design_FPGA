# RTL Design: 4-bit Pattern Detector (Moed D)

This directory contains the VHDL implementation for a specific address pattern recognition unit.

## 🛠️ Logic Details
The combinational logic continuously monitors a 4-bit `Address` bus. The `Detect` output is driven high ('1') only when one of the following alternating binary sequences is present:
* `0101` (Hex 5)
* `1010` (Hex A)
