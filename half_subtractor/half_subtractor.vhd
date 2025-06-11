Library ieee;
use ieee.std_logic_1164.all;

entity half_subtractor is
port (in1, in2: in std_logic; diff, borrow: out std_logic);
end entity half_subtractor;

architecture rtl of half_subtractor is
begin
    diff <= in1 xor in2;
    borrow <= (not in1) and in2;
end rtl;
