library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity pashreg4_left_tb is
end entity pashreg4_left_tb;

architecture rtl of pashreg4_left_tb is

    component pashreg4_left is
    port (
        clk, resetn: in std_logic;
        E, s_l, din: in std_logic;
        dout: out std_logic;
        D: in std_logic_vector (3 downto 0);
        Q: out std_logic_vector (3 downto 0)
    );
    end component pashreg4_left;

    signal clk, resetn, E, s_l, din, dout: std_logic;
    signal D, Q: std_logic_vector (3 downto 0);

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: pashreg4_left port map (
	    clk => clk,
		resetn => resetn,
		E => E,
		s_l => s_l,
		din => din,
		dout => dout,
		D => D,
		Q => Q
		);

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

    resetn <= '1';
    E <= '1';
    s_l <= '1'; -- 0 = serial load, 1 = parallel load.
    
    D <= "0000"; wait for 1 ns;
    D <= "0001"; wait for 1 ns;
    D <= "0010"; wait for 1 ns;
    D <= "0011"; wait for 1 ns;
    D <= "0100"; wait for 1 ns;

    finish;

    end process;

end rtl;
