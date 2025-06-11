Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate_tb is
end entity not_gate_tb;

architecture rtl of not_gate_tb is
component not_gate is
port (in1: in std_logic; out1: out std_logic);
end component not_gate;

signal in1, out1 : std_logic;
begin
uut: not_gate port map (
    in1 => in1,
    out1 => out1);

stimulus: process
begin

in1 <= '0';
wait for 1 ns;

in1 <= '1';
wait for 1 ns;

wait;
end process;
end rtl;
