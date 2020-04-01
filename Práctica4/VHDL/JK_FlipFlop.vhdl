entity JK_FlipFlop is
    Port ( SN : in  bit;
           RN : in  bit;
			  E : in bit;
           J : in  bit;
           K : in  bit;
           CLK : in  bit;
           Q : out  bit;
           QN : out  bit);
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
signal Qint: bit;
begin
	Q <= Qint;
	QN <= NOT Qint;
	
	process(SN, RN, CLK)
	begin
		if E = '1' then
			if RN = '0' then Qint <= '0';
			elsif SN = '0' then Qint <= '1';
			elsif CLK'event AND CLK = '0' then 
				Qint <= (J AND NOT Qint) OR (NOT K AND Qint);
			end if;
		end if;
	end process;
end Behavioral;