-- 4-bit synchronous up/down counter with asynchronous active-low reset.
-- Count range between 0 and 15.

Library ieee;
use ieee.std_logic_1164.all;

entity bcd_ud_count is
    port (
        clk, resetn, ud: in std_logic;
        Q: out integer range 0 to 15
    );
end entity bcd_ud_count;

architecture rtl of bcd_ud_count is
    signal Qt: integer range 0 to 15;
begin
    process (resetn, clk, ud)
    begin
        if (resetn = '0') then
            Qt <= 0;
        elsif (clk'event and clk = '1') then
            if (ud = '0') then
                Qt <= Qt - 1;
            else
                Qt <= Qt + 1;
            end if;
        end if;
    end process;
    Q <= Qt;
end rtl;
