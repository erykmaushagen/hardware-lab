library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is
end fa_tb;

architecture test of fa_tb is
  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic
    );
  end component;

signal a, b, cin, cout, sum : std_ulogic;
begin
  -- DEFINE PORTMAP 
  -- Portmap definieren
  full_adder: fa port map(??);

  process begin
    -- IMPLEMENT TEST HERE
    -- Test hier implementieren
    wait;
  end process;
end test;
