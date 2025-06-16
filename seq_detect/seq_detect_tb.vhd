Library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity seq_detect_tb is
end entity seq_detect_tb;

architecture rtl of seq_detect_tb is
    component seq_detect is
        port (
            clk, resetn, x: in std_logic;
            z: out std_logic
        );
    end component seq_detect;

    signal clk, resetn, x, z: std_logic;

    type state is (S1, S2, S3, S4, S5);
    signal y: state;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
    uut: seq_detect port map (
            clk => clk,
            resetn => resetn,
            x => x,
            z => z
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

       x <= '1'; wait for 1 ns; -- S1
       x <= '0'; wait for 1 ns; -- S1

       x <= '1'; wait for 1 ns; -- S2
       x <= '0'; wait for 1 ns; -- S2

       x <= '1'; wait for 1 ns; -- S3
       x <= '0'; wait for 1 ns; -- S3

       x <= '1'; wait for 1 ns; -- S4
       x <= '0'; wait for 1 ns; -- S4

       x <= '1'; wait for 1 ns; -- S5
       x <= '0'; wait for 1 ns; -- S5

       x <= '1'; wait for 1 ns; -- S1
       x <= '0'; wait for 1 ns; -- S1

       finish;

    end process;

   end rtl;
