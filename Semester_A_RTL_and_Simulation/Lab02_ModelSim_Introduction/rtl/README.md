# RTL Component Specifications - Lab 01

This document provides the technical specifications for each VHDL entity implemented in this lab. Each entity defines the hardware interface (ports, directions, and widths) for industrial logic gates and complex cryptographic cores.

---

## 1. SN74AUC2G00 (Dual 2-Input NAND Gate)
* **Description:** A dual-channel positive-NAND gate.
* **Interface:**
    * `A`, `B` (Input, 2-bit): Independent inputs for the two gates.
    * `Y` (Output, 2-bit): NAND logic outputs.
* **Logic:** $Y(n) = \text{NOT}(A(n) \text{ AND } B(n))$ for $n \in \{1, 2\}$.

## 2. CD74AC174 (Hex D-Type Flip-Flop)
* **Description:** Six D-type flip-flops with a common clock and a master reset.
* **Interface:**
    * `CLK` (Input): Positive-edge triggered clock.
    * `CLR` (Input): Asynchronous master reset (Clear).
    * `D` (Input, 6-bit): Data inputs for each flip-flop.
    * `Q` (Output, 6-bit): Registered data outputs.

## 3. IC_74HC74 (Dual D-Type Flip-Flop with Set/Reset)
* **Description:** Dual D-type positive-edge-triggered flip-flops with individual asynchronous Set and Reset.
* **Interface:**
    * `CP` (Input): Clock inputs.
    * `RD_n` (Input): Active-low Reset (Clear).
    * `SD_n` (Input): Active-low Set (Preset).
    * `D` (Input): Data inputs.
    * `Q`, `Q_n` (Output): True and complemented outputs.

## 4. DES_HELION_CORE (64-bit DES Engine)
* **Description:** High-performance Data Encryption Standard (DES) core interface.
* **Interface:**
    * `Plaintext` (Input, 64-bit): Data to be encrypted/decrypted.
    * `key` (Input, 64-bit): Cipher key.
    * `master_clock` (Input): System clock.
    * `Ciphertext` (Output, 64-bit): Encrypted result.
    * `encrypt_status` (Output): Handshake signal indicating completion.

## 5. OL_AES (Ocean Logic AES Core)
* **Description:** Advanced Encryption Standard (AES) core with adjustable key sizes.
* **Interface:**
    * `DIN`, `KIN` (Input, 32-bit): Data and key input buses.
    * `KSIZE` (Input, 2-bit): Selects between 128, 192, and 256-bit keys.
    * `DOUT` (Output, 32-bit): Processed data output.
    * `DOUT_VLD` (Output): Data valid strobe.
