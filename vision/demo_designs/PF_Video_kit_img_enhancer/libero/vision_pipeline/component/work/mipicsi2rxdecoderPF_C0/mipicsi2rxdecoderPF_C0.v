//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:52:11 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of mipicsi2rxdecoderPF_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component mipicsi2rxdecoderPF_C0
create_and_configure_core -core_vlnv {Microsemi:SolutionCore:mipicsi2rxdecoderPF:2.2.5} -component_name {mipicsi2rxdecoderPF_C0} -params {\
"g_BUFF_DEPTH:1920"  \
"g_DATAWIDTH:10"  \
"g_INPUT_DATA_INVERT:0"  \
"g_LANE_WIDTH:4"  \
"g_NUM_OF_PIXELS:4"   }
# Exporting Component Description of mipicsi2rxdecoderPF_C0 to TCL done
*/

// mipicsi2rxdecoderPF_C0
module mipicsi2rxdecoderPF_C0(
    // Inputs
    CAM_CLOCK_I,
    L0_HS_DATA_I,
    L0_LP_DATA_I,
    L0_LP_DATA_N_I,
    L1_HS_DATA_I,
    L1_LP_DATA_I,
    L1_LP_DATA_N_I,
    L2_HS_DATA_I,
    L2_LP_DATA_I,
    L2_LP_DATA_N_I,
    L3_HS_DATA_I,
    L3_LP_DATA_I,
    L3_LP_DATA_N_I,
    PARALLEL_CLOCK_I,
    RESET_n_I,
    // Outputs
    data_out_o,
    frame_end_o,
    frame_start_o,
    frame_valid_o,
    line_end_o,
    line_start_o,
    line_valid_o,
    word_count_o
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CAM_CLOCK_I;
input  [7:0]  L0_HS_DATA_I;
input         L0_LP_DATA_I;
input         L0_LP_DATA_N_I;
input  [7:0]  L1_HS_DATA_I;
input         L1_LP_DATA_I;
input         L1_LP_DATA_N_I;
input  [7:0]  L2_HS_DATA_I;
input         L2_LP_DATA_I;
input         L2_LP_DATA_N_I;
input  [7:0]  L3_HS_DATA_I;
input         L3_LP_DATA_I;
input         L3_LP_DATA_N_I;
input         PARALLEL_CLOCK_I;
input         RESET_n_I;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [39:0] data_out_o;
output        frame_end_o;
output        frame_start_o;
output        frame_valid_o;
output        line_end_o;
output        line_start_o;
output        line_valid_o;
output [15:0] word_count_o;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CAM_CLOCK_I;
wire   [39:0] data_out_o_net_0;
wire          frame_end_o_net_0;
wire          frame_start_o_net_0;
wire          frame_valid_o_net_0;
wire   [7:0]  L0_HS_DATA_I;
wire          L0_LP_DATA_I;
wire          L0_LP_DATA_N_I;
wire   [7:0]  L1_HS_DATA_I;
wire          L1_LP_DATA_I;
wire          L1_LP_DATA_N_I;
wire   [7:0]  L2_HS_DATA_I;
wire          L2_LP_DATA_I;
wire          L2_LP_DATA_N_I;
wire   [7:0]  L3_HS_DATA_I;
wire          L3_LP_DATA_I;
wire          L3_LP_DATA_N_I;
wire          line_end_o_net_0;
wire          line_start_o_net_0;
wire          line_valid_o_net_0;
wire          PARALLEL_CLOCK_I;
wire          RESET_n_I;
wire   [15:0] word_count_o_net_0;
wire   [39:0] data_out_o_net_1;
wire          frame_end_o_net_1;
wire          frame_start_o_net_1;
wire          frame_valid_o_net_1;
wire          line_end_o_net_1;
wire          line_start_o_net_1;
wire          line_valid_o_net_1;
wire   [15:0] word_count_o_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [7:0]  L4_HS_DATA_I_const_net_0;
wire   [7:0]  L5_HS_DATA_I_const_net_0;
wire   [7:0]  L6_HS_DATA_I_const_net_0;
wire   [7:0]  L7_HS_DATA_I_const_net_0;
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign L4_HS_DATA_I_const_net_0 = 8'h00;
assign L5_HS_DATA_I_const_net_0 = 8'h00;
assign L6_HS_DATA_I_const_net_0 = 8'h00;
assign L7_HS_DATA_I_const_net_0 = 8'h00;
assign GND_net                  = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign data_out_o_net_1    = data_out_o_net_0;
assign data_out_o[39:0]    = data_out_o_net_1;
assign frame_end_o_net_1   = frame_end_o_net_0;
assign frame_end_o         = frame_end_o_net_1;
assign frame_start_o_net_1 = frame_start_o_net_0;
assign frame_start_o       = frame_start_o_net_1;
assign frame_valid_o_net_1 = frame_valid_o_net_0;
assign frame_valid_o       = frame_valid_o_net_1;
assign line_end_o_net_1    = line_end_o_net_0;
assign line_end_o          = line_end_o_net_1;
assign line_start_o_net_1  = line_start_o_net_0;
assign line_start_o        = line_start_o_net_1;
assign line_valid_o_net_1  = line_valid_o_net_0;
assign line_valid_o        = line_valid_o_net_1;
assign word_count_o_net_1  = word_count_o_net_0;
assign word_count_o[15:0]  = word_count_o_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------mipicsi2rxdecoderPF   -   Microsemi:SolutionCore:mipicsi2rxdecoderPF:2.2.5
mipicsi2rxdecoderPF #( 
        .g_BUFF_DEPTH        ( 1920 ),
        .g_DATAWIDTH         ( 10 ),
        .g_INPUT_DATA_INVERT ( 0 ),
        .g_LANE_WIDTH        ( 4 ),
        .g_NUM_OF_PIXELS     ( 4 ) )
