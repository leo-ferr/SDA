LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.n_bits;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_8_1 IS
	PORT(
		in_0, in_1, in_2, in_3: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		in_4, in_5, in_6, in_7: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		sel 	: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	);
END mux_8_1;

ARCHITECTURE behavior OF mux_8_1 IS

BEGIN

	WITH sel SELECT saida <=
		in_0 WHEN "000",
		in_1 WHEN "001",
		in_2 WHEN "010",
		in_3 WHEN "011",
		in_4 WHEN "100",
		in_5 WHEN "101",
		in_6 WHEN "110",
		in_7 WHEN "111";
	
END behavior;