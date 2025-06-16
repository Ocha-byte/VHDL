-- Sequence detector with overlap.
-- Mealy FSM.

Library ieee;
use ieee.std_logic_1164.all;

entity seq_detect is
    port (
        clk, resetn, x: in std_logic;
        z: out std_logic
    );
end entity seq_detect;

architecture rtl of seq_detect is
    type state is (S1, S2, S3, S4, S5);
    signal y: state;
begin

    transitions: process (resetn, clk, x) -- defines state transitions.
    begin
        if (resetn = '0') then -- asynchronous signal
            y <= S1; -- initial state
        elsif (clk'event and clk = '1') then -- State transistions only occur on rising clk edge.
            case y is
                when S1 =>
                    if (x = '1') then y <= S2; else y <= S1; end if;
                when S2 =>
                    if (x = '1') then y <= S3; else y <= S1; end if;
                when S3 =>
                    if (x = '1') then y <= S3; else y <= S4; end if;
                when S4 =>
                    if (x = '1') then y <= S5; else y <= S1; end if;
                when S5 =>
                    if (x = '1') then y <= S3; else y <= S1; end if;
            end case;
        end if;
    end process;

    outputs: process (x, y) -- Setting default values.
    begin
        z <= '0'; -- if z not declared, case statement will set it to 0.
        case y is
            when S1 =>
            when S2 =>
            when S3 =>
            when S4 =>
            when S5 =>
                if (x = '0') then
                    z <= '1';
                end if;
        end case;
    end process;
end rtl;
