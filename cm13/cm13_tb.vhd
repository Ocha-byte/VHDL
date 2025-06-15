library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity cm13_tb is
end entity cm13_tb;

architecture rtl of cm13_tb is

    component cm13 is
    port (
        clk, resetn, E: in std_logic;
        Q: out std_logic_vector (3 downto 0);
        z: out std_logic
    );
    end component cm13;

    signal clk, resetn, E: std_logic;
    signal Q: std_logic_vector (3 downto 0);
    signal z: std_logic;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: cm13 port map (
	    clk => clk,
		resetn => resetn,
		E => E,
		Q => Q,
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
    E <= '1';
    wait for 14 ns;

    finish;

    end process;

end rtl;
