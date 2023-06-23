//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:53:32 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_XCVR_REF_CLK_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component PF_XCVR_REF_CLK_C0
create_and_configure_core -core_vlnv {Actel:SgCore:PF_XCVR_REF_CLK:1.0.103} -component_name {PF_XCVR_REF_CLK_C0} -params {\
"ENABLE_FAB_CLK_0:false"  \
"ENABLE_FAB_CLK_1:false"  \
"ENABLE_REF_CLK_0:true"  \
"ENABLE_REF_CLK_1:false"  \
"REF_CLK_MODE_0:DIFFERENTIAL"  \
"REF_CLK_MODE_1:LVCMOS"   }
# Exporting Component Description of PF_XCVR_REF_CLK_C0 to TCL done
*/

// PF_XCVR_REF_CLK_C0
module PF_XCVR_REF_CLK_C0(
    // Inputs
    REF_CLK_PAD_N,
    REF_CLK_PAD_P,
    // Outputs
    REF_CLK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  REF_CLK_PAD_N;
input  REF_CLK_PAD_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output REF_CLK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   REF_CLK_net_0;
wire   REF_CLK_PAD_N;
wire   REF_CLK_PAD_P;
wire   REF_CLK_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign REF_CLK_net_1 = REF_CLK_net_0;
assign REF_CLK       = REF_CLK_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_XCVR_REF_CLK_C0_PF_XCVR_REF_CLK_C0_0_PF_XCVR_REF_CLK   -   Actel:SgCore:PF_XCVR_REF_CLK:1.0.103
PF_XCVR_REF_CLK_C0_PF_XCVR_REF_CLK_C0_0_PF_XCVR_REF_CLK PF_XCVR_REF_CLK_C0_0(
        // Inputs
        .REF_CLK_PAD_P ( REF_CLK_PAD_P ),
        .REF_CLK_PAD_N ( REF_CLK_PAD_N ),
        // Outputs
        .REF_CLK       ( REF_CLK_net_0 ) 
        );


endmodule
