library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity bcd_count_tb is
end entity bcd_count_tb;

architecture rtl of bcd_count_tb is

    component bcd_count is
    port (
        clk, resetn: in std_logic;
        Q: out integer range 0 to 15
    );
    end component bcd_count;

    signal clk, resetn: std_logic;
    signal Q: integer;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: bcd_count port map (
	    clk => clk,
		resetn => resetn,
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
    wait for 14 ns;

    finish;

    end process;

end rtl;
