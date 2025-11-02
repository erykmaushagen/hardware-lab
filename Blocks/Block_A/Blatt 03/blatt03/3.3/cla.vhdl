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
      -- implement the ports here
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      g : out std_logic;
      p : out std_logic;
      sum : out std_logic
    );
  end component facla;

  component clag is
    port(
  -- ports of the clag 
    gin : in std_logic_vector(3 downto 0);
    pin : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic_vector(3 downto 0);
    pout : out std_logic;
    gout : out std_logic
    );
  end component clag;

-- signals   
signal wire_c : std_logic_vector(3 downto 0);
signal wire_p : std_logic_vector(3 downto 0);
signal wire_g : std_logic_vector(3 downto 0);
signal gout_i, pout_i : std_logic;

begin
-- implement cla here
-- definiere die Verknüpfung aller 4 FACLA's
  element1 : facla port map(a => a(0), b => b(0), cin => cin, g => wire_g(0), p => wire_p(0), sum => sum(0));
  element2 : facla port map(a => a(1), b => b(1), cin => wire_c(0), g => wire_g(1), p => wire_p(1), sum => sum(1));
  element3 : facla port map(a => a(2), b => b(2), cin => wire_c(1), g => wire_g(2), p => wire_p(2), sum => sum(2));
  element4 : facla port map(a => a(3), b => b(3), cin => wire_c(2), g => wire_g(3), p => wire_p(3), sum => sum(3));

  -- CLAG's Verbindugen:
  element5 : clag  port map(pin => wire_p, gin => wire_g, cin => cin, cout => wire_c, pout => pout_i, gout => gout_i);
  -- Carry der gesamten Addition von CLA ist dritter Wert des C-Vektors
  cout <= wire_c(3);
end rtl;
