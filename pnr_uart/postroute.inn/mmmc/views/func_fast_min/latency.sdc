set_clock_latency -source -early -min -rise  -0.0939906 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -early -min -fall  -0.0908218 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -early -max -rise  -0.0939906 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -early -max -fall  -0.0908218 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -late -min -rise  -0.0939906 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -late -min -fall  -0.0908218 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -late -max -rise  -0.0939906 [get_ports {sys_clk}] -clock clk 
set_clock_latency -source -late -max -fall  -0.0908218 [get_ports {sys_clk}] -clock clk 
