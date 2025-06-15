-- Parallel load, parallel output.
-- 8-bit register with enable and asynchronous reset.

Library ieee;
use ieee.std_logic_1164.all;

entity reg8 is
    port (
        clk, rstn, E: in std_logic;
        D: in std_logic_vector (7 downto 0);
        Q: out std_logic_vector (7 downto 0)
    );
end entity reg8;

architecture rtl of reg8 is
begin
    process (clk, rstn, E)
    begin
        if (rstn = '0') then
            Q <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (E = '1') then
                Q <= D;
            end if;
        end if;
    end process;
end rtl;
