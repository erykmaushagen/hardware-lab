library ieee;
use ieee.std_logic_1164.all;

entity orgate is
    -- das orgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
    port( 
        input1 : in std_logic; 
        input2 : in std_logic; 
        or_result : out std_logic
    );
end orgate;

architecture rtl of orgate is

  -- internes Signal, bisher nicht nach aussen verbunden
    signal or_gate : std_logic;
begin
    or_gate <= input1 or input2;
     -- internes Signal wird nach aussen verbunden
    or_result <= or_gate;
end rtl;