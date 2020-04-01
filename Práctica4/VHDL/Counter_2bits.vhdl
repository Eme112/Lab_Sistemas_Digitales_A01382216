entity Counter_2bits is
    Port ( CLK : in bit;
			  RN : in bit;
			  SN : in bit;
			  E : in bit;
           Q1 : out  bit;
           Q0 : out  bit;
           QN1 : out  bit;
           QN0 : out  bit);
end Counter_2bits;

architecture Behavioral of Counter_2bits is
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
	
begin

	FF0 : JK_FlipFlop port map (SN, RN, E, '1', '1', CLK, SQ0, QN0);
	FF1 : JK_FlipFlop port map (SN, RN, E, SQ0, SQ0, CLK, Q1, QN1);
	
	Q0 <= SQ0;
	
end Behavioral;