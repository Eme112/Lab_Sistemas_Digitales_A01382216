entity Reg_corr_8bits is
    port(
        CLK, CLR, L, R : in bit;
        MODE : in bit_vector(1 downto 0);
        PAR : in bit_vector(7 downto 0);
        Q : out bit_vector(7 downto 0)
    );
end entity;

architecture arch of Reg_corr_8bits is

    component SN74LS194 is
        port(
            CLK, CLR, L, R : in bit;
            MODE : in bit_vector(1 downto 0);
            PAR : in bit_vector(3 downto 0);
            Q : out bit_vector(3 downto 0)
        );
    end component;

    signal sQ : bit_vector(7 downto 0);

begin

    SN74LS194_0 : SN74LS194 port map (CLK, CLR, L, sQ(4), MODE, PAR(3 downto 0), sQ(3 downto 0));
    SN74LS194_1 : SN74LS194 port map (CLK, CLR, sQ(3), R, MODE, PAR(7 downto 4), sQ(7 downto 4));

    Q <= sQ;
    
end arch;