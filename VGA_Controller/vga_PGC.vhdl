library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_PGC is
    port(
        pixel_x, pixel_y : in integer;
        video_on         : in std_logic;
        external_dc      : in std_logic_vector(8 downto 0); -- RGB in (3 bits for each one).
        rgb              : out std_logic_vector(8 downto 0) -- RGB out (3 bits for each one).
    );
end entity;

architecture arch of vga_PGC is

begin

    rgb(8) <= video_on and external_dc(8);
    rgb(7) <= video_on and external_dc(7);
    rgb(6) <= video_on and external_dc(6);
    rgb(5) <= video_on and external_dc(5);
    rgb(4) <= video_on and external_dc(4);
    rgb(3) <= video_on and external_dc(3);
    rgb(2) <= video_on and external_dc(2);
    rgb(1) <= video_on and external_dc(1);
    rgb(0) <= video_on and external_dc(0);

end arch;