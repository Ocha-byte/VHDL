Library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor_tb is
end full_subtractor_tb;

architecture rtl of full_subtractor_tb is
component full_subtractor is
port (in1, in2, in3: in std_logic; diff, borrow: out std_logic);
end component full_subtractor;

signal in1, in2, in3, diff, borrow: std_logic;

begin
    uut: full_subtractor port map (
        in1 => in1,
        in2 => in2,
        in3 => in3,
        diff => diff,
        borrow => borrow);

stimulus: process
begin

in1 <= '0';
in2 <= '0';
in3 <= '0';
wait for 1 ns;

in1 <= '0';
in2 <= '0';
in3 <= '1';
wait for 1 ns;

in1 <= '0';
in2 <= '1';
in3 <= '0';
wait for 1 ns;

in1 <= '0';
in2 <= '1';
in3 <= '1';
wait for 1 ns;

in1 <= '1';
in2 <= '0';
in3 <= '0';
wait for 1 ns;

in1 <= '1';
in2 <= '0';
in3 <= '1';
wait for 1 ns;

in1 <= '1';
in2 <= '1';
in3 <= '0';
wait for 1 ns;

in1 <= '1';
in2 <= '1';
in3 <= '1';
wait for 1 ns;
wait;
end process;
end rtl;
