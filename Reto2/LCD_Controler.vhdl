library std;
use std.textio.all;
library ieee;
use ieee.numeric_bit.all;

entity LCD_Controler is
	port(CLK, RESET, RS, RW : in bit;
		  DATA : in bit_vector(7 downto 0);
		  RSout, RWout, EN : out bit;
		  DATAout : out bit_vector(7 downto 0));
end LCD_Controler;

architecture Behavioral of LCD_Controler is
	signal state : integer range 0 to 4 := 0;
begin
	
    process(CLK)
	begin
		if CLK'event and CLK = '0' then
			case state is
				when 0 =>
					state <= 1;
				when 1 =>
					state <= 2;
				when 2 =>
					state <= 3;
				when 3 =>
					state <= 4;
				when 4 =>
					if RESET = '0' then
						state <= 0;
                    end if;
            end case;
		end if;
    end process;
    
    process(state, RS, RW, DATA)
        file fout : TEXT open WRITE_MODE is "output.txt";
		variable text_line : line;
    begin
        case state is
            when 0 =>
                RSout <= '0';
                RWout <= '0';
                DATAout <= x"38";
                
                write(text_line, string'("instr(0x38);"));
                writeline(fout, text_line);
                
            when 1 =>
                RSout <= '0';
                RWout <= '0';
                DATAout <= x"0F";
                
                write(text_line, string'("instr(0x0F);"));
                writeline(fout, text_line);

            when 2 =>
                RSout <= '0';
                RWout <= '0';
                DATAout <= x"01";
                
                write(text_line, string'("instr(0x01);"));
                writeline(fout, text_line);

            when 3 =>
                RSout <= '0';
                RWout <= '0';
                DATAout <= x"06";
                
                write(text_line, string'("instr(0x06);"));
                writeline(fout, text_line);

            when 4 =>
                RSout <= RS;
                RWout <= RW;
                DATAout <= DATA;
                
                if RS = '0' then
                    write(text_line, string'("instr("));
                else
                    write(text_line, string'("data("));
                end if;
                write(text_line, TO_INTEGER(UNSIGNED(DATA)));
                write(text_line, string'(");"));
                writeline(fout, text_line);
        end case;
    end process;

	EN <= CLK;

end Behavioral;