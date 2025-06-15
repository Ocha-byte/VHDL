library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity cm15_tb is
end entity cm15_tb;

architecture rtl of cm15_tb is

    component cm15 is
    port (
        clk, resetn, E: in std_logic;
        Q: out integer range 0 to 15
    );
    end component cm15;

    signal clk, resetn, E: std_logic;
    signal Q: integer;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: cm15 port map (
	    clk => clk,
		resetn => resetn,
		E => E,
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
    E <= '1';
    wait for 14 ns;

    finish;

    end process;

end rtl;
