library ieee;
use ieee.std_logic_1164.all;

-- Parte 1, Somador
entity CIRCUIT1 is
    port (A, B, Cin: in std_logic; -- entradas definidas como um bit
          S, Cout: out std_logic); -- saida definida como um bit
end CIRCUIT1;

architecture CIRCUIT1_ARCH of CIRCUIT1 is
begin
    S <= (A xor B) xor Cin;                          -- implementacao da saida S, como requisitado
    Cout <= (A and B) or (A and Cin) or (B and Cin); -- implementacao da saida Cout, como requisitado
end CIRCUIT1_ARCH;