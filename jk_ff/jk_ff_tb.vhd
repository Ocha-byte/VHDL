library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity jk_ff_tb is
end entity jk_ff_tb;

architecture rtl of jk_ff_tb is

    component jk_ff is
    port (
        j, k, clk: in std_logic;
        q, nq: out std_logic);
    end component jk_ff;

    signal j, k, clk, q, nq: std_logic;
    signal qt, nqt: std_logic;

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: jk_ff port map (
		j => j,
		k => k,
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

    j <= '0';
    k <= '0';
    wait for 1 ns;

    j <= '1';
    k <= '0';
    wait for 1 ns;

    j <= '0';
    k <= '1';
    wait for 1 ns;

    j <= '1';
    k <= '1';
    wait for 1 ns;

    finish;

    end process;

end rtl;
