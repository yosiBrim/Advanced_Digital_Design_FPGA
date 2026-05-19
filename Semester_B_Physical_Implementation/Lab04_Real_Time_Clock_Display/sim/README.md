# Functional Verification & Display Decoding

This directory manages the simulation testbench used to prove that the display multiplexing logic does not distort time tracking.

## 📄 Testbench Component: `TB_Top_level.vhd`
The verification pipeline bypasses physical clock dividers via `TestMode = '1'` to capture critical rollover milestones and output alignment.

### 📊 Targeted Verification Landmarks
The simulation tracks and documents exact cathode output configurations for two key target timelines:
1. **Timestamp `01:23:45`**: Verifies correct simultaneous routing across the split internal/external displays for an arbitrary nominal state.
2. **Timestamp `23:45:01` (Pre-forced state)**: Validates boundary performance around day-rollover horizons, ensuring that the BCD conversion and segment states update concurrently without visual artifacts or lagging states.
