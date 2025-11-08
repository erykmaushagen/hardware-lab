LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        I_n : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        Y0 : OUT std_logic_vector(2 DOWNTO 0);
        Y1 : OUT std_logic_vector(2 DOWNTO 0);
        Y2 : OUT std_logic_vector(2 DOWNTO 0);
        Y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;

ARCHITECTURE rtl OF demux14 IS
--missing

END rtl;

