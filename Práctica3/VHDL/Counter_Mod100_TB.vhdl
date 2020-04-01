LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Coutner_Mod100_TB IS
END Coutner_Mod100_TB;
 
ARCHITECTURE behavior OF Coutner_Mod100_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter_Mod100
    PORT(
         CLK : IN  bit;
         U_D : IN  bit;
         Q1 : OUT  bit_vector(3 downto 0);
         Q0 : OUT  bit_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal U_D : bit := '0';

 	--Outputs
   signal Q1 : bit_vector(3 downto 0);
   signal Q0 : bit_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter_Mod100 PORT MAP (
          CLK => CLK,
          U_D => U_D,
          Q1 => Q1,
          Q0 => Q0
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

      wait for 550 ns;	

      U_D <= '1';
		
		wait for 600 ns;
   end process;

END;