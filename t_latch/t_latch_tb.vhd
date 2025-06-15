library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity t_latch_tb is
end entity t_latch_tb;

architecture rtl of t_latch_tb is

    component t_latch is
    port (
        t, E: in std_logic;
        q, nq: out std_logic);
    end component t_latch;

    signal t, E, q, nq: std_logic;
    signal qt, nqt: std_logic;

    begin
	uut: t_latch port map (
	    t => t,
		E => E,
		q => q,
		nq => nq);

    stimulus: process
    begin

    wait for 1 ns; -- reset state
    E <='1'; -- enable latch

    t <= '0';
    wait for 1 ns;

    t <= '1';
    wait for 1 ns;

    finish;

    end process;

end rtl;
