library ieee;
use ieee.std_logic_1164.all;

entity Register_4bit is
    port(
        D_in: in std_logic_vector(3 downto 0);
        CLK, LOAD, RESET: in std_logic;
        D_out: out std_logic_vector(3 downto 0)
    );
end Register_4bit;

architecture arch of Register_4bit is
    component D_flipflop is
        port(D, CLK: in std_logic;
         RESET: in std_logic;
         Q: out std_logic);
    end component;

begin
    FFD_0: D_flipflop port map(D_in(0), CLK, RESET, D_out(0));
    FFD_1: D_flipflop port map(D_in(1), CLK, RESET, D_out(1));
    FFD_2: D_flipflop port map(D_in(2), CLK, RESET, D_out(2));
    FFD_3: D_flipflop port map(D_in(3), CLK, RESET, D_out(3));
end arch;