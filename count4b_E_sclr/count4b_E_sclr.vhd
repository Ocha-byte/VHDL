-- 4-bit binary counter with enable, asynchronous active-low reset, and synchronous clear.
-- Counts from 0 to (2^4)-1

Library ieee;
use ieee.std_logic_1164.all;

entity count4b_E_sclr is
    port (
        clk, resetn, E, sclr: in std_logic;
        Q: out integer range 0 to 15
    );
end entity count4b_E_sclr;

architecture rtl of count4b_E_sclr is
    signal Qt: integer range 0 to 15;
begin
    process (resetn, clk, E)
    begin
        if (resetn = '0') then
            Qt <= 0;
        elsif (clk'event and clk = '1') then
            if (E = '1') then
                if (sclr = '1') then
                    Qt <= 0;
                else
                    Qt <= Qt + 1;
                end if;
            end if;
        end if;
    end process;
    Q <= Qt;
end rtl;
