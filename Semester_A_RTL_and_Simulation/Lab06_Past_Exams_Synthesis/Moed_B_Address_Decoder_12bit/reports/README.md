# Synthesis Reports: Address Decoder

Documentation of the synthesis process for the 12-bit decoder, focusing on logic depth and area.

## 📄 Included Reports
* **`Area_Report.txt`**: Summary of the LUTs required for the 12-bit range comparison.
* **`RTL_Schematic.png`**: High-level view showing the magnitude comparators.
* **`Technology_Schematic.png`**: Detailed view of the LUT mapping for the Artix-7 fabric.

## 🔍 Key Observations
Unlike a simple bit-pattern detector, a range decoder requires more complex combinational logic (comparators) to evaluate the "Greater-than" and "Less-than" conditions simultaneously.
