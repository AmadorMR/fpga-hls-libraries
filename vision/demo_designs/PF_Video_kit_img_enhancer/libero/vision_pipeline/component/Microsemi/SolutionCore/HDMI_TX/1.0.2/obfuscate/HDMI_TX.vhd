library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigneD.all;
entity hdmi_tx is
generic (g_pixeLS_PER_CLK: integer := 1); port (RESET_N_I: in STD_logic;
SYS_CLK_i: in std_logic;
DATA_valid_i: in STD_LOGIC;
data_r_i: in std_logic_vector(g_pixeLS_PER_CLK*8-1 downto 0);
DATA_G_I: in std_LOGIC_VECTOR(G_PIXELS_PER_clk*8-1 downto 0);
data_b_i: in STD_LOGIC_VECtor(g_pixels_per_clk*8-1 downto 0);
v_SYNC_I: in STd_logic;
H_SYNC_I: in std_logic;
tMDS_R_O: out std_logic_VECTOR(g_pixelS_PER_CLK*10-1 downto 0);
tmds_g_o: out STD_LOGIC_VECTor(g_pixels_PER_CLK*10-1 downto 0);
tmds_b_o: out sTD_LOGIC_VECTOR(g_pixels_per_CLK*10-1 downto 0));
end entity;

architecture HDMI_tx of hdmi_tx is

component TMDS_encoder is
port (reset_n_i: in STD_LOgic;
sys_clk_i: in std_lOGIC;
data_valid_i: in std_LOGIC;
DATA_I: in STD_logic_vector(7 downto 0);
vsync_i: in std_LOGIC;
hsync_i: in std_logic;
ENCODED_o: out std_logic_vecTOR(9 downto 0));
end component;

begin
O:
for l in 1 to g_PIXELS_PER_CLK
generate
OL: tmds_encoDER
port map (Reset_n_i => reseT_N_I,
sys_clk_i => SYs_clk_i,
DATA_VALID_i => DATA_VALid_i,
DATA_I => data_r_I(8*l-1 downto 8*(L-1)),
VSYNC_I => v_sync_i,
HSYNC_I => H_SYNC_I,
encoded_o => TMDs_r_o(10*l-1 downto 10*(L-1)));
end generate O;
ll:
for L in 1 to g_PIXELS_PER_CLK
generate
il: TMDS_encoder
port map (REset_n_i => reset_n_I,
SYS_CLK_i => sys_clk_i,
DATA_VALID_I => DATA_VAlid_i,
DATA_I => data_g_i(8*l-1 downto 8*(L-1)),
vsync_i => V_SYnc_i,
HSYNC_I => H_SYNC_i,
ENCODEd_o => TMDS_g_o(10*l-1 downto 10*(L-1)));
end generate ll;
OI:
for L in 1 to g_pixels_per_CLK
generate
LI: tmds_ENCODER
port map (reset_n_i => RESET_n_i,
SYS_CLK_I => Sys_clk_i,
DAta_valid_i => data_valid_i,
DATA_I => data_b_i(8*L-1 downto 8*(L-1)),
vsync_I => V_SYNC_I,
hsync_i => h_sync_I,
encoded_O => tmds_b_o(10*l-1 downto 10*(l-1)));
end generate oi;
end HDMI_TX;
