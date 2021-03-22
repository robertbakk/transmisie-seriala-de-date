library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux32_16 is
	port(gen1:in std_logic_vector(0 to 15);
		gen2:in std_logic_vector(0 to 15);
		sel:in std_logic;
		iesire:out std_logic_vector(0 to 15));
end mux32_16;

architecture mux of mux32_16 is
begin
	process(sel,gen1,gen2)
	begin
		if 	(sel='0')	then	 
			iesire<=gen1;
		else iesire<=gen2;	
		end if;	
	end process; 
end mux;
