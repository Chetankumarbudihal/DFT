#create_clock [get_ports tck]       -name tclk   -period 5   -waveform {2 4}
create_clock [get_ports tck]   -name tclk   -period 2   -waveform {0 1}
set_input_delay 2 -clock [get_clocks tck] [get_ports * -filter "direction==in"]
#set_input_delay 0.4 -clock [get_clocks tck] [get_ports tclk]
################################################################
## Assert functional mode
################################################################
set_case_analysis 0 [get_ports scan_enable]
set_case_analysis 0 [get_ports scan_mode]
################################################################
