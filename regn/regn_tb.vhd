library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity regn_tb is
    generic (N: INTEGER:= 4);
end entity regn_tb;

architecture rtl of regn_tb is

    component regn is
    port (
        clk, resetn, E, sclr: in std_logic;
        D: in std_logic_vector (N-1 downto 0);
        Q: out std_logic_vector (N-1 downto 0)
    );
    end component regn;

    signal resetn: std_logic;
    signal clk, E, sclr: std_logic;
    signal D, Q: std_logic_vector (N-1 downto 0) := "0000";

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: regn port map (
		clk => clk,
		resetn => resetn,
		E => E,
		sclr => sclr,
		D => D,
		Q => Q);

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

    E <= '1';
    sclr <= '0';

    D <= "0001"; wait for 1 ns;
    D <= "0010"; wait for 1 ns;
    D <= "0011"; wait for 1 ns;
    D <= "0100"; wait for 1 ns;
    D <= "0101"; wait for 1 ns;
    D <= "0110"; wait for 1 ns;
    D <= "0111"; wait for 1 ns;
    D <= "1000"; wait for 1 ns;

    finish;

    end process;

end rtl;
