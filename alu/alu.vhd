library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
    generic (Width: INTEGER:= 8);
port (
    sel: in STD_LOGIC_VECTOR (3 downto 0);
    rs1, rs2: in STD_LOGIC_VECTOR (Width-1 downto 0);
    rd: out STD_LOGIC_VECTOR (Width-1 downto 0)
    );
end entity alu;

architecture rtl of alu is
    signal sum, cout, diff, borrow: std_logic_vector (Width-1 downto 0);
begin

    output: process (sel, rs1, rs2)
    begin
        case sel is
            when "0000" => -- do nothing
                rd <= "00000000";
			when "0001" => -- addition
			    rd <= rs1 + rs2;
			when "0010" => -- subtraction
			    rd <= rs1 - rs2;
			when "0011" => -- logical AND
		        rd <= rs1 and rs2;
			when "0100" => -- logical OR
		        rd <= rs1 or rs2;
			when "0101" => -- logical NAND
		        rd <= rs1 nand rs2;
			when "0110" => -- logical NOR
		        rd <= rs1 nor rs2;
			when "0111" => -- logical XOR
		        rd <= rs1 xor rs2;
			when "1000" => -- logical XNOR
		        rd <= rs1 xnor rs2;
			when others =>
			    rd <= "00000000";
		end case;
	end process;
end rtl;
