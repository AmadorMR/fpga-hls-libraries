--=================================================================================================
-- File Name                           : HDMI_TX_TB.vhd

-- Description                         : This module implements the testbench of HDMI_TX module
--                                        
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2019 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--=================================================================================================

--=================================================================================================
-- Libraries
--=================================================================================================
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--=================================================================================================
-- HDMI_TX_TB entity declaration
--=================================================================================================
ENTITY HDMI_TX_TB IS
END HDMI_TX_TB;
--=================================================================================================
-- Architecture body
--=================================================================================================
ARCHITECTURE rtl OF HDMI_TX_TB IS
--=================================================================================================
-- Component declarations
--=================================================================================================       

	COMPONENT HDMI_TX
		GENERIC(
			g_PIXELS_PER_CLK 					: INTEGER := 1        
		);
		PORT (
			RESET_N_I 							: IN STD_LOGIC;
			SYS_CLK_I 							: IN STD_LOGIC;
			DATA_VALID_I 						: IN STD_LOGIC;
			DATA_R_I							: IN STD_LOGIC_VECTOR (g_PIXELS_PER_CLK * 8 - 1 DOWNTO 0);
			DATA_G_I 							: IN STD_LOGIC_VECTOR (g_PIXELS_PER_CLK * 8 - 1 DOWNTO 0);
			DATA_B_I 							: IN STD_LOGIC_VECTOR (g_PIXELS_PER_CLK * 8 - 1 DOWNTO 0);
			V_SYNC_I 							: IN STD_LOGIC;
			H_SYNC_I 							: IN STD_LOGIC;
			TMDS_R_O 							: OUT STD_LOGIC_VECTOR (g_PIXELS_PER_CLK * 10 - 1 DOWNTO 0);
			TMDS_G_O 							: OUT STD_LOGIC_VECTOR (g_PIXELS_PER_CLK * 10 - 1 DOWNTO 0);
			TMDS_B_O 							: OUT STD_LOGIC_VECTOR (g_PIXELS_PER_CLK * 10 - 1 DOWNTO 0)
		);
	END COMPONENT;

--=================================================================================================
-- Signal declarations
--=================================================================================================
	CONSTANT SYSCLK_PERIOD			: TIME 		:= 10 ns;
	CONSTANT g_PIXELS_PER_CLK 		: INTEGER := 1;
	SIGNAL SYSCLK    				: STD_LOGIC := '0';
	SIGNAL NSYSRESET 				: STD_LOGIC := '0';
  
	SIGNAL s_valid_data_tb 			: STD_LOGIC  := '0';
	SIGNAL s_data_r_tb       		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_data_g_tb       		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_data_b_tb       		: STD_LOGIC_VECTOR(7 DOWNTO 0);
		
	SIGNAL s_encoded_r 				: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL s_encoded_g				: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL s_encoded_b 				: STD_LOGIC_VECTOR(9 DOWNTO 0);
	
	SIGNAL s_h_sync			        : STD_LOGIC;	
	SIGNAL s_v_sync			        : STD_LOGIC;	
	SIGNAL s_h_active		        : STD_LOGIC;	
	SIGNAL s_v_active		        : STD_LOGIC;
	
	SIGNAL s_h_active_dly	        : STD_LOGIC;	
	SIGNAL s_h_active_fe	        : STD_LOGIC;	
	
	SIGNAL s_h_counter              : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL s_v_counter              : STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN
--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

  s_valid_data_tb <= s_h_active and s_v_active;

  RESET_GEN_PROC :
  PROCESS
    VARIABLE vhdl_initial : BOOLEAN := true;
  BEGIN
    IF (vhdl_initial) THEN
      NSYSRESET <= '0';
      WAIT FOR (SYSCLK_PERIOD * 10);
      NSYSRESET <= '1';
      WAIT;
    END IF;
  END PROCESS;

  -- Clock Driver
  SYSCLK <= NOT SYSCLK AFTER (SYSCLK_PERIOD / 2.0);
  
--========================================================================
-- Name       : H_COUNTER
-- Description: Counter for horizontal line generation
--========================================================================
H_COUNTER:
	PROCESS(SYSCLK,NSYSRESET)
	BEGIN
		IF NSYSRESET = '0' THEN
			s_h_counter <= (OTHERS=>'0');
		ELSIF rising_edge(SYSCLK) THEN
				IF(s_h_counter < x"30F") THEN
					s_h_counter <= s_h_counter + '1';
				ELSE
					s_h_counter <= (OTHERS=>'0');
				END IF;
		END IF;
	END PROCESS;
                
                
