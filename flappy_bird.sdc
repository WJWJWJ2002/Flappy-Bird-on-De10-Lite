## Generated SDC file "flappy_bird.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Thu May 28 21:41:07 2026"

##
## DEVICE  "10M50DAF484C7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll_0|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {pll_0|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 2 -master_clock {clk_50} [get_pins {pll_0|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_50}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_50}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_50}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_50}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_50}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_50}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_50}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_50}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -rise_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -rise_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -fall_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -fall_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -rise_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -rise_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -fall_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -fall_to [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_50}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.811 [get_ports {rst_n}]
set_input_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.000 [get_ports {rst_n}]
set_input_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.811 [get_ports {up}]
set_input_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.000 [get_ports {up}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_HS}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_HS}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -max -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  2.011 [get_ports {VGA_VS}]
set_output_delay -add_delay -min -clock [get_clocks {pll_0|altpll_component|auto_generated|pll1|clk[0]}]  1.500 [get_ports {VGA_VS}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_clocks {*|pll1|clk[0]}]  -to  [get_clocks {clk_50}]
set_false_path  -from  [get_clocks {clk_50}]  -to  [get_clocks {*|pll1|clk[0]}]
set_false_path -to [get_ports seg*]

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

