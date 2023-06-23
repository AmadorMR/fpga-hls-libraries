//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:53:46 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// HDMI_2p0
module HDMI_2p0(
    // Inputs
    AXIS_tdata,
    AXIS_tlast,
    AXIS_tuser,
    AXIS_tvalid,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_RXD_N,
    LANE1_RXD_P,
    LANE2_RXD_N,
    LANE2_RXD_P,
    LANE3_RXD_N,
    LANE3_RXD_P,
    REF_CLK_PAD_N,
    REF_CLK_PAD_P,
    RESET_N_I_0,
    // Outputs
    AXIS_tready_O,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE0_TX_CLK_R,
    LANE1_TXD_N,
    LANE1_TXD_P,
    LANE2_TXD_N,
    LANE2_TXD_P,
    LANE3_TXD_N,
    LANE3_TXD_P,
    // Inouts
    SDA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [95:0] AXIS_tdata;
input         AXIS_tlast;
input  [0:0]  AXIS_tuser;
input         AXIS_tvalid;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         LANE2_RXD_N;
input         LANE2_RXD_P;
input         LANE3_RXD_N;
input         LANE3_RXD_P;
input         REF_CLK_PAD_N;
input         REF_CLK_PAD_P;
input         RESET_N_I_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        AXIS_tready_O;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output        LANE0_TX_CLK_R;
output        LANE1_TXD_N;
output        LANE1_TXD_P;
output        LANE2_TXD_N;
output        LANE2_TXD_P;
output        LANE3_TXD_N;
output        LANE3_TXD_P;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         SDA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [95:0] AXIS_tdata;
wire          AXIS_tlast;
wire          AXIS_TREADY;
wire   [0:0]  AXIS_tuser;
wire          AXIS_tvalid;
wire   [31:0] AXIS_To_VGA_Converter_0_B_O;
wire          AXIS_To_VGA_Converter_0_data_enable_O;
wire   [31:0] AXIS_To_VGA_Converter_0_G_O;
wire          AXIS_To_VGA_Converter_0_hsync_O;
wire   [31:0] AXIS_To_VGA_Converter_0_R_O;
wire          AXIS_To_VGA_Converter_0_vsync_O;
wire   [39:0] HDMI_TX_C0_0_TMDS_B_O;
wire   [39:0] HDMI_TX_C0_0_TMDS_G_O;
wire   [39:0] HDMI_TX_C0_0_TMDS_R_O;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire          LANE0_TX_CLK_R_net_0;
wire          LANE0_TXD_N_net_0;
wire          LANE0_TXD_P_net_0;
wire          LANE1_RXD_N;
wire          LANE1_RXD_P;
wire          LANE1_TXD_N_net_0;
wire          LANE1_TXD_P_net_0;
wire          LANE2_RXD_N;
wire          LANE2_RXD_P;
wire          LANE2_TXD_N_net_0;
wire          LANE2_TXD_P_net_0;
wire          LANE3_RXD_N;
wire          LANE3_RXD_P;
wire          LANE3_TXD_N_net_0;
wire          LANE3_TXD_P_net_0;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire          PF_XCVR_REF_CLK_C0_0_REF_CLK;
wire          REF_CLK_PAD_N;
wire          REF_CLK_PAD_P;
wire          RESET_N_I_0;
wire          SDA;
wire          AXIS_TREADY_net_0;
wire          LANE0_TXD_N_net_1;
wire          LANE0_TXD_P_net_1;
wire          LANE0_TX_CLK_R_net_1;
wire          LANE1_TXD_N_net_1;
wire          LANE1_TXD_P_net_1;
wire          LANE2_TXD_N_net_1;
wire          LANE2_TXD_P_net_1;
wire          LANE3_TXD_N_net_1;
wire          LANE3_TXD_P_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [39:0] LANE0_TX_DATA_const_net_0;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire          reset_IN_POST_INV0_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                   = 1'b0;
assign LANE0_TX_DATA_const_net_0 = 40'h07C1F07C1F;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign reset_IN_POST_INV0_0 = ~ RESET_N_I_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AXIS_TREADY_net_0    = AXIS_TREADY;
assign AXIS_tready_O        = AXIS_TREADY_net_0;
assign LANE0_TXD_N_net_1    = LANE0_TXD_N_net_0;
assign LANE0_TXD_N          = LANE0_TXD_N_net_1;
assign LANE0_TXD_P_net_1    = LANE0_TXD_P_net_0;
assign LANE0_TXD_P          = LANE0_TXD_P_net_1;
assign LANE0_TX_CLK_R_net_1 = LANE0_TX_CLK_R_net_0;
assign LANE0_TX_CLK_R       = LANE0_TX_CLK_R_net_1;
assign LANE1_TXD_N_net_1    = LANE1_TXD_N_net_0;
assign LANE1_TXD_N          = LANE1_TXD_N_net_1;
assign LANE1_TXD_P_net_1    = LANE1_TXD_P_net_0;
assign LANE1_TXD_P          = LANE1_TXD_P_net_1;
assign LANE2_TXD_N_net_1    = LANE2_TXD_N_net_0;
assign LANE2_TXD_N          = LANE2_TXD_N_net_1;
assign LANE2_TXD_P_net_1    = LANE2_TXD_P_net_0;
assign LANE2_TXD_P          = LANE2_TXD_P_net_1;
assign LANE3_TXD_N_net_1    = LANE3_TXD_N_net_0;
assign LANE3_TXD_N          = LANE3_TXD_N_net_1;
assign LANE3_TXD_P_net_1    = LANE3_TXD_P_net_0;
assign LANE3_TXD_P          = LANE3_TXD_P_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AXIS_To_VGA_Converter
AXIS_To_VGA_Converter #( 
        .C_WIDTH       ( 8 ),
        .DEBUBBLE      ( 1 ),
        .FIFO_DEPTH    ( 32 ),
        .PIXEL_PER_CLK ( 4 ),
        .RESOLUTION    ( 2 ),
        .TUSER_WIDTH   ( 1 ) )
