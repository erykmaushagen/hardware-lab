library ieee;
use ieee.std_logic_1164.all;

entity sipo_register_tb is
end sipo_register_tb;

architecture rtl of sipo_register_tb is

  component sipo_register is
    port (
      serial_in, clear, clock : in std_logic;
      Q                       : out std_logic_vector(3 downto 0)
    );
  end component;

  -- definiere signale
  signal serial_in : std_logic;
  signal clear     : std_logic;
  signal clock     : std_logic;
  signal Q         : std_logic_vector(3 downto 0);

begin
  -- fehlt
  uut : sipo_register
  port map
  (
    serial_in => serial_in,
    clear     => clear,
    clock     => clock,
    Q         => Q
  );
  process begin
    -- Ziel: serieller Eingang "1010" liegt parallel an Q1-Q4 zum 4.ten Takt
    -- SIPO initialisieren indem man es zurueck setzt
    clock     <= '0';
    clear     <= '0';
    serial_in <= '0';
    wait for 10 ns;
    --Zuruecksetzen.

    clock <= '1';

    wait for 10 ns;
    clock <= '0';

    wait for 10 ns;

    --Uebergebe die Bitsequenz 1010 
    --erstes Bit
    serial_in <= '1';
    clock     <= '1';
    wait for 10 ns;

    clock <= '0';
    wait for 10 ns;
    --weitere Bits
    --vervollstandigen

    -- zweiter Takt Übernahme des 2.ten Bits von "1010"
    serial_in <= '0';
    clock     <= '1';
    wait for 10 ns;

    clock <= '0';
    wait for 10 ns;

    -- dritter Takt Übernahme des 3.ten Bits aus ser. input "1010"
    serial_in <= '1';
    clock     <= '1';
    wait for 10 ns;

    clock <= '0';
    wait for 10 ns;

    -- vierter Takt Übernahme des 4.ten Bits aus ser. input "1010"
    serial_in <= '0';
    clock     <= '1';
    wait for 10 ns;

    clock <= '0';
    wait for 10 ns;
    -- => nach 4.tem takt sollte also paraller Output an Q1-Q4 liegen:
    -- Q4 = 1; Q3 = 0; Q2 = 1; Q1 = 0

    --Zuruecksetzen.
    clear <= '1';
    clock <= '1';
    wait for 10 ns;

    clock <= '0';
    wait for 10 ns;

    wait;
  end process;

end rtl;
