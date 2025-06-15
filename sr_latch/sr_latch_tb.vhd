library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity sr_latch_tb is
end entity sr_latch_tb;

architecture rtl of sr_latch_tb is

    component sr_latch is
    port (
        s, r, E: in std_logic;
        q, nq: out std_logic);
    end component sr_latch;

    signal s, r, E, q, nq: std_logic;
    signal qt, nqt: std_logic;

    begin
	uut: sr_latch port map (
		s => s,
		r => r,
		E => E,
		q => q,
		nq => nq);

    stimulus: process
    begin

    wait for 1 ns; -- reset state
    E <='1'; -- enable latch

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