mipicsi2rxdecoderPF_C0_0(
        // Inputs
        .CAM_CLOCK_I      ( CAM_CLOCK_I ),
        .PARALLEL_CLOCK_I ( PARALLEL_CLOCK_I ),
        .RESET_n_I        ( RESET_n_I ),
        .L0_HS_DATA_I     ( L0_HS_DATA_I ),
        .L1_HS_DATA_I     ( L1_HS_DATA_I ),
        .L2_HS_DATA_I     ( L2_HS_DATA_I ),
        .L3_HS_DATA_I     ( L3_HS_DATA_I ),
        .L4_HS_DATA_I     ( L4_HS_DATA_I_const_net_0 ), // tied to 8'h00 from definition
        .L5_HS_DATA_I     ( L5_HS_DATA_I_const_net_0 ), // tied to 8'h00 from definition
        .L6_HS_DATA_I     ( L6_HS_DATA_I_const_net_0 ), // tied to 8'h00 from definition
        .L7_HS_DATA_I     ( L7_HS_DATA_I_const_net_0 ), // tied to 8'h00 from definition
        .L0_LP_DATA_I     ( L0_LP_DATA_I ),
        .L0_LP_DATA_N_I   ( L0_LP_DATA_N_I ),
        .L1_LP_DATA_I     ( L1_LP_DATA_I ),
        .L1_LP_DATA_N_I   ( L1_LP_DATA_N_I ),
        .L2_LP_DATA_I     ( L2_LP_DATA_I ),
        .L2_LP_DATA_N_I   ( L2_LP_DATA_N_I ),
        .L3_LP_DATA_I     ( L3_LP_DATA_I ),
        .L3_LP_DATA_N_I   ( L3_LP_DATA_N_I ),
        .L4_LP_DATA_I     ( GND_net ), // tied to 1'b0 from definition
        .L4_LP_DATA_N_I   ( GND_net ), // tied to 1'b0 from definition
        .L5_LP_DATA_I     ( GND_net ), // tied to 1'b0 from definition
        .L5_LP_DATA_N_I   ( GND_net ), // tied to 1'b0 from definition
        .L6_LP_DATA_I     ( GND_net ), // tied to 1'b0 from definition
        .L6_LP_DATA_N_I   ( GND_net ), // tied to 1'b0 from definition
        .L7_LP_DATA_I     ( GND_net ), // tied to 1'b0 from definition
        .L7_LP_DATA_N_I   ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .data_out_o       ( data_out_o_net_0 ),
        .frame_end_o      ( frame_end_o_net_0 ),
        .frame_start_o    ( frame_start_o_net_0 ),
        .frame_valid_o    ( frame_valid_o_net_0 ),
        .line_end_o       ( line_end_o_net_0 ),
        .line_start_o     ( line_start_o_net_0 ),
        .line_valid_o     ( line_valid_o_net_0 ),
        .word_count_o     ( word_count_o_net_0 ) 
        );


endmodule
