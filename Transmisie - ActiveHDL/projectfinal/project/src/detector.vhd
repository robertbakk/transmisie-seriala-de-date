library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity det is
	port(intrare,clk:in std_logic;
		reset:in std_logic:='1';
		codcorect:in std_logic_vector(0 to 5):="010101";
		SS,SM,SC:out std_logic:='0';
		enable:out std_logic);
end det;


architecture a of det is
	component pachetprimire is
		port(reset:in std_logic:='1';
			clk:in std_logic;
			bitstart:out std_logic:='0';
			codstart:out std_logic_vector(0 to 5):="010101";
			date:out std_logic_vector(0 to 15);
			sumacontrol:out std_logic_vector(0 to 3);
			enable:out std_logic:='0';
			intrare:in std_logic;
			iesire:out std_logic:='0');
	end component pachetprimire;
	
	component verifsuma is
		port(intrare1:in std_logic_vector(0 to 3);
			intrare2:in std_logic_vector(0 to 3);
			iesire:out std_logic:='1');
	end component verifsuma;
	
	component verifcodstart is
	port(intrare1:in std_logic_vector(0 to 5);
		intrare2:in std_logic_vector(0 to 5);
		iesire:out std_logic:='1');
	end component verifcodstart; 
	
	component sumacontrol is
		port(intrare:in std_logic_vector(0 to 15);
			iesire:out std_logic_vector(0 to 3));
	end component sumacontrol;
	
	signal s1:std_logic:='0';
	signal s4,s6,en:std_logic;
	signal s2:std_logic_vector(0 to 15);
	signal s3:std_logic_vector(0 to 3);
	signal s5:std_logic_vector(0 to 3);
	signal scod:std_logic_vector(0 to 5);
	signal s7:std_logic:='1';
begin
	c1:pachetprimire port map(reset=>reset,clk=>clk,bitstart=>s1,
	codstart=>scod,date=>s2,sumacontrol=>s3,enable=>en,intrare=>intrare,iesire=>s4);
	c2:sumacontrol port map(intrare=>s2,iesire=>s5);
	c3:verifsuma port map(intrare1=>s5,intrare2=>s3,iesire=>s6);
	c4:verifcodstart port map(intrare1=>scod,intrare2=>codcorect,iesire=>s7);
	SS<=not(reset) and not(s1) and s7;
	SM<=not(reset) and s4;
	SC<=not(reset) and s6 and en;
	enable<=en;			
end a;