Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end entity half_adder_tb;

architecture rtl of half_adder_tb is
component half_adder is
port (
    in1, in2: in std_logic;
    Sum, Cout: out std_logic);
end component half_adder;

signal in1, in2, Sum, Cout: std_logic;

begin
    uut: half_adder port map (
        in1 => in1,
        in2 => in2,
        Sum => Sum,
        Cout => Cout);

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
