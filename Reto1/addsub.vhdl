library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY addsub IS
   PORT (
      A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      B : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
      T : IN STD_LOGIC;
      C_FLAG : OUT STD_LOGIC;
      OV_FLAG : OUT STD_LOGIC;
      R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END ENTITY;

architecture Behavioral of addsub is
	component FullAdder is
		Port ( A : in  STD_LOGIC;
				 B : in  STD_LOGIC;
				 Ci : in  STD_LOGIC;
				 R : out  STD_LOGIC;
				 Co : out  STD_LOGIC);
	end component;
	
	signal S_Co : STD_LOGIC_VECTOR(7 downto 0);
	signal S_Bxor : STD_LOGIC_VECTOR(7 downto 0);
	
begin

	S_Bxor(0) <= T XOR B(0);
	S_Bxor(1) <= T XOR B(1);
	S_Bxor(2) <= T XOR B(2);
	S_Bxor(3) <= T XOR B(3);
	S_Bxor(4) <= T XOR B(4);
	S_Bxor(5) <= T XOR B(5);
	S_Bxor(6) <= T XOR B(6);
	S_Bxor(7) <= T XOR B(7);

	FA0 : FullAdder port map (A(0), S_Bxor(0),       T, R(0), S_Co(0));
	FA1 : FullAdder port map (A(1), S_Bxor(1), S_Co(0), R(1), S_Co(1));
	FA2 : FullAdder port map (A(2), S_Bxor(2), S_Co(1), R(2), S_Co(2));
	FA3 : FullAdder port map (A(3), S_Bxor(3), S_Co(2), R(3), S_Co(3));
	FA4 : FullAdder port map (A(4), S_Bxor(4), S_Co(3), R(4), S_Co(4));
	FA5 : FullAdder port map (A(5), S_Bxor(5), S_Co(4), R(5), S_Co(5));
	FA6 : FullAdder port map (A(6), S_Bxor(6), S_Co(5), R(6), S_Co(6));
	FA7 : FullAdder port map (A(7), S_Bxor(7), S_Co(6), R(7), S_Co(7));
	
	C_FLAG <= S_Co(7);
	OV_FLAG <= s_Co(6) XOR S_Co(7);

end Behavioral;