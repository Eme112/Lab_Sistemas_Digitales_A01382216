entity Decoder_7S is
    Port ( I : in  bit_VECTOR (3 downto 0);
           PDi : in  bit;
           EN : in  bit;
           a : out  bit;
           b : out  bit;
           c : out  bit;
           d : out  bit;
           e : out  bit;
           f : out  bit;
           g : out  bit;
           PDo : out  bit);
end Decoder_7S;

architecture Behavioral of Decoder_7S is

begin

	process(I(0), I(1), I(2), I(3), PDi, EN)
	begin
		if EN = '1' then
			a <= (I(2) AND I(0)) OR (NOT I(2) AND NOT I(0)) OR I(3) OR I(1);
			b <= (I(1) AND I(0)) OR (NOT I(1) AND NOT I(0)) OR NOT I(2);
			c <= I(2) OR NOT I(1) OR I(0);
			d <= I(3) OR (NOT I(2) AND NOT I(0)) OR (I(1) AND NOT I(0)) OR (NOT I(2) AND I(1)) OR (I(0) AND I(2) AND NOT I(1));
			e <= (I(1) AND NOT I(0)) OR (NOT I(2) AND NOT I(0));
			f <= (NOT I(1) AND NOT I(0)) OR (I(2) AND NOT I(0)) OR (I(2) AND NOT I(1)) OR I(3);
			g <= (I(1) AND NOT I(0)) OR (I(2) AND NOT I(1)) OR (NOT I(2) AND I(1)) OR I(3);
			PDo <= PDi;
		elsif EN = '0' then
			a <= '0';
			b <= '0';
			c <= '0';
			d <= '0';
			e <= '0';
			f <= '0';
			g <= '0';
			PDo <= '0';
		end if;
	end process;

end Behavioral;