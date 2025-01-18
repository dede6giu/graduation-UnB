library IEEE;
use IEEE.std_logic_1164.all;

entity TBJK is
    port (
        DUT_out: in std_logic;
        J, K, clk, CLR, PR: out std_logic
    );
end TBJK;

architecture TBJK_ARCH of TBJK is
begin
    process
    begin
        report "Iniciando teste..." severity NOTE;

        J <= '0';
        K <= '0';
        CLR <= '0';
        PR <= '1';
        clk <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = '1') report "Falha no Teste 1." severity ERROR;

        PR <= '0';
        CLR <= '1';
        clk <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = '0') report "Falha no Teste 2." severity ERROR;

        CLR <= '0';
        J <= '0';
        K <= '0';
        clk <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = '0') report "Falha no Teste 3." severity ERROR;
        
        J <= '1';
        K <= '0';
        clk <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = '1') report "Falha no Teste 4." severity ERROR;

        J <= '0';
        K <= '1';
        clk <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = '0') report "Falha no Teste 5." severity ERROR;

        J <= '1';
        K <= '1';
        clk <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = '1') report "Falha no Teste 6." severity ERROR;

        report "Teste finalizado." severity NOTE;
        wait;
    end process;
end TBJK_ARCH;