ENTITY Display_4_TB IS
END Display_4_TB;
 
ARCHITECTURE behavior OF Display_4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Display_4
    PORT(
         Disp0in : IN  bit_vector(3 downto 0);
         Disp1in : IN  bit_vector(3 downto 0);
         Disp2in : IN  bit_vector(3 downto 0);
         Disp3in : IN  bit_vector(3 downto 0);
         Decimal_point : IN  bit_vector(3 downto 0);
         CLK : IN  bit;
         a : OUT  bit;
         b : OUT  bit;
         c : OUT  bit;
         d : OUT  bit;
         e : OUT  bit;
         f : OUT  bit;
         g : OUT  bit;
         DPout : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal Disp0in : bit_vector(3 downto 0) := (others => '0');
   signal Disp1in : bit_vector(3 downto 0) := (others => '0');
   signal Disp2in : bit_vector(3 downto 0) := (others => '0');
   signal Disp3in : bit_vector(3 downto 0) := (others => '0');
   signal Decimal_point : bit_vector(3 downto 0) := (others => '0');
   signal CLK : bit := '0';

 	--Outputs
   signal a : bit;
   signal b : bit;
   signal c : bit;
   signal d : bit;
   signal e : bit;
   signal f : bit;
   signal g : bit;
   signal DPout : bit;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Display_4 PORT MAP (
          Disp0in => Disp0in,
          Disp1in => Disp1in,
          Disp2in => Disp2in,
          Disp3in => Disp3in,
          Decimal_point => Decimal_point,
          CLK => CLK,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g,
          DPout => DPout
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
		Disp0in <= "0000";
		Disp1in <= "0001";
		Disp2in <= "0010";
		Disp3in <= "0011";
		Decimal_point <= "0010";
		
		wait for 50 ns;
		
		Disp0in <= "0100";
		Disp1in <= "0101";
		Disp2in <= "0110";
		Disp3in <= "0111";
		Decimal_point <= "0100";
		
		wait for 50 ns;
		
		Disp0in <= "1000";
		Disp1in <= "1001";
		Disp2in <= "0000";
		Disp3in <= "0001";
		Decimal_point <= "0001";
		
		wait for 50 ns;
   end process;

END;
