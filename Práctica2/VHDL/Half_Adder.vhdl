library IEEE;
use IEEE.std_logic_1164.ALL;

entity Half_Adder is
    port(i1, i0: in STD_LOGIC; Q, Cout: out STD_LOGIC);
end Half_Adder;

architecture arch of Half_Adder is
    component mux
        port(A, B, C, D, i0, i1: in STD_LOGIC; Q: out STD_LOGIC);
    end component;

    begin
        mux1: mux port map('0', '1', '1', '0', i1, i0, Q);
        mux2: mux port map('0', '0', '0', '1', i1, i0, Cout);
end arch;