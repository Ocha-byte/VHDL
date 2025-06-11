library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity alu is
port (
    sel: in STD_LOGIC_VECTOR (3 downto 0);
    in1, in2, in3: in STD_LOGIC_VECTOR (7 downto 0);
    out1: out STD_LOGIC_VECTOR (15 downto 0));
end entity alu;

architecture rtl of alu is

signal bit_internal, bit_sum, bit_cout: STD_LOGIC_VECTOR;

begin

    output: case sel generate
		when "0000" => -- nothing
			out1 <= "0000000000000000";
		when "0001" => -- addition

		    -- Bit 0
			bit_internal(0) <= in1(0) xor in2(0);
			bit_sum(0) <= bit_internal(0) xor in3(0);
			bit_cout(0) <= (in1(0) and in2(0)) or (bit_internal(0) and in3(0));
			-- Bit 1
			bit_internal(1) <= in1(1) xor in2(1);
			bit_sum(1) <= bit_internal(1) xor in3(1);
			bit_cout(1) <= (in1(1) and in2(1)) or (bit_internal(1) and in3(1));
			-- Bit 2
			bit_internal(2) <= in1(2) xor in2(2);
			bit_sum(2) <= bit_internal(2) xor in3(2);
			bit_cout(2) <= (in1(2) and in2(2)) or (bit_internal(2) and in3(2));
			-- Bit 3
			bit_internal(3) <= in1(3) xor in2(3);
			bit_sum(3) <= bit_internal(3) xor in3(3);
			bit_cout(3) <= (in1(3) and in2(3)) or (bit_internal(3) and in3(3));
			-- Bit 4
			bit_internal(4) <= in1(4) xor in2(4);
			bit_sum(4) <= bit_internal(4) xor in3(4);
			bit_cout(4) <= (in1(4) and in2(4)) or (bit_internal(4) and in3(4));
			-- Bit 5
			bit_internal(5) <= in1(5) xor in2(5);
			bit_sum(5) <= bit_internal(5) xor in3(5);
			bit_cout(5) <= (in1(5) and in2(5)) or (bit_internal(5) and in3(5));
			-- Bit 6
			bit_internal(6) <= in1(6) xor in2(6);
			bit_sum(6) <= bit_internal(6) xor in3(6);
			bit_cout(6) <= (in1(6) and in2(6)) or (bit_internal(6) and in3(6));
			-- Bit 7
			bit_internal(7) <= in1(7) xor in2(7);
			bit_sum(7) <= bit_internal(7) xor in3(7);
			bit_cout(7) <= (in1(7) and in2(7)) or (bit_internal(7) and in3(7));

			-- Output
			out1 <=bit_cout;

		    -- Half adder 1
			ha_sum1 <= in1 xor in2l;
			ha_cout1 <= in1 and in2;

			-- Half adder 2
			ha_sum2 <= in3 xor ha_sum1;
			ha_cout2 <= in3 and ha_sum1;

			-- Full adder
			fa_sum <= ha_sum2;
			fa_cout <=ha_cout1 or ha_cout2;

			-- Output
			out1 <=fa_sum;

		when "0010" => -- Subtraction

		    -- Half subtractor 1
			hs_diff1 <= in1 xnor in2;
			hs_borr1 <= (not in1) and in2;

			-- Half subtractor 2
			hs_diff2 <= hs_diff1 xnor in3;
			hs_borr2 <= (not hs_diff1) and in3;

			-- Full subtractor
			fs_diff <= hs_diff2;
			fs_borr <= hs_borr1 or hs_borr2;

			-- Output
			out1 <= fs_diff;

		when "0011" => -- Multiplication
		when "0100" => -- Division
		when "0101" => -- Logical AND
		when "0110" => -- Logical OR
		when "0111" => -- Logical NOT
		when "1000" => -- Logical NAND
		when "1001" => -- Logical NOR
		when "1010" => -- Logical XOR
		when "1011" => -- Logical XNOR
		when "1100" => -- bitwise shift to the left
		when "1101" => -- bitwise shift to the right
		when "1110" => -- bitwise rotate to the left
		when "1111" => -- bitwise rotate to the right

	end generate;
end rtl;
