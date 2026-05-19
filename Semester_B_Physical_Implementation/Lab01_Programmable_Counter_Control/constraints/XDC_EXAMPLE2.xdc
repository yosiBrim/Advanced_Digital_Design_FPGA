##################################################################################
# Timing Constraints
##################################################################################
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports CLK]

##################################################################################
# Physical Pin Mapping (Target: Basys 3 Board)
##################################################################################
# System Clock
set_property PACKAGE_PIN W5 [get_ports CLK]							
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

# Central Push Button (Reset)
set_property PACKAGE_PIN U18 [get_ports RESET]						
set_property IOSTANDARD LVCMOS33 [get_ports RESET]

# Terminal Count Output (PMOD Header Pin H1)
set_property PACKAGE_PIN H1 [get_ports TC]							
set_property IOSTANDARD LVCMOS33 [get_ports TC]
