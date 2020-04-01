LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Half_Adder_TB IS
END Half_Adder_TB;
 
ARCHITECTURE behavior OF Half_Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Half_Adder
    PORT(
         i1 : IN  std_logic;
         i0 : IN  std_logic;
         Q : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i1 : std_logic := '0';
   signal i0 : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Half_Adder PORT MAP (
          i1 => i1,
          i0 => i0,
          Q => Q,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		i0 <= '0';
		i1 <= '0';
		
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '0';
		
		wait for 50 ns;
		
		i0 <= '0';
		i1 <= '1';
		
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '1';
		
		wait for 50 ns;
   end process;

END;