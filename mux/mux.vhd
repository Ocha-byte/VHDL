Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
port (
	sel : in std_logic;
	in1, in2 : in std_logic_vector (3 downto 0);
	out1 : out std_logic_vector (3 downto 0));
end entity mux;

architecture rtl of mux is
begin
    --out1 <= in1 when s = '0' else in2; -- Alternative method.
    with sel select
        out1 <= in1 when '1',
                in2 when '0',
                '_' when others; -- optimise circuit.
end rtl;
