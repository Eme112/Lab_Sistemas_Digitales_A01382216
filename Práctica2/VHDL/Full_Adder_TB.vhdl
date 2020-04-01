LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Full_Adder_TB IS
END Full_Adder_TB;
 
ARCHITECTURE behavior OF Full_Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         i1 : IN  std_logic;
         i0 : IN  std_logic;
         Cin : IN  std_logic;
         Q : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i1 : std_logic := '0';
   signal i0 : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Cout : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          i1 => i1,
          i0 => i0,
          Cin => Cin,
          Q => Q,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      i0 <= '0';
		i1 <= '0';
		cin <= '0';
		
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '0';
		cin <= '0';
		
		wait for 50 ns;
		
		i0 <= '0';
		i1 <= '1';
		cin <= '0';
		
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '1';
		cin <= '0';
		
		wait for 50 ns;
		i0 <= '0';
		i1 <= '0';
		cin <= '1';
		
		wait for 50 ns;
		i0 <= '1';
		i1 <= '0';
		cin <= '1';
		
		wait for 50 ns;
		i0 <= '0';
		i1 <= '1';
		cin <= '1';
		
		wait for 50 ns;
		i0 <= '1';
		i1 <= '1';
		cin <= '1';
		
		wait for 50 ns;
   end process;

END;