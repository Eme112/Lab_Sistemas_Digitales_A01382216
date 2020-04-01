LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY JK_FlipFlop_TB IS
END JK_FlipFlop_TB;
 
ARCHITECTURE behavior OF JK_FlipFlop_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JK_FlipFlop
    PORT(
         SN : IN  bit;
         RN : IN  bit;
			E : IN bit;
         J : IN  bit;
         K : IN  bit;
         CLK : IN  bit;
         Q : OUT  bit;
         QN : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal SN : bit := '0';
   signal RN : bit := '0';
	signal E : bit := '0';
   signal J : bit := '0';
   signal K : bit := '0';
   signal CLK : bit := '0';

 	--Outputs
   signal Q : bit;
   signal QN : bit;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JK_FlipFlop PORT MAP (
          SN => SN,
          RN => RN,
			 E => E,
          J => J,
          K => K,
          CLK => CLK,
          Q => Q,
          QN => QN
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
		RN <= '0';
		SN <= '1';
		E <= '1';
      -- hold reset state for 100 ns.
		
		wait for 99 ns;
		
		RN <= '1';
		
      wait for 1 ns;		

      wait for CLK_period;
		
		J <= '1';
		
		wait for CLK_period;
		
		J <= '0';
		K <= '1';
		
		wait for CLK_period;
		
		J <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;