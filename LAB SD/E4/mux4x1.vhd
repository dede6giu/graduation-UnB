library ieee;
use ieee.std_logic_1164.all;

-- Multiplexador de 4 bits
entity MUX4X1 is
    port (
        S: in std_logic_vector(1 downto 0); -- Entrada S --> vetor de 2 bits
        D: in std_logic_vector(3 downto 0); -- Entrada D --> vetor de 4 bits
        Y: out std_logic                    --   Saida Y --> bit
    );
end MUX4X1;

architecture MUX4X1_ARCH of MUX4X1 is
begin
    Y <= D(0) when S = "00" else
         D(1) when S = "01" else
         D(2) when S = "10" else
         D(3) when S = "11";
end MUX4X1_ARCH;