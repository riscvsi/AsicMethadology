
# read design 
read_verilog counter/counter.v

# elaborate design hierarchy
hierarchy -check -top first_counterNew 

# the high-level stuff
opt; fsm; opt;

# mapping to internal cell library
techmap; opt

# cleanup
synth -top first_counterNew 

dfflibmap -liberty counter/sky130_fd_sc_hd__tt_025C_1v80.lib

abc -liberty counter/sky130_fd_sc_hd__tt_025C_1v80.lib


# write synthesized design
write_verilog counter.synth.v

