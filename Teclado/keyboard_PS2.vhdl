library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard_PS2 is
    port(
        keyboard_clk, keyboard_data, clk_25Mhz, reset, enable : in std_logic;
        scan_code    : out std_logic_vector(7 downto 0);
        scan_ready   : out std_logic;
        parity_error : out std_logic
    );
end entity;


architecture arch of keyboard_PS2 is
    signal state : integer range 0 to 10 := 0;
    signal keyboard_clk_filtered : std_logic;
    signal read_char : std_logic := '0';
    signal ready_set : std_logic := '0';
    signal shift_in : std_logic_vector(8 downto 0);
    signal filter : std_logic_vector(7 downto 0);
    signal parity_bit : std_logic := '1'; -- 1 if pair ammount of 1's
    signal parity_calculated : std_logic;

begin

    clock_filter : process
    begin
        wait until clk_25Mhz'event and clk_25Mhz = '1';
        filter(6 downto 0) <= filter(7 downto 1);
        filter(7) <= keyboard_clk;
        if filter = x"FF" then 
            keyboard_clk_filtered <= '1';
        elsif filter = x"00" then
            keyboard_clk_filtered <= '0';
        end if;
    end process;

    process 
    begin
        wait until (keyboard_clk_filtered'event and keyboard_clk_filtered = '0');
        if reset = '1' then
            state <= 0;
            read_char <= '0';
            parity_error <= '0';
            parity_calculated <= '0';
        else 
            if keyboard_data = '0' and read_char = '0' then -- Start reading signal.
                read_char <= '1';
                ready_set <= '0';
            else 
                -- Scan code construction.
                if read_char = '1' then
                    if state < 9 then
                        state <= state + 1;
                        shift_in(7 downto 0) <= shift_in(8 downto 1);
                        shift_in(8) <= keyboard_data;
                        ready_set <= '0';
                        if keyboard_data = '1' then
                            parity_calculated <= not parity_calculated;
                        end if;
                    elsif state = 10 then
                        parity_bit <= keyboard_data;
                    else
                        scan_code <= shift_in(7 downto 0);
                        read_char <= '0';
                        ready_set <= '1';
                        state <= 0;
                        if parity_bit = parity_calculated then
                            parity_error <= '0';
                        else
                            parity_error <= '1';
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    process (enable, ready_set)
    begin
        if enable = '1' then
            scan_ready <= '0';
        elsif ready_set'event and ready_set = '1' then
            scan_ready <= '1';
        end if;
    end process;
    
end arch ; -- arch