library IEEE;
use IEEE.numeric_bit.all;

entity Union is
    port(
        GO_i, CLK : in bit;
        X_i, Y_i : in unsigned(3 downto 0);
        Data_o : out unsigned(3 downto 0)
    );
end entity;

architecture arch of Union is

    component Datapath is
        port(
            X_i, Y_i : in unsigned(3 downto 0);
            X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb : in bit;
            X_gt_Y, X_eq_Y, X_lt_Y : out bit;
            Data_o : out unsigned(3 downto 0)
        );
    end component;

    component Controller is
        port(
            GO_i, CLK : in bit;
            X_gt_Y, X_lt_Y, X_eq_Y : in bit;
            X_sel, Y_sel : out bit;
            X_ld, Y_ld : out bit;
            X_sub, Y_sub : out bit;
            O_enb : out bit
        );
    end component;

    signal X_sel, Y_Sel : bit;
    signal X_ld, Y_ld : bit;
    signal X_sub, Y_sub : bit;
    signal O_enb : bit;
    signal X_gt_Y, X_lt_Y, X_eq_Y : bit;

begin

    DP : Datapath port map (X_i, Y_i, X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb, X_gt_Y, X_eq_Y, X_lt_Y, Data_o);
    C : Controller port map (GO_i, CLK, X_gt_Y, X_lt_Y, X_eq_Y, X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb);

end arch;