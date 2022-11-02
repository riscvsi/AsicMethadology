
source setup.tcl


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


set_multi_cpu_usage -local_cpu $numCPUPnR -verbose

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
