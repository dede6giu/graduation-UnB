library IEEE;
use IEEE.std_logic_1164.all;

entity TBMOEDEIRA is
    port (
        P, Tr25, Tr50: in std_logic;
        A: out std_logic_vector(1 downto 0);
        clock: out std_logic
    );
end TBMOEDEIRA;

architecture TBMOEDEIRA_ARCH of TBMOEDEIRA is
begin
    process
    begin
        report "Iniciando teste..." severity NOTE;

        -- SETUP
        A <= "00";
        clock <= '1';
        wait for 250 ns;
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "Inicializacao, ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ESPR
        A <= "00";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 00 | ESPR => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;
        A <= "11";
        clock <= '0';
        report "A = 11 | ESPR => ESPR" severity NOTE;
        wait for 250 ns;
        clock <= '1';
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ST25
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ESPR => ST25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;
        
        -- ST25 => ST25
        A <= "00";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 00 | ST25 => ST25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST25 => TC25
        A <= "11";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 11 | ST25 => TC25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '1') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;
        
        -- TC25 => ESPR
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | TC25 => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ST25
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ESPR => ST25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST25 => ST50
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ST25 => ST50" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST50 => ST50
        A <= "00";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 00 | ST50 => ST50" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST50 => TC50
        A <= "11";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 11 | ST50 => TC50" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '1') report "Falha." severity ERROR;
        
        -- TC50 => ESPR
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | TC50 => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ST50
        A <= "10";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 10 | ESPR => ST50" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST50 => ST75
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ST50 => ST75" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST75 => ST75
        A <= "00";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 00 | ST75 => ST75" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST75 => TC75
        A <= "11";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 11 | ST75 => TC75" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '1') report "Falha." severity ERROR;
        assert (Tr50 = '1') report "Falha." severity ERROR;

        -- TC75 => ESPR
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | TC75 => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ST25
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ESPR => ST25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST25 => ST75
        A <= "10";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 10 | ST25 => ST75" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST75 => ST12
        A <= "10";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 10 | ST75 => ST12" severity NOTE;
        wait for 250 ns;
        assert (P = '1')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST12 => TC25
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | ST12 => TC25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '1') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- TC25 => ESPR
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | TC25 => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ST25
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ESPR => ST25" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST25 => ST75
        A <= "10";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 10 | ST25 => ST75" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST75 => ST10
        A <= "01";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 01 | ST75 => ST10" severity NOTE;
        wait for 250 ns;
        assert (P = '1')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST10 => ESPR
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | ST10 => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ESPR => ST50
        A <= "10";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 10 | ESPR => ST50" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        -- ST50 => ST10
        A <= "10";
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = 10 | ST50 => ST10" severity NOTE;
        wait for 250 ns;
        assert (P = '1')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;
        
        -- ST10 => ESPR
        -- INDEPENDE DE A
        clock <= '0';
        wait for 250 ns;
        clock <= '1';
        report "A = XX | ST10 => ESPR" severity NOTE;
        wait for 250 ns;
        assert (P = '0')    report "Falha." severity ERROR;
        assert (Tr25 = '0') report "Falha." severity ERROR;
        assert (Tr50 = '0') report "Falha." severity ERROR;

        report "Teste finalizado." severity NOTE;
        wait;
    end process;
end TBMOEDEIRA_ARCH;