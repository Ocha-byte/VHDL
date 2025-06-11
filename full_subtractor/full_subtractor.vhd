Library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
port (in1, in2, in3: in std_logic; diff, borrow: out std_logic);
end entity full_subtractor;

architecture rtl of full_subtractor is
signal internal1: std_logic;
begin
    internal1 <= in1 xor in2;
    diff <=internal1 xor in3;
    borrow <= ((not internal1) and in3) or ((not in1) and in2);
end rtl;
