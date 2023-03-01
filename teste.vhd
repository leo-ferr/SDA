library ieee;
--use work.utils.all;
use ieee.std_logic_1164.all;

entity teste is
	port(
		input: in std_logic_vector(15 downto 0);
		sel: in std_logic_vector(2 downto 0);
		saida: out std_logic
	);
end teste;

architecture behavior of teste is
	component FA IS
	PORT(
		a		: IN  STD_LOGIC;
		b		: IN  STD_LOGIC;
		cin	: IN  STD_LOGIC;
		cout	: OUT STD_LOGIC;
		s		: OUT STD_LOGIC
	);
	END COMPONENT;
	
	signal temp : std_logic_vector(7 downto 0);
	
begin
	
	--meu_for: for i in 0 to 15 generate:
	--	mux_2_1 port map()
	
	--end generate;
	
end behavior;