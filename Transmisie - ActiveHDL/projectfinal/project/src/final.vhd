library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity final is
	port(start,clk:in std_logic;
		reset:in std_logic:='1';
		mode:in std_logic_vector(0 to 1);
		SS,SM,SC,final:out std_logic);
end final;

architecture a of final is
	
	component det is
		port(intrare,clk:in std_logic;
			reset:in std_logic:='1';
			codcorect:in std_logic_vector(0 to 5):="010101";
			SS,SM,SC:out std_logic:='0';
			enable:out std_logic);
	end component det;
	
	component generator is
	port(codst:in std_logic_vector(0 to 5):="010101";
		gen1:in std_logic_vector(0 to 15):="1011100011010101";
		gen2:in std_logic_vector(0 to 15):="1100101011000101";
		reset:in std_logic:='1';
		mode:in std_logic_vector(0 to 1);
		clk:in std_logic;
		iesire:out std_logic);
	end component generator;
	
	component divizor is 
		port(CLK_IN:in std_logic;
			CLK_OUT:out std_logic);
	end component divizor;
	
	signal s1,s2,sclk,fin:std_logic;
	signal modul:std_logic_vector(0 to 1);
begin
	s1<=clk and start;
	modul<=mode;
	c1:divizor port map(CLK_IN=>s1,CLK_OUT=>sclk);
	c2:generator port map(reset=>reset,mode=>modul,clk=>sclk,iesire=>s2);						--pentru divizor se modifica s1 cu sclk
	c3:det port map(intrare=>s2,clk=>sclk,reset=>reset,SS=>SS,SM=>SM,SC=>SC,enable=>fin);		--pentru divizor se modifica s1 cu sclk
	final<=fin;
end a;