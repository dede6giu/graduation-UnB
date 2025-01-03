library IEEE;
use IEEE.std_logic_1164.all;

-- Somador Completo
entity SUMM is
    port (
        A, B, Cin: in std_logic;
        S, Cout: out std_logic
    );
end SUMM;

architecture SUMM_ARCH of SUMM is
begin
    S <= (A xor B) xor Cin;                         
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end SUMM_ARCH;