# Physical Implementation Constraints

## 📄 File: `Basys3_Prog_TimeBase.xdc`
This XDC file connects the logical 16-bit interface to the physical Artix-7 components.

### 📍 Port Mappings
* **Clock (`CLK`):** 100MHz system clock.
* **Input Data (`DATA[15:0]`):** Mapped sequentially to the 16 slide switches (`SW0`-`SW15`) on the Basys 3 board.
* **Control Signals:** `RESET` and `LOAD` are mapped to independent push buttons.
* **Output (`TC`):** Routed to an external monitoring pin (or LED) for frequency verification.
