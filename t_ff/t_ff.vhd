library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
    port(t, clk: in std_logic; q, nq: out std_logic);
end entity t_ff;

architecture rtl of t_ff is
signal qt, nqt: std_logic;
begin
    process(t, clk)
    begin
        if (clk'event and clk = '1') then
            if (t = '1') then
                qt <= not(qt);
            end if;
        end if;
    end process;
    q <= qt; nq <= not(qt);
end rtl;
