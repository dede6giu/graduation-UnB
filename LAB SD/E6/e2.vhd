library IEEE;
use IEEE.std_logic_1164.all;

entity SHIFTER is
    port (
        clk, rst, load, DIR, L, R: in std_logic;
        D: in std_logic_vector(3 downto 0);
        Q: out std_logic_vector(3 downto 0)
    );
end SHIFTER;

architecture SHIFTER_ARCH of SHIFTER is
begin
    process(clk)
        variable Qbuf : std_logic_vector(3 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                Qbuf := "0000";
            elsif load = '1' then
                Qbuf := D;
            elsif DIR = '0' then
                Qbuf := Qbuf(2 downto 0) & L;
            else
                Qbuf := R & Qbuf(3 downto 1);
            end if;
        end if;
        Q <= Qbuf;
    end process;
end SHIFTER_ARCH;