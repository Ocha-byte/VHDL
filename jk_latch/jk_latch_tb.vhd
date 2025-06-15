library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity jk_latch_tb is
end entity jk_latch_tb;

architecture rtl of jk_latch_tb is

    component jk_latch is
    port (
        j, k, E: in std_logic;
        q, nq: out std_logic);
    end component jk_latch;

    signal j, k, E, q, nq: std_logic;
    signal qt, nqt: std_logic;

    begin
	uut: jk_latch port map (
		j => j,
		k => k,
		E => E,
		q => q,
		nq => nq);

    stimulus: process
    begin

    wait for 1 ns; -- reset state
    E <='1'; -- enable latch

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
