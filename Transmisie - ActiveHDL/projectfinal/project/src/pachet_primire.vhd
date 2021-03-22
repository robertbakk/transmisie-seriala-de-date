library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity pachetprimire is
	port(reset:in std_logic:='1';
		clk:in std_logic;
		bitstart:out std_logic:='0';
		codstart:out std_logic_vector(0 to 5):="010101";
		date:out std_logic_vector(0 to 15);
		sumacontrol:out std_logic_vector(0 to 3);
		enable:out std_logic:='0';
		intrare:in std_logic;
		iesire:out std_logic:='0');
end pachetprimire;

architecture arh of pachetprimire is
begin	
	process (clk,reset)
		variable i:integer:=0;
	begin 
		if (reset='1') then
				i:=0;
				iesire<='0';
				enable<='0';
				bitstart<='0';
				codstart<="010101";
		elsif (clk'event and clk='1') then	 
				if (i=1) then 
					bitstart<=intrare;
				end if;
				if (i=2) then 
					codstart(0)<=intrare;
				end if;
				if (i=3) then 
					codstart(1)<=intrare;
				end if;
				if (i=4) then 
					codstart(2)<=intrare;
				end if;
				if (i=5) then 
					codstart(3)<=intrare;
				end if;
				if (i=6) then 
					codstart(4)<=intrare;
				end if;
				if (i=7) then 
					codstart(5)<=intrare;
				end if;
				if(i=8)	then
					date(0)<=intrare;
					iesire<='1';
				end if;
				if(i=9)	then
					date(1)<=intrare;
				end if;
				if(i=10) then
					date(2)<=intrare;
				end if;
				if(i=11) then
					date(3)<=intrare;
				end if;
				if(i=12) then
					date(4)<=intrare;
				end if;
				if(i=13) then
					date(5)<=intrare;
				end if;
				if(i=14) then
					date(6)<=intrare;
				end if;
				if(i=15) then
					date(7)<=intrare;
				end if;
				if(i=16) then
					date(8)<=intrare;
				end if;
				if(i=17) then
					date(9)<=intrare;
				end if;
				if(i=18) then
					date(10)<=intrare;
				end if;
				if(i=19) then
					date(11)<=intrare;
				end if;
				if(i=20) then
					date(12)<=intrare;
				end if;
				if(i=21) then
					date(13)<=intrare;
				end if;
				if(i=22) then
					date(14)<=intrare;
				end if;
				if(i=23) then
					date(15)<=intrare;
				end if;
				if(i=24) then
					sumacontrol(0)<=intrare;
				end if;
				if(i=25) then
					sumacontrol(1)<=intrare;
				end if;
				if(i=26) then
					sumacontrol(2)<=intrare;
				end if;
				if(i=27) then
					sumacontrol(3)<=intrare;
				end if;
				if(i=28) then
					enable<='1';
				end if;
				i:=i+1;
		end if;	
	end process;
end arh;	