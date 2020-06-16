library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity keyboard_PS2_TB is
end entity;

architecture arch of keyboard_PS2_TB is

    component keyboard_PS2 is
        port(
            keyboard_clk, keyboard_data, clk_25Mhz, reset, enable : in std_logic;
            scan_code    : out std_logic_vector(7 downto 0);
            scan_ready   : out std_logic;
            parity_error : out std_logic
        );
    end component;
    
    constant kbd_clk_period     : time := 40 ns;
    constant clk_period : time := 60 us;

    -- Input.
    signal keyboard_clk  : std_logic := '1';
    signal keyboard_data : std_logic := '1';
    signal clk_25Mhz     : std_logic := '1';
    signal reset         : std_logic := '0';
    signal enable        : std_logic := '1';

    -- Output.
    signal scan_code    : std_logic_vector(7 downto 0);
    signal scan_ready   : std_logic;
    signal parity_error : std_logic := '0';

    type kbd_record is record
        data  : std_logic_vector(7 downto 0);
        p_bit : std_logic; 
    end record;

    type LUT_type is array (0 to 4) of kbd_record;
    constant LUT : LUT_type := ((data => x"21", p_bit => '1'),
                                (data => x"44", p_bit => '1'),
                                (data => x"2A", p_bit => '0'),
                                (data => x"43", p_bit => '0'),
                                (data => x"23", p_bit => '0'));

    begin 

    UUT : keyboard_PS2 port map (keyboard_clk, keyboard_data, clk_25MHz, reset, enable, scan_code, scan_ready );

    -- Señal de reloj del sistema
    clk_25MHz <= not clk_25MHz after (kbd_clk_period / 2);
    reset <= '1', '0' after kbd_clk_period;

    process
        procedure send_code( sc : kbd_record ) is
        begin
            keyboard_clk <= 'H';
            keyboard_data <= 'H';

            wait for (clk_period/2);
            keyboard_data <= '0'; -- Start bit
            wait for (clk_period/2);
            keyboard_clk <= '0';
            wait for (clk_period/2);
            keyboard_clk <= '1';
            for i in 0 to 7 loop
                keyboard_data <= sc.data(i);
                wait for (clk_period/2);
                keyboard_clk <= '0';
                wait for (clk_period/2);
                keyboard_clk <= '1';
            end loop;
            -- bit de paridad
            keyboard_data <= sc.p_bit;

            wait for (clk_period/2);
            keyboard_clk <= '0';
            wait for (clk_period/2);
            keyboard_clk <= '1';

            -- stop bit
            keyboard_data <= '1';
            wait for (clk_period/2);
            keyboard_clk <= '0';
            wait for (clk_period/2);

            keyboard_clk <= '1';
            keyboard_data <= 'H';
            wait for (clk_period * 3);
        end procedure send_code;
    
        begin
        wait for clk_period;
        for j in LUT'range loop
            send_code(LUT(j));
        end loop;
    end process;

    process 
        variable l : line;
    begin
        wait until scan_ready = '1';
        wait for 300* kbd_clk_period;
        write (l, string'("Scan code : "));
        write (l, scan_code);
        writeline(output, l);
        wait for clk_period;
    end process;

end arch;