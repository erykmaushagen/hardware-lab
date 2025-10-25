library ieee;
use ieee.std_logic_1164.all;

entity norgate is
    -- das norgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
    port( 
        input1 : in std_logic; 
        input2 : in std_logic; 
        nor_result : out std_logic
    );
end norgate;

architecture rtl of norgate is

  -- internes Signal, bisher nicht nach aussen verbunden
    signal nor_gate : std_logic;
begin
    nor_gate <= input1 nor input2;
     -- internes Signal wird nach aussen verbunden
    nor_result <= nor_gate;
end rtl;