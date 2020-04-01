LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux_TB IS
END mux_TB;
 
ARCHITECTURE behavior OF mux_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         i1 : IN  std_logic;
         i0 : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';
   signal i1 : std_logic := '0';
   signal i0 : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          i1 => i1,
          i0 => i0,
          Q => Q
        );


   -- Stimulus process
   stim_proc: process
   begin
		A <= '0';
		B <= '0';
		C <= '0';
		D <= '0';
		
		wait for 100 ns;
		
		A <= '1';
		B <= '0';
		C <= '1';
		D <= '0';
		
		i0 <= '0';
		i1 <= '0';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '0';
		
		wait for 20 ns;
		
		i0 <= '0';
		i1 <= '1';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '1';
		
		wait for 20 ns;
		
		A <= '0';
		B <= '1';
		C <= '0';
		D <= '1';
		
		i0 <= '0';
		i1 <= '0';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '0';
		
		wait for 20 ns;
		
		i0 <= '0';
		i1 <= '1';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '1';
		
		wait for 20 ns;
   end process;

END;