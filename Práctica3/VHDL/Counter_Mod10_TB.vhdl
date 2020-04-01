LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Counter_Mod10_TB IS
END Counter_Mod10_TB;
 
ARCHITECTURE behavior OF Counter_Mod10_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter_Mod10
    PORT(
         U_D : IN  bit;
         E : IN  bit;
         CLK : IN  bit;
         Q : OUT  bit_vector(3 downto 0);
         QN : OUT  bit_vector(3 downto 0);
         TC : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal U_D : bit:= '0';
   signal E : bit := '0';
   signal CLK : bit := '0';

 	--Outputs
   signal Q : bit_vector(3 downto 0);
   signal QN : bit_vector(3 downto 0);
   signal TC : bit;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter_Mod10 PORT MAP (
          U_D => U_D,
          E => E,
          CLK => CLK,
          Q => Q,
          QN => QN,
          TC => TC
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		U_D <= '0';
		E <= '0';
		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		E <= '1';

      wait for CLK_period*25;
		
		U_D <='1';
		
		wait for CLK_period*30;
		
		E <= '0';
		
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;