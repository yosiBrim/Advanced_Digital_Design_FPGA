# Lab 01: VHDL Entities & Syntax Fundamentals

## 📌 Overview
This directory contains the first exercise of the Advanced Digital Design course. The objective was to translate real-world hardware component specifications into valid synthesizable **VHDL Entity** declarations.

## 🛠️ Key Concepts Explored
* **VHDL Syntax & Naming Conventions:** Adhering to strict language rules (e.g., identifiers cannot start with numbers, handling active-low signal names without special characters).
* **Port Declarations:** Defining input and output ports correctly.
* **Data Types:** Utilizing `std_logic` for single-bit signals and `std_logic_vector` for multi-bit buses.
* **Library Management:** Properly importing the IEEE standard logic libraries (`IEEE.STD_LOGIC_1164.ALL`).

## 🗂️ Components Defined
The exercise includes the structural interfaces for the following industrial and cryptographic cores:
1. **SN74AUC2G00** (Dual 2-Input Positive-NAND Gate)
2. **CD74AC174** (Hex D-Type Flip-Flop with Reset)
3. **74HC74** (Dual D-Type Flip-Flop with Set and Reset)
4. **DES Helion Core** (Data Encryption Standard Cryptographic Core)
5. **Ocean Logic AES Core** (Advanced Encryption Standard Core)
