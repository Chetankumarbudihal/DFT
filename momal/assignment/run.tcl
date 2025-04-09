read_lib ../NangateOpenCellLibrary_slow_conditional_ccs.lib
read_lib -lef ../NANOCL.lef 
read_verilog ../momal_scan.v 
set_top_module
read_def ../momal_scan_def.def
set IP [all_inputs ]
set IP [remove_from_collection $IP {in_cfclk in_sclk in_rclk in_cclk tck}]
set fo [] 
set freg []
foreach_in_collection x $IP {
 lappend fo [all_fanout -endpoints_only -from $x]
}

