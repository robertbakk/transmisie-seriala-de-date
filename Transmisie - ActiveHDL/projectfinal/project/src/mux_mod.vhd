library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity muxmod is
	port(sel:in std_logic_vector(0 to 1);
		iesire:out std_logic);
end muxmod;

architecture arh of muxmod is
begin
	process(sel)
	begin
		if 	(sel="10")	then	 
			iesire<='1';
		else iesire<='0';	
		end if;	
	end process; 
end arh;
