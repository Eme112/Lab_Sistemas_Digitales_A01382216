library ieee;
use ieee.numeric_bit.all;

entity Hours is
    port(Clkin : in bit;
         H1 : out bit;
         H0 : out unsigned(3 downto 0);
         M1 : out unsigned(2 downto 0);
         M0 : out unsigned(3 downto 0));
end entity;

architecture arch of Hours is
    component DivFrec60_final is
        port(Clkin : in bit;
         ClkM1 : out bit;
         M1 : out unsigned(2 downto 0);
         M0 : out unsigned(3 downto 0));
    end component;

    signal Enable : bit := '0';
    signal sM1 : unsigned(2 downto 0);
    signal sM0 : unsigned(3 downto 0);
    signal sH0 : unsigned(3 downto 0) := x"1";
    signal hours_helper : integer range 1 to 12 := 1;
begin
    Minutes : DivFrec60_final port map (Clkin, Enable, sM1, sM0);

    process(Enable)
    begin
        if Enable'event and Enable = '1' then
            hours_helper <= hours_helper + 1;
            if hours_helper < 9 then
                sH0 <= sH0 + 1;
                H1 <= '0';
            elsif hours_helper = 9 then
                sH0 <= x"0";
                H1 <= '1';
            elsif hours_helper = 10 then
                sH0 <= x"1";
                H1 <= '1';
            elsif hours_helper = 11 then
                sH0 <= x"2";
                H1 <= '1';
            else
                sH0 <= x"1";
                H1 <= '0';
                hours_helper <= 1;
            end if;
        end if;
    end process;

    H0 <= sH0;
    M1 <= sM1;
    M0 <= sM0;
end architecture;