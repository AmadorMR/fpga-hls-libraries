//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:53:30 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_XCVR_ERM_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component PF_XCVR_ERM_C0
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_XCVR_ERM:3.1.200} -component_name {PF_XCVR_ERM_C0} -params {\
"EXPOSE_ALL_DEBUG_PORTS:false" \
"EXPOSE_FWF_EN_PORTS:false" \
"SHOW_UNIVERSAL_SOLN_PORTS:true" \
"UI_CDR_LOCK_MODE:Lock to data" \
"UI_CDR_REFERENCE_CLK_FREQ:148.50" \
"UI_CDR_REFERENCE_CLK_SOURCE:Dedicated" \
"UI_CDR_REFERENCE_CLK_TOLERANCE:1" \
"UI_ENABLE_32BIT_DATA_WIDTH:false" \
"UI_ENABLE_64B66B:true" \
"UI_ENABLE_64B67B:false" \
"UI_ENABLE_64B6XB_MODE:false" \
"UI_ENABLE_8B10B_MODE:false" \
"UI_ENABLE_BER:false" \
"UI_ENABLE_DISPARITY:false" \
"UI_ENABLE_FIBRE_CHANNEL_DISPARITY:false" \
"UI_ENABLE_PHASE_COMP_MODE:false" \
"UI_ENABLE_PIPE_MODE:false" \
"UI_ENABLE_PMA_MODE:true" \
"UI_ENABLE_SCRAMBLING:false" \
"UI_ENABLE_SWITCH_BETWEEN_CDR_REFCLKS:false" \
"UI_ENABLE_SWITCH_BETWEEN_TXPLLS:false" \
"UI_EXPOSE_APBLINK_PORTS:false" \
"UI_EXPOSE_CDR_BITSLIP_PORT:true" \
"UI_EXPOSE_DYNAMIC_RECONFIGURATION_PORTS:false" \
"UI_EXPOSE_JA_CLOCK_PORT:false" \
"UI_EXPOSE_RX_READY_VAL_CDR_PORT:false" \
"UI_EXPOSE_TX_BYPASS_DATA:false" \
"UI_EXPOSE_TX_ELEC_IDLE:false" \
"UI_INTERFACE_RXCLOCK:Regional" \
"UI_INTERFACE_TXCLOCK:Regional" \
"UI_IS_CONFIGURED:true" \
"UI_NUMBER_OF_LANES:4" \
"UI_PCS_ARST_N:RX Only" \
"UI_PIPE_PROTOCOL_USED:PCIe Gen1 (2.5 Gbps)" \
"UI_PMA_ARST_N:TX and RX PMA" \
"UI_PROTOCOL_PRESET_USED:None" \
"UI_RX_DATA_RATE:1485" \
"UI_RX_PCS_FAB_IF_WIDTH:10" \
"UI_SATA_IDLE_BURST_TIMING:MAC" \
"UI_TX_CLK_DIV_FACTOR:2" \
"UI_TX_DATA_RATE:2970" \
"UI_TX_PCS_FAB_IF_WIDTH:40" \
"UI_TX_RX_MODE:Tx and Rx (Independent)" \
"UI_USE_INTERFACE_CLK_AS_PLL_REFCLK:false" \
"UI_XCVR_RX_CALIBRATION:None (CDR)" \
"UI_XCVR_RX_DATA_EYE_CALIBRATION:false" \
"UI_XCVR_RX_DFE_COEFF_CALIBRATION:false" \
"UI_XCVR_RX_ENHANCED_MANAGEMENT:false" \
"XT_ES_DEVICE:false" }
# Exporting Component Description of PF_XCVR_ERM_C0 to TCL done
*/

