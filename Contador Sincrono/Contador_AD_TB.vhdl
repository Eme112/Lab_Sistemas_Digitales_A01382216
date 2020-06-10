library IEEE;
use IEEE.numeric_bit.all;

entity Contador_AD_TB is
end entity;

architecture arch of Contador_AD_TB is

    component Contador_AD is
        port(
            CP, UD, EN : in bit;
            Q : out unsigned(7 downto 0)
        );
    end component;

    -- Input.
    signal CP, UD, EN : bit := '1';

    -- Output.
    signal Q : unsigned(7 downto 0);

    constant clk_period : time := 10 ns;

begin

    UUT : Contador_AD port map (CP, UD, EN, Q);

    clk_process : process
    begin
        CP <= '0';
        wait for clk_period/2;
        CP <= '1';
        wait for clk_period/2;
    end process;

    stim_process : process
    begin
        wait for 20 ns;

        EN <= '0';

        wait for clk_period*120;

        UD <= '0';

        wait for clk_period*140;
    end process;

end arch;