library ieee;
use ieee.std_logic_1164.all;

-- create testbench for and_gate
-- can be left empty, since test bench (this file) has no inputs or outputs
entity andgate_tb is
end andgate_tb;

architecture test of andgate_tb is
  -- component declaration, so that it can be instantiated later
  -- must have same name and port list as the entity
  component andgate
      port (
        input1 : in std_logic;
        input2 : in std_logic;
        and_result : out std_logic
      );
  end component;
-- define the signals that will be used in test
  signal a, b, c : std_logic;
-- begin test code
begin
  -- creates an instance of andgate
  and_g: andgate port map(input1 => a, input2 => b, and_result => c);

  -- teste logische Korrektheit:
  process begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;
    a <= 'X';
    b <= 'W';
    wait for 10 ns;

    
    -- Stabilisiere das Signal:
    a <= '0'; 
    b <= '0';
    wait for 30 ns; 
    -- Ausgangssignal nun auf '0', simuliere Impuls: 

    a <= '1'; 
    b <= '1';
    
    -- Check 1: Nach 14ns darf sich nichts geändert haben (von '0' auf '1'),sonst Änderung zu früh!
    wait for 14 ns;
    assert c /= '1' 
      report "FEHLER: Signal hat sich nach 14 ns bereits geändert (zu früh)!" 
      severity error;
    
    -- Check 2: Nach 16ns muss sich etwas geändert haben (von'0' auf '1' annehmen)
    wait for 2 ns;
    assert c = '1' 
      report "FEHLER: Signal hat sich nach 16 ns nicht geändert (Delay funktioniert nicht)!" 
      severity error;
    
    report "Test: Transport Delay korrekt";

    assert false report "End of test";
    wait;
  end process;
end test;