AXIS_To_VGA_Converter_0(
        // Inputs
        .reset         ( reset_IN_POST_INV0_0 ),
        .clk           ( LANE0_TX_CLK_R_net_0 ),
        .tlast         ( AXIS_tlast ),
        .tvalid        ( AXIS_tvalid ),
        .tuser         ( AXIS_tuser ),
        .tdata         ( AXIS_tdata ),
        // Outputs
        .tready_O      ( AXIS_TREADY ),
        .hsync_O       ( AXIS_To_VGA_Converter_0_hsync_O ),
        .vsync_O       ( AXIS_To_VGA_Converter_0_vsync_O ),
        .data_enable_O ( AXIS_To_VGA_Converter_0_data_enable_O ),
        .R_O           ( AXIS_To_VGA_Converter_0_R_O ),
        .G_O           ( AXIS_To_VGA_Converter_0_G_O ),
        .B_O           ( AXIS_To_VGA_Converter_0_B_O ) 
        );

//--------BIBUF
BIBUF BIBUF_0(
        // Inputs
        .D   ( GND_net ),
        .E   ( GND_net ),
        // Outputs
        .Y   (  ),
        // Inouts
        .PAD ( SDA ) 
        );

//--------HDMI_TX_C0
HDMI_TX_C0 HDMI_TX_C0_0(
        // Inputs
        .RESET_N_I    ( RESET_N_I_0 ),
        .SYS_CLK_I    ( LANE0_TX_CLK_R_net_0 ),
        .DATA_VALID_I ( AXIS_To_VGA_Converter_0_data_enable_O ),
        .DATA_R_I     ( AXIS_To_VGA_Converter_0_R_O ),
        .DATA_G_I     ( AXIS_To_VGA_Converter_0_G_O ),
        .DATA_B_I     ( AXIS_To_VGA_Converter_0_B_O ),
        .V_SYNC_I     ( AXIS_To_VGA_Converter_0_vsync_O ),
        .H_SYNC_I     ( AXIS_To_VGA_Converter_0_hsync_O ),
        // Outputs
        .TMDS_R_O     ( HDMI_TX_C0_0_TMDS_R_O ),
        .TMDS_G_O     ( HDMI_TX_C0_0_TMDS_G_O ),
        .TMDS_B_O     ( HDMI_TX_C0_0_TMDS_B_O ) 
        );

//--------PF_TX_PLL_C0
PF_TX_PLL_C0 PF_TX_PLL_C0_0(
        // Inputs
        .REF_CLK         ( PF_XCVR_REF_CLK_C0_0_REF_CLK ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ) 
        );

