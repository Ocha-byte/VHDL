-- 4-bit synchronous counter with parallel load

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lcount is
    port (
        clk, resetn, load: in std_logic;
        data: in std_logic_vector (3 downto 0);
        Q: out std_logic_vector (3 downto 0)
    );
end entity lcount;

architecture rtl of lcount is
    signal Qt: std_logic_vector (3 downto 0);
begin
    process (resetn, clk, load)
    begin
        if (resetn = '0') then
            Qt <= "0000";
        elsif (clk'event and clk = '1') then
            if (load = '1') then
                Qt <= data;
            else
                Qt <= Qt + "0001";
            end if;
        end if;
    end process;
    Q <= Qt;
end rtl;