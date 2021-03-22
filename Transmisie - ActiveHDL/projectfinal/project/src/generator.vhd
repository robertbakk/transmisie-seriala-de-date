library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity generator is
	port(codst:in std_logic_vector(0 to 5):="010101";
		gen1:in std_logic_vector(0 to 15):="1011100011010101";
		gen2:in std_logic_vector(0 to 15):="1100101011000101";
		reset:in std_logic:='1';
		mode:in std_logic_vector(0 to 1);
		clk:in std_logic;
		iesire:out std_logic);
end generator;		  

architecture a of generator is	
	component mux32_16 is
		port(gen1:in std_logic_vector(0 to 15);
			gen2:in std_logic_vector(0 to 15);
			sel:in std_logic;
			iesire:out std_logic_vector(0 to 15));
	end component mux32_16;
	
	component muxmod is
		port(sel:in std_logic_vector(0 to 1);
			iesire:out std_logic);
	end component muxmod;
	
	component sumacontrol is
		port(intrare:in std_logic_vector(0 to 15);
	
		iesire:out std_logic_vector(0 to 3));
	end component sumacontrol;
	
	component pachet is
		port(reset:in std_logic:='1';
			clk:in std_logic;
			codstart:in std_logic_vector(0 to 6);
			date:in std_logic_vector(0 to 15);
			sumacontrol:in std_logic_vector(0 to 3);	
			iesire:out std_logic);
	end component pachet;
	
	component codstart is
		port (start:in std_logic;			
			intrare:in std_logic_vector(0 to 5);
			iesire:out std_logic_vector(0 to 6));
	end component codstart;
	
	signal s1:std_logic;
	signal s2:std_logic_vector(0 to 6);
	signal s3:std_logic_vector(0 to 15);
	signal s4:std_logic_vector(0 to 3);
	signal s5:std_logic;
	signal s6:std_logic_vector(0 to 3);
	
begin 
	c1:muxmod port map(sel=>mode,iesire=>s1);
	c2:codstart port map(start=>s1,intrare=>codst,iesire=>s2);
	c3:mux32_16 port map(gen1=>gen1,gen2=>gen2,sel=>mode(1),iesire=>s3);
	c4:sumacontrol port map(intrare=>s3,iesire=>s4);
	s5<=mode(0)and mode(1);
	s6<=s4 xor s5&s5&s5&s5;
	
	c5:pachet port map(reset=>reset,clk=>clk,codstart=>s2,date=>s3,sumacontrol=>s6,iesire=>iesire);
end a;