Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
port (
    in1, in2: in std_logic; Sum, Cout: out std_logic);
end entity half_adder;

architecture rtl of half_adder is
begin
    Sum <= in1 xor in2;
    Cout <= in1 and in2;
end rtl;
