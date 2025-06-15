library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity bcd_ud_count_tb is
end entity bcd_ud_count_tb;

architecture rtl of bcd_ud_count_tb is

    component bcd_ud_count is
    port (
        clk, resetn, ud: in std_logic;
        Q: out integer range 0 to 15
    );
    end component bcd_ud_count;

    signal clk, resetn, ud: std_logic;
    signal Q: integer;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: bcd_ud_count port map (
	    clk => clk,
		resetn => resetn,
		ud => ud,
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
    
    ud <= '1';
    wait for 2 ns;
    
    ud <= '0';
    wait for 1 ns;
    
    ud <= '1';
    wait for 3 ns;
    
    ud <= '0';
    wait for 1 ns;

    finish;

    end process;

end rtl;
