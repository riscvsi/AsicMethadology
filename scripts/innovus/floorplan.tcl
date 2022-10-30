
source setup.tcl

set pnrDir "pnr"
if {![file exists $pnrDir]} {
  file mkdir "pnr"
  puts "Creating directory $pnrDir"
}
catch {cd $pnrDir}


set_multi_cpu_usage -local_cpu $numCPUPnR -verbose

### need to generated viewDefinition_cui.tcl and use it here
read_mmmc ../INPUT/viewDefinition_cui.tcl
###


read_physical -lef $lefFiles

read_netlist synthesis/output/${designName}.synth.v

read_power_intent -1801 synthesis/output/${designName}.synth.upf

init_design

commit_power_intent -verbose

check_power_domains -nets_missing_iso
check_power_domains -nets_missing_shifter


write_db setupComplete
