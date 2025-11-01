library ieee;
use ieee.std_logic_1164.all;

entity rca is
  port (
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    sum : out std_logic_vector(7 downto 0)
    -- missing port(s)?
  );
end rca;

architecture rtl of rca is
  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic
    );
  end component;
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
  -- more wires?
begin
  add0 : fa port map(a => a(0), b => b(0), cin => '0', cout => wire_1, sum => sum(0));
-- ?
end rtl;
