library ieee;
use ieee.std_logic_1164.all;

entity xnorgate is
    -- das  xnorgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
    port( 
        input1 : in std_logic; 
        input2 : in std_logic; 
        xnor_result : out std_logic
    );
end xnorgate;

architecture rtl of xnorgate is

  -- internes Signal, bisher nicht nach aussen verbunden
    signal xnor_gate : std_logic;
begin
    xnor_gate <= input1 xnor input2;
     -- internes Signal wird nach aussen verbunden
    xnor_result <= xnor_gate;
end rtl;