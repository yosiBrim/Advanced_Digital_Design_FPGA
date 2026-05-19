# Physical Implementation Constraints

This directory contains the Xilinx Design Constraints (XDC) mapping the RTC to the physical board.

## 📍 Port Mappings (Basys 3 / Artix-7)
* **System Clock (`CLK`):** 100MHz input.
* **7-Segment Anodes (`AN[3:0]`):** Mapped to the 4 digit-enable transistors.
* **7-Segment Cathodes (`SEG[7:0]`):** Mapped to the individual LED segments (A-G and Decimal Point).
