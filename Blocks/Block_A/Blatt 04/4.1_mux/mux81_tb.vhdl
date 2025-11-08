library ieee;
use ieee.std_logic_1164.all;

entity mux81_tb is
end mux81_tb;

architecture testbench of mux81_tb is
  component mux81
    port (--missing);
  end component;

--missing (Signale)

begin
    multiplex: mux81 port map(--missing);



    -- 
    process begin
    -- Die vorgegebenen Werte werden an die Eingaenge des 8:1 Mux angelegt
        i0_81 <= "000";
        i1_81 <= "001";
        i2_81 <= "010";
        i3_81 <= "011";
        i4_81 <= "100";
        i5_81 <= "101";
        i6_81 <= "110";
        i7_81 <= "111";
        
    -- Die Eingaenge werden der Reihe nach durchgeschaltet    
        sel_81 <= "000";
        wait for 10 ns;
        sel_81 <= "001";
        wait for 10 ns;
        -- die weiteren Faelle fehlen und sollen ergaenzt werden
        wait for 10 ns;
        wait;
    end process;
end testbench;
