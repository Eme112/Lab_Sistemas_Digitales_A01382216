library IEEE;
use IEEE.numeric_bit.all;

entity Controller is
    port(
        GO_i, CLK : in bit;
        X_gt_Y, X_lt_Y, X_eq_Y : in bit;
        X_sel, Y_sel : out bit;
        X_ld, Y_ld : out bit;
        X_sub, Y_sub : out bit;
        O_enb : out bit
    );
end entity;

architecture arch of Controller is

    signal first_time : bit := '1';
    signal state, next_state : integer range 0 to 3 := 0;

begin

    process(state)
    begin
        case state is
            when 0 =>
                X_sel <= X_gt_Y or not first_time;
                Y_sel <= X_lt_Y or not first_time;
                X_ld <= '0';
                Y_ld <= '0';
            when 1 =>
                X_ld <= X_gt_Y or  first_time;
                Y_ld <= X_lt_Y or  first_time;
            when 2 =>
                X_sub <= X_gt_Y;
                Y_sub <= X_lt_y;
                first_time <= '0';
                X_ld <= '0';
                Y_ld <= '0';
            when 3 =>
                O_enb <= X_eq_Y;
                X_ld <= '0';
                Y_ld <= '0';
        end case;
    end process;

    process(CLK)
    begin
        if GO_i = '1' then
            if CLK'event and CLK = '1' then
                case state is
                    when 0 => next_state <= 1;
                    when 1 => next_state <= 2;
                    when 2 => next_state <= 3;
                    when 3 => 
                        if X_gt_Y = '1' or X_lt_Y = '1' then
                            next_state <= 0;
                        else
                            next_state <= 3;
                        end if;
                end case;
            end if;
        end if;
    end process;

    state <= next_state;

end arch;