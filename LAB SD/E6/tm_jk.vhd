library IEEE;
use IEEE.std_logic_1164.all;

entity TMJK is
end TMJK;

architecture TMJK_ARCH of TMJK is
    component JK is
        port (
            J, K, clk, CLR, PR: in std_logic;
            Q: out std_logic
        );
    end component;

    component TBJK is
        port (
            DUT_out: in std_logic;
            J, K, clk, CLR, PR: out std_logic
        );
    end component;

    signal J, K, clk, CLR, PR : std_logic;
    signal DUT_out : std_logic;

begin
    INT1 : JK port map(J, K, clk, CLR, PR, DUT_out);
    INT2 : TBJK port map(DUT_out, J, K, clk, CLR, PR);
end TMJK_ARCH;