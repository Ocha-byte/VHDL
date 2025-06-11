Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate_tb is
end entity nor_gate_tb;

architecture rtl of nor_gate_tb is
component nor_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end component nor_gate;

signal in1, in2, out1 : std_logic;
begin
uut: nor_gate port map (
    in1 => in1,
    in2 => in2,
    out1 => out1);

stimulus: process
begin

in1 <= '0';
in2 <= '0';
wait for 1 ns;

in1 <= '1';
in2 <= '0';
wait for 1 ns;

in1 <= '0';
in2 <= '1';
wait for 1 ns;

in1 <= '1';
in2 <= '1';
wait for 1 ns;

wait;
end process;
end rtl;
