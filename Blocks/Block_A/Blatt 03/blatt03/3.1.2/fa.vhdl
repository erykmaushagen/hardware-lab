library ieee;
use ieee.std_logic_1164.all;

entity fa is
  port (
    a : in std_logic;
    b : in std_logic;
    cin : in std_logic; -- entspricht c(n-1)
    cout : out std_logic; -- entspricht c(n)
    sum : out std_logic -- entspricht s(n)
  );
end fa;

architecture rtl of fa is
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
begin
  -- Implementierug des Volladdierers auf Basis der in a) definierten Rechenschaltung
  wire_1 <= a and b; 
  wire_2 <= a xor b; 
  wire_3 <= cin and wire_2; 
  cout <= wire_1 or wire_3; 
  sum <= wire_2 xor cin;
end rtl;