//--------PF_XCVR_ERM_C0
PF_XCVR_ERM_C0 PF_XCVR_ERM_C0_0(
        // Inputs
        .LANE0_RXD_P          ( LANE0_RXD_P ),
        .LANE0_RXD_N          ( LANE0_RXD_N ),
        .LANE1_RXD_P          ( LANE1_RXD_P ),
        .LANE1_RXD_N          ( LANE1_RXD_N ),
        .LANE2_RXD_P          ( LANE2_RXD_P ),
        .LANE2_RXD_N          ( LANE2_RXD_N ),
        .LANE3_RXD_P          ( LANE3_RXD_P ),
        .LANE3_RXD_N          ( LANE3_RXD_N ),
        .LANE0_TX_DATA        ( LANE0_TX_DATA_const_net_0 ),
        .LANE0_CDR_REF_CLK_0  ( PF_XCVR_REF_CLK_C0_0_REF_CLK ),
        .LANE0_RX_SLIP        ( GND_net ),
        .LANE0_PCS_ARST_N     ( RESET_N_I_0 ),
        .LANE0_PMA_ARST_N     ( RESET_N_I_0 ),
        .LANE1_TX_DATA        ( HDMI_TX_C0_0_TMDS_B_O ),
        .LANE1_CDR_REF_CLK_0  ( PF_XCVR_REF_CLK_C0_0_REF_CLK ),
        .LANE1_RX_SLIP        ( GND_net ),
        .LANE1_PCS_ARST_N     ( RESET_N_I_0 ),
        .LANE1_PMA_ARST_N     ( RESET_N_I_0 ),
        .LANE2_TX_DATA        ( HDMI_TX_C0_0_TMDS_G_O ),
        .LANE2_CDR_REF_CLK_0  ( PF_XCVR_REF_CLK_C0_0_REF_CLK ),
        .LANE2_RX_SLIP        ( GND_net ),
        .LANE2_PCS_ARST_N     ( RESET_N_I_0 ),
        .LANE2_PMA_ARST_N     ( RESET_N_I_0 ),
        .LANE3_TX_DATA        ( HDMI_TX_C0_0_TMDS_R_O ),
        .LANE3_CDR_REF_CLK_0  ( PF_XCVR_REF_CLK_C0_0_REF_CLK ),
        .LANE3_RX_SLIP        ( GND_net ),
        .LANE3_PCS_ARST_N     ( RESET_N_I_0 ),
        .LANE3_PMA_ARST_N     ( RESET_N_I_0 ),
        .TX_PLL_LOCK_0        ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK ),
        .TX_BIT_CLK_0         ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK ),
        .TX_PLL_REF_CLK_0     ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        // Outputs
        .LANE0_TXD_P          ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N          ( LANE0_TXD_N_net_0 ),
        .LANE1_TXD_P          ( LANE1_TXD_P_net_0 ),
        .LANE1_TXD_N          ( LANE1_TXD_N_net_0 ),
        .LANE2_TXD_P          ( LANE2_TXD_P_net_0 ),
        .LANE2_TXD_N          ( LANE2_TXD_N_net_0 ),
        .LANE3_TXD_P          ( LANE3_TXD_P_net_0 ),
        .LANE3_TXD_N          ( LANE3_TXD_N_net_0 ),
        .LANE0_RX_DATA        (  ),
        .LANE0_TX_CLK_R       ( LANE0_TX_CLK_R_net_0 ),
        .LANE0_RX_CLK_R       (  ),
        .LANE0_RX_IDLE        (  ),
        .LANE0_RX_READY       (  ),
        .LANE0_RX_VAL         (  ),
        .LANE0_TX_CLK_STABLE  (  ),
        .LANE0_RX_BYPASS_DATA (  ),
        .LANE1_RX_DATA        (  ),
        .LANE1_TX_CLK_R       (  ),
        .LANE1_RX_CLK_R       (  ),
        .LANE1_RX_IDLE        (  ),
        .LANE1_RX_READY       (  ),
        .LANE1_RX_VAL         (  ),
        .LANE1_TX_CLK_STABLE  (  ),
        .LANE1_RX_BYPASS_DATA (  ),
        .LANE2_RX_DATA        (  ),
        .LANE2_TX_CLK_R       (  ),
        .LANE2_RX_CLK_R       (  ),
        .LANE2_RX_IDLE        (  ),
        .LANE2_RX_READY       (  ),
        .LANE2_RX_VAL         (  ),
        .LANE2_TX_CLK_STABLE  (  ),
        .LANE2_RX_BYPASS_DATA (  ),
        .LANE3_RX_DATA        (  ),
        .LANE3_TX_CLK_R       (  ),
        .LANE3_RX_CLK_R       (  ),
        .LANE3_RX_IDLE        (  ),
        .LANE3_RX_READY       (  ),
        .LANE3_RX_VAL         (  ),
        .LANE3_TX_CLK_STABLE  (  ),
        .LANE3_RX_BYPASS_DATA (  ) 
        );

//--------PF_XCVR_REF_CLK_C0
PF_XCVR_REF_CLK_C0 PF_XCVR_REF_CLK_C0_0(
        // Inputs
        .REF_CLK_PAD_P ( REF_CLK_PAD_P ),
        .REF_CLK_PAD_N ( REF_CLK_PAD_N ),
        // Outputs
        .REF_CLK       ( PF_XCVR_REF_CLK_C0_0_REF_CLK ) 
        );


endmodule
