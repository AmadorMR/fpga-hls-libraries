set_component PF_XCVR_ERM_C0_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Jun-16 13:53:30
#

create_clock -period 6.73401 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 13.468 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 6.73401 -waveform {0 4.04 } [ get_pins { LANE0/RX_CLK_R } ]
create_clock -period 6.73401 [ get_pins { LANE1/REF_CLK_P } ]
create_clock -period 13.468 [ get_pins { LANE1/TX_CLK_R } ]
create_clock -period 6.73401 -waveform {0 4.04 } [ get_pins { LANE1/RX_CLK_R } ]
create_clock -period 6.73401 [ get_pins { LANE2/REF_CLK_P } ]
create_clock -period 13.468 [ get_pins { LANE2/TX_CLK_R } ]
create_clock -period 6.73401 -waveform {0 4.04 } [ get_pins { LANE2/RX_CLK_R } ]
create_clock -period 6.73401 [ get_pins { LANE3/REF_CLK_P } ]
create_clock -period 13.468 [ get_pins { LANE3/TX_CLK_R } ]
create_clock -period 6.73401 -waveform {0 4.04 } [ get_pins { LANE3/RX_CLK_R } ]
