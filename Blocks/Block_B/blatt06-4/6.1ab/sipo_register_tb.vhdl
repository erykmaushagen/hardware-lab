library ieee;
use ieee.std_logic_1164.all;

entity sipo_register_tb is 
end sipo_register_tb;

architecture rtl of sipo_register_tb is

-- fehlt
    
begin
   -- fehlt

    process begin
       -- SIPO initialisieren indem man es zurueck setzt
        clock <= '0'; 
        clear <= '0';
        serial_data_input <= '0';
        wait for 10 ns;
        --Zuruecksetzen.
        clear <= '1';
        clock <= '1';
        
        wait for 10 ns;
        clock <= '0'; 
        clear <= '0';
        wait for 10 ns;

        --Uebergebe die Bitsequenz 1000 
        --erstes Bit
        serial_data_input <= '1';
        clock <= '1';
        wait for 10 ns;
        clock <= '0'; 
        wait for 10 ns; 
        --weitere Bits
        --vervollstandigen
             
        --Pause, nichts aendert sich
        wait for 30 ns; 
        --Zuruecksetzen.
        clear <= '1';
        clock <= '1';
        serial_data_input <= '0';
        wait for 10 ns;
        clock <= '0'; 
        clear <= '0';
        wait for 10 ns;
        
        --Uebergebe weite Bitsequenz 
        
        wait;
    end process; 
    
end rtl; 
