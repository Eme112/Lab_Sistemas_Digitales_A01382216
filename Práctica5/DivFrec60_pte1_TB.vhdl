library ieee;
use ieee.numeric_bit.all;

entity DivFrec60_pte1_TB is
end entity;

architecture arch of DivFrec60_pte1_TB is
    component DivFrec60_pte1 is
        port(CLKin : in bit;
             CLKM0 : out bit;
             M0 : out unsigned(3 downto 0));
    end component;

    -- Input
    signal CLKin : bit := '0';

    -- Output
    signal CLKM0 : bit := '0';
    signal M0 : unsigned(3 downto 0);
    constant CLK_period : time := 10 ns;
begin
    UUT : DivFrec60_pte1 port map (CLKin, CLKM0, M0);

    CLK_process : process
    begin
        CLKin <= '0';
        wait for CLK_period/2;
        CLKin <= '1';
        wait for CLK_period/2;
    end process;
end arch;