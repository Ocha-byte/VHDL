-- 4-Bit parallel access shift register - shift to the left

Library ieee;
use ieee.std_logic_1164.all;

entity pashreg4_left is
    port (
        clk, resetn: in std_logic;
        E, s_l, din: in std_logic;
        dout: out std_logic;
        D: in std_logic_vector (3 downto 0);
        Q: out std_logic_vector (3 downto 0)
    );
end entity pashreg4_left;

architecture rtl of pashreg4_left is
    signal Qt: std_logic_vector (3 downto 0);
begin
    process (resetn, clk, s_l, E)
    begin
        if (resetn = '0') then
            Qt <= "0000";
        elsif (clk'event and clk = '1') then
            if (E = '1') then
                if (s_l = '1') then
                    Qt <= D;
                else
                    gg: for i in 1 to 3 loop
                        Qt(i) <= Qt(i - 1);
                    end loop;
                    Qt(0) <= din;
                end if;
            end if;
        end if;
    end process;
    Q <= Qt; dout <= Qt(3);
end rtl;