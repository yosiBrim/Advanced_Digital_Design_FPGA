# ModelSim Automation Script for Lab 03 (Testbench Flow)
vlib work
vmap work work

# 1. Compile the RTL and the Testbench
vcom ../rtl/nnn.vhd
vcom ../tb/TB_NNN.vhd

# 2. Simulate the Testbench (Top Level)
vsim work.TB_NNN

# 3. Add waveforms from the Testbench hierarchy
add wave -position insertpoint sim:/TB_NNN/*
add wave -position insertpoint sim:/TB_NNN/DUT/*

# 4. Run the simulation (Stimulus is driven by the VHDL code)
run 300 ns
