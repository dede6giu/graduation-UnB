library ieee;
use ieee.std_logic_1164.all;

-- Parte 2, Multiplexador
entity CIRCUIT2 is
    port (S: in std_logic_vector(1 downto 0); -- entrada S definida como um vetor (10)
          D: in std_logic_vector(3 downto 0); -- entrada D definida como um vetor (3210)
          Y: out std_logic);                  -- saida Y definida como um bit
end CIRCUIT2;

architecture CIRCUIT2_ARCH of CIRCUIT2 is
signal aux: std_logic_vector(3 downto 0);       -- fio auxiliar definido como um vetor (3210)
begin
    aux(0) <= D(0) and not(S(1)) and not(S(0)); -- D0 x ~S1 x ~S0
    aux(1) <= D(1) and not(S(1)) and S(0);      -- D1 x ~S1 x S0
    aux(2) <= D(2) and S(1) and not(S(0));      -- D2 x S1 x ~S0
    aux(3) <= D(3) and S(1) and S(0);           -- D3 x S1 x S0
    Y <= aux(0) or aux(1) or aux(2) or aux(3);  -- implementacao do multiplexador, como requisitado
end CIRCUIT2_ARCH;