//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:52:29 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// IMX334_IF_TOP
module IMX334_IF_TOP(
    // Inputs
    ARST_N,
    AXIS_i_tready,
    CAM1_RXD,
    CAM1_RXD_N,
    CAM1_RX_CLK_N,
    CAM1_RX_CLK_P,
    CAM2_RXD,
    CAM2_RXD_N,
    CAM2_RX_CLK_N,
    CAM2_RX_CLK_P,
    INIT_DONE,
    TRNG_RST_N,
    i_axis_clk,
    i_axis_reset,
    // Outputs
    AXIS_o_tdata,
    AXIS_o_tlast,
    AXIS_o_tuser,
    AXIS_o_tvalid,
    CAMERA_CLK,
    c1_line_valid_o
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         ARST_N;
input         AXIS_i_tready;
input  [3:0]  CAM1_RXD;
input  [3:0]  CAM1_RXD_N;
input         CAM1_RX_CLK_N;
input         CAM1_RX_CLK_P;
input  [3:0]  CAM2_RXD;
input  [3:0]  CAM2_RXD_N;
input         CAM2_RX_CLK_N;
input         CAM2_RX_CLK_P;
input         INIT_DONE;
input         TRNG_RST_N;
input         i_axis_clk;
input         i_axis_reset;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] AXIS_o_tdata;
output        AXIS_o_tlast;
output [0:0]  AXIS_o_tuser;
output        AXIS_o_tvalid;
output        CAMERA_CLK;
output        c1_line_valid_o;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           AND2_0_Y;
wire           AND2_1_Y;
wire           ARST_N;
wire   [31:0]  AXIS_TDATA;
wire           AXIS_TLAST;
wire           AXIS_i_tready;
wire   [0:0]   AXIS_TUSER;
wire           AXIS_TVALID;
wire           c1_line_valid_o_net_0;
wire           CAM1_RX_CLK_N;
wire           CAM1_RX_CLK_P;
wire   [3:0]   CAM1_RXD;
wire   [3:0]   CAM1_RXD_N;
wire           CAM2_RX_CLK_N;
wire           CAM2_RX_CLK_P;
wire   [3:0]   CAM2_RXD;
wire   [3:0]   CAM2_RXD_N;
wire           CAMERA_CLK_net_0;
wire           CORERESET_PF_C1_0_FABRIC_RESET_N;
wire           CORERESET_PF_C2_0_FABRIC_RESET_N;
wire           CORERESET_PF_C3_0_FABRIC_RESET_N;
wire   [9:2]   CSI2_RXDecoder_1_data_out_o9to2;
wire   [19:12] CSI2_RXDecoder_1_data_out_o19to12;
wire   [29:22] CSI2_RXDecoder_1_data_out_o29to22;
wire   [39:32] CSI2_RXDecoder_1_data_out_o39to32;
wire           CSI2_RXDecoder_1_frame_start_o;
wire           CSI2_RXDecoder_1_line_valid_o;
wire           i_axis_clk;
wire           i_axis_reset;
wire           INIT_DONE;
wire           PF_CCC_C2_0_OUT0_FABCLK_0;
wire           PF_CCC_C2_0_PLL_LOCK_0;
wire           PF_IOD_GENERIC_RX_C0_0_L0_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L0_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_0_L0_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L1_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L1_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_0_L1_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L2_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L2_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_0_L2_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L3_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_L3_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_0_L3_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_0_training_done_o;
wire           PF_IOD_GENERIC_RX_C0_1_L0_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L0_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_1_L0_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L1_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L1_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_1_L1_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L2_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L2_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_1_L2_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L3_LP_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_L3_LP_DATA_N;
wire   [7:0]   PF_IOD_GENERIC_RX_C0_1_L3_RXD_DATA;
wire           PF_IOD_GENERIC_RX_C0_1_RX_CLK_G;
wire           PF_IOD_GENERIC_RX_C0_1_training_done_o;
wire           TRNG_RST_N;
wire           AXIS_TLAST_net_0;
wire           AXIS_TVALID_net_0;
wire           CAMERA_CLK_net_1;
wire           c1_line_valid_o_net_1;
wire   [31:0]  AXIS_TDATA_net_0;
wire   [0:0]   AXIS_TUSER_net_0;
wire   [19:12] data_out_o_slice_0;
wire   [29:22] data_out_o_slice_1;
wire   [39:32] data_out_o_slice_2;
wire   [9:2]   data_out_o_slice_3;
wire   [31:0]  i_Data_net_0;
wire   [39:0]  data_out_o_net_0;
wire   [39:0]  data_out_o_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [11:0]  i_vres_const_net_0;
wire   [11:0]  i_hres_const_net_0;
wire           VCC_net;
wire           GND_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire           i_video_reset_IN_POST_INV0_0;
wire           i_axis_reset_IN_POST_INV1_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign i_vres_const_net_0 = 12'h870;
assign i_hres_const_net_0 = 12'hF00;
assign VCC_net            = 1'b1;
assign GND_net            = 1'b0;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign i_video_reset_IN_POST_INV0_0 = ~ CORERESET_PF_C1_0_FABRIC_RESET_N;
assign i_axis_reset_IN_POST_INV1_0  = ~ i_axis_reset;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AXIS_TLAST_net_0      = AXIS_TLAST;
assign AXIS_o_tlast          = AXIS_TLAST_net_0;
assign AXIS_TVALID_net_0     = AXIS_TVALID;
assign AXIS_o_tvalid         = AXIS_TVALID_net_0;
assign CAMERA_CLK_net_1      = CAMERA_CLK_net_0;
assign CAMERA_CLK            = CAMERA_CLK_net_1;
assign c1_line_valid_o_net_1 = c1_line_valid_o_net_0;
assign c1_line_valid_o       = c1_line_valid_o_net_1;
assign AXIS_TDATA_net_0      = AXIS_TDATA;
assign AXIS_o_tdata[31:0]    = AXIS_TDATA_net_0;
assign AXIS_TUSER_net_0[0]   = AXIS_TUSER[0];
assign AXIS_o_tuser[0:0]     = AXIS_TUSER_net_0[0];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign CSI2_RXDecoder_1_data_out_o9to2   = data_out_o_net_1[9:2];
assign CSI2_RXDecoder_1_data_out_o19to12 = data_out_o_net_1[19:12];
assign CSI2_RXDecoder_1_data_out_o29to22 = data_out_o_net_1[29:22];
assign CSI2_RXDecoder_1_data_out_o39to32 = data_out_o_net_1[39:32];
assign data_out_o_slice_0                = data_out_o_net_0[19:12];
assign data_out_o_slice_1                = data_out_o_net_0[29:22];
assign data_out_o_slice_2                = data_out_o_net_0[39:32];
assign data_out_o_slice_3                = data_out_o_net_0[9:2];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign i_Data_net_0 = { CSI2_RXDecoder_1_data_out_o39to32 , CSI2_RXDecoder_1_data_out_o29to22 , CSI2_RXDecoder_1_data_out_o19to12 , CSI2_RXDecoder_1_data_out_o9to2 };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( TRNG_RST_N ),
        .B ( PF_CCC_C2_0_PLL_LOCK_0 ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------AND2
AND2 AND2_1(
        // Inputs
        .A ( PF_IOD_GENERIC_RX_C0_1_training_done_o ),
        .B ( PF_IOD_GENERIC_RX_C0_0_training_done_o ),
        // Outputs
        .Y ( AND2_1_Y ) 
        );

//--------Camera_To_AXIS_Converter
Camera_To_AXIS_Converter #( 
        .C_WIDTH       ( 8 ),
        .DEBUBBLE      ( 0 ),
        .FIFO_DEPTH    ( 4096 ),
        .LINES_TO_SKIP ( 1 ),
        .PIXEL_PER_CLK ( 4 ),
        .TUSER_WIDTH   ( 1 ) )
