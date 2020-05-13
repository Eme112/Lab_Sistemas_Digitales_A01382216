library ieee;
use ieee.numeric_bit.all;

entity DivFrec60_final_TB is
end entity;

architecture arch of DivFrec60_final_TB is
    component DivFrec60_final is
        port(Clkin : in bit;
             ClkM1 : out bit;
             M1 : out unsigned(2 downto 0);
             M0 : out unsigned(3 downto 0));
    end component;

    -- Input
    signal CLKin : bit := '0';

    -- Output
    signal CLKM1 : bit := '0';
    signal M0 : unsigned(3 downto 0);
    signal M1 : unsigned(2 downto 0);
    constant CLK_period : time := 10 ns;
begin
    UUT : DivFrec60_final port map (CLKin, CLKM1, M1, M0);

    CLK_process : process
    begin
        CLKin <= '0';
        wait for CLK_period/2;
        CLKin <= '1';
        wait for CLK_period/2;
    end process;
end arch;