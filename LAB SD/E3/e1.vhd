library ieee;
use ieee.std_logic_1164.all;

-- Multiplexador de 8 bits.
entity CIRCUIT1 is
    port (S: in std_logic_vector(2 downto 0); -- entrada S definida como um vetor de 3 bits
          D: in std_logic_vector(7 downto 0); -- entrada D definida como um vetor de 8 bits
          Y: out std_logic);                  -- saida Y definida como um bit
end CIRCUIT1;

architecture CIRCUIT1_ARCH of CIRCUIT1 is
begin
    -- Implementação da tabela verdade do multiplexador
    -- por uso do método when-else
    Y <= D(0) when S = "000" else
         D(1) when S = "001" else
         D(2) when S = "010" else
         D(3) when S = "011" else
         D(4) when S = "100" else
         D(5) when S = "101" else
         D(6) when S = "110" else
         D(7) when S = "111";
end CIRCUIT1_ARCH;