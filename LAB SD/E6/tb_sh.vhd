library IEEE;
use IEEE.std_logic_1164.all;

entity TBSH is
    port (
        DUT_out: in std_logic_vector(3 downto 0);
        clk, rst, load, DIR, L, R: out std_logic;
        D: out std_logic_vector(3 downto 0)
    );
end TBSH;

architecture TBSH_ARCH of TBSH is
begin
    process
    begin
        report "Iniciando teste..." severity NOTE;

        clk <= '0';
        rst <= '1';
        load <= '0';
        D <= "0000";
        DIR <= '0';
        L <= '0';
        R <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = "0000") report "Falha no Teste 1." severity ERROR;

        clk <= '0';
        rst <= '0';
        load <= '1';
        D <= "0110";
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = "0110") report "Falha no Teste 2." severity ERROR;

        clk <= '0';
        load <= '0';
        DIR <= '0';
        L <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = "1100") report "Falha no Teste 3." severity ERROR;

        clk <= '0';
        DIR <= '0';
        L <= '1';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = "1001") report "Falha no Teste 4." severity ERROR;

        clk <= '0';
        DIR <= '1';
        R <= '0';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = "0100") report "Falha no Teste 5." severity ERROR;

        clk <= '0';
        DIR <= '1';
        R <= '1';
        wait for 250 ns;
        clk <= '1';
        wait for 250 ns;
        assert (DUT_out = "1010") report "Falha no Teste 6." severity ERROR;
        
        report "Teste finalizado." severity NOTE;
        wait;
    end process;
end TBSH_ARCH;