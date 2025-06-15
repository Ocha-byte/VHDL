library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity d_ff_tb is
end entity d_ff_tb;

architecture rtl of d_ff_tb is

    component d_ff is
    port (
        D, clk: in std_logic;
        q, nq: out std_logic);
    end component d_ff;

    signal D, clk, q, nq: std_logic;
    signal qt: std_logic;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: d_ff port map (
		D => D,
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

    D <= '0';
    wait for 1 ns;

    D <= '1';
    wait for 1 ns;

    finish;

    end process;

end rtl;
