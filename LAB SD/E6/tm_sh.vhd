library IEEE;
use IEEE.std_logic_1164.all;

entity TMSH is
end TMSH;

architecture TMSH_ARCH of TMSH is
    component SHIFTER is
        port (
            clk, rst, load, DIR, L, R: in std_logic;
            D: in std_logic_vector(3 downto 0);
            Q: out std_logic_vector(3 downto 0)
        );
    end component;

    component TBSH is
        port (
            DUT_out: in std_logic_vector(3 downto 0);
            clk, rst, load, DIR, L, R: out std_logic;
            D: out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk, rst, load, DIR, L, R : std_logic;
    signal DUT_out, D : std_logic_vector(3 downto 0);

begin
    INT1 : SHIFTER port map(clk, rst, load, DIR, L, R, D, DUT_out);
    INT2 : TBSH port map(DUT_out, clk, rst, load, DIR, L, R, D);
end TMSH_ARCH;