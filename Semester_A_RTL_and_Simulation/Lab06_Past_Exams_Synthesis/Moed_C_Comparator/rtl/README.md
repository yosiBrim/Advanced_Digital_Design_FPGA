# RTL Design: 4-bit Magnitude Comparator (Moed C)

This directory contains the VHDL implementation of a 4-bit magnitude comparator with **Active-Low** outputs.

## 🛠️ Logic Details
The module compares two 4-bit unsigned inputs (`A` and `B`) and generates three status signals:
* **EQ**: Asserted ('0') when A equals B.
* **GT**: Asserted ('0') when A is greater than B.
* **LT**: Asserted ('0') when A is less than B.

The use of Active-Low logic is a specific design constraint to ensure compatibility with certain hardware interface standards.
