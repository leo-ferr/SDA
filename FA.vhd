LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA IS
	PORT(
		a		: IN  STD_LOGIC;
		b		: IN  STD_LOGIC;
		cin	: IN  STD_LOGIC;
		cout	: OUT STD_LOGIC;
		s		: OUT STD_LOGIC
	);
END FA;

ARCHITECTURE arq_FA OF FA IS
BEGIN

	cout <= (cin AND a) OR (cin AND b) OR (a AND b);
	
	s <= a XOR b XOR cin;
	
END arq_FA;