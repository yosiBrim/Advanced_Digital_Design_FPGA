# ModelSim Automation Script for Lab 02
vlib work
vmap work work
vcom ../rtl/nnn.vhd
vsim work.nnn

# Add signals to wave window
add wave -position insertpoint sim:/nnn/*

# Stimulus sequence
force -freeze sim:/nnn/A 1 0
run 100 ns
examine Y

force -freeze sim:/nnn/A 0 0
run 100 ns
examine Y

force -freeze sim:/nnn/A 1 0
run 100 ns
examine Y
