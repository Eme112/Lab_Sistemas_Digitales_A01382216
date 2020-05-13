library ieee;
use ieee.numeric_bit.all;

entity Hours_TB is
end entity;

architecture arch of Hours_TB is
    component Hours is
        port(Clkin : in bit;
             H1 : out bit;
             H0 : out unsigned(3 downto 0);
             M1 : out unsigned(2 downto 0);
             M0 : out unsigned(3 downto 0));
    end component;

    signal Clkin :  bit := '0';
    signal H1 : bit := '0';
    signal H0 : unsigned(3 downto 0) := x"1";
    signal M1 : unsigned(2 downto 0) := "000";
    signal M0 : unsigned(3 downto 0) := x"0";
    constant CLK_period : time := 10 ns;
begin
    UUT : Hours port map (CLKin, H1, H0, M1, M0);

    clock_process : process
    begin
        CLkin <= '0';
        wait for CLK_period/2;
        CLKin <= '1';
        wait for CLK_period/2;
    end process;
end arch;