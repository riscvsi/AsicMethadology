if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast\
   -timing\
    [list [list ${::IMEX::libVar}/mmmc/pdkIO.lib\
          ${::IMEX::libVar}/mmmc/MEM2_512X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_4096X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_2048X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_136X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_128X16_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_1024X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM1_4096X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM1_256X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM1_1024X32_slow.lib\
          ${::IMEX::libVar}/mmmc/fast.lib\
          ${::IMEX::libVar}/mmmc/MEM2_128X32_slow.lib]]
create_library_set -name slow\
   -timing\
    [list [list ${::IMEX::libVar}/mmmc/MEM2_4096X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_2048X32_slow.lib\
          ${::IMEX::libVar}/mmmc/pdkIO.lib\
          ${::IMEX::libVar}/mmmc/MEM2_512X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_136X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_128X16_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_1024X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM1_4096X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM1_256X32_slow.lib\
          ${::IMEX::libVar}/mmmc/MEM1_1024X32_slow.lib\
          ${::IMEX::libVar}/mmmc/slow.lib\
          ${::IMEX::libVar}/mmmc/MEM2_128X32_slow.lib]]
create_timing_condition -name tc_fast\
   -library_sets [list fast]
create_timing_condition -name tc_slow\
   -library_sets [list slow]
create_rc_corner -name rc_best\
   -cap_table ${::IMEX::libVar}/mmmc/capTable\
   -pre_route_res 1.34236\
   -post_route_res 1.34236\
   -pre_route_cap 1.10066\
   -post_route_cap 0.960235\
   -post_route_cross_cap 1.22327\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {0.969117 0 0}\
   -temperature 0\
   -qrc_tech ${::IMEX::libVar}/mmmc/qrcTechFile
create_rc_corner -name rc_worst\
   -cap_table ${::IMEX::libVar}/mmmc/capTable\
   -pre_route_res 1.34236\
   -post_route_res 1.34236\
   -pre_route_cap 1.10066\
   -post_route_cap 0.960234\
   -post_route_cross_cap 1.22327\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {0.969117 0 0}\
   -temperature 125\
   -qrc_tech ${::IMEX::libVar}/mmmc/qrcTechFile
create_delay_corner -name slow_max\
   -timing_condition {tc_slow}\
   -rc_corner rc_worst
create_delay_corner -name fast_min\
   -timing_condition {tc_fast}\
   -rc_corner rc_best
create_constraint_mode -name functional_func_slow_max\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/functional_func_slow_max/functional_func_slow_max.sdc]
create_analysis_view -name func_slow_max -constraint_mode functional_func_slow_max -delay_corner slow_max -latency_file ${::IMEX::dataVar}/mmmc/views/func_slow_max/latency.sdc
create_analysis_view -name func_fast_min -constraint_mode functional_func_slow_max -delay_corner fast_min -latency_file ${::IMEX::dataVar}/mmmc/views/func_fast_min/latency.sdc
set_analysis_view -setup [list func_slow_max] -hold [list func_fast_min]
