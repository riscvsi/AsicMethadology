set_clock_latency -source -early -min -rise  -0.294962 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -early -min -fall  -0.267769 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -early -max -rise  -0.294962 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -early -max -fall  -0.267769 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -late -min -rise  -0.294962 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -late -min -fall  -0.267769 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -late -max -rise  -0.294962 [get_ports {wb_clk_i}] -clock clk 
set_clock_latency -source -late -max -fall  -0.267769 [get_ports {wb_clk_i}] -clock clk 
