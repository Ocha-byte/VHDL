Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end entity or_gate;

architecture rtl of or_gate is
begin
    out1 <= in1 or in2;
end rtl;
