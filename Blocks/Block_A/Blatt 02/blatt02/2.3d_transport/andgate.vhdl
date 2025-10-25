

-- wir verwenden std_logic_1164 aus der IEEE libary
-- diese Datei definiert die Standards fuer logische Werte im elektronischen Design
-- Details finden sich in der Datei std_logic_1164.vhdl in ghdl/libraries/ieee
-- Die IEEE libary definiert auch operatoren und Schluesselwoerter

library ieee;
use ieee.std_logic_1164.all;


entity andgate is
  -- das andgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
  
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
  );
end andgate;


architecture rtl of andgate is
  -- internes Signal, bisher nicht nach aussen verbunden
  signal and_gate : std_logic;
  
begin
  -- internes Signal wird entsprechend der benoetigten Funktionalitaet gesetzt (hier: logisches und der Eingabewerte)

  and_gate <= input1 and input2;
  -- internes Signal wird nach aussen verbunden
  and_result <= transport and_gate after 15 ns; -- verzögerte Signalzuweisung
end rtl;