Camera_To_AXIS_Converter_0(
        // Inputs
        .i_video_reset       ( i_video_reset_IN_POST_INV0_0 ),
        .i_video_clk         ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .i_frame_start       ( CSI2_RXDecoder_1_frame_start_o ),
        .i_data_valid        ( CSI2_RXDecoder_1_line_valid_o ),
        .i_Data              ( i_Data_net_0 ),
        .i_vres              ( i_vres_const_net_0 ),
        .i_hres              ( i_hres_const_net_0 ),
        .i_axis_reset        ( i_axis_reset_IN_POST_INV1_0 ),
        .i_axis_clk          ( i_axis_clk ),
        .i_tready            ( AXIS_i_tready ),
        // Outputs
        .o_frames_skipped    (  ),
        .o_pushback_detected (  ),
        .o_tlast             ( AXIS_TLAST ),
        .o_tvalid            ( AXIS_TVALID ),
        .o_tuser             ( AXIS_TUSER ),
        .o_tdata             ( AXIS_TDATA ) 
        );

//--------CORERESET_PF_C1
CORERESET_PF_C1 CORERESET_PF_C1_0(
        // Inputs
        .CLK                ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .EXT_RST_N          ( AND2_1_Y ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( GND_net ),
        .PLL_LOCK           ( PF_CCC_C2_0_PLL_LOCK_0 ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( VCC_net ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C1_0_FABRIC_RESET_N ) 
        );

//--------CORERESET_PF_C2
CORERESET_PF_C2 CORERESET_PF_C2_0(
        // Inputs
        .CLK                ( CAMERA_CLK_net_0 ),
        .EXT_RST_N          ( AND2_1_Y ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( GND_net ),
        .PLL_LOCK           ( PF_CCC_C2_0_PLL_LOCK_0 ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( VCC_net ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C2_0_FABRIC_RESET_N ) 
        );

//--------CORERESET_PF_C3
CORERESET_PF_C3 CORERESET_PF_C3_0(
        // Inputs
        .CLK                ( PF_IOD_GENERIC_RX_C0_1_RX_CLK_G ),
        .EXT_RST_N          ( AND2_1_Y ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( GND_net ),
        .PLL_LOCK           ( PF_CCC_C2_0_PLL_LOCK_0 ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( VCC_net ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C3_0_FABRIC_RESET_N ) 
        );

//--------mipicsi2rxdecoderPF_C0
mipicsi2rxdecoderPF_C0 CSI2_RXDecoder_0(
        // Inputs
        .CAM_CLOCK_I      ( CAMERA_CLK_net_0 ),
        .PARALLEL_CLOCK_I ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .RESET_n_I        ( CORERESET_PF_C2_0_FABRIC_RESET_N ),
        .L0_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L0_RXD_DATA ),
        .L1_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L1_RXD_DATA ),
        .L2_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L2_RXD_DATA ),
        .L3_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L3_RXD_DATA ),
        .L0_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L0_LP_DATA ),
        .L0_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_0_L0_LP_DATA_N ),
        .L1_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L1_LP_DATA ),
        .L1_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_0_L1_LP_DATA_N ),
        .L2_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L2_LP_DATA ),
        .L2_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_0_L2_LP_DATA_N ),
        .L3_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_0_L3_LP_DATA ),
        .L3_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_0_L3_LP_DATA_N ),
        // Outputs
        .data_out_o       ( data_out_o_net_0 ),
        .frame_end_o      (  ),
        .frame_start_o    (  ),
        .frame_valid_o    (  ),
        .line_end_o       (  ),
        .line_start_o     (  ),
        .line_valid_o     ( c1_line_valid_o_net_0 ),
        .word_count_o     (  ) 
        );

