LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY FullAdder_TB IS
END FullAdder_TB;
 
ARCHITECTURE behavior OF FullAdder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FullAdder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Ci : IN  std_logic;
         R : OUT  std_logic;
         Co : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Ci : std_logic := '0';

 	--Outputs
   signal R : std_logic;
   signal Co : std_logic;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdder PORT MAP (
          A => A,
          B => B,
          Ci => Ci,
          R => R,
          Co => Co
        );
 
   -- Stimulus process
   stim_proc: process
   begin
		A <= '0';
		B <= '0';
		Ci <= '0';
		
		wait for 10 ns;
		
		A <= '1';
		
		wait for 10 ns;
		
		A <= '0';
		B <= '1';
		
		wait for 10 ns;
		
		A <= '1';
		
		wait for 10 ns;
		
		A <= '0';
		B <= '0';
		Ci <= '1';
		
		wait for 10 ns;
		
		A <= '1';
		
		wait for 10 ns;
		
		A <= '0';
		B <= '1';
		
		wait for 10 ns;
		
		A <= '1';
		
		wait for 10 ns;
   end process;

END;