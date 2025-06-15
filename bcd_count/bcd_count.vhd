-- BCD (or modulo-10) counter with asynchronous active-low reset.
-- Counts from 0 to 9 (4-bits)

Library ieee;
use ieee.std_logic_1164.all;

entity bcd_count is
    port (
        clk, resetn: in std_logic;
        Q: out integer range 0 to 15
    );
end entity bcd_count;

architecture rtl of bcd_count is
    signal Qt: integer range 0 to 15;
begin
    process (resetn, clk)
    begin
        if (resetn = '0') then
            Qt <= 0;
        elsif (clk'event and clk = '1') then
            if (Qt = 9) then
                Qt <= 0;
            else
                Qt <= Qt + 1;
            end if;
        end if;
    end process;
    Q <= Qt;
end rtl;
