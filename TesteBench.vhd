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
    clock <= '1', '0' after 1 ns;
    wait for 2ns;
  end process;
	
	main: process
	begin
		
		data_in <= (others => '0');
		wait for 0.5ns;
    C <= (others => '0');
    wait for 3ns;
    
		data_in <= "01010000";
		wait for 0.5ns;
		C <= (8 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "10101010";
		wait for 0.5ns;
		C <= (9 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "11111110";
		wait for 0.5ns;
		C <= (10 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "11110000";
		wait for 0.5ns;
		C <= (11 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "00001111";
		wait for 0.5ns;
		C <= (12 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "00111100";
		wait for 0.5ns;
		C <= (13 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "11000011";
		wait for 0.5ns;
		C <= (14 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "01101101";
		wait for 0.5ns;
		C <= (15 => '1', others => '0');
		wait for 3ns;
		
		data_in <= "00011100";
		wait for 0.5ns;
		C <= (-- primeiro mux_8_1
		      16 => '0', 17 => '0', 18 => '0',
		      
		      -- segundo mux_8_1
		      19 => '1', 20 => '0', 21 => '0',
		      
		      -- terceiro mux_8_1
		      22 => '0', 23 => '1', 24 => '0',
		      
		      others => '0');
		wait for 3ns;
		
		data_in <= "10000000";
		wait for 0.5ns;
		C <= (-- primeiro mux_8_1
		      16 => '1', 17 => '1', 18 => '0',
		      
		      -- segundo mux_8_1
		      19 => '0', 20 => '0', 21 => '1',
		      
		      -- terceiro mux_8_1
		      22 => '1', 23 => '0', 24 => '1',
		      
		      others => '0');
		wait for 3ns;
		
		data_in <= "00011000";
		wait for 0.5ns;
		C <= (-- primeiro mux_8_1
		      16 => '0', 17 => '1', 18 => '1',
		      
		      -- segundo mux_8_1
		      19 => '1', 20 => '1', 21 => '1',
		      
		      -- terceiro mux_8_1
		      22 => '0', 23 => '0',  24 => '0',
		      
		      others => '0');
		wait for 3ns;

	end process;	
end arch_teste;














