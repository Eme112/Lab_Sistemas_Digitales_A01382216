entity Display_4 is
    Port ( Disp0in : in  bit_VECTOR (3 downto 0);
           Disp1in : in  bit_VECTOR (3 downto 0);
           Disp2in : in  bit_VECTOR (3 downto 0);
           Disp3in : in  bit_VECTOR (3 downto 0);
           Decimal_point : in  bit_VECTOR (3 downto 0);
           CLK : in  bit;
		   a, b, c, d, e, f, g, DPout : out bit;
		   Enable : out bit_vector (3 downto 0));
end Display_4;

architecture Behavioral of Display_4 is

	component Counter_2bits is
		port (
			CLK : in bit;
			RN : in bit;
			SN : in bit;
			E : in bit;
         	Q1 : out  bit;
         	Q0 : out  bit;
         	QN1 : out  bit;
         	QN0 : out  bit
		);
	end component;
	
	component Decoder_7S is
		port (
		 I : in  bit_VECTOR (3 downto 0);
         PDi : in  bit;
         EN : in  bit;
         a : out  bit;
         b : out  bit;
         c : out  bit;
         d : out  bit;
         e : out  bit;
         f : out  bit;
         g : out  bit;
         PDo : out  bit
		);
	end component;

	signal Q : bit_VECTOR (1 downto 0);
	signal Irrelevant : bit_VECTOR (1 downto 0);
	
	signal i : bit_VECTOR (3 downto 0);
	signal PDin : bit;
begin

	Counter : Counter_2bits port map (CLK, '1', '1', '1', Q(1), Q(0), Irrelevant(1), Irrelevant(0));
	
	Decoder : Decoder_7S port map (i, PDin, '1', a, b, c, d, e, f, g, DPout);
	
	process(Q)
	begin
		if Q(0) = '0' AND Q(1) = '0' then
			i(0) <= Disp0in(0);
			i(1) <= Disp0in(1);
			i(2) <= Disp0in(2);
			i(3) <= Disp0in(3);
			PDin <= Decimal_point(0);
			Enable <= "0111";
			
		elsif Q(0) = '1' AND Q(1) = '0' then
			i(0) <= Disp1in(0);
			i(1) <= Disp1in(1);
			i(2) <= Disp1in(2);
			i(3) <= Disp1in(3);
			PDin <= Decimal_point(1);
			Enable <= "1011";
			
		elsif Q(0) = '0' AND Q(1) = '1' then
			i(0) <= Disp2in(0);
			i(1) <= Disp2in(1);
			i(2) <= Disp2in(2);
			i(3) <= Disp2in(3);
			PDin <= Decimal_point(2);
			Enable <= "1101";
		
		elsif Q(0) = '1' AND Q(1) = '1' then
			i(0) <= Disp3in(0);
			i(1) <= Disp3in(1);
			i(2) <= Disp3in(2);
			i(3) <= Disp3in(3);
			PDin <= Decimal_point(3);	
			Enable <= "1110";		
		end if;
	end process;
	
end Behavioral;