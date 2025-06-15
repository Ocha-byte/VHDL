library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity sr_ff_tb is
end entity sr_ff_tb;

architecture rtl of sr_ff_tb is

    component sr_ff is
    port (
        s, r, clk: in std_logic;
        q, nq: out std_logic);
    end component sr_ff;

    signal s, r, clk, q, nq: std_logic;
    signal qt, nqt: std_logic;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: sr_ff port map (
		s => s,
		r => r,
		clk => clk,
		q => q,
		nq => nq);

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

    s <= '0';
    r <= '0';
    wait for 1 ns;

    s <= '1';
    r <= '0';
    wait for 1 ns;

    s <= '0';
    r <= '1';
    wait for 1 ns;

    s <= '1';
    r <= '1';
    wait for 1 ns;

    finish;

    end process;

end rtl;
