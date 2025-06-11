Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end entity xor_gate;

architecture rtl of xor_gate is
begin
    out1 <= in1 xor in2;
end rtl;
