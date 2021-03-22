library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity codstart is
	port(start:in std_logic;			
		intrare:in std_logic_vector(0 to 5);
		iesire:out std_logic_vector(0 to 6));
end codstart;

architecture arh of codstart is
begin
	iesire(0)<='0';
	iesire(1 to 6)<=intrare xor start&start&start&start&start&start;
end arh;
