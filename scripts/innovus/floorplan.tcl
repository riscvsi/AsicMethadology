
source setup.tcl


set conf_qxconf_file {NULL}
set conf_qxlib_file {NULL}
set defHierChar {/}
set init_design_settop 0
set init_gnd_net {VSS}
set init_lef_file $lefFiles
set init_mmmc_file [file normalize scripts/innovus/mmmc${technology}.tcl]
set init_pwr_net {VDD}
set init_verilog [file normalize synthesis/outputs/${designName}_synth.v]
set powerIntent [file normalize synthesis/outputs/${designName}_synth1.upf]
set lsgOCPGainMult 1.000000
set init_design_setup ${designName}

set pnrDir "pnr"
if {![file exists $pnrDir]} {
  file mkdir "pnr"
  puts "Creating directory $pnrDir"
}
catch {cd $pnrDir}


set_multi_cpu_usage -local_cpu 2 -verbose

### need to generated viewDefinition_cui.tcl and use it here
read_mmmc $init_mmmc_file
###


read_physical -lef $lefFiles

read_netlist $init_verilog

init_design
create_floorplan -site CoreSite -core_density_size 1 0.7 10 10 10 10

read_power_intent -1801 ../synthesis/outputs/${designName}_synth.upf
commit_power_intent -verbose



check_power_domains -nets_missing_iso
check_power_domains -nets_missing_shifter


write_db setupComplete.inn

exit
