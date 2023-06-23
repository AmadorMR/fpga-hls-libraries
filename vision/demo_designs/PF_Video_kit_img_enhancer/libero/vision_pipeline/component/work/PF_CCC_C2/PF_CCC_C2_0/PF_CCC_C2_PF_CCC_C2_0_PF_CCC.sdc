set_component PF_CCC_C2_PF_CCC_C2_0_PF_CCC
# Microsemi Corp.
# Date: 2023-Jun-16 13:52:09
#

# Base clock for PLL #0
create_clock -period 6.66667 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 99 -divide_by 200 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
