entity Display_4 is
    Port ( Disp0in : in  bit_VECTOR (3 downto 0);
           Disp1in : in  bit_VECTOR (3 downto 0);
           Disp2in : in  bit_VECTOR (3 downto 0);
           Disp3in : in  bit_VECTOR (3 downto 0);
           Decimal_point : in  bit_VECTOR (3 downto 0);
           CLK : in  bit;
			  Disp0out : out bit_VECTOR (6 downto 0);
			  Disp1out : out bit_VECTOR (6 downto 0);
			  Disp2out : out bit_VECTOR (6 downto 0);
			  Disp3out : out bit_VECTOR (6 downto 0);
			  Decimal_point_out : out bit_VECTOR (3 downto 0) );
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
	signal a, b, c, d, e, f, g, PDo : bit;
begin

	Counter : Counter_2bits port map (CLK, '1', '1', '1', Q(1), Q(0), Irrelevant(1), Irrelevant(0));
	
	Decoder : Decoder_7S port map (i, PDin, '1', a, b, c, d, e, f, g, PDo);
	
	process(Q)
	begin
		if Q(0) = '0' AND Q(1) = '0' then
			i(0) <= Disp0in(0);
			i(1) <= Disp0in(1);
			i(2) <= Disp0in(2);
			i(3) <= Disp0in(3);
			PDin <= Decimal_point(0);
			
		elsif Q(0) = '1' AND Q(1) = '0' then
			i(0) <= Disp1in(0);
			i(1) <= Disp1in(1);
			i(2) <= Disp1in(2);
			i(3) <= Disp1in(3);
			PDin <= Decimal_point(1);
			
		elsif Q(0) = '0' AND Q(1) = '1' then
			i(0) <= Disp2in(0);
			i(1) <= Disp2in(1);
			i(2) <= Disp2in(2);
			i(3) <= Disp2in(3);
			PDin <= Decimal_point(2);
		
		elsif Q(0) = '1' AND Q(1) = '1' then
			i(0) <= Disp3in(0);
			i(1) <= Disp3in(1);
			i(2) <= Disp3in(2);
			i(3) <= Disp3in(3);
			PDin <= Decimal_point(3);			
		end if;
	end process;
	
	process(Q)
	begin
		if Q(0) = '0' AND Q(1) = '0' then
			Disp0Out(0) <= a;
			Disp0Out(1) <= b;
			Disp0Out(2) <= c;
			Disp0Out(3) <= d;
			Disp0Out(4) <= e;
			Disp0Out(5) <= f;
			Disp0Out(6) <= g;
			Decimal_point_out(0) <= PDo;
			
			Disp3Out(0) <= '0';
			Disp3Out(1) <= '0';
			Disp3Out(2) <= '0';
			Disp3Out(3) <= '0';
			Disp3Out(4) <= '0';
			Disp3Out(5) <= '0';
			Disp3Out(6) <= '0';
			Decimal_point_out(3) <= '0';
			
			Disp1Out(0) <= '0';
			Disp1Out(1) <= '0';
			Disp1Out(2) <= '0';
			Disp1Out(3) <= '0';
			Disp1Out(4) <= '0';
			Disp1Out(5) <= '0';
			Disp1Out(6) <= '0';
			Decimal_point_out(1) <= '0';
			
			Disp2Out(0) <= '0';
			Disp2Out(1) <= '0';
			Disp2Out(2) <= '0';
			Disp2Out(3) <= '0';
			Disp2Out(4) <= '0';
			Disp2Out(5) <= '0';
			Disp2Out(6) <= '0';
			Decimal_point_out(2) <= '0';
			
		elsif Q(0) = '1' AND Q(1) = '0' then
			Disp1Out(0) <= a;
			Disp1Out(1) <= b;
			Disp1Out(2) <= c;
			Disp1Out(3) <= d;
			Disp1Out(4) <= e;
			Disp1Out(5) <= f;
			Disp1Out(6) <= g;
			Decimal_point_out(1) <= PDo;
			
			Disp0Out(0) <= '0';
			Disp0Out(1) <= '0';
			Disp0Out(2) <= '0';
			Disp0Out(3) <= '0';
			Disp0Out(4) <= '0';
			Disp0Out(5) <= '0';
			Disp0Out(6) <= '0';
			Decimal_point_out(0) <= '0';
			
			Disp3Out(0) <= '0';
			Disp3Out(1) <= '0';
			Disp3Out(2) <= '0';
			Disp3Out(3) <= '0';
			Disp3Out(4) <= '0';
			Disp3Out(5) <= '0';
			Disp3Out(6) <= '0';
			Decimal_point_out(3) <= '0';
			
			Disp2Out(0) <= '0';
			Disp2Out(1) <= '0';
			Disp2Out(2) <= '0';
			Disp2Out(3) <= '0';
			Disp2Out(4) <= '0';
			Disp2Out(5) <= '0';
			Disp2Out(6) <= '0';
			Decimal_point_out(2) <= '0';
			
		elsif Q(0) = '0' AND Q(1) = '1' then
			Disp2Out(0) <= a;
			Disp2Out(1) <= b;
			Disp2Out(2) <= c;
			Disp2Out(3) <= d;
			Disp2Out(4) <= e;
			Disp2Out(5) <= f;
			Disp2Out(6) <= g;
			Decimal_point_out(2) <= PDo;
			
			Disp0Out(0) <= '0';
			Disp0Out(1) <= '0';
			Disp0Out(2) <= '0';
			Disp0Out(3) <= '0';
			Disp0Out(4) <= '0';
			Disp0Out(5) <= '0';
			Disp0Out(6) <= '0';
			Decimal_point_out(0) <= '0';
			
			Disp1Out(0) <= '0';
			Disp1Out(1) <= '0';
			Disp1Out(2) <= '0';
			Disp1Out(3) <= '0';
			Disp1Out(4) <= '0';
			Disp1Out(5) <= '0';
			Disp1Out(6) <= '0';
			Decimal_point_out(1) <= '0';
			
			Disp3Out(0) <= '0';
			Disp3Out(1) <= '0';
			Disp3Out(2) <= '0';
			Disp3Out(3) <= '0';
			Disp3Out(4) <= '0';
			Disp3Out(5) <= '0';
			Disp3Out(6) <= '0';
			Decimal_point_out(3) <= '0';
			
		elsif Q(0) = '1' AND Q(1) = '1' then
			Disp3Out(0) <= a;
			Disp3Out(1) <= b;
			Disp3Out(2) <= c;
			Disp3Out(3) <= d;
			Disp3Out(4) <= e;
			Disp3Out(5) <= f;
			Disp3Out(6) <= g;
			Decimal_point_out(3) <= PDo;
			
			Disp0Out(0) <= '0';
			Disp0Out(1) <= '0';
			Disp0Out(2) <= '0';
			Disp0Out(3) <= '0';
			Disp0Out(4) <= '0';
			Disp0Out(5) <= '0';
			Disp0Out(6) <= '0';
			Decimal_point_out(0) <= '0';
			
			Disp1Out(0) <= '0';
			Disp1Out(1) <= '0';
			Disp1Out(2) <= '0';
			Disp1Out(3) <= '0';
			Disp1Out(4) <= '0';
			Disp1Out(5) <= '0';
			Disp1Out(6) <= '0';
			Decimal_point_out(1) <= '0';
			
			Disp2Out(0) <= '0';
			Disp2Out(1) <= '0';
			Disp2Out(2) <= '0';
			Disp2Out(3) <= '0';
			Disp2Out(4) <= '0';
			Disp2Out(5) <= '0';
			Disp2Out(6) <= '0';
			Decimal_point_out(2) <= '0';
			
		end if;
	end process;
	
end Behavioral;