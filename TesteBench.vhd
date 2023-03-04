library ieee;
library work;
use work.utils.all;
use ieee.std_logic_1164.all;

entity TesteBench is

end TesteBench;

architecture arch_teste of TesteBench is

	component datapath is
		port(
			-- entradas
			clock, reset: in  STD_LOGIC;
			data_in		: in  STD_LOGIC_VECTOR(7 downto 0);
			c 				: in  STD_LOGIC_VECTOR(28 downto 0)
			-- flags
			--N,Z,Ov,Cout : out STD_LOGIC;
		
			-- debug
			--DEBUG : in matriz_8bits
		
			-- saida dados
			--data_out		: out STD_LOGIC_VECTOR(7 downto 0)
	
		);
	end component;
	
	signal clock: std_logic;
	signal reset: std_logic;
	signal data_in: std_logic_vector(7 downto 0);
	signal C: std_logic_vector(28 downto 0);
	--signal DEBUG_saida: matriz_8bits;
	--signal Z: std_logic;
	--signal N: std_logic;
	--signal Ov: std_logic;
	--signal Cout: std_logic;
	--signal data_out: std_logic;

begin
	--DEBUG <= DEBUG_saida;
	DUT: datapath port map(
		clock => clock,
		reset => reset,
		data_in => data_in,
		C => C
		--DEBUG => DEBUG
		--Z => open,
		--N => open,
		--Ov => open,
		--Cout => open,
		--data_out => open
	);
	
	reset <= '1', '0' after 100 ps;
	
	clock_signal: process
  begin
    clock <= '1', '0' after 1ns;
    wait for 2ns;
  end process;
	
	main: process
	begin
		
		data_in <= (others => '0');
    C <= (others => '0');
    wait for 3ns;
    
		data_in <= "01010000";
		C <= (8 => '1', 14 => '1', others => '0');
		wait;
		
	end process;	
end arch_teste;














