LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ula2 IS
	PORT(
		c, d		: IN STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		op			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		N,Z	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	);
END ula2;

ARCHITECTURE behavior OF ula2 IS
	SIGNAL s: STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
	
	FUNCTION check_zero(input: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
		VARIABLE check : STD_LOGIC := '0';
	BEGIN
		FOR i IN 0 TO n_bits - 1 LOOP
			check := check XOR input(i);
		END LOOP;
		
		RETURN check;
	END FUNCTION check_zero;
	
BEGIN
	
	PROCESS(c, d, op)
	BEGIN
		IF (op = "00") THEN
			s <= d;
			
		ELSIF (op = "01") THEN
			s <= NOT c;
			
		ELSIF (op = "10") THEN
			s <= d(n_bits - 2 DOWNTO 0) & '0';
			
		ELSIF (op = "11") THEN
			s <= c AND (NOT d);
		
		END IF;
	END PROCESS;
	
	saida <= s;
	N <= s(n_bits - 1);
	Z <= check_zero(s);
	
	
END behavior;