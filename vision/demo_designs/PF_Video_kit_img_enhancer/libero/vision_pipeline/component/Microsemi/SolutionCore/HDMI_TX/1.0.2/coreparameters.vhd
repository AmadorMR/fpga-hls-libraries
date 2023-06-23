----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Fri Jun 16 13:53:20 2023
-- Parameters for HDMI_TX
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FAMILY : integer := 26;
    constant g_PIXELS_PER_CLK : integer := 4;
    constant HDL_License : string( 1 to 1 ) := "O";
    constant testbench : string( 1 to 4 ) := "User";
end coreparameters;
