library ieee;
use ieee.std_logic_1164.all;


-- definiere Entität
entity facla is
  port (
    a : in std_logic;
    b : in std_logic;
    cin : in std_logic;
    g : out std_logic;
    p : out std_logic;
    sum : out std_logic
  );
end facla;

-- definiere Architektur mit Eigenschaften von FACLA
architecture rtl of facla is
 --add implementation
begin
  g <= a and b; -- generates Carry
  p <= a or b; -- propagate Carry, dient der Übergabe eines Carry's 
  sum <= a xor b xor cin; 
end rtl;
