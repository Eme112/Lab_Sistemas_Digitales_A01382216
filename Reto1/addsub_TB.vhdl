LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY addsub_TB IS
END addsub_TB;
 
ARCHITECTURE behavior OF addsub_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addsub
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         T : IN  std_logic;
         C_FLAG : OUT  std_logic;
         OV_FLAG : OUT  std_logic;
         R : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal T : std_logic := '0';

 	--Outputs
   signal C_FLAG : std_logic;
   signal OV_FLAG : std_logic;
   signal R : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub PORT MAP (
          A => A,
          B => B,
          T => T,
          C_FLAG => C_FLAG,
          OV_FLAG => OV_FLAG,
          R => R
        );

   -- Stimulus process
   stim_proc: process
   begin
		-- 2 casos de suma de numeros positivos.
		T <= '0';
      A <= "00010110";
		B <= "00101010";
		
      wait for 20 ns;	

      A <= "00101010";
		B <= "01010101";
		
		wait for 20 ns;
		
		-- 2 casos de suma de numero poistivo y numero negativo.
      A <= "00100111";
		B <= "11001111";
		
		wait for 20 ns;	

      A <= "00000100";
		B <= "10011111";
		
		wait for 20 ns;	
		
		-- 2 casos de suma de numero negativo y numero positivo.
      A <= "10000001";
		B <= "00000001";
		
		wait for 20 ns;	

      A <= "10011001";
		B <= "00111111";
		
		wait for 20 ns;	
		
		-- 2 casos de overflow suma.
      A <= "00110011";
		B <= "01111111";
		
		wait for 20 ns;	

      A <= "10000000";
		B <= "11111111";
		
		wait for 20 ns;	
		
		-- 2 casos de overflow resta.
		T <= '1';
      A <= "01111111";
		B <= "11111111";
		
		wait for 20 ns;	

      A <= "10001001";
		B <= "01110111";
		
		wait for 20 ns;	
		
		-- 2 casos con carry out suma.
		T <= '0';
      A <= "11011011";
		B <= "00111101";
		
		wait for 20 ns;	

      A <= "10011001";
		B <= "11111101";
		
		wait for 20 ns;
		
		-- 2 casos con carry out resta.
		T <= '1';
      A <= "01011111";
		B <= "01011111";
		
		wait for 20 ns;	

      A <= "10110011";
		B <= "00000010";
		
		wait for 20 ns;
   end process;

END;