# Lab 01: VHDL Entities & Interface Design

## 📌 Overview
This lab marks the beginning of the Advanced Digital Design course. The primary focus was on mastering **VHDL Entity declarations**, defining the physical and logical boundaries of various hardware components. 

The exercise involved translating datasheet specifications and high-level logic descriptions into synthesizable VHDL code, with a strict emphasis on naming conventions and data types.

**Developer:** Yossi Brim
**Course:** Advanced Digital Design (130323)

---

## 🛠️ Key Technical Concepts

### 1. Naming Conventions & Identifiers
VHDL has strict rules regarding identifiers. During this lab, several adjustments were made to ensure the code is valid for EDA tools:
* **Numeric Prefixes:** Since VHDL identifiers cannot start with a digit, components like the `74HC74` were renamed to `IC_74HC74`.
* **Active-Low Signals:** Components featuring active-low pins (like Set and Reset) were documented using the `_n` suffix (e.g., `RD_n`) instead of special characters, adhering to industry standards.

### 2. Port Definitions and Vectors
* **Standard Logic:** Used `std_logic` for single control signals (Clock, Reset).
* **Bus Logic:** Extensively used `std_logic_vector` for multi-bit data paths, ensuring correct bit-ordering (e.g., `63 downto 0` for 64-bit cryptographic keys).
* **Directionality:** Correct assignment of `in` and `out` ports to prevent drive contention.

---

## 📂 Component Specifications

The following entities were implemented in this lab:

| Component Name | Type | Key Features |
| :--- | :--- | :--- |
| **SN74AUC2G00** | Logic Gate | Dual 2-Input NAND Gate. |
| **CD74AC174** | Flip-Flop | Hex D-Type with Clear. |
| **IC_74HC74** | Flip-Flop | Dual D-Type with Set and Reset. |
| **DES_HELION_CORE** | Crypto Core | 64-bit Data Encryption Standard interface. |
| **OL_AES** | Crypto Core | 32-bit Advanced Encryption Standard interface. |

---

## 🚀 Future Steps: RTL Implementation
While this lab focused exclusively on the **Entity** (the interface), the next stage involves developing the **Architecture** (the internal logic) and verifying the functionality through Testbenches in ModelSim/Questa.
