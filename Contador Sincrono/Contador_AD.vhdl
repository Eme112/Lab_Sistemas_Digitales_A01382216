library IEEE;
use IEEE.numeric_bit.all;

entity Contador_AD is
    port(
        CP, UD, EN : in bit;
        Q : out unsigned(7 downto 0)
    );
end entity;

architecture arch of Contador_AD is

    component SC_74F169 is
        port(
            CP, CET, CEP, PE, UD : in bit;
            D : in unsigned(3 downto 0);
            TC : out bit;
            Q : out unsigned(3 downto 0)
        );
    end component;

    signal PE : bit;
    signal D : unsigned(7 downto 0);
    signal TC : bit;
    signal not_used : bit;

    signal count : unsigned(7 downto 0);

begin

    SC_74F169_0 : SC_74F169 port map (CP, '0', EN, PE, UD, D(3 downto 0), TC,       count(3 downto 0));
    SC_74F169_1 : SC_74F169 port map (CP,  TC, TC, PE, UD, D(7 downto 4), not_used, count(7 downto 4));

    Q <= count;

    process(CP)
    begin
        if CP = '1' and CP'event then
            if count = x"62" and UD = '1' then
                D <= x"00";
                PE <= '0';
            elsif count = x"01" and UD = '0' then
                D <= x"63";
                PE <= '0';
            else
                D <= x"00";
                PE <= '1';
            end if;
        end if;
    end process;

end arch;