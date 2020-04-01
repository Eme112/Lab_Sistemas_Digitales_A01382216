library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Counter_Mod100 is
    Port ( CLK : in  bit;
			  U_D : in bit;
           Q1 : out  bit_vector (3 downto 0);
           Q0 : out  bit_vector (3 downto 0));
end Counter_Mod100;


architecture Behavioral of Counter_Mod100 is
	component Counter_Mod10 is
		Port ( U_D : in  bit;
				 E : in  bit;
				 CLK : in  bit;
				 Q : out  bit_vector(3 downto 0);
				 QN : out  bit_vector (3 downto 0);
				 TC : out  bit);
	end component;
	
	signal STC : bit;
	signal Irrelevant0 : bit_vector(3 downto 0);
	signal Irrelevant1 : bit_vector(3 downto 0);
	signal Irrelevant2 : bit;
	
begin

	Counter0 : Counter_Mod10 port map (U_D, '1', CLK, Q0, Irrelevant0, STC); 
	Counter1 : Counter_Mod10 port map (U_D, STC, CLK, Q1, Irrelevant1, Irrelevant2);

end Behavioral;