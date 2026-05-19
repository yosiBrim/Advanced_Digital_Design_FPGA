# Physical IO Pin Allocation (XDC)

This directory contains the physical implementation blueprint mapping the complex I/O matrix to the Artix-7 chip package.

## 📄 Configuration Mapping File
The constraint layout includes:
* **Clock & Control:** 100MHz Input Clock on `W5`, Reset Button on `U18`, and TestMode switch mapped to an onboard slide switch.
* **Onboard Display Controller:** * 4 Anode select lines (`BASYS_ANODE_OUT[3:0]`) mapped to the driving transistors.
  * 7 Segment cathode lines (`BASYS_SEGMENTS_OUT[6:0]`) mapped to segments A through G.
* **External Extension Port:** * 7 External display segment lines (`SSD_SEGMENTS_OUT[6:0]`) routed out through PMOD header connections.
  * Cathode selection signal (`SSD_CATHODE_OUT`) mapped onto the PMOD port to cycle between seconds tens and units.
