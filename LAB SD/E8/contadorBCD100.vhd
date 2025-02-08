library IEEE;
use IEEE.std_logic_1164.all;

entity CONTADORBCD100 is
    port (
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        rci: in std_logic;
        load: in std_logic;
        d_uni: in std_logic_vector(3 downto 0);
        d_dez: in std_logic_vector(3 downto 0);
        Q_uni: out std_logic_vector(3 downto 0);
        Q_dez: out std_logic_vector(3 downto 0);
        RCO: out std_logic
    );
end CONTADORBCD100;

architecture CONTADORBCD100_ARCH of CONTADORBCD100 is
    component CONTADORBCD10 is
        port (
            clock: in std_logic;
            reset: in std_logic;
            enable: in std_logic;
            rci: in std_logic;
            load: in std_logic;
            d: in std_logic_vector(3 downto 0);
            Q: out std_logic_vector(3 downto 0);
            RCO: out std_logic
        );
    end component;

    signal uRCO, dRCO : std_logic;

begin
    INT1 : CONTADORBCD10 port map(clock, reset, enable, rci, load, d_uni, Q_uni, uRCO);
    INT2 : CONTADORBCD10 port map(clock, reset, enable, uRCO, load, d_dez, Q_dez, dRCO);

    RCO <= uRCO or dRCO;

end CONTADORBCD100_ARCH;