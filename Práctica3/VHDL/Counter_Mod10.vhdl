library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_Mod10 is
    Port ( U_D : in  bit;
           E : in  bit;
           CLK : in  bit;
           Q : out  bit_vector(3 downto 0);
           QN : out  bit_vector (3 downto 0);
           TC : out  bit);
end Counter_Mod10;



architecture Behavioral of Counter_Mod10 is
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
	
	signal SQ : bit_vector(3 downto 0);
	signal SQN : bit_vector(3 downto 0);
	
	signal ResetD : bit;
	signal ResetU : bit;
	
	signal Reset : bit;
	
	signal SFF1 : bit;
	signal SFF2 : bit;
	signal SFF3 : bit;
	
begin
	
	FF0 : JK_FlipFlop port map (ResetD, ResetU, E,  '1',  '1', CLK, SQ(0), SQN(0));
	FF1 : JK_FlipFlop port map (   '1',  Reset, E, SFF1, SFF1, CLK, SQ(1), SQN(1));
	FF2 : JK_FlipFlop port map (   '1',  Reset, E, SFF2, SFF2, CLK, SQ(2), SQN(2));
	FF3 : JK_FlipFlop port map (ResetD, ResetU, E, SFF3, SFF3, CLK, SQ(3), SQN(3));
	
	ResetD <= NOT(SQ(0) AND SQ(1) AND SQ(2) AND SQ(3) AND U_D);
	ResetU <= NOT(SQN(0) AND SQ(1) AND SQN(2) AND SQ(3) AND (NOT U_D));
	
	Reset <= ResetD AND ResetU;
	
	SFF1 <= ((NOT U_D) AND SQ(0)) OR (SQN(0) AND U_D);
	SFF2 <= ((NOT U_D) AND SQ(0) AND SQ(1)) OR (SQN(0) AND SQN(1) AND U_D);
	SFF3 <= ((NOT U_D) AND SQ(0) AND SQ(1) AND SQ(2)) OR (SQN(0) AND SQN(1) AND SQN(2) AND U_D);
	
	
	Q(0) <= SQ(0);
	Q(1) <= SQ(1);
	Q(2) <= SQ(2);
	Q(3) <= SQ(3);
	
	QN(0) <= SQN(0);
	QN(1) <= SQN(1);
	QN(2) <= SQN(2);
	QN(3) <= SQN(3);
	
	TC <= ((NOT U_D) AND SFF1 AND SQ(3)) OR (U_D AND SQN(0) AND SQN(1) AND SQN(2) AND SQN(3));

end Behavioral;