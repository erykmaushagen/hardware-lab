library ieee;
use ieee.std_logic_1164.all;

entity clag is
  port (
    gin : in std_logic_vector(3 downto 0);
    pin : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic_vector(3 downto 0);
    pout : out std_logic;
    gout : out std_logic
  );
end clag;

architecture rtl of clag is
-- implement clag here
