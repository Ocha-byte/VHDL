library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity lcount_tb is
end entity lcount_tb;

architecture rtl of lcount_tb is

    component lcount is
    port (
        clk, resetn, load: in std_logic;
        data: in std_logic_vector (3 downto 0);
        Q: out std_logic_vector (3 downto 0)
    );
    end component lcount;

    signal clk, resetn, load: std_logic;
    signal data: std_logic_vector (3 downto 0);
    signal Q: std_logic_vector (3 downto 0);

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
	uut: lcount port map (
	    clk => clk,
		resetn => resetn,
		load => load,
		data => data,
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
    load <= '1';
    data <= "1111";
    wait for 1 ns;

    load <= '0';
    wait for 10 ns;

    finish;

    end process;

end rtl;