--========================================================================
-- Name       : H_TIMIMG_GEN_EXT_SYNC
-- Description: Timing signals based on external horizontal counter
--========================================================================
H_TIMIMG_GEN_EXT_SYNC:
	PROCESS(SYSCLK,NSYSRESET)
	BEGIN
		IF NSYSRESET = '0' THEN
            s_h_sync		<= '0';
			s_h_active  	<= '0';
		ELSIF rising_edge(SYSCLK) THEN
			IF(s_h_counter < x"0008") THEN
				s_h_sync 	<= '0';
				s_h_active	<= '0';
			ELSIF(s_h_counter < x"0068") THEN
				s_h_sync 	<= '1';
				s_h_active	<= '0';
			ELSIF(s_h_counter < x"0090") THEN
				s_h_sync 	<= '0';
				s_h_active	<= '0';
			ELSE
				s_h_sync 	<= '0';
				s_h_active	<= '1';
			END IF;
		END IF;
	END PROCESS;
	
--========================================================================
-- Name       : V_COUNTER
-- Description: Counter for vertical line generation
--========================================================================
V_COUNTER:
	PROCESS(SYSCLK,NSYSRESET)
	BEGIN
		IF NSYSRESET = '0' THEN
			s_h_active_dly	<= '0';
		    s_h_active_fe	<= '0';
			s_v_counter		<= (OTHERS=>'0');
		ELSIF rising_edge(SYSCLK) THEN
			s_h_active_dly	<= s_h_active;
			s_h_active_fe	<= NOT(s_h_active) AND (s_h_active_dly);
				IF(s_h_active_fe = '1') THEN
					IF(s_v_counter < x"01FC") THEN
						s_v_counter <= s_v_counter + '1';
					ELSE
						s_v_counter <= (OTHERS=>'0');
					END IF;
				END IF;
		END IF;
	END PROCESS;
	
		
--========================================================================
-- Name       : V_TIMIMG_GEN_EXT_SYNC
-- Description: Timing signals based on external vertical counter
--========================================================================
V_TIMIMG_GEN_EXT_SYNC:
	PROCESS(SYSCLK,NSYSRESET)
	BEGIN
		IF NSYSRESET = '0' THEN
            s_v_sync	<= '0';
			s_v_active  <= '0';
		ELSIF rising_edge(SYSCLK) THEN	
			IF(s_v_counter < x"0002") THEN
				s_v_sync 	<= '0';
				s_v_active  <= '0';
			ELSIF(s_v_counter < x"0004") THEN
				s_v_sync 	<= '1';
				s_v_active  <= '0';
			ELSIF(s_v_counter < x"001D") THEN
				s_v_sync 	<= '0';
				s_v_active  <= '0';
			ELSE
				s_v_sync 	<= '0';
				s_v_active  <= '1';
			END IF;
		END IF;
	END PROCESS;

--========================================================================
-- Name       : DATA_GEN
-- Description: generating "R" data
--========================================================================
  PROCESS(SYSCLK, NSYSRESET)
  BEGIN
    IF NSYSRESET = '0' THEN
      s_data_r_tb <= (OTHERS => '0');
      s_data_g_tb <= (OTHERS => '0');
      s_data_b_tb <= (OTHERS => '0');	  
    ELSIF RISING_EDGE(SYSCLK) THEN
      IF(s_v_active = '1') THEN
        IF(s_h_active = '1') THEN
          s_data_r_tb <= s_data_r_tb + '1';
		  s_data_g_tb <= s_data_g_tb + x"89";
          s_data_b_tb <= s_data_b_tb + x"48";
        END IF;
      ELSE
        s_data_r_tb <= (OTHERS => '0');
        s_data_g_tb <= (OTHERS => '0');
        s_data_b_tb <= (OTHERS => '0');
      END IF;
    END IF;
  END PROCESS;

  
--=================================================================================================
-- Component Instantiations
--=================================================================================================
	

HDMI_TX_INST0 : HDMI_TX
    GENERIC MAP(
		g_PIXELS_PER_CLK 		=> g_PIXELS_PER_CLK
		)
    PORT MAP (

		RESET_N_I 	 		=> NSYSRESET,
		SYS_CLK_I        	=> SYSCLK,
		DATA_VALID_I		=> s_valid_data_tb,
		DATA_R_I    		=> s_data_r_tb,
		DATA_G_I     		=> s_data_g_tb,
		DATA_B_I    		=> s_data_b_tb,
		V_SYNC_I    		=> s_v_sync, 
		H_SYNC_I    		=> s_h_sync,
		TMDS_R_O    		=> s_encoded_r,
		TMDS_G_O    		=> s_encoded_g,
		TMDS_B_O    		=> s_encoded_b
    );

	
END rtl;

