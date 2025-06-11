Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_tb is
end mux_tb;

architecture rtl of mux_tb is
component mux is
port (
	sel : in std_logic;
	in1, in2 : in std_logic_vector (3 downto 0);
	out1 : out std_logic_vector (3 downto 0));
end component mux;

signal sel : std_logic;
signal in1, in2 : std_logic_vector(3 downto 0) := "0000";
signal out1 : std_logic_vector(3 downto 0);

begin
	uut: mux port map (
		sel => sel,
		in1 => in1,
		in2 => in2,
		out1 => out1);

stim: process
begin

sel <= '0';
in1 <= "0000";
in2 <= "0000";
wait for 1 ns;

sel <= '1';
in1 <= "0001";
in2 <= "0000";
wait for 1 ns;

sel <= '0';
in1 <= "0010";
in2 <= "0000";
wait for 1 ns;

sel <= '1';
in1 <= "0011";
in2 <= "0000";
wait for 1 ns;

sel <= '0';
in1 <= "0100";
in2 <= "0000";
wait for 1 ns;

sel <= '1';
in1 <= "0101";
in2 <= "0000";
wait for 1 ns;

sel <= '0';
in1 <= "0110";
in2 <= "0000";
wait for 1 ns;

sel <= '1';
in1 <= "0111";
in2 <= "0000";
wait for 1 ns;

sel <= '0';
in1 <= "1000";
in2 <= "0000";
wait for 1 ns;

wait;
end process;
end rtl;
