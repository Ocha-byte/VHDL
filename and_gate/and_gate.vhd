Library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity and_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end entity and_gate;

architecture rtl of and_gate is
begin
    out1 <= in1 and in2;
end rtl;
