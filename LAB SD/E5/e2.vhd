library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-- Golden Model
-- Somador de 4 bits construido com a biblioteca nativa do IEEE
entity GM is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end GM;

architecture GM_ARCH of GM is
begin
    S <= ('0' & unsigned(A)) + ('0' & unsigned(B));
end GM_ARCH;