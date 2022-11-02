
source setup.tcl

set_db design_process_node 45

set_multi_cpu_usage -local_cpu 2
set_db timing_analysis_type ocv 
set_db timing_analysis_cppr both
set_db place_global_place_io_pins true


set conf_qxconf_file {NULL}
set conf_qxlib_file {NULL}
set defHierChar {/}
set init_design_settop 0
set init_gnd_net {VSS}
set init_lef_file $lefFiles
set init_mmmc_file scripts/innovus/mmmc${technology}.tcl}
set init_pwr_net {VDD}
set init_verilog synthesis/${designName}_synth.v
set lsgOCPGainMult 1.000000


set pnrDir "pnr"
if {![file exists $pnrDir]} {
  file mkdir "pnr"
  puts "Creating directory $pnrDir"
}
catch {cd $pnrDir}


set_multi_cpu_usage -local_cpu 2 -verbose

### need to generated viewDefinition_cui.tcl and use it here
#read_mmmc ../INPUT/viewDefinition_cui.tcl
###


read_physical -lef $lefFiles

read_netlist synthesis/output/${designName}.synth.v

read_power_intent -1801 synthesis/output/${designName}.synth.upf

init_design

commit_power_intent -verbose

check_power_domains -nets_missing_iso
check_power_domains -nets_missing_shifter


write_db setupComplete
