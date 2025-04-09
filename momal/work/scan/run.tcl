read_lib ../NangateOpenCellLibrary_slow_conditional_ccs.lib
read_lib -lef ../NANOCL.lef
read_verilog ../momal_scan.v
set_top_module
read_def ../momal_scan_def.def
report_scan_chain
