//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 16 13:51:32 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of CORERXIODBITALIGN_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component CORERXIODBITALIGN_C0
create_and_configure_core -core_vlnv {Actel:DirectCore:CORERXIODBITALIGN:2.1.104} -component_name {CORERXIODBITALIGN_C0} -params {\
"DEM_TAP_WAIT_CNT_WIDTH:3"  \
"HOLD_TRNG:0"  \
"MIPI_TRNG:1"  \
"SKIP_TRNG:0"   }
# Exporting Component Description of CORERXIODBITALIGN_C0 to TCL done
*/

// CORERXIODBITALIGN_C0
module CORERXIODBITALIGN_C0(
    // Inputs
    BIT_ALGN_EYE_IN,
    BIT_ALGN_HOLD,
    BIT_ALGN_RSTRT,
    BIT_ALGN_SKIP,
    IOD_EARLY,
    IOD_LATE,
    IOD_OOR,
    LP_IN,
    PLL_LOCK,
    RESETN,
    SCLK,
    // Outputs
    BIT_ALGN_CLR_FLGS,
    BIT_ALGN_DIR,
    BIT_ALGN_DONE,
    BIT_ALGN_ERR,
    BIT_ALGN_LOAD,
    BIT_ALGN_MOVE,
    BIT_ALGN_OOR,
    BIT_ALGN_START,
    DEM_CLK_ALGN_TAPDLY
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [2:0] BIT_ALGN_EYE_IN;
input        BIT_ALGN_HOLD;
input        BIT_ALGN_RSTRT;
input        BIT_ALGN_SKIP;
input        IOD_EARLY;
input        IOD_LATE;
input        IOD_OOR;
input        LP_IN;
input        PLL_LOCK;
input        RESETN;
input        SCLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       BIT_ALGN_CLR_FLGS;
output       BIT_ALGN_DIR;
output       BIT_ALGN_DONE;
output       BIT_ALGN_ERR;
output       BIT_ALGN_LOAD;
output       BIT_ALGN_MOVE;
output       BIT_ALGN_OOR;
output       BIT_ALGN_START;
output [7:0] DEM_CLK_ALGN_TAPDLY;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         BIT_ALGN_CLR_FLGS_net_0;
wire         BIT_ALGN_DIR_net_0;
wire         BIT_ALGN_DONE_net_0;
wire         BIT_ALGN_ERR_net_0;
wire   [2:0] BIT_ALGN_EYE_IN;
wire         BIT_ALGN_HOLD;
wire         BIT_ALGN_LOAD_net_0;
wire         BIT_ALGN_MOVE_net_0;
wire         BIT_ALGN_OOR_net_0;
wire         BIT_ALGN_RSTRT;
wire         BIT_ALGN_SKIP;
wire         BIT_ALGN_START_net_0;
wire   [7:0] DEM_CLK_ALGN_TAPDLY_net_0;
wire         IOD_EARLY;
wire         IOD_LATE;
wire         IOD_OOR;
wire         LP_IN;
wire         PLL_LOCK;
wire         RESETN;
wire         SCLK;
wire         BIT_ALGN_START_net_1;
wire         BIT_ALGN_DONE_net_1;
wire         BIT_ALGN_OOR_net_1;
wire         BIT_ALGN_CLR_FLGS_net_1;
wire         BIT_ALGN_LOAD_net_1;
wire         BIT_ALGN_DIR_net_1;
wire         BIT_ALGN_MOVE_net_1;
wire         BIT_ALGN_ERR_net_1;
wire   [7:0] DEM_CLK_ALGN_TAPDLY_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign BIT_ALGN_START_net_1      = BIT_ALGN_START_net_0;
assign BIT_ALGN_START            = BIT_ALGN_START_net_1;
assign BIT_ALGN_DONE_net_1       = BIT_ALGN_DONE_net_0;
assign BIT_ALGN_DONE             = BIT_ALGN_DONE_net_1;
assign BIT_ALGN_OOR_net_1        = BIT_ALGN_OOR_net_0;
assign BIT_ALGN_OOR              = BIT_ALGN_OOR_net_1;
assign BIT_ALGN_CLR_FLGS_net_1   = BIT_ALGN_CLR_FLGS_net_0;
assign BIT_ALGN_CLR_FLGS         = BIT_ALGN_CLR_FLGS_net_1;
assign BIT_ALGN_LOAD_net_1       = BIT_ALGN_LOAD_net_0;
assign BIT_ALGN_LOAD             = BIT_ALGN_LOAD_net_1;
assign BIT_ALGN_DIR_net_1        = BIT_ALGN_DIR_net_0;
assign BIT_ALGN_DIR              = BIT_ALGN_DIR_net_1;
assign BIT_ALGN_MOVE_net_1       = BIT_ALGN_MOVE_net_0;
assign BIT_ALGN_MOVE             = BIT_ALGN_MOVE_net_1;
assign BIT_ALGN_ERR_net_1        = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR              = BIT_ALGN_ERR_net_1;
assign DEM_CLK_ALGN_TAPDLY_net_1 = DEM_CLK_ALGN_TAPDLY_net_0;
assign DEM_CLK_ALGN_TAPDLY[7:0]  = DEM_CLK_ALGN_TAPDLY_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_CORERXIODBITALIGN   -   Actel:DirectCore:CORERXIODBITALIGN:2.1.104
CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_CORERXIODBITALIGN #( 
        .DEM_TAP_WAIT_CNT_WIDTH ( 3 ),
        .HOLD_TRNG              ( 0 ),
        .MIPI_TRNG              ( 1 ),
        .SKIP_TRNG              ( 0 ) )
CORERXIODBITALIGN_C0_0(
        // Inputs
        .SCLK                ( SCLK ),
        .RESETN              ( RESETN ),
        .PLL_LOCK            ( PLL_LOCK ),
        .IOD_EARLY           ( IOD_EARLY ),
        .IOD_LATE            ( IOD_LATE ),
        .IOD_OOR             ( IOD_OOR ),
        .BIT_ALGN_RSTRT      ( BIT_ALGN_RSTRT ),
        .BIT_ALGN_HOLD       ( BIT_ALGN_HOLD ),
        .BIT_ALGN_EYE_IN     ( BIT_ALGN_EYE_IN ),
        .LP_IN               ( LP_IN ),
        .BIT_ALGN_SKIP       ( BIT_ALGN_SKIP ),
        // Outputs
        .BIT_ALGN_START      ( BIT_ALGN_START_net_0 ),
        .BIT_ALGN_DONE       ( BIT_ALGN_DONE_net_0 ),
        .BIT_ALGN_OOR        ( BIT_ALGN_OOR_net_0 ),
        .BIT_ALGN_CLR_FLGS   ( BIT_ALGN_CLR_FLGS_net_0 ),
        .BIT_ALGN_LOAD       ( BIT_ALGN_LOAD_net_0 ),
        .BIT_ALGN_DIR        ( BIT_ALGN_DIR_net_0 ),
        .BIT_ALGN_MOVE       ( BIT_ALGN_MOVE_net_0 ),
        .BIT_ALGN_ERR        ( BIT_ALGN_ERR_net_0 ),
        .DEM_CLK_ALGN_TAPDLY ( DEM_CLK_ALGN_TAPDLY_net_0 ) 
        );


endmodule
