LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity MUX is
    port(A, B, C, D, i1, i0: in std_logic; Q: out std_logic);
end MUX;

architecture arch of MUX is
    begin
    process (A, B, C, D, i1, i0) is
        begin
        if (i1 = '0' AND i0 = '0') then
            Q <= A;
        elsif (i1 = '0' AND i0 = '1') then
            Q <= B;
        elsif (i1 = '1' AND i0 = '0') then
            Q <= C;
        else
            Q <= D;
        end if;
    end process;
end arch;