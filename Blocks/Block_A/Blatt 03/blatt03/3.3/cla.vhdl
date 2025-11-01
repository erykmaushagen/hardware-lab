library ieee;
use ieee.std_logic_1164.all;

entity cla is
  port (
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    sum : out std_logic_vector(3 downto 0)
  );
end cla;

-- a simple example for an implementation using 2 predefined components can be found in the nandgate related to exercise sheet 1
-- Ein einfaches Beispiel fuer eine Implementierung die 2 vordefinierte Komponenten verwendet kann im nandgate das Uebungsblatt 1 beilag gefunden werden

architecture rtl of cla is
  component facla is
    port (
  -- ports of the facla

    );
  end component facla;

  component clag is
    port(
  -- ports of the clag 
    
    );
  end component clag;

-- signals   


begin
-- implement cla here

end rtl;
