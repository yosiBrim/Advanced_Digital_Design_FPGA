# Lab 04: Simulation Automation & Waveform formatting
vlib work
vmap work work

vcom ../rtl/cntr.vhd
vcom ../tb/tb_cntr.vhd
vsim work.tb_cntr

# Waveform Configuration
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_cntr/tbCLK
add wave -noupdate /tb_cntr/tbRESET
add wave -noupdate -radix hexadecimal -expand /tb_cntr/tbQ
add wave -noupdate /tb_cntr/tbTC
TreeUpdate [SetDefaultTree]

run 2000 ns
