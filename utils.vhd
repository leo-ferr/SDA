LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE utils IS
	CONSTANT n_bits: INTEGER := 8;
	 
	TYPE matriz_8bits IS ARRAY(n_bits - 1 DOWNTO 0) OF STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
	TYPE matriz_8bits_2 IS ARRAY(2 DOWNTO 0) OF STD_LOGIC_VECTOR(n_bits -1 DOWNTO 0);
	
	COMPONENT mux_8_1 IS
		PORT(
			in_0, in_1, in_2, in_3: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
			in_4, in_5, in_6, in_7: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
			sel 	: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			saida	: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT mux_2_1
		PORT(
			in_0, in_1	: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
			sel 			: IN  STD_LOGIC;
			saida			: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT registrador
		PORT(
			data 	: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
			clock	: IN  STD_LOGIC;
			clear	: IN  STD_LOGIC;
			enable: IN  STD_LOGIC;
			q		: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)	
		);
	END COMPONENT;
	
	COMPONENT somador_completo
		PORT(
			a, b 		: IN  STD_LOGIC;
			carry_in	: IN  STD_LOGIC;
			carry_out: OUT STD_LOGIC;
			saida		: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT somador
		PORT(
			a, b		: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
			carry_in	: IN  STD_LOGIC;
			Ov			: IN  STD_LOGIC;
			saida 	: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
		);
	END COMPONENT;

END PACKAGE utils;
