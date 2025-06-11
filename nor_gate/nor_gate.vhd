Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end entity nor_gate;

architecture rtl of nor_gate is
begin
    out1 <= in1 nor in2;
end rtl;
