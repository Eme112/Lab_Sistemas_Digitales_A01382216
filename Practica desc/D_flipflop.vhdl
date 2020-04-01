library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop is
    port(D, CLK: in std_logic;
         RESET: in std_logic;
         Q: out std_logic);
end D_flipflop;

architecture arch of D_flipflop is
    begin
        process(CLK, RESET)
        begin
            if (RESET = '1') then
                Q <= '0';
            elsif (CLK = '1') AND (CLK'event) then
                Q <= D;
            end if;
        end process;
end arch;