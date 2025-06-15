library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
    port (s, r, E: in std_logic; q, nq: out std_logic);
end entity sr_latch;

architecture rtl of sr_latch is
    signal qt, nqt: std_logic;
begin
    process (s, r, E)
    begin
        if (E = '1') then
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