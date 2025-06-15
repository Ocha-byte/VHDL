library ieee;
use ieee.std_logic_1164.all;

entity t_latch is
    port (
        t, E: in std_logic;
        q, nq: out std_logic);
end entity t_latch;

architecture rtl of t_latch is
    signal qt, nqt: std_logic;
begin
    process (t,E)
    begin
        if (E = '1') then
            if (t = '1') then
                qt <= not(qt);
            end if;
        end if;
    end process;

    q <= qt; nq <= not(qt);

end rtl;
