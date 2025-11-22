library ieee;
use ieee.std_logic_1164.all;

entity jk_ff_tb is
end entity;

architecture testbench of jk_ff_tb is
  component jk_flipflop is
    port (
      J, K, clk, reset : in std_logic;
      Q                : out std_logic
    );
  end component;

  -- Signale für Testbench
  signal J, K, clk, reset : std_logic := '0';
  signal Q                : std_logic;
begin

  -- Instanziierung des Flip-Flops
  uut : jk_flipflop
  port map
  (
    J     => J,
    K     => K,
    clk   => clk,
    reset => reset,
    Q     => Q
  );

  -- Alles in einem Prozess
  process
  begin

    reset <= '0';
    -- Taktzyklus 1: J=1, K=0 (Set) vor Takt setzen
    J <= '1';
    K <= '0';
    wait for 5 ns; -- Signal leicht vor dem Takt
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 5 ns;

    -- Taktzyklus 2: J=0, K=1 (Reset) vor Takt setzen
    J <= '0';
    K <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 5 ns;

    -- Taktzyklus 3: J=1, K=1 (Toggle) vor Takt setzen
    J <= '1';
    K <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 5 ns;

    -- Taktzyklus 4: J=0, K=0 (No change) vor Takt setzen
    J <= '0';
    K <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 5 ns;

    -- Signal aktivieren für Reset
    reset <= '1';
    wait for 5 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 5 ns;

    wait;
  end process;

end architecture;
