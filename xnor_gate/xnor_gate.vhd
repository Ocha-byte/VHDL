Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end entity xnor_gate;

architecture rtl of xnor_gate is
begin
    out1 <= in1 xnor in2;
end rtl;
