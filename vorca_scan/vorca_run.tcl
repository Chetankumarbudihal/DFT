read_lib slow.lib
read_verilog vorca.v 
set load_netlist_ignore_undefined_cell true
set_top_module vorca
set IP [all_inputs]
set IP [remove_from_collection $IP clk] 
foreach_in_collection x $IP {
     set fanouts [all_fanout -endpoints_only -from $x]
     foreach_in_collection fo $fanouts {
         set v [get_object_name $fo]
         if {[regexp {/SI$} $v]} {
             puts "[get_object_name $x]===>$v"  
         }
     }
 } > vorca_si.rpt

