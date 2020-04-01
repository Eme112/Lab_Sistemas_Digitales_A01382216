library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Full_Adder is
    port(i1, i0, Cin: in STD_LOGIC;
         Q, Cout: out STD_LOGIC);
end Full_Adder;

architecture arch of Full_Adder is
    component mux
        port(A, B, C, D, i0, i1: in STD_LOGIC; Q: out STD_LOGIC);
    end component;
    
    signal NOTCin: STD_LOGIC;
    
    begin 
        NOTCin <= NOT Cin;
        mux1: mux port map(Cin, NOTCin, NOTCin, Cin, i1, i0, Q);
        mux2: mux port map('0', Cin, Cin, '1', i1, i0, Cout);
end arch;