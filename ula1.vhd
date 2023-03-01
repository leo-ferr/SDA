LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.n_bits;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ula1 IS
	PORT(
		a, b		: IN STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		op			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Ov, Cout	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	);
END ula1;

ARCHITECTURE behavior OF ula1 IS
	SIGNAL s: STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
BEGIN
	
	PROCESS(a, b, op)
	BEGIN
		IF (op = "00") THEN
			s <= a;
			Ov <= '0';
			Cout <= '0';
			
		ELSIF (op = "01") THEN
			s <= a OR b;
			Ov <= '0';
			Cout <= '0';
			
		ELSIF (op = "10") THEN
			--soma: PORT MAP somador(a => a, b => b, carry_in => '0', Ov => Ov, saida => saida);
			--s <= a + b;
			Ov <= '0';
			Cout <= '0';
			
		ELSIF (op = "11") THEN
			s <= a XOR (NOT b);
			Ov <= '0';
			Cout <= '0';
		
		END IF;
	END PROCESS;
	
	saida <= s;

END behavior;