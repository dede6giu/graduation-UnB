library IEEE;
use IEEE.std_logic_1164.all;

-- Device Under Testing
-- Somador de 4 bits construido por somadores completos
entity DUT is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end DUT;

architecture DUT_ARCH of DUT is
component SUMM is
    port (
        A, B, Cin: in std_logic;
        S, Cout: out std_logic
    );
end component;

signal w1, w2, w3, w4: std_logic;

begin
    INT1 : SUMM port map(A(0), B(0), '0', S(0), w1);
    INT2 : SUMM port map(A(1), B(1), w1, S(1), w2);
    INT3 : SUMM port map(A(2), B(2), w2, S(2), w3);
    INT4 : SUMM port map(A(3), B(3), w3, S(3), w4);
    S(4) <= w4;
end DUT_ARCH;