//--------mipicsi2rxdecoderPF_C0
mipicsi2rxdecoderPF_C0 CSI2_RXDecoder_1(
        // Inputs
        .CAM_CLOCK_I      ( PF_IOD_GENERIC_RX_C0_1_RX_CLK_G ),
        .PARALLEL_CLOCK_I ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .RESET_n_I        ( CORERESET_PF_C3_0_FABRIC_RESET_N ),
        .L0_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L0_RXD_DATA ),
        .L1_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L1_RXD_DATA ),
        .L2_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L2_RXD_DATA ),
        .L3_HS_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L3_RXD_DATA ),
        .L0_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L0_LP_DATA ),
        .L0_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_1_L0_LP_DATA_N ),
        .L1_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L1_LP_DATA ),
        .L1_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_1_L1_LP_DATA_N ),
        .L2_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L2_LP_DATA ),
        .L2_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_1_L2_LP_DATA_N ),
        .L3_LP_DATA_I     ( PF_IOD_GENERIC_RX_C0_1_L3_LP_DATA ),
        .L3_LP_DATA_N_I   ( PF_IOD_GENERIC_RX_C0_1_L3_LP_DATA_N ),
        // Outputs
        .data_out_o       ( data_out_o_net_1 ),
        .frame_end_o      (  ),
        .frame_start_o    ( CSI2_RXDecoder_1_frame_start_o ),
        .frame_valid_o    (  ),
        .line_end_o       (  ),
        .line_start_o     (  ),
        .line_valid_o     ( CSI2_RXDecoder_1_line_valid_o ),
        .word_count_o     (  ) 
        );

