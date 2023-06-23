----------------------------------------------------------------------
-- Created by SmartDesign Fri Jun 16 13:53:20 2023
-- Version: 2023.1 2023.1.0.6
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of HDMI_TX_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component HDMI_TX_C0
--create_and_configure_core -core_vlnv {Microsemi:SolutionCore:HDMI_TX:1.0.2} -component_name {HDMI_TX_C0} -params {\
--"g_PIXELS_PER_CLK:4"   }
--# Exporting Component Description of HDMI_TX_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- HDMI_TX_C0 entity declaration
----------------------------------------------------------------------
entity HDMI_TX_C0 is
    -- Port list
    port(
        -- Inputs
        DATA_B_I     : in  std_logic_vector(31 downto 0);
        DATA_G_I     : in  std_logic_vector(31 downto 0);
        DATA_R_I     : in  std_logic_vector(31 downto 0);
        DATA_VALID_I : in  std_logic;
        H_SYNC_I     : in  std_logic;
        RESET_N_I    : in  std_logic;
        SYS_CLK_I    : in  std_logic;
        V_SYNC_I     : in  std_logic;
        -- Outputs
        TMDS_B_O     : out std_logic_vector(39 downto 0);
        TMDS_G_O     : out std_logic_vector(39 downto 0);
        TMDS_R_O     : out std_logic_vector(39 downto 0)
        );
end HDMI_TX_C0;
----------------------------------------------------------------------
-- HDMI_TX_C0 architecture body
----------------------------------------------------------------------
architecture RTL of HDMI_TX_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- HDMI_TX   -   Microsemi:SolutionCore:HDMI_TX:1.0.2
component HDMI_TX
    generic( 
        g_PIXELS_PER_CLK : integer := 4 
        );
    -- Port list
    port(
        -- Inputs
        DATA_B_I     : in  std_logic_vector(31 downto 0);
        DATA_G_I     : in  std_logic_vector(31 downto 0);
        DATA_R_I     : in  std_logic_vector(31 downto 0);
        DATA_VALID_I : in  std_logic;
        H_SYNC_I     : in  std_logic;
        RESET_N_I    : in  std_logic;
        SYS_CLK_I    : in  std_logic;
        V_SYNC_I     : in  std_logic;
        -- Outputs
        TMDS_B_O     : out std_logic_vector(39 downto 0);
        TMDS_G_O     : out std_logic_vector(39 downto 0);
        TMDS_R_O     : out std_logic_vector(39 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal TMDS_B_O_net_0 : std_logic_vector(39 downto 0);
signal TMDS_G_O_net_0 : std_logic_vector(39 downto 0);
signal TMDS_R_O_net_0 : std_logic_vector(39 downto 0);
signal TMDS_R_O_net_1 : std_logic_vector(39 downto 0);
signal TMDS_G_O_net_1 : std_logic_vector(39 downto 0);
signal TMDS_B_O_net_1 : std_logic_vector(39 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 TMDS_R_O_net_1        <= TMDS_R_O_net_0;
 TMDS_R_O(39 downto 0) <= TMDS_R_O_net_1;
 TMDS_G_O_net_1        <= TMDS_G_O_net_0;
 TMDS_G_O(39 downto 0) <= TMDS_G_O_net_1;
 TMDS_B_O_net_1        <= TMDS_B_O_net_0;
 TMDS_B_O(39 downto 0) <= TMDS_B_O_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- HDMI_TX_C0_0   -   Microsemi:SolutionCore:HDMI_TX:1.0.2
HDMI_TX_C0_0 : HDMI_TX
    generic map( 
        g_PIXELS_PER_CLK => ( 4 )
        )
    port map( 
        -- Inputs
        RESET_N_I    => RESET_N_I,
        SYS_CLK_I    => SYS_CLK_I,
        DATA_VALID_I => DATA_VALID_I,
        DATA_R_I     => DATA_R_I,
        DATA_G_I     => DATA_G_I,
        DATA_B_I     => DATA_B_I,
        V_SYNC_I     => V_SYNC_I,
        H_SYNC_I     => H_SYNC_I,
        -- Outputs
        TMDS_R_O     => TMDS_R_O_net_0,
        TMDS_G_O     => TMDS_G_O_net_0,
        TMDS_B_O     => TMDS_B_O_net_0 
        );

end RTL;
