LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY multiplier_TB IS
END multiplier_TB;
 
ARCHITECTURE behavior OF multiplier_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplier PORT MAP (
          A => A,
          B => B,
          Z => Z
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		A <= "0101";
		B <= "0011";
		
		wait for 20 ns;
		
		A <= "1111";
		B <= "1111";
		
		wait for 20 ns;
		
		A <= "0001";
		B <= "1000";
		
		wait for 20 ns;
   end process;

END;