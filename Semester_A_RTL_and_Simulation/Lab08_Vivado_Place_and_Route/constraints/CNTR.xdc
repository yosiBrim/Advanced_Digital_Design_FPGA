
##########
# Clocks #
##########
create_clock [get_ports CLK] -name CLK -period 10 -waveform {0 5}

###############
# Input Delay #
###############
set_input_delay 0 -clock CLK  -add_delay  [get_ports RESET]

################
# Output Delay #
################
set_output_delay 0 -clock CLK  -add_delay  [get_ports {Q* TC}]
