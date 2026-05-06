##########
# Clocks #
##########
create_clock -name CLK -period 10 -waveform {0 5} [get_ports CLK]

###############
# Input Delay #
###############
set_input_delay 0 -clock CLK  -add_delay  [get_ports {RESET*}]

################
# Output Delay #
################
set_output_delay 0 -clock CLK  -add_delay  [get_ports {LIGHT*}]

##############################
# Pin Locations and Voltages #
##############################
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports { CLK  }]; 
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { RESET}]; 

set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { LIGHT[0]  }];
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { LIGHT[1]  }];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { LIGHT[2]  }];
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { LIGHT[3]  }];
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { LIGHT[4]  }];

##########################
# Configuration Settings #
##########################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
