


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
  signal and_gate : std_logic;
begin
  and_gate <= input1 and input2 after 10 ns;
  -- Inertial Delay: Nur Impulse >= 10ns werden übertragen, Verzögerung 10ns
  
  and_result <= transport and_gate after 15 ns; -- verzögerte Signalzuweisung aus d)
  -- => Delay summiert sich auf 25 ns 10 ns durch 'inertial delay' und dann 15 ns 
  --    durch 'transport Delay'
end rtl;

