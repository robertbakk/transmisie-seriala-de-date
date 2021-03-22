library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity pachet is
	port(reset:in std_logic:='1';
		clk:in std_logic;
		codstart:in std_logic_vector(0 to 6);
		date:in std_logic_vector(0 to 15);
		sumacontrol:in std_logic_vector(0 to 3);	
		iesire:out std_logic);
end pachet;

architecture arh of pachet is

begin	
	process (clk,reset)
	variable i:integer:=0;
	begin
		  
		if (reset='1') then
			i:=0;
		elsif(clk'event and clk='1') then	
			if (i=0) then 
					iesire<=codstart(0);
			end if;	
			if (i=1) then 
					iesire<=codstart(1);
			end if;	
			if (i=2) then 
					iesire<=codstart(2);
			end if;	
			if (i=3) then 
					iesire<=codstart(3);
			end if;	
			if (i=4) then 
					iesire<=codstart(4);
			end if;
			if (i=5) then 
					iesire<=codstart(5);
			end if;	
			if (i=6) then 
					iesire<=codstart(6);
			end if;	  
			if (i=7) then 
					iesire<=date(0);
			end if;	
			if (i=8) then 
					iesire<=date(1);
			end if;	
			if (i=9) then 
					iesire<=date(2);
			end if;	
			if (i=10) then 
					iesire<=date(3);
			end if;	
			if (i=11) then 
					iesire<=date(4);
			end if;	
			if (i=12) then 
					iesire<=date(5);
			end if;	
			if (i=13) then 
					iesire<=date(6);
			end if;	
			if (i=14) then 
					iesire<=date(7);
			end if;	 
			if (i=15) then 
					iesire<=date(8);
			end if;	
			if (i=16) then 
					iesire<=date(9);
			end if;	
			if (i=17) then 
					iesire<=date(10);
			end if;	
			if (i=18) then 
					iesire<=date(11);
			end if;	
			if (i=19) then 
					iesire<=date(12);
			end if;	
			if (i=20) then 
					iesire<=date(13);
			end if;	
			if (i=21) then 
					iesire<=date(14);
			end if;					 
			if (i=22) then 
					iesire<=date(15);
			end if;	
			if (i=23) then 
				iesire<=sumacontrol(0);	
			end if;	
			if (i=24) then 
				iesire<=sumacontrol(1);	
			end if;	
			if (i=25) then 
				iesire<=sumacontrol(2);	
			end if;	
			if (i=26) then 
				iesire<=sumacontrol(3);	
			end if;	
			 i:=i+1;
		end if;
	end process;
end arh;	