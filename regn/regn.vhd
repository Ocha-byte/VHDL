-- N-bit register with enable, sclr and asynchronous reset.
-- sclr: only considered if E = '1'.

library ieee;
use ieee.std_logic_1164.all;

entity regn is
    generic (N: INTEGER:= 4);
    port (
        clk: in std_logic;
        resetn: in std_logic;
        E, sclr: in std_logic;
        D: in std_logic_vector (N-1 downto 0);
        Q: out std_logic_vector (N-1 downto 0)
    );
end entity regn;

architecture rtl of regn is
    signal Qt: std_logic_vector (N-1 downto 0);
begin
    process (resetn, clk)
    begin
        if (resetn = '0') then
            Qt <= (others => '0');
            elsif (clk'event and clk = '1') then
                if (E = '1') then
                    if (sclr = '1') then
                        Qt <= (others => '0');
                    else
                        Qt <= D;
                    end if;
                end if;
            end if;
    end process;
    Q <= Qt;
end rtl;
