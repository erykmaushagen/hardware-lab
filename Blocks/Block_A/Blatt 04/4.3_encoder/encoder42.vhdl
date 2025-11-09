library ieee;
use ieee.std_logic_1164.all;

entity encoder42 is
  port (
    i : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(1 downto 0)
  );
end encoder42;

architecture rtl of encoder42 is
  --missing
  -- and-Gatter anmelden
  component and_gate_2 is
    port (
      input1     : in std_logic;
      input2     : in std_logic;
      and_result : out std_logic
    );
  end component;
  -- not-Gatter anmelden
  component not_gate is
    port (
      input1     : in std_logic;
      not_output : out std_logic
    );
  end component;
  -- oder-Gatter anmelden
  component or_gate is
    port (
      input1    : in std_logic;
      input2    : in std_logic;
      or_result : out std_logic
    );
  end component;

  -- definiere interne Signale
  signal and_1 : std_logic;
  signal not_1 : std_logic;

begin
  -- not-Gatter instanzieren
  not_instance : not_gate
  port map
  (
    input1 => i(2), not_output => not_1
  );
  -- and-Gatter instanzieren
  and_instance : and_gate_2
  port map
  (
    input1 => i(1), input2 => not_1, and_result => and_1
  );
  -- oder-Gatter instanzieren 
  or_instance_1 : or_gate
  port map
  (
    input1 => i(2), input2 => i(3), or_result => y(1)
  );
  -- oder-Gatter instanzieren
  or_instance_2 : or_gate
  port map
  (
    input1 => and_1, input2 => i(3), or_result => y(0)
  );
end rtl;
