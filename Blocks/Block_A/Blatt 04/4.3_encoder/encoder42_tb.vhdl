library ieee;
use ieee.std_logic_1164.all;

entity encoder42_tb is
end encoder42_tb;

architecture testbench of encoder42_tb is
  --missing

  -- Komponente anmelden
  component encoder42 is
    port (
      i : in std_logic_vector(3 downto 0);
      y : out std_logic_vector(1 downto 0)
    );
  end component;

  -- Signale für die Verbindung
  signal i_tb : std_logic_vector(3 downto 0);
  signal y_tb : std_logic_vector(1 downto 0);

begin
  encoder42_test : encoder42
  port map
  (
    i => i_tb,
    y => y_tb
  );

  process begin
    -- Testfall 1
    i_tb <= "0001";
    wait for 10 ns;

    -- Testfall 2
    i_tb <= "0010";
    wait for 10 ns;

    -- Testfall 3
    i_tb <= "0100";
    wait for 10 ns;

    -- Testfall 4
    i_tb <= "1000";
    wait for 10 ns;

    -- Simulation beenden
    wait;
  end process;

end testbench;