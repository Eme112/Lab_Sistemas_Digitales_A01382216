library ieee;
use ieee.std_logic_1164.all;

entity register_tb is  
end entity;

architecture arch of register_tb is

    component Register_4bit is
        port (
            D_in: in std_logic_vector(3 downto 0);
            CLK, LOAD, RESET: in std_logic;
            D_out: out std_logic_vector(3 downto 0)
        );
    end component;

    signal D_in: std_logic_vector(3 downto 0);
    signal D_out: std_logic_vector(3 downto 0);
    signal CLK: std_logic:= '0';
    signal LOAD, RESET: std_logic;

begin
    UUT: Register_4bit port map(D_in, CLK, LOAD, RESET, D_out);

    process
    begin
        CLK <= '0';
        wait for 25 ns;
        CLK <= '1';
        wait for 25 ns;
    end process;

    D_in <= "1010" after 20 ns, "1000" after 120 ns;
    LOAD <= '1' after 30 ns, '0' after 60 ns, '1' after 130 ns;
end arch;