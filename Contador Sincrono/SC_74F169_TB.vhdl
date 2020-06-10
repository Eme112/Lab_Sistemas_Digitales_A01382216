library IEEE;
use IEEE.numeric_bit.all;

entity SC_74F169_TB is
end entity;

architecture arch of SC_74F169_TB is

    component SC_74F169 is
        port(
            CP, CET, CEP, PE, UD : in bit;
            D : in unsigned(3 downto 0);
            TC : out bit;
            Q : out unsigned(3 downto 0)
        );
    end component;

    -- Input.
    signal CP, CET, CEP, PE, UD : bit := '1';
    signal D : unsigned(3 downto 0) := "0000";

    -- Output.
    signal TC : bit;
    signal Q : unsigned(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    UUT : SC_74F169 port map (CP, CET, CEP, PE, UD, D, TC, Q);

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

        CET <= '0';
        CEP <= '0';

        wait for clk_period*20;

        CET <= '1';
        CEP <= '1';
        PE <= '0';
        D <= "0000";
        UD <= '0';

        wait for clk_period*2;

        CET <= '0';
        PE <= '1';

        wait for clk_period*2;

        CEP <= '0';

        wait for clk_period*20;
    end process;

end arch;