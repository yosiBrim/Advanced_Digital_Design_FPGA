##################################################################################
# Timing Constraints
##################################################################################
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports CLK]

##################################################################################
# Input Controls
##################################################################################
set_property PACKAGE_PIN W5 [get_ports CLK]							
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

set_property PACKAGE_PIN U18 [get_ports RESET]						
set_property IOSTANDARD LVCMOS33 [get_ports RESET]

set_property PACKAGE_PIN V17 [get_ports TestMode]					
set_property IOSTANDARD LVCMOS33 [get_ports TestMode]

##################################################################################
# Onboard 7-Segment Display (Cathodes A-G)
##################################################################################
set_property PACKAGE_PIN W7 [get_ports {BASYS_SEGMENTS_OUT[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[0]}]
set_property PACKAGE_PIN W6 [get_ports {BASYS_SEGMENTS_OUT[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[1]}]
set_property PACKAGE_PIN U8 [get_ports {BASYS_SEGMENTS_OUT[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[2]}]
set_property PACKAGE_PIN V8 [get_ports {BASYS_SEGMENTS_OUT[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[3]}]
set_property PACKAGE_PIN U5 [get_ports {BASYS_SEGMENTS_OUT[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[4]}]
set_property PACKAGE_PIN V5 [get_ports {BASYS_SEGMENTS_OUT[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[5]}]
set_property PACKAGE_PIN U7 [get_ports {BASYS_SEGMENTS_OUT[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_SEGMENTS_OUT[6]}]

##################################################################################
# Onboard Display Anodes (AN0 - AN3)
##################################################################################
set_property PACKAGE_PIN U2 [get_ports {BASYS_ANODE_OUT[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_ANODE_OUT[0]}]
set_property PACKAGE_PIN U4 [get_ports {BASYS_ANODE_OUT[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_ANODE_OUT[1]}]
set_property PACKAGE_PIN V4 [get_ports {BASYS_ANODE_OUT[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_ANODE_OUT[2]}]
set_property PACKAGE_PIN W4 [get_ports {BASYS_ANODE_OUT[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {BASYS_ANODE_OUT[3]}]

##################################################################################
# External SSD Display via PMOD JA (Segments & Cathode Control)
##################################################################################
set_property PACKAGE_PIN J1 [get_ports {SSD_SEGMENTS_OUT[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[0]}]
set_property PACKAGE_PIN L2 [get_ports {SSD_SEGMENTS_OUT[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[1]}]
set_property PACKAGE_PIN J2 [get_ports {SSD_SEGMENTS_OUT[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[2]}]
set_property PACKAGE_PIN G2 [get_ports {SSD_SEGMENTS_OUT[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[3]}]
set_property PACKAGE_PIN H1 [get_ports {SSD_SEGMENTS_OUT[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[4]}]
set_property PACKAGE_PIN K2 [get_ports {SSD_SEGMENTS_OUT[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[5]}]
set_property PACKAGE_PIN H2 [get_ports {SSD_SEGMENTS_OUT[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEGMENTS_OUT[6]}]

set_property PACKAGE_PIN G3 [get_ports SSD_CATHODE_OUT]					
set_property IOSTANDARD LVCMOS33 [get_ports SSD_CATHODE_OUT]

##################################################################################
# Configuration Setup
##################################################################################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
