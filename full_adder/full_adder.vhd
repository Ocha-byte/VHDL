Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port (
    in1, in2, Cin: in std_logic; Sum, Cout: out std_logic);
end entity full_adder;

architecture rtl of full_adder is
    signal internal: std_logic;
begin
    internal <= in1 xor in2;
    Sum <= (in1 xor in2) xor Cin;
    Cout <= (in1 and in2) or ((in1 xor in2) and Cin);
end rtl;
