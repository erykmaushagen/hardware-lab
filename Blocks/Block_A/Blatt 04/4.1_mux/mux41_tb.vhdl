library ieee;
use ieee.std_logic_1164.all;

entity mux41_tb is
end mux41_tb;

architecture testbench of mux41_tb is
  component mux41
    port (
--missing
    );
  end component;

--missing (signals)

begin
    multiplex: mux41 port map(--missing);

    process begin
    --setting the input values
        i0 <= "000";
        i1 <= "001";
        i2 <= "010";
        i3 <= "011";
        --switching which input is propagated
        sel <= "00";
        wait for 10 ns;
        sel <= "01";
        wait for 10 ns;
        sel <= "10";
        wait for 10 ns;
        sel <= "11";
        wait for 10 ns;
        sel <= "10";
        wait for 10 ns;
	sel <= "11";
        wait for 10 ns;

		
        wait;
    end process;
end testbench;