// PF_XCVR_ERM_C0
module PF_XCVR_ERM_C0(
    // Inputs
    LANE0_CDR_REF_CLK_0,
    LANE0_PCS_ARST_N,
    LANE0_PMA_ARST_N,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE0_RX_SLIP,
    LANE0_TX_DATA,
    LANE1_CDR_REF_CLK_0,
    LANE1_PCS_ARST_N,
    LANE1_PMA_ARST_N,
    LANE1_RXD_N,
    LANE1_RXD_P,
    LANE1_RX_SLIP,
    LANE1_TX_DATA,
    LANE2_CDR_REF_CLK_0,
    LANE2_PCS_ARST_N,
    LANE2_PMA_ARST_N,
    LANE2_RXD_N,
    LANE2_RXD_P,
    LANE2_RX_SLIP,
    LANE2_TX_DATA,
    LANE3_CDR_REF_CLK_0,
    LANE3_PCS_ARST_N,
    LANE3_PMA_ARST_N,
    LANE3_RXD_N,
    LANE3_RXD_P,
    LANE3_RX_SLIP,
    LANE3_TX_DATA,
    TX_BIT_CLK_0,
    TX_PLL_LOCK_0,
    TX_PLL_REF_CLK_0,
    // Outputs
    LANE0_RX_BYPASS_DATA,
    LANE0_RX_CLK_R,
    LANE0_RX_DATA,
    LANE0_RX_IDLE,
    LANE0_RX_READY,
    LANE0_RX_VAL,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE0_TX_CLK_R,
    LANE0_TX_CLK_STABLE,
    LANE1_RX_BYPASS_DATA,
    LANE1_RX_CLK_R,
    LANE1_RX_DATA,
    LANE1_RX_IDLE,
    LANE1_RX_READY,
    LANE1_RX_VAL,
    LANE1_TXD_N,
    LANE1_TXD_P,
    LANE1_TX_CLK_R,
    LANE1_TX_CLK_STABLE,
    LANE2_RX_BYPASS_DATA,
    LANE2_RX_CLK_R,
    LANE2_RX_DATA,
    LANE2_RX_IDLE,
    LANE2_RX_READY,
    LANE2_RX_VAL,
    LANE2_TXD_N,
    LANE2_TXD_P,
    LANE2_TX_CLK_R,
    LANE2_TX_CLK_STABLE,
    LANE3_RX_BYPASS_DATA,
    LANE3_RX_CLK_R,
    LANE3_RX_DATA,
    LANE3_RX_IDLE,
    LANE3_RX_READY,
    LANE3_RX_VAL,
    LANE3_TXD_N,
    LANE3_TXD_P,
    LANE3_TX_CLK_R,
    LANE3_TX_CLK_STABLE
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         LANE0_CDR_REF_CLK_0;
input         LANE0_PCS_ARST_N;
input         LANE0_PMA_ARST_N;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE0_RX_SLIP;
input  [39:0] LANE0_TX_DATA;
input         LANE1_CDR_REF_CLK_0;
input         LANE1_PCS_ARST_N;
input         LANE1_PMA_ARST_N;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         LANE1_RX_SLIP;
input  [39:0] LANE1_TX_DATA;
input         LANE2_CDR_REF_CLK_0;
input         LANE2_PCS_ARST_N;
input         LANE2_PMA_ARST_N;
input         LANE2_RXD_N;
input         LANE2_RXD_P;
input         LANE2_RX_SLIP;
input  [39:0] LANE2_TX_DATA;
input         LANE3_CDR_REF_CLK_0;
input         LANE3_PCS_ARST_N;
input         LANE3_PMA_ARST_N;
input         LANE3_RXD_N;
input         LANE3_RXD_P;
input         LANE3_RX_SLIP;
input  [39:0] LANE3_TX_DATA;
input         TX_BIT_CLK_0;
input         TX_PLL_LOCK_0;
input         TX_PLL_REF_CLK_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        LANE0_RX_BYPASS_DATA;
output        LANE0_RX_CLK_R;
output [9:0]  LANE0_RX_DATA;
output        LANE0_RX_IDLE;
output        LANE0_RX_READY;
output        LANE0_RX_VAL;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output        LANE0_TX_CLK_R;
output        LANE0_TX_CLK_STABLE;
output        LANE1_RX_BYPASS_DATA;
output        LANE1_RX_CLK_R;
output [9:0]  LANE1_RX_DATA;
output        LANE1_RX_IDLE;
output        LANE1_RX_READY;
output        LANE1_RX_VAL;
output        LANE1_TXD_N;
output        LANE1_TXD_P;
output        LANE1_TX_CLK_R;
output        LANE1_TX_CLK_STABLE;
output        LANE2_RX_BYPASS_DATA;
output        LANE2_RX_CLK_R;
output [9:0]  LANE2_RX_DATA;
output        LANE2_RX_IDLE;
output        LANE2_RX_READY;
output        LANE2_RX_VAL;
output        LANE2_TXD_N;
output        LANE2_TXD_P;
output        LANE2_TX_CLK_R;
output        LANE2_TX_CLK_STABLE;
output        LANE3_RX_BYPASS_DATA;
output        LANE3_RX_CLK_R;
output [9:0]  LANE3_RX_DATA;
output        LANE3_RX_IDLE;
output        LANE3_RX_READY;
output        LANE3_RX_VAL;
output        LANE3_TXD_N;
output        LANE3_TXD_P;
output        LANE3_TX_CLK_R;
output        LANE3_TX_CLK_STABLE;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          TX_BIT_CLK_0;
wire          TX_PLL_LOCK_0;
wire          TX_PLL_REF_CLK_0;
wire          LANE0_CDR_REF_CLK_0;
wire          LANE0_PCS_ARST_N;
wire          LANE0_PMA_ARST_N;
wire          LANE0_RX_BYPASS_DATA_net_0;
wire          LANE0_RX_CLK_R_net_0;
wire   [9:0]  LANE0_RX_DATA_net_0;
wire          LANE0_RX_IDLE_net_0;
wire          LANE0_RX_READY_net_0;
wire          LANE0_RX_SLIP;
wire          LANE0_RX_VAL_net_0;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire          LANE0_TX_CLK_R_net_0;
wire          LANE0_TX_CLK_STABLE_net_0;
wire   [39:0] LANE0_TX_DATA;
wire          LANE0_TXD_N_net_0;
wire          LANE0_TXD_P_net_0;
wire          LANE1_CDR_REF_CLK_0;
wire          LANE1_PCS_ARST_N;
wire          LANE1_PMA_ARST_N;
wire          LANE1_RX_BYPASS_DATA_net_0;
wire          LANE1_RX_CLK_R_net_0;
wire   [9:0]  LANE1_RX_DATA_net_0;
wire          LANE1_RX_IDLE_net_0;
wire          LANE1_RX_READY_net_0;
wire          LANE1_RX_SLIP;
wire          LANE1_RX_VAL_net_0;
wire          LANE1_RXD_N;
wire          LANE1_RXD_P;
wire          LANE1_TX_CLK_R_net_0;
wire          LANE1_TX_CLK_STABLE_net_0;
wire   [39:0] LANE1_TX_DATA;
wire          LANE1_TXD_N_net_0;
wire          LANE1_TXD_P_net_0;
wire          LANE2_CDR_REF_CLK_0;
wire          LANE2_PCS_ARST_N;
wire          LANE2_PMA_ARST_N;
wire          LANE2_RX_BYPASS_DATA_net_0;
wire          LANE2_RX_CLK_R_net_0;
wire   [9:0]  LANE2_RX_DATA_net_0;
wire          LANE2_RX_IDLE_net_0;
wire          LANE2_RX_READY_net_0;
wire          LANE2_RX_SLIP;
wire          LANE2_RX_VAL_net_0;
wire          LANE2_RXD_N;
wire          LANE2_RXD_P;
wire          LANE2_TX_CLK_R_net_0;
wire          LANE2_TX_CLK_STABLE_net_0;
wire   [39:0] LANE2_TX_DATA;
wire          LANE2_TXD_N_net_0;
wire          LANE2_TXD_P_net_0;
wire          LANE3_CDR_REF_CLK_0;
wire          LANE3_PCS_ARST_N;
wire          LANE3_PMA_ARST_N;
wire          LANE3_RX_BYPASS_DATA_net_0;
wire          LANE3_RX_CLK_R_net_0;
wire   [9:0]  LANE3_RX_DATA_net_0;
wire          LANE3_RX_IDLE_net_0;
wire          LANE3_RX_READY_net_0;
wire          LANE3_RX_SLIP;
wire          LANE3_RX_VAL_net_0;
wire          LANE3_RXD_N;
wire          LANE3_RXD_P;
wire          LANE3_TX_CLK_R_net_0;
wire          LANE3_TX_CLK_STABLE_net_0;
wire   [39:0] LANE3_TX_DATA;
wire          LANE3_TXD_N_net_0;
wire          LANE3_TXD_P_net_0;
wire          LANE0_TXD_P_net_1;
wire          LANE0_TXD_N_net_1;
wire          LANE1_TXD_P_net_1;
wire          LANE1_TXD_N_net_1;
wire          LANE2_TXD_P_net_1;
wire          LANE2_TXD_N_net_1;
wire          LANE3_TXD_P_net_1;
wire          LANE3_TXD_N_net_1;
wire   [9:0]  LANE0_RX_DATA_net_1;
wire          LANE0_TX_CLK_R_net_1;
wire          LANE0_RX_CLK_R_net_1;
wire          LANE0_RX_IDLE_net_1;
wire          LANE0_RX_READY_net_1;
wire          LANE0_RX_VAL_net_1;
wire          LANE0_TX_CLK_STABLE_net_1;
wire          LANE0_RX_BYPASS_DATA_net_1;
wire   [9:0]  LANE1_RX_DATA_net_1;
wire          LANE1_TX_CLK_R_net_1;
wire          LANE1_RX_CLK_R_net_1;
wire          LANE1_RX_IDLE_net_1;
wire          LANE1_RX_READY_net_1;
wire          LANE1_RX_VAL_net_1;
wire          LANE1_TX_CLK_STABLE_net_1;
wire          LANE1_RX_BYPASS_DATA_net_1;
wire   [9:0]  LANE2_RX_DATA_net_1;
wire          LANE2_TX_CLK_R_net_1;
wire          LANE2_RX_CLK_R_net_1;
wire          LANE2_RX_IDLE_net_1;
wire          LANE2_RX_READY_net_1;
wire          LANE2_RX_VAL_net_1;
wire          LANE2_TX_CLK_STABLE_net_1;
wire          LANE2_RX_BYPASS_DATA_net_1;
wire   [9:0]  LANE3_RX_DATA_net_1;
wire          LANE3_TX_CLK_R_net_1;
wire          LANE3_RX_CLK_R_net_1;
wire          LANE3_RX_IDLE_net_1;
wire          LANE3_RX_READY_net_1;
wire          LANE3_RX_VAL_net_1;
wire          LANE3_TX_CLK_STABLE_net_1;
wire          LANE3_RX_BYPASS_DATA_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [9:0]  LANE0_TX_DISPFNC_const_net_0;
wire   [4:0]  LANE0_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE0_TX_HDR_const_net_0;
wire   [3:0]  LANE0_TXDATAK_const_net_0;
wire   [1:0]  LANE0_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE0_POWERDOWN_const_net_0;
wire   [1:0]  LANE0_SATA_RATE_const_net_0;
wire   [1:0]  LANE0_TXPATTERN_const_net_0;
wire   [1:0]  LANE0_CDR_LOCKMODE_const_net_0;
wire   [9:0]  LANE1_TX_DISPFNC_const_net_0;
wire   [4:0]  LANE1_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE1_TX_HDR_const_net_0;
wire   [3:0]  LANE1_TXDATAK_const_net_0;
wire   [1:0]  LANE1_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE1_POWERDOWN_const_net_0;
wire   [1:0]  LANE1_SATA_RATE_const_net_0;
wire   [1:0]  LANE1_TXPATTERN_const_net_0;
wire   [1:0]  LANE1_CDR_LOCKMODE_const_net_0;
wire   [9:0]  LANE2_TX_DISPFNC_const_net_0;
wire   [4:0]  LANE2_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE2_TX_HDR_const_net_0;
wire   [3:0]  LANE2_TXDATAK_const_net_0;
wire   [1:0]  LANE2_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE2_POWERDOWN_const_net_0;
wire   [1:0]  LANE2_SATA_RATE_const_net_0;
wire   [1:0]  LANE2_TXPATTERN_const_net_0;
wire   [1:0]  LANE2_CDR_LOCKMODE_const_net_0;
wire   [9:0]  LANE3_TX_DISPFNC_const_net_0;
wire   [4:0]  LANE3_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE3_TX_HDR_const_net_0;
wire   [3:0]  LANE3_TXDATAK_const_net_0;
wire   [1:0]  LANE3_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE3_POWERDOWN_const_net_0;
wire   [1:0]  LANE3_SATA_RATE_const_net_0;
wire   [1:0]  LANE3_TXPATTERN_const_net_0;
wire   [1:0]  LANE3_CDR_LOCKMODE_const_net_0;
wire   [1:0]  POWERDOWN_const_net_0;
wire   [2:0]  TXMARGIN_const_net_0;
wire   [32:0] LANE0_DRI_WDATA_const_net_0;
wire   [10:0] LANE0_DRI_CTRL_const_net_0;
wire   [32:0] LANE1_DRI_WDATA_const_net_0;
wire   [10:0] LANE1_DRI_CTRL_const_net_0;
wire   [32:0] LANE2_DRI_WDATA_const_net_0;
wire   [10:0] LANE2_DRI_CTRL_const_net_0;
wire   [32:0] LANE3_DRI_WDATA_const_net_0;
wire   [10:0] LANE3_DRI_CTRL_const_net_0;
wire   [2:0]  LANE0_LINK_ADDR_const_net_0;
wire   [3:0]  LANE0_LINK_WDATA_const_net_0;
wire   [2:0]  LANE1_LINK_ADDR_const_net_0;
wire   [3:0]  LANE1_LINK_WDATA_const_net_0;
wire   [2:0]  LANE2_LINK_ADDR_const_net_0;
wire   [3:0]  LANE2_LINK_WDATA_const_net_0;
wire   [2:0]  LANE3_LINK_ADDR_const_net_0;
wire   [3:0]  LANE3_LINK_WDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                        = 1'b0;
assign LANE0_TX_DISPFNC_const_net_0   = 10'h000;
assign LANE0_8B10B_TX_K_const_net_0   = 5'h00;
assign LANE0_TX_HDR_const_net_0       = 4'h0;
assign LANE0_TXDATAK_const_net_0      = 4'h0;
assign LANE0_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE0_POWERDOWN_const_net_0    = 2'h0;
assign LANE0_SATA_RATE_const_net_0    = 2'h0;
assign LANE0_TXPATTERN_const_net_0    = 2'h0;
assign LANE0_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE1_TX_DISPFNC_const_net_0   = 10'h000;
assign LANE1_8B10B_TX_K_const_net_0   = 5'h00;
assign LANE1_TX_HDR_const_net_0       = 4'h0;
assign LANE1_TXDATAK_const_net_0      = 4'h0;
assign LANE1_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE1_POWERDOWN_const_net_0    = 2'h0;
assign LANE1_SATA_RATE_const_net_0    = 2'h0;
assign LANE1_TXPATTERN_const_net_0    = 2'h0;
assign LANE1_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE2_TX_DISPFNC_const_net_0   = 10'h000;
assign LANE2_8B10B_TX_K_const_net_0   = 5'h00;
assign LANE2_TX_HDR_const_net_0       = 4'h0;
assign LANE2_TXDATAK_const_net_0      = 4'h0;
assign LANE2_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE2_POWERDOWN_const_net_0    = 2'h0;
assign LANE2_SATA_RATE_const_net_0    = 2'h0;
assign LANE2_TXPATTERN_const_net_0    = 2'h0;
assign LANE2_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE3_TX_DISPFNC_const_net_0   = 10'h000;
assign LANE3_8B10B_TX_K_const_net_0   = 5'h00;
assign LANE3_TX_HDR_const_net_0       = 4'h0;
assign LANE3_TXDATAK_const_net_0      = 4'h0;
assign LANE3_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE3_POWERDOWN_const_net_0    = 2'h0;
assign LANE3_SATA_RATE_const_net_0    = 2'h0;
assign LANE3_TXPATTERN_const_net_0    = 2'h0;
assign LANE3_CDR_LOCKMODE_const_net_0 = 2'h0;
assign POWERDOWN_const_net_0          = 2'h0;
assign TXMARGIN_const_net_0           = 3'h0;
assign LANE0_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE0_DRI_CTRL_const_net_0     = 11'h000;
assign LANE1_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE1_DRI_CTRL_const_net_0     = 11'h000;
assign LANE2_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE2_DRI_CTRL_const_net_0     = 11'h000;
assign LANE3_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE3_DRI_CTRL_const_net_0     = 11'h000;
assign LANE0_LINK_ADDR_const_net_0    = 3'h0;
assign LANE0_LINK_WDATA_const_net_0   = 4'h0;
assign LANE1_LINK_ADDR_const_net_0    = 3'h0;
assign LANE1_LINK_WDATA_const_net_0   = 4'h0;
assign LANE2_LINK_ADDR_const_net_0    = 3'h0;
assign LANE2_LINK_WDATA_const_net_0   = 4'h0;
assign LANE3_LINK_ADDR_const_net_0    = 3'h0;
assign LANE3_LINK_WDATA_const_net_0   = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1          = LANE0_TXD_P_net_0;
assign LANE0_TXD_P                = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1          = LANE0_TXD_N_net_0;
assign LANE0_TXD_N                = LANE0_TXD_N_net_1;
assign LANE1_TXD_P_net_1          = LANE1_TXD_P_net_0;
assign LANE1_TXD_P                = LANE1_TXD_P_net_1;
assign LANE1_TXD_N_net_1          = LANE1_TXD_N_net_0;
assign LANE1_TXD_N                = LANE1_TXD_N_net_1;
assign LANE2_TXD_P_net_1          = LANE2_TXD_P_net_0;
assign LANE2_TXD_P                = LANE2_TXD_P_net_1;
assign LANE2_TXD_N_net_1          = LANE2_TXD_N_net_0;
assign LANE2_TXD_N                = LANE2_TXD_N_net_1;
assign LANE3_TXD_P_net_1          = LANE3_TXD_P_net_0;
assign LANE3_TXD_P                = LANE3_TXD_P_net_1;
assign LANE3_TXD_N_net_1          = LANE3_TXD_N_net_0;
assign LANE3_TXD_N                = LANE3_TXD_N_net_1;
assign LANE0_RX_DATA_net_1        = LANE0_RX_DATA_net_0;
assign LANE0_RX_DATA[9:0]         = LANE0_RX_DATA_net_1;
assign LANE0_TX_CLK_R_net_1       = LANE0_TX_CLK_R_net_0;
assign LANE0_TX_CLK_R             = LANE0_TX_CLK_R_net_1;
assign LANE0_RX_CLK_R_net_1       = LANE0_RX_CLK_R_net_0;
assign LANE0_RX_CLK_R             = LANE0_RX_CLK_R_net_1;
assign LANE0_RX_IDLE_net_1        = LANE0_RX_IDLE_net_0;
assign LANE0_RX_IDLE              = LANE0_RX_IDLE_net_1;
assign LANE0_RX_READY_net_1       = LANE0_RX_READY_net_0;
assign LANE0_RX_READY             = LANE0_RX_READY_net_1;
assign LANE0_RX_VAL_net_1         = LANE0_RX_VAL_net_0;
assign LANE0_RX_VAL               = LANE0_RX_VAL_net_1;
assign LANE0_TX_CLK_STABLE_net_1  = LANE0_TX_CLK_STABLE_net_0;
assign LANE0_TX_CLK_STABLE        = LANE0_TX_CLK_STABLE_net_1;
assign LANE0_RX_BYPASS_DATA_net_1 = LANE0_RX_BYPASS_DATA_net_0;
assign LANE0_RX_BYPASS_DATA       = LANE0_RX_BYPASS_DATA_net_1;
assign LANE1_RX_DATA_net_1        = LANE1_RX_DATA_net_0;
assign LANE1_RX_DATA[9:0]         = LANE1_RX_DATA_net_1;
assign LANE1_TX_CLK_R_net_1       = LANE1_TX_CLK_R_net_0;
assign LANE1_TX_CLK_R             = LANE1_TX_CLK_R_net_1;
assign LANE1_RX_CLK_R_net_1       = LANE1_RX_CLK_R_net_0;
assign LANE1_RX_CLK_R             = LANE1_RX_CLK_R_net_1;
assign LANE1_RX_IDLE_net_1        = LANE1_RX_IDLE_net_0;
assign LANE1_RX_IDLE              = LANE1_RX_IDLE_net_1;
assign LANE1_RX_READY_net_1       = LANE1_RX_READY_net_0;
assign LANE1_RX_READY             = LANE1_RX_READY_net_1;
assign LANE1_RX_VAL_net_1         = LANE1_RX_VAL_net_0;
assign LANE1_RX_VAL               = LANE1_RX_VAL_net_1;
assign LANE1_TX_CLK_STABLE_net_1  = LANE1_TX_CLK_STABLE_net_0;
assign LANE1_TX_CLK_STABLE        = LANE1_TX_CLK_STABLE_net_1;
assign LANE1_RX_BYPASS_DATA_net_1 = LANE1_RX_BYPASS_DATA_net_0;
assign LANE1_RX_BYPASS_DATA       = LANE1_RX_BYPASS_DATA_net_1;
assign LANE2_RX_DATA_net_1        = LANE2_RX_DATA_net_0;
assign LANE2_RX_DATA[9:0]         = LANE2_RX_DATA_net_1;
assign LANE2_TX_CLK_R_net_1       = LANE2_TX_CLK_R_net_0;
assign LANE2_TX_CLK_R             = LANE2_TX_CLK_R_net_1;
assign LANE2_RX_CLK_R_net_1       = LANE2_RX_CLK_R_net_0;
assign LANE2_RX_CLK_R             = LANE2_RX_CLK_R_net_1;
assign LANE2_RX_IDLE_net_1        = LANE2_RX_IDLE_net_0;
assign LANE2_RX_IDLE              = LANE2_RX_IDLE_net_1;
assign LANE2_RX_READY_net_1       = LANE2_RX_READY_net_0;
assign LANE2_RX_READY             = LANE2_RX_READY_net_1;
assign LANE2_RX_VAL_net_1         = LANE2_RX_VAL_net_0;
assign LANE2_RX_VAL               = LANE2_RX_VAL_net_1;
assign LANE2_TX_CLK_STABLE_net_1  = LANE2_TX_CLK_STABLE_net_0;
assign LANE2_TX_CLK_STABLE        = LANE2_TX_CLK_STABLE_net_1;
assign LANE2_RX_BYPASS_DATA_net_1 = LANE2_RX_BYPASS_DATA_net_0;
assign LANE2_RX_BYPASS_DATA       = LANE2_RX_BYPASS_DATA_net_1;
assign LANE3_RX_DATA_net_1        = LANE3_RX_DATA_net_0;
assign LANE3_RX_DATA[9:0]         = LANE3_RX_DATA_net_1;
assign LANE3_TX_CLK_R_net_1       = LANE3_TX_CLK_R_net_0;
assign LANE3_TX_CLK_R             = LANE3_TX_CLK_R_net_1;
assign LANE3_RX_CLK_R_net_1       = LANE3_RX_CLK_R_net_0;
assign LANE3_RX_CLK_R             = LANE3_RX_CLK_R_net_1;
assign LANE3_RX_IDLE_net_1        = LANE3_RX_IDLE_net_0;
assign LANE3_RX_IDLE              = LANE3_RX_IDLE_net_1;
assign LANE3_RX_READY_net_1       = LANE3_RX_READY_net_0;
assign LANE3_RX_READY             = LANE3_RX_READY_net_1;
assign LANE3_RX_VAL_net_1         = LANE3_RX_VAL_net_0;
assign LANE3_RX_VAL               = LANE3_RX_VAL_net_1;
assign LANE3_TX_CLK_STABLE_net_1  = LANE3_TX_CLK_STABLE_net_0;
assign LANE3_TX_CLK_STABLE        = LANE3_TX_CLK_STABLE_net_1;
assign LANE3_RX_BYPASS_DATA_net_1 = LANE3_RX_BYPASS_DATA_net_0;
assign LANE3_RX_BYPASS_DATA       = LANE3_RX_BYPASS_DATA_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_XCVR_ERM_C0_I_XCVR_PF_XCVR   -   Actel:SgCore:PF_XCVR:2.1.101
PF_XCVR_ERM_C0_I_XCVR_PF_XCVR I_XCVR(
        // Inputs
        .LANE0_TX_DATA        ( LANE0_TX_DATA ),
        .LANE0_CDR_REF_CLK_0  ( LANE0_CDR_REF_CLK_0 ),
        .LANE0_RX_SLIP        ( LANE0_RX_SLIP ),
        .LANE0_PCS_ARST_N     ( LANE0_PCS_ARST_N ),
        .LANE0_PMA_ARST_N     ( LANE0_PMA_ARST_N ),
        .LANE1_TX_DATA        ( LANE1_TX_DATA ),
        .LANE1_CDR_REF_CLK_0  ( LANE1_CDR_REF_CLK_0 ),
        .LANE1_RX_SLIP        ( LANE1_RX_SLIP ),
        .LANE1_PCS_ARST_N     ( LANE1_PCS_ARST_N ),
        .LANE1_PMA_ARST_N     ( LANE1_PMA_ARST_N ),
        .LANE2_TX_DATA        ( LANE2_TX_DATA ),
        .LANE2_CDR_REF_CLK_0  ( LANE2_CDR_REF_CLK_0 ),
        .LANE2_RX_SLIP        ( LANE2_RX_SLIP ),
        .LANE2_PCS_ARST_N     ( LANE2_PCS_ARST_N ),
        .LANE2_PMA_ARST_N     ( LANE2_PMA_ARST_N ),
        .LANE3_TX_DATA        ( LANE3_TX_DATA ),
        .LANE3_CDR_REF_CLK_0  ( LANE3_CDR_REF_CLK_0 ),
        .LANE3_RX_SLIP        ( LANE3_RX_SLIP ),
        .LANE3_PCS_ARST_N     ( LANE3_PCS_ARST_N ),
        .LANE3_PMA_ARST_N     ( LANE3_PMA_ARST_N ),
        .TX_BIT_CLK_0         ( TX_BIT_CLK_0 ),
        .TX_PLL_REF_CLK_0     ( TX_PLL_REF_CLK_0 ),
        .TX_PLL_LOCK_0        ( TX_PLL_LOCK_0 ),
        .LANE0_RXD_P          ( LANE0_RXD_P ),
        .LANE0_RXD_N          ( LANE0_RXD_N ),
        .LANE1_RXD_P          ( LANE1_RXD_P ),
        .LANE1_RXD_N          ( LANE1_RXD_N ),
        .LANE2_RXD_P          ( LANE2_RXD_P ),
        .LANE2_RXD_N          ( LANE2_RXD_N ),
        .LANE3_RXD_P          ( LANE3_RXD_P ),
        .LANE3_RXD_N          ( LANE3_RXD_N ),
        // Outputs
        .LANE0_RX_DATA        ( LANE0_RX_DATA_net_0 ),
        .LANE0_TX_CLK_R       ( LANE0_TX_CLK_R_net_0 ),
        .LANE0_RX_CLK_R       ( LANE0_RX_CLK_R_net_0 ),
        .LANE0_RX_IDLE        ( LANE0_RX_IDLE_net_0 ),
        .LANE0_RX_READY       ( LANE0_RX_READY_net_0 ),
        .LANE0_RX_VAL         ( LANE0_RX_VAL_net_0 ),
        .LANE0_TX_CLK_STABLE  ( LANE0_TX_CLK_STABLE_net_0 ),
        .LANE0_RX_BYPASS_DATA ( LANE0_RX_BYPASS_DATA_net_0 ),
        .LANE1_RX_DATA        ( LANE1_RX_DATA_net_0 ),
        .LANE1_TX_CLK_R       ( LANE1_TX_CLK_R_net_0 ),
        .LANE1_RX_CLK_R       ( LANE1_RX_CLK_R_net_0 ),
        .LANE1_RX_IDLE        ( LANE1_RX_IDLE_net_0 ),
        .LANE1_RX_READY       ( LANE1_RX_READY_net_0 ),
        .LANE1_RX_VAL         ( LANE1_RX_VAL_net_0 ),
        .LANE1_TX_CLK_STABLE  ( LANE1_TX_CLK_STABLE_net_0 ),
        .LANE1_RX_BYPASS_DATA ( LANE1_RX_BYPASS_DATA_net_0 ),
        .LANE2_RX_DATA        ( LANE2_RX_DATA_net_0 ),
        .LANE2_TX_CLK_R       ( LANE2_TX_CLK_R_net_0 ),
        .LANE2_RX_CLK_R       ( LANE2_RX_CLK_R_net_0 ),
        .LANE2_RX_IDLE        ( LANE2_RX_IDLE_net_0 ),
        .LANE2_RX_READY       ( LANE2_RX_READY_net_0 ),
        .LANE2_RX_VAL         ( LANE2_RX_VAL_net_0 ),
        .LANE2_TX_CLK_STABLE  ( LANE2_TX_CLK_STABLE_net_0 ),
        .LANE2_RX_BYPASS_DATA ( LANE2_RX_BYPASS_DATA_net_0 ),
        .LANE3_RX_DATA        ( LANE3_RX_DATA_net_0 ),
        .LANE3_TX_CLK_R       ( LANE3_TX_CLK_R_net_0 ),
        .LANE3_RX_CLK_R       ( LANE3_RX_CLK_R_net_0 ),
        .LANE3_RX_IDLE        ( LANE3_RX_IDLE_net_0 ),
        .LANE3_RX_READY       ( LANE3_RX_READY_net_0 ),
        .LANE3_RX_VAL         ( LANE3_RX_VAL_net_0 ),
        .LANE3_TX_CLK_STABLE  ( LANE3_TX_CLK_STABLE_net_0 ),
        .LANE3_RX_BYPASS_DATA ( LANE3_RX_BYPASS_DATA_net_0 ),
        .LANE0_TXD_P          ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N          ( LANE0_TXD_N_net_0 ),
        .LANE1_TXD_P          ( LANE1_TXD_P_net_0 ),
        .LANE1_TXD_N          ( LANE1_TXD_N_net_0 ),
        .LANE2_TXD_P          ( LANE2_TXD_P_net_0 ),
        .LANE2_TXD_N          ( LANE2_TXD_N_net_0 ),
        .LANE3_TXD_P          ( LANE3_TXD_P_net_0 ),
        .LANE3_TXD_N          ( LANE3_TXD_N_net_0 ) 
        );


endmodule
