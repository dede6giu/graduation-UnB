library IEEE;
use IEEE.std_logic_1164.all;

-- Top Module
-- Entidade que controla a simulação do GM e DUT, alem do Testbench.
-- Note que nao possue entrada nem saida. Apenas circuitos internos.
entity TOPMODULE is
end TOPMODULE;

architecture TOPMODULE_ARCH of TOPMODULE is
component DUT is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end component;

component GM is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end component;

component TESTBENCH is
    port (
        DUT_out, GM_out: in std_logic_vector(4 downto 0);
        A, B: out std_logic_vector(3 downto 0)
    );
end component;

signal A, B : std_logic_vector(3 downto 0);
signal DUT_out, GM_out : std_logic_vector(4 downto 0);

begin
    INT1 : DUT port map(A, B, DUT_out);
    INT2 : GM port map(A, B, GM_out);
    INT3 : TESTBENCH port map(DUT_out, GM_out, A, B);
end TOPMODULE_ARCH;