library IEEE;
use IEEE.numeric_bit.all;

entity Union_TB is
end entity;

architecture arch of Union_TB is

    component Union is
        port(
            GO_i, CLK : in bit;
            X_i, Y_i : in unsigned(3 downto 0);
            Data_o : out unsigned(3 downto 0)
        );
    end component;

    -- Input.
    signal GO_i, CLK : bit := '0';
    signal X_i, Y_i : unsigned(3 downto 0);
    
    -- Output.
    signal Data_o : unsigned(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    UUT : Union port map(GO_i, CLK, X_i, Y_i, Data_o);

    clk_process : process
    begin
        CLK <= '0';
        wait for clk_period/2;
        CLK <= '1';
        wait for clk_period/2;
    end process;

    stim_process : process
    begin
        X_i <= x"A";
        Y_i <= x"C";

        wait for 2*clk_period;

        GO_i <= '1';

        wait for 600 ns;
    end process;


end arch;