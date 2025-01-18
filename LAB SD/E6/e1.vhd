library IEEE;
use IEEE.std_logic_1164.all;

entity JK is
    port (
        J, K, clk, CLR, PR: in std_logic;
        Q: out std_logic
    );
end JK;

architecture JK_ARCH of JK is
    signal JK : std_logic_vector(1 downto 0);
begin
    JK <= J & K;
    process(clk, CLR, PR)
        variable Qbuf : std_logic;
    begin
        if PR = '1' then
            Qbuf := '1';
        elsif CLR = '1' then
            Qbuf := '0';
        elsif rising_edge(clk) then
            case JK is
                when "00" => Qbuf := Qbuf;
                when "01" => Qbuf := '0';
                when "10" => Qbuf := '1';
                when "11" => Qbuf := not(Qbuf);
                when others => Qbuf := Qbuf;
            end case;
        end if;
        Q <= Qbuf;
    end process;
end JK_ARCH;