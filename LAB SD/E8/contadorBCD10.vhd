library IEEE;
use IEEE.std_logic_1164.all;

entity CONTADORBCD10 is
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
end CONTADORBCD10;

architecture CONTADORBCD10_ARCH of CONTADORBCD10 is

    type estado is (ST0,ST1,ST2,ST3,ST4,ST5,ST6,ST7,ST8,ST9);

    signal currState, nextState : estado;
    signal nextQ : std_logic_vector(3 downto 0);
    signal nextRCO : std_logic;

begin

    sync_proc: process(clock)
    begin
        if rising_edge(clock) then
            currState <= nextState;
            Q <= nextQ;
            RCO <= nextRCO;
        end if;
    end process sync_proc;

    comb_proc: process(currState, reset, load, d, enable, rci)
    begin
        if (reset = '1') then
            nextState <= ST0;
            nextQ <= "0000";
            nextRCO <= '1';
        elsif (load = '1') then
            case (d) is
                when "0000" => 
                    nextState <= ST0;
                    nextQ <= "0000";
                    nextRCO <= '1';
                when "0001" =>
                    nextState <= ST1;
                    nextQ <= "0001";
                    nextRCO <= '1';
                when "0010" =>
                    nextState <= ST2;
                    nextQ <= "0010";
                    nextRCO <= '1';
                when "0011" =>
                    nextState <= ST3;
                    nextQ <= "0011";
                    nextRCO <= '1';
                when "0100" =>
                    nextState <= ST4;
                    nextQ <= "0100";
                    nextRCO <= '1';
                when "0101" =>
                    nextState <= ST5;
                    nextQ <= "0101";
                    nextRCO <= '1';
                when "0110" =>
                    nextState <= ST6;
                    nextQ <= "0110";
                    nextRCO <= '1';
                when "0111" =>
                    nextState <= ST7;
                    nextQ <= "0111";
                    nextRCO <= '1';
                when "1000" =>
                    nextState <= ST8;
                    nextQ <= "1000";
                    nextRCO <= '1';
                when "1001" =>
                    nextState <= ST9;
                    nextQ <= "1001";
                    nextRCO <= '0';
                when others =>
                    nextState <= ST0;
                    nextQ <= "0000";
                    nextRCO <= '1';
            end case;
        elsif (enable = '0') and (rci = '0') then
            case (currState) is
                when ST0 =>
                    nextState <= ST1;
                    nextQ <= "0001";
                    nextRCO <= '1';
                when ST1 =>
                    nextState <= ST2;
                    nextQ <= "0010";
                    nextRCO <= '1';
                when ST2 =>
                    nextState <= ST3;
                    nextQ <= "0011";
                    nextRCO <= '1';
                when ST3 =>
                    nextQ <= "0100";
                    nextRCO <= '1';
                    nextState <= ST4;
                when ST4 =>
                    nextState <= ST5;
                    nextQ <= "0101";
                    nextRCO <= '1';
                when ST5 =>
                    nextState <= ST6;
                    nextQ <= "0110";
                    nextRCO <= '1';
                when ST6 =>
                    nextState <= ST7;
                    nextQ <= "0111";
                    nextRCO <= '1';
                when ST7 =>
                    nextState <= ST8;
                    nextQ <= "1000";
                    nextRCO <= '1';
                when ST8 =>
                    nextState <= ST9;
                    nextQ <= "1001";
                    nextRCO <= '0';
                when ST9 =>
                    nextState <= ST0;
                    nextQ <= "0000";
                    nextRCO <= '1';
                when others =>
                    nextState <= ST0;
                    nextQ <= "0000";
                    nextRCO <= '1';
            end case;
        end if;
    end process comb_proc;
end CONTADORBCD10_ARCH;