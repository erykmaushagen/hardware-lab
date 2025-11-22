
library ieee;
  use ieee.std_logic_1164.all;

entity and_gate is

  port (
    input1     : in  std_logic;
    input2     : in  std_logic;
    and_result : out std_logic
  );
end entity;

architecture rtl of and_gate is
  -- internal signal, not yet connected to the outside
  signal and_gate : std_logic;

begin

  and_gate   <= input1 and input2;
  and_result <= and_gate;
end architecture;


