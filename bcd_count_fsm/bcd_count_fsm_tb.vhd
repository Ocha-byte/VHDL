Library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity bcd_count_fsm_tb is
end entity bcd_count_fsm_tb;

architecture rtl of bcd_count_fsm_tb is
    component bcd_count_fsm is
        port (
            clk, resetn, stop: in std_logic;
            Q: out std_logic_vector (3 downto 0)
        );
    end component bcd_count_fsm;

    signal clk, resetn, stop: std_logic;
    signal Q: std_logic_vector (3 downto 0);

    type state is (S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
    signal y: state;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
    uut: bcd_count_fsm port map (
            clk => clk,
            resetn => resetn,
            stop => stop,
            Q => Q
		);

	clock: process
	begin
	    clk <= '0';
		wait for (T - T*duty);
		clk <= '1';
		wait for T*duty;
	end process;

    stimulus: process
    begin

       wait for 1 ns; -- reset state

       resetn <= '1';

       stop <= '1'; wait for 1 ns; -- S1
       stop <= '0'; wait for 1 ns; -- S1

       stop <= '1'; wait for 1 ns; -- S2
       stop <= '0'; wait for 1 ns; -- S2

       stop <= '1'; wait for 1 ns; -- S3
       stop <= '0'; wait for 1 ns; -- S3

       stop <= '1'; wait for 1 ns; -- S4
       stop <= '0'; wait for 1 ns; -- S4

       stop <= '1'; wait for 1 ns; -- S5
       stop <= '0'; wait for 1 ns; -- S5

       stop <= '1'; wait for 1 ns; -- S6
       stop <= '0'; wait for 1 ns; -- S6

       stop <= '1'; wait for 1 ns; -- S7
       stop <= '0'; wait for 1 ns; -- S7

       stop <= '1'; wait for 1 ns; -- S8
       stop <= '0'; wait for 1 ns; -- S8

       stop <= '1'; wait for 1 ns; -- S9
       stop <= '0'; wait for 1 ns; -- S9

       stop <= '1'; wait for 1 ns; -- S10
       stop <= '0'; wait for 1 ns; -- S10

       stop <= '1'; wait for 1 ns; -- S1
       stop <= '0'; wait for 1 ns; -- S1

       finish;

    end process;

   end rtl;
