entity mux_4bit is
    port(X, Y: in   bit_vector(3 downto 0); sig: in bit; res: out bit_vector(3 downto 0));
end entity;

architecture arch of mux_4bit is
    begin
--      USING PROCESS.
        process(sig)
        begin
            if (sig = '0') then
                res <= X;
            elsif (sig = '1') then
                res <= Y;
            end if;
        end process;
    
--      USING WHEN.
--      res <= X when sel = '0' else
--             Y when sel = '1' else
--             NULL when OTHERS;
--      IT IS ALSO POSSIBLE USING INDIVIDUAL MUX'es AND PORT MAPS.
end architecture;