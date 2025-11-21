library ieee;
use ieee.std_logic_1164.all;

entity D_Latch_tb is
end D_Latch_tb;

architecture testbench of D_Latch_tb is

--missing

begin

--missing

    process begin
        clk <= '1';
        d <= '0';
        wait for 10 ns;
        clk <= '0';
        d <= '0';
        wait for 10 ns;
        clk <= '1';
        d <= '0';
        wait for 10 ns;
        clk <= '0';
        d <= '1';
        wait for 10 ns;
        clk <= '1';
        d <= '1';
        wait for 10 ns;
		clk <= '0';
        d <= '0';
        wait for 10 ns;
        wait;
    end process;
end testbench;