-- 4-bit binary counter with asynchronous active-low reset.
-- Counts from 0 to (2^4)-1

Library ieee;
use ieee.std_logic_1164.all;

entity count4b is
    port (
        clk, resetn: in std_logic;
        Q: out integer range 0 to 15
    );
end entity count4b;

architecture rtl of count4b is
    signal Qt: integer range 0 to 15;
begin
    process (resetn, clk)
    begin
        if (resetn = '0') then
            Qt <= 0;
        elsif (clk'event and clk = '1') then
            Qt <= Qt + 1;
        end if;
    end process;
    Q <= Qt;
end rtl;
