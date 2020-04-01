library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Ci : in  STD_LOGIC;
           R : out  STD_LOGIC;
           Co : out  STD_LOGIC);
end FullAdder;


architecture Behavioral of FullAdder is

begin
	R <= Ci XOR (A XOR B);
	Co <= (Ci AND (A XOR B)) OR (A AND B);
	
end Behavioral;