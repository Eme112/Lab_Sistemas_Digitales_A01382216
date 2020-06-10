entity SN74LS194 is
    port(
        CLK, CLR, L, R : in bit;
        MODE : in bit_vector(1 downto 0);
        PAR : in bit_vector(3 downto 0);
        Q : out bit_vector(3 downto 0)
    );
end entity;

architecture arch of SN74LS194 is

    signal sQ : bit_vector(3 downto 0);

begin

    Q <= sQ;

    process(CLK, CLR)
    begin
        if CLR = '0' then
            sQ <= "0000";
        elsif CLK = '1' and CLK'event then
            if MODE = "11" then
                sQ <= PAR;
            elsif MODE = "01" then
                sQ <= R & sQ(3 downto 1);
            elsif MODE = "10" then
                sQ <= sQ(2 downto 0) & L;
            end if;
        end if;
    end process;

end arch;