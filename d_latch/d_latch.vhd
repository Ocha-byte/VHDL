library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
    port (
        D, E: in std_logic; 
        q, nq: out std_logic);
end entity d_latch;

architecture rtl of d_latch is
    signal qt: std_logic;
begin
    process (D,E)
    begin
        if (E = '1') then
            qt <= d;
        end if;
    end process;
    
    q <= qt; nq <= not(qt);

end rtl;