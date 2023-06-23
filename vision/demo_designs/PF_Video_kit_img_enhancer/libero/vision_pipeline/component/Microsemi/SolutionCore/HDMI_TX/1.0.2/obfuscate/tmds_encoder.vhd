library IEEE;
use Ieee.std_logiC_1164.all;
use IEEE.std_lOGIC_UNSIGNED.all;
entity tmds_encoder is
port (reset_N_I: in std_logic;
sys_clk_i: in STD_LOGIC;
DATA_VAlid_i: in std_logic;
DATA_I: in STD_LOGIC_VECTOR(7 downto 0);
VSync_i: in std_lOGIC;
hsync_i: in STD_LOGIC;
encoded_o: out std_logic_VECTOR(9 downto 0));
end entity;

architecture ii of TMDS_ENCODER is

signal O0: std_LOGIC_VECTOR(1 downto 0) := ( others => '0');

signal L0: STd_logic_vector(8 downto 0);

signal i0: STD_LOGIC_VECTOR(8 downto 0);

signal O1: STd_logic_vector(3 downto 0);

signal L1: STD_LOgic_vector(8 downto 0);

signal I1: STD_LOgic_vector(8 downto 0);

signal ool: sTD_LOGIC_VECTOR(3 downto 0);

signal lol: STD_LOGIc_vector(3 downto 0) := ( others => '0');

begin
o0(1) <= VSYNC_I;
O0(0) <= HSYNC_I;
L0(0) <= data_i(0);
l0(1) <= DAta_i(1) xor L0(0);
l0(2) <= DATA_I(2) xor l0(1);
L0(3) <= DATA_I(3) xor l0(2);
l0(4) <= data_i(4) xor l0(3);
l0(5) <= DATA_I(5) xor L0(4);
l0(6) <= data_i(6) xor L0(5);
L0(7) <= DATA_I(7) xor L0(6);
L0(8) <= '1';
i0(0) <= DATA_I(0);
i0(1) <= data_i(1) xnor I0(0);
i0(2) <= data_i(2) xnor I0(1);
i0(3) <= DATa_i(3) xnor I0(2);
I0(4) <= data_i(4) xnor I0(3);
i0(5) <= DATA_I(5) xnor i0(4);
I0(6) <= data_i(6) xnor I0(5);
I0(7) <= datA_I(7) xnor i0(6);
i0(8) <= '0';
o1 <= "0000"+DATA_I(0)+DATA_I(1)+DAta_i(2)+DATA_I(3)+Data_i(4)+DATa_i(5)+data_i(6)+DATA_i(7);
IOL:
process (o1,data_i(0),i0,L0)
begin
if O1 > 4 or (O1 = 4 and DATA_I(0) = '0') then
L1 <= I0;
I1 <= not (i0);
else
l1 <= l0;
I1 <= not (L0);
end if;
end process;
ool <= "1100"+l1(0)+L1(1)+L1(2)+l1(3)+L1(4)+L1(5)+L1(6)+L1(7);
OLL:
process (sys_clk_i,RESEt_n_i)
begin
if RESET_n_i = '0' then
Encoded_o <= ( others => '0');
LOL <= ( others => '0');
elsif rising_edge(sys_clk_i) then
if data_vaLID_I = '0' then
case o0 is
when "00" =>
encoded_o <= "1101010100";
when "01" =>
ENCODED_O <= "0010101011";
when "10" =>
encoded_o <= "0101010100";
when others =>
ENCODED_O <= "1010101011";
end case;
LOL <= ( others => '0');
else
if lol = "00000" or ooL = 0 then
if L1(8) = '1' then
encoded_o <= "01"&L1(7 downto 0);
LOL <= LOL+ool;
else
encoded_o <= "10"&i1(7 downto 0);
LOL <= LOL-ool;
end if;
elsif (LOL(3) = '0' and ool(3) = '0') or (LOL(3) = '1' and OOL(3) = '1') then
ENCODED_O <= '1'&L1(8)&I1(7 downto 0);
LOL <= LOL+L1(8)-OOl;
else
ENCODED_O <= '0'&l1;
LOL <= lol-i1(8)+ool;
end if;
end if;
end if;
end process;
end II;
