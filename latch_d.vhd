LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY latch_d IS
	PORT(
		d 		: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		clear : IN  STD_LOGIC;
		clock	: IN  STD_LOGIC;
		q 		: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		eDebug: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END latch_d;

ARCHITECTURE arq_latch_d OF latch_d IS
	
	COMPONENT cod_7seg IS
		PORT(
			num: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			s  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;


	SIGNAL saida : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
	------------ UMA IMPLEMENTAÇAO -----------

	--SAIDA <= d WHEN rising_edge(clock);
	
	---------- OUTRA IMPLEMENTAÇAO ----------
	PROCESS(clock, clear, d)
	BEGIN
		IF clear = '1'  THEN
			saida <= (OTHERS => '0');
			
		ELSIF clock'EVENT AND clock = '1' THEN
			saida <= d;
			
		END IF;
	END PROCESS;
	
	----------------------------------------
	
	display_reg: cod_7seg PORT MAP(num => saida, s => q);
	
	display_in: cod_7seg PORT MAP(num => d, s => eDebug);

END arq_latch_d;