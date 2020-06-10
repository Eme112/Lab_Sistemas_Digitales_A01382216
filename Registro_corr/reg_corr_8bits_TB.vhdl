entity Reg_corr_8bits_TB is
end entity;

architecture arch of Reg_corr_8bits_TB is

    component Reg_corr_8bits is
        port(
            CLK, CLR, L, R : in bit;
            MODE : in bit_vector(1 downto 0);
            PAR : in bit_vector(7 downto 0);
            Q : out bit_vector(7 downto 0)
        );
    end component;

    constant clk_period : time := 10 ns;

    -- Input.
    signal CLK, CLR, L, R : bit := '0';
    signal MODE : bit_vector(1 downto 0) := "11";
    signal PAR : bit_vector(7 downto 0);

    -- Output.
    signal Q : bit_vector(7 downto 0);

begin

    UUT : Reg_corr_8bits port map (CLK, CLR, L, R, MODE, PAR, Q);

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_process : process
    begin
        wait for clk_period*10;

        PAR <= "10101010";
        CLR <= '1';
        MODE <= "11";

        wait for clk_period;

        MODE <= "01";
        R <= '0';

        wait for clk_period*2;

        R <= '1';

        wait for clk_period*2;

        MODE <= "10";
        L <= '1';

        wait for clk_period*2;

        L <= '0';

        wait for clk_period*2;

        MODE <= "00";

        wait for clk_period*100;
    end process;

end arch;