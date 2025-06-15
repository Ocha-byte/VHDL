library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity t_ff_tb is
end entity t_ff_tb;

architecture rtl of t_ff_tb is

    component t_ff is
    port (
        t, clk: in std_logic;
        q, nq: out std_logic);
    end component t_ff;

    signal t, clk, q, nq: std_logic;
    signal qt, nqt: std_logic;

    constant Time: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: t_ff port map (
	    t => t,
		clk => clk,
		q => q,
		nq => nq);

	clock: process
	begin
	    clk <= '0';
		wait for (Time - Time*duty);
		clk <= '1';
		wait for Time*duty;
	end process;

    stimulus: process
    begin

    wait for 1 ns; -- reset state

    t <= '0';
    wait for 1 ns;

    t <= '1';
    wait for 1 ns;

    finish;

    end process;

end rtl;
