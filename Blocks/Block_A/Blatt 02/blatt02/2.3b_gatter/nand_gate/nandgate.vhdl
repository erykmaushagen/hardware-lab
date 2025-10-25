library ieee;
use ieee.std_logic_1164.all;

entity nandgate is
 
  -- das nandgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
    port( 
        input1 : in std_logic; -- 
        input2 : in std_logic; 
        nand_result : out std_logic
    );
end nandgate;

architecture rtl of nandgate is

  -- internes Signal, bisher nicht nach aussen verbunden
    signal nand_gate : std_logic;
begin
    nand_gate <= input1 nand input2;
     -- internes Signal wird nach aussen verbunden
    nand_result <= nand_gate;
end rtl;