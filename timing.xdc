
# CPU outputs to BRAM: stable for full 6.25 MHz period
set_max_delay -datapath_only 150.0 -from [get_clocks mhz_6_25_clk_wiz_0_1] -to [get_clocks mhz_50_clk_wiz_0_1]
# Cache to regfile: stable for full 6.25 MHz period  
set_max_delay -datapath_only 150.0 -from [get_clocks mhz_25_n_clk_wiz_0_1] -to [get_clocks mhz_6_25_clk_wiz_0_1]
# cpu_cache -> CPU decode -> ALU -> BRAM address
set_max_delay -datapath_only 150.0 -from [get_clocks mhz_25_n_clk_wiz_0_1] -to [get_clocks mhz_50_clk_wiz_0_1]

