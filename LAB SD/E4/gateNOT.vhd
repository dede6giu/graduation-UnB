library ieee;
use ieee.std_logic_1164.all;

-- Porta logica NOT
-- Todas as entradas (A) e saidas (Y) sao bits simples
entity GATENOT is
    port (
        A: in std_logic;
        Y: out std_logic 
    );
end GATENOT;

architecture GATENOT_ARCH of GATENOT is
begin
    Y <= not A;
end GATENOT_ARCH;