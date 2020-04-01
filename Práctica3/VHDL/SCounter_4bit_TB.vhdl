LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SCounter_4bit_TB IS
END SCounter_4bit_TB;
 
ARCHITECTURE behavior OF SCounter_4bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SCounter_4bit
    PORT(
         CLK : IN  bit;
         RN : IN  bit;
         SN : IN  bit;
			E : IN bit;
         Q3 : OUT  bit;
         Q2 : OUT  bit;
         Q1 : OUT  bit;
         Q0 : OUT  bit;
         QN3 : OUT  bit;
         QN2 : OUT  bit;
         QN1 : OUT  bit;
         QN0 : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal RN : bit := '0';
   signal SN : bit := '0';

 	--Outputs
   signal Q3 : bit;
   signal Q2 : bit;
   signal Q1 : bit;
   signal Q0 : bit;
   signal QN3 : bit;
   signal QN2 : bit;
   signal QN1 : bit;
   signal QN0 : bit;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SCounter_4bit PORT MAP (
          CLK => CLK,
          RN => RN,
          SN => SN,
			 E => '1',
          Q3 => Q3,
          Q2 => Q2,
          Q1 => Q1,
          Q0 => Q0,
          QN3 => QN3,
          QN2 => QN2,
          QN1 => QN1,
          QN0 => QN0
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
		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		RN <= '1';
		SN <= '0';
		
		wait for 100 ns;
		
		SN <= '1';
		
		wait for 1000 ns;

      -- insert stimulus here 

      wait;
   end process;

END;