library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity reg8_tb is
end entity reg8_tb;

architecture rtl of reg8_tb is

    component reg8 is
    port (
        clk, rstn, E: in std_logic;
        D: in std_logic_vector (7 downto 0);
        Q: out std_logic_vector (7 downto 0)
    );
    end component reg8;

    signal clk, rstn, E: std_logic;
    signal D, Q: std_logic_vector (7 downto 0) := "00000000";

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: reg8 port map (
		clk => clk,
		rstn => rstn,
		E => E,
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

    D <= "00000001"; wait for 1 ns;
    D <= "00000010"; wait for 1 ns;
    D <= "00000011"; wait for 1 ns;
    D <= "00000100"; wait for 1 ns;
    D <= "00000101"; wait for 1 ns;
    D <= "00000110"; wait for 1 ns;  
    D <= "00000111"; wait for 1 ns;
    D <= "00001000"; wait for 1 ns;
    
    finish;

    end process;

end rtl;
