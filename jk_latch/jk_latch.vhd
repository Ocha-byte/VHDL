library ieee;
use ieee.std_logic_1164.all;

entity jk_latch is
    port (j, k, E: in std_logic; q, nq: out std_logic);
end entity jk_latch;

architecture rtl of jk_latch is
    signal qt, nqt: std_logic;
begin
    process (j, k, E)
    begin
        if (E = '1') then
            if (j = '1' and k = '1') then
                qt <= not(qt);
            elsif (j = '1' and k = '0') then
                qt <= '0';
            elsif (j = '0' and k = '1') then
                qt <= '1';
            end if;
        end if;
    end process;

    nqt <= not(qt);
    q <= qt; nq <= nqt;

end rtl;
