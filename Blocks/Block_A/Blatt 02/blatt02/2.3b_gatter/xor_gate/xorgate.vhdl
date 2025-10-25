library ieee;
use ieee.std_logic_1164.all;

entity xorgate is
    -- das xorgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
    port( 
        input1 : in std_logic; 
        input2 : in std_logic; 
        xor_result : out std_logic
    );
end xorgate;

architecture rtl of xorgate is

  -- internes Signal, bisher nicht nach aussen verbunden
    signal xor_gate : std_logic;
begin
    xor_gate <= input1 xor input2;
     -- internes Signal wird nach aussen verbunden
    xor_result <= xor_gate;
end rtl;



