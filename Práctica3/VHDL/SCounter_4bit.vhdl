library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SCounter_4bit is
    Port ( CLK : in  bit;
			  RN : in bit;
			  SN : in bit;
			  E : in bit;
           Q3 : out  bit;
           Q2 : out  bit;
           Q1 : out  bit;
           Q0 : out  bit;
			  QN3 : out  bit;
           QN2 : out  bit;
           QN1 : out  bit;
           QN0 : out  bit);
end SCounter_4bit;

architecture Behavioral of SCounter_4bit is
	component JK_FlipFlop is
		Port ( SN : in bit;
				 RN : in bit;
				 E : in bit;
				 J : in bit;
				 K : in bit;
				 CLK : in bit;
				 Q : out bit;
				 QN : out bit );
	end component;
	
	signal SQ0 : bit;
	signal SQ1 : bit;
	signal SQ2 : bit;
	
	signal SFF2 : bit;
	signal SFF3 : bit;
	
begin

	SFF2 <= SQ0 AND SQ1;
	SFF3 <= SFF2 AND SQ2;

	FF0 : JK_FlipFlop port map (SN, RN, E, '1', '1', CLK, SQ0, QN0);
	FF1 : JK_FlipFlop port map (SN, RN, E, SQ0, SQ0, CLK, SQ1, QN1);
	FF2 : JK_FlipFlop port map (SN, RN, E, SFF2, SFF2, CLK, SQ2, QN2);
	FF3 : JK_FlipFlop port map (SN, RN, E, SFF3, SFF3, CLK, Q3, QN3);
	
	Q0 <= SQ0;
	Q1 <= SQ1;
	Q2 <= SQ2;
	
end Behavioral;