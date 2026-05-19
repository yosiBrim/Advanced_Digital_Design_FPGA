##################################################################################
# Timing Constraints (100MHz System Clock)
##################################################################################
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports CLK]

##################################################################################
# Physical Pin Mapping - Inputs
##################################################################################
# System Clock (100MHz)
set_property PACKAGE_PIN W5 [get_ports CLK]                            
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

# RESET - Central Push Button (Active High)
set_property PACKAGE_PIN U18 [get_ports RESET]                        
set_property IOSTANDARD LVCMOS33 [get_ports RESET]

# TestMode - Slide Switch SW0
set_property PACKAGE_PIN V17 [get_ports TestMode]                        
set_property IOSTANDARD LVCMOS33 [get_ports TestMode]

##################################################################################
# Physical Pin Mapping - Outputs (Time Vectors)
##################################################################################
# Seconds_Out [5:0] mapped to LEDs [5:0]
set_property PACKAGE_PIN U16 [get_ports {Seconds_Out[0]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Seconds_Out[0]}]
set_property PACKAGE_PIN E19 [get_ports {Seconds_Out[1]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Seconds_Out[1]}]
set_property PACKAGE_PIN U19 [get_ports {Seconds_Out[2]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Seconds_Out[2]}]
set_property PACKAGE_PIN V19 [get_ports {Seconds_Out[3]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Seconds_Out[3]}]
set_property PACKAGE_PIN W18 [get_ports {Seconds_Out[4]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Seconds_Out[4]}]
set_property PACKAGE_PIN U15 [get_ports {Seconds_Out[5]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Seconds_Out[5]}]

# Minutes_Out [5:0] mapped to LEDs [11:6]
set_property PACKAGE_PIN U14 [get_ports {Minutes_Out[0]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Minutes_Out[0]}]
set_property PACKAGE_PIN V14 [get_ports {Minutes_Out[1]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Minutes_Out[1]}]
set_property PACKAGE_PIN V13 [get_ports {Minutes_Out[2]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Minutes_Out[2]}]
set_property PACKAGE_PIN V3  [get_ports {Minutes_Out[3]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Minutes_Out[3]}]
set_property PACKAGE_PIN W3  [get_ports {Minutes_Out[4]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Minutes_Out[4]}]
set_property PACKAGE_PIN U3  [get_ports {Minutes_Out[5]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Minutes_Out[5]}]

# Hours_Out [4:0] mapped to LEDs [15:12] and one PMOD pin
set_property PACKAGE_PIN P3  [get_ports {Hours_Out[0]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Hours_Out[0]}]
set_property PACKAGE_PIN N3  [get_ports {Hours_Out[1]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Hours_Out[1]}]
set_property PACKAGE_PIN P1  [get_ports {Hours_Out[2]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Hours_Out[2]}]
set_property PACKAGE_PIN L1  [get_ports {Hours_Out[3]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Hours_Out[3]}]

# Note: The Basys 3 board only has 16 LEDs. 
# The MSB of the Hours (Hours_Out[4]) is routed to PMOD Header JA, pin J1.
set_property PACKAGE_PIN J1  [get_ports {Hours_Out[4]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Hours_Out[4]}]

##################################################################################
# Configuration Voltages
##################################################################################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
