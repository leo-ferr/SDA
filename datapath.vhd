LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY datapath IS
	PORT(
		-- entradas
		clock, reset: IN  STD_LOGIC;
		data_in		: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		c 				: IN  STD_LOGIC_VECTOR(28 DOWNTO 0)
		-- flags
		--N,Z,Ov,Cout : OUT STD_LOGIC;
		
		-- debug
		--DEBUG : OUT matriz_8bits
		--DEBUG : OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		
		-- saida dados
		--data_out		: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	
	);
END datapath;

ARCHITECTURE behavior OF datapath IS
	-- sinais para a saida dos muxs 2:1 que selecionam o dado de entrada para os registradores
	SIGNAL saidas_mux_2_1: matriz_8bits;
	
	-- sinal para a saida dos registradores, que são conectados aos mux 8:1
	SIGNAL saidas_reg: matriz_8bits;
	
	-- sinal para a saida dos muxs 8:1, que são conectados as ulas
	--SIGNAL saidas_mux_8_1: matriz_8bits;
	
	-- sinal para a saida das ulas
	SIGNAL saida_ula_1, saida_ula_2: STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
	
BEGIN
	-- TESTE

	
	
	--data_out <= saida_mux_8_1(2);
	
	-- cria os mux 2 pra 1
	for_mux_2_1: FOR i IN 0 TO n_bits - 1 GENERATE
		--muxs: mux_2_1 PORT MAP(in_0 => data_in, in_1 => saida_ula_2, sel => c(i), saida => saidas_mux_2_1(i));
		l_mux_2_1: mux_2_1 PORT MAP(
							in_0 => data_in, 
							in_1 => "11111111", 
							sel => c(i), 
							saida => saidas_mux_2_1(i)
						);
	END GENERATE;
	
	
	-- cria os registradores de 8 bits
	for_regs: FOR i IN 0 TO n_bits - 1 GENERATE
		regs: registrador PORT MAP(
										data => saidas_mux_2_1(i),
										clock => clock,
										clear => reset,
										enable => c(8 + i),
										q => saidas_reg(i)
				);
	END GENERATE for_regs;
	
	--DEBUG <= saidas_reg;
	
	--DEBUG(0) <= saidas_reg(0);
	--DEBUG(1) <= saidas_reg(1);
	--DEBUG(2) <= saidas_reg(2);
	--DEBUG(3) <= saidas_reg(3);
	--DEBUG(4) <= saidas_reg(4);
	--DEBUG(5) <= saidas_reg(5);
	--DEBUG(6) <= saidas_reg(6);
	--DEBUG(7) <= saidas_reg(7);
	--DEBUG <= saidas_reg;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- cria os mux de8 para 1, conectados as portas das ulas
	--for_mux_8_1: FOR i IN 0 TO 2 GENERATE
	--	muxs_8_1: mux_8_1 PORT MAP(
	--					in_0 <= saidas_reg(0),
	--					in_1 <= saidas_reg(1),
	--					in_2 <= saidas_reg(2),
	--					in_3 <= saidas_reg(3),
	--					in_4 <= saidas_reg(4),
	--					in_5 <= saidas_reg(5),
	--					in_6 <= saidas_reg(6),
	--					in_7 <= saidas_reg(7),
	--					sel <= c(16 + (i * 3) DOWNTO 18 + (i * 3)),
	--					saida <= saida_mux_8_1(i)
	--				);
	--END GENERATE for_mux_8_1;
	
	
	
END behavior;