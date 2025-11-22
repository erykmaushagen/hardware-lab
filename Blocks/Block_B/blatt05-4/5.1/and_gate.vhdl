
library ieee;
use ieee.std_logic_1164.all;
entity and_gate is

  port (
    input1     : in std_logic;
    input2     : in std_logic;
    and_result : out std_logic
  );
end and_gate;
architecture rtl of and_gate is

  signal and_gate_signal : std_logic;

begin
  and_gate_signal <= input1 and input2;

  and_result <= and_gate_signal;
end rtl;
