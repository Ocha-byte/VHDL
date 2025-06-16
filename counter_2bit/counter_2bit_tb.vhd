Library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity counter_2bit_tb is
end entity counter_2bit_tb;

architecture rtl of counter_2bit_tb is
    component counter_2bit is
        port (
            clk, resetn: in std_logic;
            Q: out std_logic_vector (1 downto 0)
        );
    end component counter_2bit;

    signal clk, resetn: std_logic;
    signal Q: std_logic_vector (1 downto 0);

    constant T: time:= 1 ns; -- Cycle time.
    constant duty: real:= 0.25; -- Duty cycle = 50%

    begin
    uut: counter_2bit port map (
            clk => clk,
            resetn => resetn,
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
       wait for 20 ns;

       finish;

    end process;

   end rtl;
