LIBRARY IEEE;
LIBRARY WORK;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.UTILS.ALL;

ENTITY datapath IS
	PORT(
		-- entradas
		clock, reset: IN  STD_LOGIC;
		data_in		: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		c 				: IN  STD_LOGIC_VECTOR(28 DOWNTO 0);
		-- flags
		N,Z,Ov,Cout : OUT STD_LOGIC;
		
		-- debug
		DEBUG : IN matriz_8bits(n_bits - 1 DOWNTO 0);
		
		-- saida dados
		data_out		: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	
	);
END datapath;

ARCHITECTURE behavior OF datapath IS
	-- sinais para a saida dos muxs 2:1 que selecionam o dado de entrada para os registradores
	--SIGNAL saida_mux_2_1_0, saida_mux_2_1_1, saida_mux_2_1_2, saida_mux_2_1_3: STD_LOGIC;
	--SIGNAL saida_mux_2_1_4, saida_mux_2_1_5, saida_mux_2_1_6, saida_mux_2_1_7: STD_LOGIC;
	
	SIGNAL saida_mux_2_1: matriz_8bits(n_bits - 1 DOWNTO 0);
	
	-- sinal para a saida dos registradores, que são conectados aos mux 8:1
	--SIGNAL saida_reg0, saida_reg1, saida_reg2, saida_reg3: STD_LOGIC;
	--SIGNAL saida_reg4, saida_reg5, saida_reg6, saida_reg7: STD_LOGIC;
	
	SIGNAL saida_reg: matriz_8bits(n_bits - 1 DOWNTO 0);
	
	-- sinal para a saida dos muxs 8:1, que são conectados as ulas
	--SIGNAL saida_mux_8_1: matriz_8bits(2 DOWNTO 0);
	
	-- sinal para a saida das ulas
	--SIGNAL saida_ula_1, saida_ula_2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN

	--data_out <= saida_mux_8_1(2);
	
	-- cria os mux 2 pra 1
	
	for_mux_2_1: FOR i IN 0 TO n_bits - 1 GENERATE
		mux_2_1 PORT MAP(in_0 <= data_in, in_1 <= saida_ula_2, sel <= c(i), saida <= saida_mux_2_1(i));
		--l_mux_2_1: mux_2_1 PORT MAP(in_0 <= data_in, in_1 <= "11111111", sel <= c(i), saida <= saida_mux_2_1(i));
	END GENERATE for_mux_2_1;
	
	
	-- cria os registradores de 8 bits
	
	for_regs: FOR i IN 0 TO n_bits - 1 GENERATE
		l_reg: registrador PORT MAP(data <= saida_mux_2_1(i), clock <= clock, clear <= reset, enable <= c(8 + i), q <= saida_reg(i));
	END GENERATE for_regs;
	
	DEBUG <= saida_reg;
	
	-- cria os mux de8 para 1, conectados as portas das ulas
	
	--for_mux_8_1: FOR i IN 0 TO 2 GENERATE
	--	mux_8_1 PORT MAP(
	--			in_0 <= saida_reg(0),
	--			in_1 <= saida_reg(1),
	--			in_2 <= saida_reg(2),
	--			in_3 <= saida_reg(3),
	--			in_4 <= saida_reg(4),
	--			in_5 <= saida_reg(5),
	--			in_6 <= saida_reg(6),
	--			in_7 <= saida_reg(7),
		--		sel <= c(16 + (i * 3) DOWNTO 18 + (i * 3)),
	--			saida <= saida_mux_8_1(i)
	--		);
	--END GENERATE for_mux_8_1;
	
	
	
END behavior;