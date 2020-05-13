library ieee;
use ieee.numeric_bit.all;

entity DivFrec60_pte1 is
    port(Clkin : in bit;
         ClkM0 : out bit;
         M0 : out unsigned(3 downto 0));
end entity;

architecture arch of DivFrec60_pte1 is
    signal sM0 : unsigned(3 downto 0) := x"0";
begin
    process(Clkin)
    begin
        if CLKin'event and CLKin = '1' then
            if sM0 < x"9" then
                sM0 <= sM0 + 1;
                ClkM0 <= '0';
            else
                sM0 <= x"0";
                ClkM0 <= '1';
            end if;
        end if;
    end process;

    M0 <= sM0;
end arch;