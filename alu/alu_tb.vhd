Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end entity alu_tb;

architecture rtl of alu_tb is
component alu is
port (
    sel, in1, in2: in std_logic;
    out1: out std_logic);
end component alu;

signal in1, in2, out1: std_logic;
begin
uut: alu port map (
    sel => sel,
    in1 => in1,
    in2 => in2,
    out1 => out1);

stimulus: process
begin

sel <= '0';
in1 <= '0';
in2 <= '0';
wait for 1 ns;

wait;
end process;
end rtl;
