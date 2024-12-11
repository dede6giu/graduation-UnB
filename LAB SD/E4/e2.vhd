library ieee;
use ieee.std_logic_1164.all;

-- Implementacao do sistema 2 requisitado pelo relatorio
-- Todas as entradas (A, B, C, D, E, F, G) e saidas (Z) sao bits simples
entity SYSTEM2 is
    port (
        A: in std_logic;
        B: in std_logic;
        C: in std_logic;
        D: in std_logic;
        E: in std_logic;
        F: in std_logic;
        G: in std_logic;
        Z: out std_logic
    );
end SYSTEM2;

architecture SYSTEM2_ARCH of SYSTEM2 is

component MUX8X1 is
    port (
        S: in std_logic_vector(2 downto 0);
        D: in std_logic_vector(7 downto 0);
        Y: out std_logic
    );
end component;

component GATEOR is
    port (
        A: in std_logic;
        B: in std_logic;
        Y: out std_logic
    );
end component;

component DECOD4X16 is
    port (
        A: in std_logic_vector(3 downto 0);
        Y: out std_logic_vector(15 downto 0)
    );
end component;

signal decvect   : std_logic_vector(3 downto 0);
signal setvect   : std_logic_vector(2 downto 0);
signal decresult : std_logic_vector(15 downto 0);
signal datain    : std_logic_vector(7 downto 0);

signal wire1, wire2, wire3 : std_logic;

begin
    decvect(3) <= A;
    decvect(2) <= B;
    decvect(1) <= C;
    decvect(0) <= D;

    setvect(2) <= E;
    setvect(1) <= F;
    setvect(0) <= G;

    INT1 : DECOD4X16 port map(decvect, decresult);

    INT2 : GATEOR port map(decresult(0), decresult(15), wire1);
    INT3 : GATEOR port map(decresult(15), decresult(9), wire2);
    INT4 : GATEOR port map(decresult(10), decresult(11), wire3);

    datain(0) <= '0';
    datain(1) <= wire1;
    datain(2) <= decresult(7);
    datain(3) <= '1';
    datain(4) <= wire2;
    datain(5) <= '0';
    datain(6) <= wire3;
    datain(7) <= '1';

    INT5 : MUX8X1 port map(setvect, datain, Z);

end SYSTEM2_ARCH;