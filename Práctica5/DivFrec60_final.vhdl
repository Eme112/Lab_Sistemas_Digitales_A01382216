library ieee;
use ieee.numeric_bit.all;

entity DivFrec60_final is
    port(Clkin : in bit;
         ClkM1 : out bit;
         M1 : out unsigned(2 downto 0);
         M0 : out unsigned(3 downto 0));
end entity;

architecture arch of DivFrec60_final is
    component DivFrec60_pte1 is
        port(Clkin : in bit;
             ClkM0 : out bit;
             M0 : out unsigned(3 downto 0));
    end component;

    signal sM1 : unsigned(2 downto 0) := "000";
    signal sM0 : unsigned(3 downto 0) := "0000";
    signal sCLKM0 : bit := '0';
begin
    M0_signal : DivFrec60_pte1 port map (Clkin, sCLKM0, sM0);

    process(sCLKM0)
    begin
        if sCLKM0'event and sCLKM0 = '1' then
            if sM1 < "101" then
                sM1 <= sM1 + 1;
            else
                sM1 <= "000";
            end if;
        end if;
    end process;

    process(CLKin)
    begin
        if sM1&sM0 < "1011001" then
            CLKM1 <= '0';
        else
            CLKM1 <= '1';
        end if;
    end process;

    M0 <= sM0;
    M1 <= sM1;
end arch;