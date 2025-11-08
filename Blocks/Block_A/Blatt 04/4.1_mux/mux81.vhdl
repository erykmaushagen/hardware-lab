LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux81 IS
    PORT (
        i0_81 : IN std_logic_vector(2 DOWNTO 0); 
        i1_81 : IN std_logic_vector(2 DOWNTO 0);
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
END mux81;

ARCHITECTURE rtl OF mux81 IS

    COMPONENT mux41 IS
        PORT (
            i0 : IN std_logic_vector(2 DOWNTO 0); 
            i1 : IN std_logic_vector(2 DOWNTO 0);
            i2 : IN std_logic_vector(2 DOWNTO 0);
            i3 : IN std_logic_vector(2 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0); 
            y : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
    
    -- weitere Komponenten 
    
    
    -- Signale
begin

    --missing;
    -- hier werden die einzelnen Komponenten verschaltet

end rtl;

