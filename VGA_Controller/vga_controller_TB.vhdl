library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_controller_TB is
    constant h_pulse   : integer := 96;
    constant h_bp      : integer := 48;
    constant h_display : integer := 640;
    constant h_fp      : integer := 16;
    constant h_pol     : std_logic := '0';
    constant v_pulse   : integer := 2;
    constant v_bp      : integer := 33;
    constant v_display : integer := 480;
    constant v_fp      : integer := 10;
    constant v_pol     : std_logic := '0';
    constant period    : time := 40 ps;
end entity;

architecture arch of vga_controller_TB is

    component vga_controller is 
        generic(
            h_pulse   : integer := 96;
            h_bp      : integer := 48;
            h_display : integer := 640;
            h_fp      : integer := 16;
            h_pol     : std_logic := '0';
            v_pulse   : integer := 2;
            v_bp      : integer := 33;
            v_display : integer := 480;
            v_fp      : integer := 10;
            v_pol     : std_logic := '0'
        );
        port(
            clk             : in std_logic;
            enable          : out std_logic;
            column          : out integer;
            row             : out integer;
            h_sync, v_sync  : out std_logic;
            clk_vga         : out std_logic;
            video_on        : out std_logic
        ); 
    end component;

    signal clk             : std_logic := '0';
    signal enable          : std_logic := '0';
    signal column          : integer := 0;
    signal row             : integer := 0;
    signal h_sync, v_sync  : std_logic;
    signal clk_vga         : std_logic;
    signal video_on        : std_logic;

begin

    UUT : vga_controller 
        generic map (h_pulse, h_bp, h_display, h_fp, h_pol, v_pulse, v_bp, v_display, v_fp, v_pol)
        port map (clk, enable, column, row, h_sync, v_sync, clk_vga, video_on);

    clk_process : process
    begin
        clk <= '0'; wait for period/2;
        clk <= '1'; wait for period/2;
    end process;

end arch;