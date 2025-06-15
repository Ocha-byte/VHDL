-- Modulo-13 counter with enable and asynchronous active-low reset
-- Counts from 0 to 12 (4-bits)
-- Outputs 'z' when count is 12.

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity cm13 is
    port (
        clk, resetn, E: in std_logic;
        Q: out std_logic_vector (3 downto 0);
        z: out std_logic
    );
end entity cm13;

architecture rtl of cm13 is
    signal Qt: integer range 0 to 15;
begin
    process (resetn, clk, E)
    begin
        if (resetn = '0') then
            Qt <= 0;
        elsif (clk'event and clk = '1') then
            if (E = '1') then
                if (Qt = 12) then
                    Qt <= 0;
                else
                    Qt <= Qt + 1;
                end if;
            end if;
        end if;
    end process;
    Q <= conv_std_logic_vector (Qt, 4);
    z <= '1' when Qt = 12 else '0';
end rtl;
