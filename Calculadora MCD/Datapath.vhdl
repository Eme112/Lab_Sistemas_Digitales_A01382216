library IEEE;
use IEEE.numeric_bit.all;

entity Datapath is
    port(
        X_i, Y_i : in unsigned(3 downto 0);
        X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb : in bit;
        X_gt_Y, X_eq_Y, X_lt_Y : out bit;
        Data_o : out unsigned(3 downto 0)
    );
end entity;

architecture arch of Datapath is

    signal X_mux, Y_mux : unsigned(3 downto 0);
    signal X_register, Y_register : unsigned(3 downto 0);
    signal X_substractor, Y_substractor : unsigned(3 downto 0);
    signal comparator : unsigned(3 downto 0);
    signal output_r : unsigned(3 downto 0);

begin
    
    -- Mux behavior.
    X_mux <= X_i when X_sel = '0'
        else X_substractor;
    Y_mux <= Y_i when Y_sel = '0'
        else Y_substractor;

    -- Register behaviour.
    process(X_ld)
    begin
        if X_ld = '1' then
            X_register <= X_mux;
        end if;
    end process;

    process(Y_ld)
    begin
        if Y_ld = '1' then
            Y_register <= Y_mux;
        end if;
    end process;

    -- Substractor behaviour.
    X_substractor <= X_register - Y_register when X_sub = '1'
                else X_register;
    Y_substractor <= Y_register - X_register when Y_sub = '1'
                else Y_register;

    -- Comparator.
    X_gt_Y <= '1' when X_register > Y_register
         else '0';
    X_lt_Y <= '1' when X_register < Y_register
         else '0';
    X_eq_Y <= '1' when X_register = Y_register
         else '0';
    comparator <= X_register when X_register = Y_register;
    
    -- Output register.
    process(O_enb)
    begin
        if O_enb = '1' then
            Data_o <= comparator;
        end if;
    end process;

end arch;