LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY somador_4b IS
	PORT(
		a			: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		b			: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		negativo	: IN STD_LOGIC;
		s			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		dBug_negativo: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		over		: OUT STD_LOGIC
	);
END somador_4b;

ARCHITECTURE arq_somador_4b OF somador_4b IS
	
	COMPONENT FA IS
		PORT(
			a		: IN  STD_LOGIC;
			b		: IN  STD_LOGIC;
			cin	: IN  STD_LOGIC;
			cout	: OUT STD_LOGIC;
			s		: OUT STD_LOGIC
		);
	END COMPONENT;
	
	--SIGNAL c1, c2, c3 : STD_LOGIC;
	SIGNAL valor_b: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL carrys : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	
	valor_b <= NOT b WHEN negativo = '1' ELSE
					b;
					
	--dBug_negativo <= valor_b;
	
	carrys(0) <= negativo;
	
	--bit1: FA PORT MAP(a => a(0), b => valor_b(0), cin => negativo, cout => c1,s => s(0));
	--bit2: FA PORT MAP(a => a(1), b => valor_b(1), cin => c1, cout => c2,s => s(1));
	--bit3: FA PORT MAP(a => a(2), b => valor_b(2), cin => c2, cout => c3,s => s(2));
	--bit4: FA PORT MAP(a => a(3), b => valor_b(3), cin => c3, cout => over,s => s(3));
	
	for_generate: for i in 0 to 3 generate
		soma: FA PORT MAP(a => a(i), b => valor_b(i), cin => carrys(i), cout => carrys(i + 1), s => s(i));
	end generate;
	
	over <= carrys(4);
	
END arq_somador_4b;