//--------PF_CCC_C2
PF_CCC_C2 PF_CCC_C2_0(
        // Inputs
        .REF_CLK_0     ( CAMERA_CLK_net_0 ),
        // Outputs
        .OUT0_FABCLK_0 ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0    ( PF_CCC_C2_0_PLL_LOCK_0 ) 
        );

//--------CAM_IOD_TIP_TOP
CAM_IOD_TIP_TOP PF_IOD_GENERIC_RX_C0_0(
        // Inputs
        .ARST_N          ( ARST_N ),
        .HS_IO_CLK_PAUSE ( GND_net ),
        .HS_SEL          ( VCC_net ),
        .RESTART_TRNG    ( GND_net ),
        .RX_CLK_N        ( CAM1_RX_CLK_N ),
        .RX_CLK_P        ( CAM1_RX_CLK_P ),
        .SKIP_TRNG       ( GND_net ),
        .TRAINING_RESETN ( AND2_0_Y ),
        .RXD_N           ( CAM1_RXD_N ),
        .RXD             ( CAM1_RXD ),
        // Outputs
        .CLK_TRAIN_DONE  (  ),
        .CLK_TRAIN_ERROR (  ),
        .L0_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_0_L0_LP_DATA_N ),
        .L0_LP_DATA      ( PF_IOD_GENERIC_RX_C0_0_L0_LP_DATA ),
        .L1_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_0_L1_LP_DATA_N ),
        .L1_LP_DATA      ( PF_IOD_GENERIC_RX_C0_0_L1_LP_DATA ),
        .L2_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_0_L2_LP_DATA_N ),
        .L2_LP_DATA      ( PF_IOD_GENERIC_RX_C0_0_L2_LP_DATA ),
        .L3_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_0_L3_LP_DATA_N ),
        .L3_LP_DATA      ( PF_IOD_GENERIC_RX_C0_0_L3_LP_DATA ),
        .RX_CLK_G        ( CAMERA_CLK_net_0 ),
        .training_done_o ( PF_IOD_GENERIC_RX_C0_0_training_done_o ),
        .L0_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_0_L0_RXD_DATA ),
        .L1_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_0_L1_RXD_DATA ),
        .L2_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_0_L2_RXD_DATA ),
        .L3_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_0_L3_RXD_DATA ) 
        );

//--------CAM_IOD_TIP_TOP
CAM_IOD_TIP_TOP PF_IOD_GENERIC_RX_C0_1(
        // Inputs
        .ARST_N          ( ARST_N ),
        .HS_IO_CLK_PAUSE ( GND_net ),
        .HS_SEL          ( VCC_net ),
        .RESTART_TRNG    ( GND_net ),
        .RX_CLK_N        ( CAM2_RX_CLK_N ),
        .RX_CLK_P        ( CAM2_RX_CLK_P ),
        .SKIP_TRNG       ( GND_net ),
        .TRAINING_RESETN ( AND2_0_Y ),
        .RXD_N           ( CAM2_RXD_N ),
        .RXD             ( CAM2_RXD ),
        // Outputs
        .CLK_TRAIN_DONE  (  ),
        .CLK_TRAIN_ERROR (  ),
        .L0_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_1_L0_LP_DATA_N ),
        .L0_LP_DATA      ( PF_IOD_GENERIC_RX_C0_1_L0_LP_DATA ),
        .L1_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_1_L1_LP_DATA_N ),
        .L1_LP_DATA      ( PF_IOD_GENERIC_RX_C0_1_L1_LP_DATA ),
        .L2_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_1_L2_LP_DATA_N ),
        .L2_LP_DATA      ( PF_IOD_GENERIC_RX_C0_1_L2_LP_DATA ),
        .L3_LP_DATA_N    ( PF_IOD_GENERIC_RX_C0_1_L3_LP_DATA_N ),
        .L3_LP_DATA      ( PF_IOD_GENERIC_RX_C0_1_L3_LP_DATA ),
        .RX_CLK_G        ( PF_IOD_GENERIC_RX_C0_1_RX_CLK_G ),
        .training_done_o ( PF_IOD_GENERIC_RX_C0_1_training_done_o ),
        .L0_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_1_L0_RXD_DATA ),
        .L1_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_1_L1_RXD_DATA ),
        .L2_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_1_L2_RXD_DATA ),
        .L3_RXD_DATA     ( PF_IOD_GENERIC_RX_C0_1_L3_RXD_DATA ) 
        );


endmodule
