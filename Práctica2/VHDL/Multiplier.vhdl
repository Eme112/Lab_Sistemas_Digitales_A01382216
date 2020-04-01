library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (7 downto 0));
end multiplier;

architecture Behavioral of multiplier is

	component Full_Adder is
		port (
			i1 : in STD_LOGIC;
			i0 : in STD_LOGIC;
			Cin : in STD_LOGIC;
         Q : out STD_LOGIC;
			Cout: out STD_LOGIC
		);
	end component;

	component Half_Adder is
		port (
			i0 : in STD_LOGIC;
			i1 : in STD_LOGIC;
			Q : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component;

	signal S : STD_LOGIC_VECTOR (15 downto 0);
	
	signal S0 : STD_LOGIC_VECTOR (2 downto 0);
	signal S1 : STD_LOGIC_VECTOR (2 downto 0);
	
	signal SC0 : STD_LOGIC_VECTOR (3 downto 0);
	signal SC1 : STD_LOGIC_VECTOR (3 downto 0);
	signal SC2 : STD_LOGIC_VECTOR (3 downto 0);
	
	signal Irrelevant : STD_LOGIC;
	
begin

	S(0) <= A(0) AND B(0);
	S(1) <= A(1) AND B(0);
	S(2) <= A(2) AND B(0);
	S(3) <= A(3) NAND B(0);
	S(4) <= A(0) AND B(1);
	S(5) <= A(1) AND B(1);
	S(6) <= A(2) AND B(1);
	S(7) <= A(3) NAND B(1);
	S(8) <= A(0) AND B(2);
	S(9) <= A(1) AND B(2);
	S(10) <= A(2) AND B(2);
	S(11) <= A(3) NAND B(2);
	S(12) <= A(0) NAND B(3);
	S(13) <= A(1) NAND B(3);
	S(14) <= A(2) NAND B(3);
	S(15) <= A(3) AND B(3);
	
	Z(0) <= S(0);
	
	HA0 : Half_Adder port map (S(1), S(4), Z(1), SC0(0));
	HA1 : Half_Adder port map (S(8), S0(0), Z(2), SC1(0));
	HA2 : Half_Adder port map (S(12), S1(0), Z(3), SC2(0));
	HA3 : Half_Adder port map ('1', SC2(3), Z(7), Irrelevant);
	
	FA0 : Full_Adder port map (S(2), S(5), SC0(0), S0(0), SC0(1));
	FA1 : Full_Adder port map (S(3), S(6), SC0(1), S0(1), SC0(2));
	FA2 : Full_Adder port map ('1', S(7), SC0(2), S0(2), SC0(3));
	
	FA3 : Full_Adder port map (S(9), S0(1), SC1(0), S1(0), SC1(1));
	FA4 : Full_Adder port map (S(10), S0(2), SC1(1), S1(1), SC1(2));
	FA5 : Full_Adder port map (S(11), SC0(3), SC1(2), S1(2), SC1(3));
	
	FA6 : Full_Adder port map (S(13), S1(1), SC2(0), Z(4), SC2(1));
	FA7 : Full_Adder port map (S(14), S1(2), SC2(1), Z(5), SC2(2));
	FA8 : Full_Adder port map (S(15), SC1(3), SC2(2), Z(6), SC2(3));
	
end Behavioral;