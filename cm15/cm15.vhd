-- Counter modulo-15.
-- 4-bit binary counter with asynchronous active-low reset and enable.
-- Counts from 0 to (2^4)-1

Library ieee;
use ieee.std_logic_1164.all;

entity cm15 is
    port (
        clk, resetn, E: in std_logic;
        Q: out integer range 0 to 15
    );
end entity cm15;

architecture rtl of cm15 is
    signal Qt: integer range 0 to 15;
begin
    process (resetn, clk, E)
    begin
        if (resetn = '0') then
            Qt <= 0;
        elsif (clk'event and clk = '1') then
            if (E = '1') then
                Qt <= Qt + 1;
            end if;
        end if;
    end process;
    Q <= Qt;
end rtl;
