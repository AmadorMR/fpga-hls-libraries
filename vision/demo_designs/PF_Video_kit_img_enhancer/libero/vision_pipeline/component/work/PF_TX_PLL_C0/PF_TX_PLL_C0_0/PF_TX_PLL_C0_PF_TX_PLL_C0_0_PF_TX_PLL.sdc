set_component PF_TX_PLL_C0_PF_TX_PLL_C0_0_PF_TX_PLL
# Microsemi Corp.
# Date: 2023-Jun-16 13:53:23
#

create_clock -period 6.73401 [ get_pins { txpll_isnt_0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { txpll_isnt_0/DIV_CLK } ]
