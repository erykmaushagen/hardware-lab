library ieee;
use ieee.std_logic_1164.all;

entity SR_Latch_tb is
end SR_Latch_tb;

architecture testbench of SR_Latch_tb is

--missing

begin

--missing
    process begin

        S <= '1';
        R <= '0';
        wait for 10 ns;
        S <= '0';
        R <= '1';
        wait for 10 ns;
        S <= '0';
        R <= '0';
        wait for 10 ns;
        S <= '1';
        R <= '1';
        wait for 10 ns;
        wait;
    end process;
end testbench;
