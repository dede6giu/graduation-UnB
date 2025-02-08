library IEEE;
use IEEE.std_logic_1164.all;

entity TMMOEDEIRA is
end TMMOEDEIRA;

architecture TMMOEDEIRA_ARCH of TMMOEDEIRA is
    component MOEDEIRA is
        port (
            A: in std_logic_vector(1 downto 0);
            clock: in std_logic;
            P, Tr25, Tr50: out std_logic
        );
    end component;

    component TBMOEDEIRA is
        port (
            P, Tr25, Tr50: in std_logic;
            A: out std_logic_vector(1 downto 0);
            clock: out std_logic
        );
    end component;

    signal A : std_logic_vector(1 downto 0);
    signal P, Tr25, Tr50, clock : std_logic;

begin
    INT1 : MOEDEIRA port map(A, clock, P, Tr25, Tr50);
    INT2 : TBMOEDEIRA port map(P, Tr25, Tr50, A, clock);
end TMMOEDEIRA_ARCH;