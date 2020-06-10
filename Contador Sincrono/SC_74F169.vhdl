library IEEE;
use IEEE.numeric_bit.all;

entity SC_74F169 is
    port(
        CP, CET, CEP, PE, UD : in bit;
        D : in unsigned(3 downto 0);
        TC : out bit;
        Q : out unsigned(3 downto 0)
    );
end entity;

architecture arch of SC_74F169 is

    signal count : unsigned(3 downto 0) := x"0";

begin

    process(CP)
    begin
        if CP = '1' and CP'event then
            if PE = '0' then
                count <= D;
            elsif CEP = '0' and CET = '0' then
                if UD = '1' then
                    count <= count + 1;
                else
                    count <= count - 1;
                end if;
            end if;
        end if;

        if CET = '0' and ((count = x"0" and UD = '0') or (count = x"F" and UD = '1')) then
            TC <= '0';
        else
            TC <= '1';
        end if;
    end process;

    Q <= count;

end arch;