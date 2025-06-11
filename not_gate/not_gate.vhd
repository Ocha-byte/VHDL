Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
port (in1: in std_logic; out1: out std_logic);
end entity not_gate;

architecture rtl of not_gate is
begin
    out1 <= not in1;
end rtl;
