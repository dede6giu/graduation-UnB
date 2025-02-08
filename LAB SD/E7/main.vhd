library IEEE;
use IEEE.std_logic_1164.all;

entity MOEDEIRA is
    port (
        A: in std_logic_vector(1 downto 0);
        clock: in std_logic;
        P, Tr25, Tr50: out std_logic
    );
end MOEDEIRA;

architecture MOEDEIRA_ARCH of MOEDEIRA is

    type estado is (ESPR,ST25,ST50,ST75,ST10,ST12,TC75,TC50,TC25);

    signal currState, nextState : estado;

begin

    sync_proc: process(clock)
    begin
        if rising_edge(clock) then
            currState <= nextState;
        end if;
    end process sync_proc;

    comb_proc: process(currState, A)
    begin
        case currState is
            when ESPR =>
                P <= '0';
                Tr25 <= '0';
                Tr50 <= '0';
                case A is
                    when "01"   => nextState <= ST25;
                    when "10"   => nextState <= ST50;
                    when others => nextState <= ESPR;
                end case;
                
            when ST25 =>
                P <= '0';
                Tr25 <= '0';
                Tr50 <= '0';
                case A is
                    when "01"   => nextState <= ST50;
                    when "10"   => nextState <= ST75;
                    when "11"   => nextState <= TC25;
                    when others => nextState <= ST25;
                end case;
                
            when ST50 =>
                P <= '0';
                Tr25 <= '0';
                Tr50 <= '0';
                case A is
                    when "01"   => nextState <= ST75;
                    when "10"   => nextState <= ST10;
                    when "11"   => nextState <= TC50;
                    when others => nextState <= ST50;
                end case;
                
            when ST75 =>
                P <= '0';
                Tr25 <= '0';
                Tr50 <= '0';
                case A is
                    when "01"   => nextState <= ST10;
                    when "10"   => nextState <= ST12;
                    when "11"   => nextState <= TC75;
                    when others => nextState <= ST75;
                end case;
                
            when ST10 =>
                P <= '1';
                Tr25 <= '0';
                Tr50 <= '0';
                nextState <= ESPR;
                
            when ST12 =>
                P <= '1';
                Tr25 <= '0';
                Tr50 <= '0';
                nextState <= TC25;
                
            when TC75 =>
                P <= '0';
                Tr25 <= '1';
                Tr50 <= '1';
                nextState <= ESPR;
                
            when TC50 =>
                P <= '0';
                Tr25 <= '0';
                Tr50 <= '1';
                nextState <= ESPR;
                
            when TC25 =>
                P <= '0';
                Tr25 <= '1';
                Tr50 <= '0';
                nextState <= ESPR;
                
            when others =>
                P <= '0';
                Tr25 <= '0';
                Tr50 <= '0';
                nextState <= ESPR;
        end case;
    end process;
end MOEDEIRA_ARCH;