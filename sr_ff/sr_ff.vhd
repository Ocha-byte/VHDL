library ieee;
use ieee.std_logic_1164.all;

entity sr_ff is
    port (s, r, clk: in std_logic; q, nq: out std_logic);
end entity sr_ff;

architecture rtl of sr_ff is
    signal qt, nqt: std_logic;
begin
    process (s, r, clk)
    begin
        if (clk = '1' and clk'event) then
            if (s = '1' and r = '0') then
                qt <= '1'; nqt <= '0';
            elsif (s = '0' and r = '1') then
                    qt <= '0'; nqt <= '1';
            elsif (s = '1' and r = '1') then
                    qt <= '0'; nqt <= '0';
            end if;
        end if;
    end process;
    
    q <= qt; nq <= nqt;

end rtl;