library std;
use std.textio.all;

ENTITY LCD_Controler_TB IS
END LCD_Controler_TB;
 
ARCHITECTURE behavior OF LCD_Controler_TB IS
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD_Controler
    PORT(
         CLK : IN  bit;
         RESET : IN  bit;
         RS : IN  bit;
         RW : IN  bit;
         DATA : IN  bit_vector(7 downto 0);
         RSout : OUT  bit;
         RWout : OUT  bit;
         EN : OUT  bit;
         DATAout : OUT  bit_vector(7 downto 0)
        );
    END COMPONENT;
  

   -- Inputs
   signal CLK : bit := '0';
   signal RESET : bit := '1';
   signal RS : bit := '0';
   signal RW : bit := '0';
   signal DATA : bit_vector(7 downto 0) := (others => '0');

 	-- Outputs
   signal RSout : bit;
   signal RWout : bit;
   signal EN : bit;
   signal DATAout : bit_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
BEGIN
 
  uut: LCD_Controler PORT MAP (CLK, RESET, RS, RW, DATA, RSout, RWout, EN, DATAout);

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   stim_proc: process
		file fin : TEXT open READ_MODE is "input.txt";
		variable curr_line : line;
		variable vRS, vRW, vRESET : bit;
		variable vDATA : bit_vector(7 downto 0);
  begin
    
    wait for 40 ns;
    wait for 0 ns;
    
		while not endfile(fin) loop
			readline(fin, curr_line);
			read(curr_line, vRS);
			read(curr_line, vRW);
			read(curr_line, vDATA);
			read(curr_line, vRESET);
			
			RS <= vRS;
			RW <= vRW;
			DATA <= vDATA;
      RESET <= vRESET;

      wait for 10 ns;
			
		end loop;
		
   end process;

END;