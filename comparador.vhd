library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	port(
		a, b: in std_logic;
		saida: out std_logic
	);
end comparador;

architecture behavior of comparador is

	signal s: std_logic;
	
begin
	process(a, b)
	begin	
		if a = b then
			s <= '1';
		end if;
		
		s <= '0';
	
	end process;
	
	saida <= s;
	
end behavior;