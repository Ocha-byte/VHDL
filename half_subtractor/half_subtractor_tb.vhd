Library ieee;
use ieee.std_logic_1164.all;

entity half_subtractor_tb is
end entity half_subtractor_tb;

architecture rtl of half_subtractor_tb is
component half_subtractor is
port (
    in1, in2: in std_logic;
    diff, borrow: out std_logic);
end component half_subtractor;

signal in1, in2, diff, borrow: std_logic;

begin
    uut: half_subtractor port map (
        in1 => in1,
        in2 => in2,
        diff => diff,
        borrow => borrow);

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
