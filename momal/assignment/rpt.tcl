
set output_file [open "Momalports.rpt" w]
set input_file [open "scanChain.rpt" r]
set active_chain "" 
set total_chains 0
set total_ff 0

puts $output_file [string repeat "-" 100]
puts $output_file [format "%-10s %-30s %-35s %-30s" "Chain_num" "Start FF Instance" "Cell Type" "source of data to SI pin"]
puts $output_file [string repeat "-" 100]

while {[gets $input_file line] >= 0} {
    if {[regexp {^\[(\d+)\]\s+scan info\s+:\s+(\S+)} $line -> chain_num]} {
        set active_chain $chain_num
        incr total_chains
        continue
    }
    
    if {$active_chain ne "" && [regexp {^\s*START:\s+(\S+)/\S+\s} $line -> ffs]} {
        set cell_type [get_attribute [get_cells $ffs] ref_name]
        set FI [get_object_name [all_fanin -startpoints_only -to "${ffs}/SI" -flat]]
        puts $output_file [format "%-10s %-30s %-35s %-30s" $active_chain $ffs $cell_type $FI]
        incr total_ff
        set active_chain ""
    }
}

puts $output_file [string repeat "-" 100]
puts $output_file "# Total Scan Chains: $total_chains"
puts $output_file "# Total Starting FFs Processed: $total_ff"
puts $output_file [string repeat "-" 100]

close $input_file
close $output_file
