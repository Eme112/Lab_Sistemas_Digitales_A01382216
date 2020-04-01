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
         Disp0out : OUT  bit_vector(6 downto 0);
         Disp1out : OUT  bit_vector(6 downto 0);
         Disp2out : OUT  bit_vector(6 downto 0);
         Disp3out : OUT  bit_vector(6 downto 0);
         Decimal_point_out : OUT  bit_vector(3 downto 0)
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
   signal Disp0out : bit_vector(6 downto 0);
   signal Disp1out : bit_vector(6 downto 0);
   signal Disp2out : bit_vector(6 downto 0);
   signal Disp3out : bit_vector(6 downto 0);
   signal Decimal_point_out : bit_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Display_4 PORT MAP (
          Disp0in => Disp0in,
          Disp1in => Disp1in,
          Disp2in => Disp2in,
          Disp3in => Disp3in,
          Decimal_point => Decimal_point,
          CLK => CLK,
          Disp0out => Disp0out,
          Disp1out => Disp1out,
          Disp2out => Disp2out,
          Disp3out => Disp3out,
          Decimal_point_out => Decimal_point_out
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
		wait for CLK_period;
		
		Disp0in(0) <= '1';
		Disp0in(1) <= '0';
		Disp0in(2) <= '1';
		Disp0in(3) <= '0';
		
		Disp1in(0) <= '1';
		Disp1in(1) <= '1';
		Disp1in(2) <= '0';
		Disp1in(3) <= '0';
		
		Disp2in(0) <= '1';
		Disp2in(1) <= '0';
		Disp2in(2) <= '0';
		Disp2in(3) <= '0';
		
		Disp3in(0) <= '0';
		Disp3in(1) <= '1';
		Disp3in(2) <= '0';
		Disp3in(3) <= '0';
		
		Decimal_point(0) <= '0';
		Decimal_point(1) <= '0';
		Decimal_point(2) <= '0';
		Decimal_point(3) <= '1';		

      wait for CLK_period;
	end process;

END;