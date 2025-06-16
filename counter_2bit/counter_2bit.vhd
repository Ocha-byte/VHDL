-- Moore-type Finite State Machine (FSM)
-- Count 00 > 01 > 10 > 10 > 00 > ...

Library ieee;
use ieee.std_logic_1164.all;

entity counter_2bit is
    port (
        clk, resetn: in std_logic;
        Q: out std_logic_vector (1 downto 0)
    );
end entity counter_2bit;

architecture rtl of counter_2bit is
    type state is (S1, S2, S3, S4);
    signal y: state;
begin

    transitions: process (resetn, clk) -- defines state transitions.
    begin
        if (resetn = '0') then -- asynchronous signal
            y <= S1; -- initial state
        elsif (clk'event and clk = '1') then -- State transistions only occur on rising clk edge.
            case y is
                when S1 => y <= S2;
                when S2 => y <= S3;
                when S3 => y <= S4;
                when S4 => y <= S1;
            end case;
        end if;
    end process;

    outputs: process (y) -- Moore machine as outputs only depend on current state.
    begin
        case y is --Only controlled by current state. Defines outputs.
            when S1 => Q <= "00";
            when S2 => Q <= "01";
            when S3 => Q <= "10";
            when S4 => Q <= "11";
        end case;
    end process;
end rtl;
