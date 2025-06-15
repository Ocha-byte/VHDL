library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity d_latch_tb is
end entity d_latch_tb;

architecture rtl of d_latch_tb is

    component d_latch is
    port (
        D, E: in std_logic;
        q, nq: out std_logic);
    end component d_latch;

    signal D, E, q, nq: std_logic;
    signal qt: std_logic;

    begin
	uut: d_latch port map (
	    D => D,
		E => E,
		q => q,
		nq => nq);

    stimulus: process
    begin

    wait for 1 ns; -- reset state
    E <='1'; -- enable latch

    D <= '0';
    E <= '0';
    wait for 1 ns;

    D <= '1';
    E <= '0';
    wait for 1 ns;

    D <= '0';
    E <= '1';
    wait for 1 ns;

    D <= '1';
    E <= '1';
    wait for 1 ns;

    finish;

    end process;

end rtl;
