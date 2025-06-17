Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish;

entity alu_tb is
end entity alu_tb;

architecture rtl of alu_tb is
    constant Width: INTEGER:= 8;
    component alu is
        port (
            sel: in STD_LOGIC_VECTOR (3 downto 0);
            rs1, rs2: in STD_LOGIC_VECTOR (Width-1 downto 0);
            rd: out STD_LOGIC_VECTOR (Width-1 downto 0)
        );
    end component alu;

signal sel: STD_LOGIC_VECTOR (3 downto 0);
signal rs1, rs2: STD_LOGIC_VECTOR (Width-1 downto 0);
signal rd: STD_LOGIC_VECTOR (Width-1 downto 0);

begin
    uut: alu
        port map (
            sel => sel,
            rs1 => rs1,
            rs2 => rs2,
            rd => rd
        );

        stimulus: process
        begin

        -- Do nothing
        sel <= "0000";
        rs1 <= "00000000";
        rs2 <= "00000000";
        wait for 1 ns;

        -- Addition
        sel <= "0001";
        rs1 <= "00000001";
        rs2 <= "00000011";
        wait for 1 ns;

        -- Subtraction
        sel <= "0010";
        rs1 <= "10000000";
        rs2 <= "00000001";
        wait for 1 ns;

        -- logical AND
        sel <= "0011";
        rs1 <= "10001000";
        rs2 <= "10001000";
        wait for 1 ns;

        -- logical OR
        sel <= "0100";
        rs1 <= "00001000";
        rs2 <= "00000000";
        wait for 1 ns;

        -- logical NAND
		sel <= "0101";
		rs1 <= "00001000";
        rs2 <= "01000000";
        wait for 1 ns;

		-- logical NOR
		sel <=	"0110";
		rs1 <= "00000000";
        rs2 <= "00000001";
        wait for 1 ns;

		-- logical XOR
		sel <= "0111";
		rs1 <= "00010000";
        rs2 <= "00000001";
        wait for 1 ns;

		-- logical XNOR
		sel <= "1000";
		rs1 <= "00000100";
        rs2 <= "00100000";
        wait for 1 ns;

        finish;
        end process;
end rtl;
