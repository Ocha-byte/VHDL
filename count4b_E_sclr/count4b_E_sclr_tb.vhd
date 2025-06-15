library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity count4b_E_sclr_tb is
end entity count4b_E_sclr_tb;

architecture rtl of count4b_E_sclr_tb is

    component count4b_E_sclr is
    port (
        clk, resetn, E, sclr: in std_logic;
        Q: out integer range 0 to 15
    );
    end component count4b_E_sclr;

    signal clk, resetn, E, sclr: std_logic;
    signal Q: integer;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: count4b_E_sclr port map (
	    clk => clk,
		resetn => resetn,
		E => E,
		sclr => sclr,
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
    sclr <= '0';
    wait for 14 ns;

    finish;

    end process;

end rtl;
