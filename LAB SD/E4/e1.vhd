library ieee;
use ieee.std_logic_1164.all;

-- Implementacao do sistema 1 requisitado pelo relatorio
-- Todas as entradas (A, B, C) e saidas (X, Y) sao bits simples
entity SYSTEM1 is
    port (
        A: in std_logic;
        B: in std_logic;
        C: in std_logic;
        X: out std_logic;
        Y: out std_logic
    );
end SYSTEM1;

architecture SYSTEM1_ARCH of SYSTEM1 is
component MUX4X1 is
    port (
        S: in std_logic_vector(1 downto 0);
        D: in std_logic_vector(3 downto 0);
        Y: out std_logic
    );
end component;

component GATENOT is
    port (
        A: in std_logic;
        Y: out std_logic
    );
end component;

signal setvect      : std_logic_vector(1 downto 0);
signal data1, data2 : std_logic_vector(3 downto 0);
signal notC         : std_logic;

begin
    setvect(0) <= B;
    setvect(1) <= A;

    INT1 : GATENOT port map(C, notC);

    data1(0) <= '0';
    data1(1) <= C;
    data1(2) <= notC;
    data1(3) <= '1';

    data2(0) <= '1';
    data2(1) <= notC;
    data2(2) <= '0';
    data2(3) <= C;

    INT2 : MUX4X1 port map(setvect, data2, Y);
    INT3 : MUX4X1 port map(setvect, data1, X);
end SYSTEM1_ARCH;