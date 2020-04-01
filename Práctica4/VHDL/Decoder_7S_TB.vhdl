ENTITY Decoder_7S_TB IS
END Decoder_7S_TB;
 
ARCHITECTURE behavior OF Decoder_7S_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder_7S
    PORT(
         I : IN  bit_vector(3 downto 0);
         PDi : IN  bit;
         EN : IN  bit;
         a : OUT  bit;
         b : OUT  bit;
         c : OUT  bit;
         d : OUT  bit;
         e : OUT  bit;
         f : OUT  bit;
         g : OUT  bit;
         PDo : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal I : bit_vector(3 downto 0) := (others => '0');
   signal PDi : bit := '0';
   signal EN : bit := '0';

 	--Outputs
   signal a : bit;
   signal b : bit;
   signal c : bit;
   signal d : bit;
   signal e : bit;
   signal f : bit;
   signal g : bit;
   signal PDo : bit;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_7S PORT MAP (
          I => I,
          PDi => PDi,
          EN => EN,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g,
          PDo => PDo
        );

   -- Stimulus process
   stim_proc: process
   begin		
		EN <= '0';
		
		wait for 100 ns;
		
		EN <= '1';
		I(0) <= '0';
		I(1) <= '0';
		I(2) <= '0';
		I(3) <= '0';
		PDi <= '0';
		
		wait for 20 ns;
		
		I(0) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '0';
		I(1) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '0';
		I(1) <= '0';
		I(2) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '0';
		I(1) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '0';
		I(1) <= '0';
		I(2) <= '0';
		I(3) <= '1';
		
		wait for 20 ns;
		
		I(0) <= '1';
		
		wait for 20 ns;
		
		PDi <= '1';
		
		wait for 20 ns;
   end process;

END;