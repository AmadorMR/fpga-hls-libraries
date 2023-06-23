//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:51:31 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of CORERESET_PF_C1 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component CORERESET_PF_C1
create_and_configure_core -core_vlnv {Actel:DirectCore:CORERESET_PF:2.2.107} -component_name {CORERESET_PF_C1} -params { }
# Exporting Component Description of CORERESET_PF_C1 to TCL done
*/

// CORERESET_PF_C1
module CORERESET_PF_C1(
    // Inputs
    BANK_x_VDDI_STATUS,
    BANK_y_VDDI_STATUS,
    CLK,
    EXT_RST_N,
    FF_US_RESTORE,
    FPGA_POR_N,
    INIT_DONE,
    PLL_LOCK,
    SS_BUSY,
    // Outputs
    FABRIC_RESET_N,
    PLL_POWERDOWN_B
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  BANK_x_VDDI_STATUS;
input  BANK_y_VDDI_STATUS;
input  CLK;
input  EXT_RST_N;
input  FF_US_RESTORE;
input  FPGA_POR_N;
input  INIT_DONE;
input  PLL_LOCK;
input  SS_BUSY;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output FABRIC_RESET_N;
output PLL_POWERDOWN_B;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   BANK_x_VDDI_STATUS;
wire   BANK_y_VDDI_STATUS;
wire   CLK;
wire   EXT_RST_N;
wire   FABRIC_RESET_N_net_0;
wire   FF_US_RESTORE;
wire   FPGA_POR_N;
wire   INIT_DONE;
wire   PLL_LOCK;
wire   PLL_POWERDOWN_B_net_0;
wire   SS_BUSY;
wire   PLL_POWERDOWN_B_net_1;
wire   FABRIC_RESET_N_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PLL_POWERDOWN_B_net_1 = PLL_POWERDOWN_B_net_0;
assign PLL_POWERDOWN_B       = PLL_POWERDOWN_B_net_1;
assign FABRIC_RESET_N_net_1  = FABRIC_RESET_N_net_0;
assign FABRIC_RESET_N        = FABRIC_RESET_N_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CORERESET_PF_C1_CORERESET_PF_C1_0_CORERESET_PF   -   Actel:DirectCore:CORERESET_PF:2.2.107
CORERESET_PF_C1_CORERESET_PF_C1_0_CORERESET_PF CORERESET_PF_C1_0(
        // Inputs
        .CLK                ( CLK ),
        .EXT_RST_N          ( EXT_RST_N ),
        .BANK_x_VDDI_STATUS ( BANK_x_VDDI_STATUS ),
        .BANK_y_VDDI_STATUS ( BANK_y_VDDI_STATUS ),
        .PLL_LOCK           ( PLL_LOCK ),
        .SS_BUSY            ( SS_BUSY ),
        .INIT_DONE          ( INIT_DONE ),
        .FF_US_RESTORE      ( FF_US_RESTORE ),
        .FPGA_POR_N         ( FPGA_POR_N ),
        // Outputs
        .PLL_POWERDOWN_B    ( PLL_POWERDOWN_B_net_0 ),
        .FABRIC_RESET_N     ( FABRIC_RESET_N_net_0 ) 
        );


endmodule
