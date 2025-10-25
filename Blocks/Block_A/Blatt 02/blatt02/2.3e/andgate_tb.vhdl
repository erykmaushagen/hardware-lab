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
  
  process begin
    -- *******************************
    -- TEST: Trägheitsverzögerung
    -- *******************************
    -- Initialisierung:
    a <= '0'; 
    b <= '0';
    wait for 30 ns; -- nun stabiles Signal mit Signalwert '1'

    -- Test 1: 
    report "Test 1: Langer Impuls (20 ns)";
    a <= '1'; 
    b <= '1';
    wait for 15 ns;
    a <= '0';
    wait for 30 ns;
    -- erwartet: Signal c wechselt auf '1' nach 15ns, dann zurück auf '0'
    -- => Impuls >= 10ns, daher NICHT unterdrückt

    -- Test 2:
    report "Test 2: Kurzer Impuls (5 ns) - sollte ignoriert werden";
    a <= '0'; 
    b <= '0';
    wait for 30 ns; -- Signal stabilisieren
    a <= '1'; 
    b <= '1';
    wait for 5 ns;  -- ← Nur 5 ns!
    a <= '0';
    wait for 30 ns;
    -- ERWARTET: Signal c bleibt bei permanent bei '0'
    -- => : Sginalwechsle soll unterdrückt werden

    -- Test 3:
    report "Test 3: Kurzer Impuls (1 ns) - sollte ignoriert werden";
    a <= '0'; 
    b <= '0';
    wait for 30 ns; -- Signal stabilisieren
    a <= '1'; 
    b <= '1';
    wait for 1 ns;  -- ← Nur 1 ns!
    a <= '0';
    wait for 30 ns;
    -- ERWARTET: Signal c bleibt bei permanent bei '0'
    -- => : Sginalwechsle soll unterdrückt werden
    

    assert false report "End of test";
    wait;
  end process;
end test;
