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
			c 				: in  STD_LOGIC_VECTOR(28 downto 0);
			-- flags
			N,Z,Ov,Cout : out STD_LOGIC;
		
			-- debug
			DEBUG : in matriz_8bits(7 downto 0);
		
			-- saida dados
			data_out		: out STD_LOGIC_VECTOR(7 downto 0)
	
		);
	end component;
	
	signal clk, rst, d_in, ctl, d_out, z_out, n_out, ov_out, cout_out: std_logic;

begin
	
	DUT: datapath port map(
		clock <= clk,
		reset <= rst,
		data_in <= d_in,
		C <= ctl,
		Z <= z_out,
		N <= n_out,
		Ov <= ov_out,
		Cout <= cout_out,
		data_out <= d_out
	);
	
	process
	begin
		
		
		
		
		
	end process;	
end arch_teste;














