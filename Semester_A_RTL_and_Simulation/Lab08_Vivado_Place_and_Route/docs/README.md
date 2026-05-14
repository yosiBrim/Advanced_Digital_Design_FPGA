# Implementation Reports & Documentation

This directory contains the formal lab requirements and the final implementation analysis report.

## 📁 Included Documents
* **`Lab08_Requirements.pdf`**: The official lab scope focusing on Vivado's Place & Route flow.
* **`Lab08_Implementation_Report.pdf`**: A comprehensive report detailing the implementation results, including:
    * **Device Visualization**: Screenshots of the routed counter on the Artix-7 silicon.
    * **Resource Utilization**: Final counts of LUTs and Slice Registers.
    * **Timing Analysis**: Comparison between different Speed Grades (-3 vs -1) and analysis of the resulting timing violations.
    * **DRC Analysis**: Review of Design Rule Check warnings and configuration issues.

## 📊 Key Findings
The documentation highlights the impact of hardware speed grades on timing slack, demonstrating how a design that meets timing on a fast device can fail on a slower one.
