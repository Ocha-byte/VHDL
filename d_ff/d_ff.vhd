library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
    port (
        D, clk: in std_logic; 
        q, nq: out std_logic);
end entity d_ff;

architecture rtl of d_ff is
    signal qt: std_logic;
begin
    process (D, clk)
    begin
        if (clk = '1' and clk'event) then
            qt <= d;
        end if;
    end process;
    
    q <= qt; nq <= not(qt);

end rtl;