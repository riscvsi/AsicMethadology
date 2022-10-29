source setup.tcl
#read_liberty $lib
#read_lef $techLef 
#read_verilog $synthNetlist
#link_design $designName
#read_sdc -echo $sdc
#unset_propagated_clock [all_clocks]
#
#
#set yUnit 2.72
#set xUnit 0.46
#
#set bottom_margin  [expr $yUnit * 1]
#set top_margin  [expr $yUnit * 1]
#set left_margin [expr $xUnit * 1]
#set right_margin [expr $xUnit * 1]
#
#
#initialize_floorplan -utilization 30 \
#    -aspect_ratio 1 \
#    -core_space "$bottom_margin $top_margin $left_margin $right_margin" \
#    -site unithd
#
exit
