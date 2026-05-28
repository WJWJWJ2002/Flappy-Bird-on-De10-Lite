create_clock -name clk_50 -period 20.000 -waveform {0.000 10.000} [get_ports clk_50]
derive_pll_clocks
derive_clock_uncertainty
set_output_delay -max [expr 1.811 + 0.2] -clock [get_clocks *pll1|clk[0]] [get_ports VGA_G*]
set_output_delay -min 1.500 -clock [get_clocks *pll1|clk[0]] [get_ports VGA_G*]
set_output_delay -max [expr 1.811 + 0.2] -clock [get_clocks *pll1|clk[0]] [get_ports VGA_R*]
set_output_delay -min 1.500 -clock [get_clocks *pll1|clk[0]] [get_ports VGA_R*]
set_output_delay -max [expr 1.811 + 0.2] -clock [get_clocks *pll1|clk[0]] [get_ports VGA_B*]
set_output_delay -min 1.500 -clock [get_clocks *pll1|clk[0]] [get_ports VGA_B*]
set_output_delay -max [expr 1.811 + 0.2] -clock [get_clocks *pll1|clk[0]] [get_ports VGA_HS]
set_output_delay -min 1.500 -clock [get_clocks *pll1|clk[0]] [get_ports VGA_HS]
set_output_delay -max [expr 1.811 + 0.2] -clock [get_clocks *pll1|clk[0]] [get_ports VGA_VS]
set_output_delay -min 1.500 -clock [get_clocks *pll1|clk[0]] [get_ports VGA_VS]
