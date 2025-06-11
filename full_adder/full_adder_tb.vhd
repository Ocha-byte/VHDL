Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture rtl of full_adder_tb is
component full_adder is
port (
    in1, in2, Cin: in std_logic;
    Sum, Cout: out std_logic);
end component full_adder;

signal in1, in2, Cin, Sum, Cout: std_logic;

begin
    uut: full_adder port map (
        in1 => in1,
        in2 => in2,
        Cin => Cin,
        Sum => Sum,
        Cout => Cout);

stimulus: process
begin

in1 <= '0';
in2 <= '0';
Cin <= '0';
wait for 1 ns;

in1 <= '0';
in2 <= '0';
Cin <= '1';
wait for 1 ns;

in1 <= '0';
in2 <= '1';
Cin <= '0';
wait for 1 ns;

in1 <= '0';
in2 <= '1';
Cin <= '1';
wait for 1 ns;

in1 <= '1';
in2 <= '0';
Cin <= '0';
wait for 1 ns;

in1 <= '1';
in2 <= '0';
Cin <= '1';
wait for 1 ns;

in1 <= '1';
in2 <= '1';
Cin <= '0';
wait for 1 ns;

in1 <= '1';
in2 <= '1';
Cin <= '1';
wait for 1 ns;

wait;
end process;
end rtl;
