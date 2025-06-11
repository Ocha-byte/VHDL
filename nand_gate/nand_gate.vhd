Library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity nand_gate is
port (in1, in2: in std_logic; out1: out std_logic);
end entity nand_gate;

architecture rtl of nand_gate is
begin
    out1 <= in1 nand in2;
end rtl;
