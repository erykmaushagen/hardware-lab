library ieee;
use ieee.std_logic_1164.all;

entity sync_counter_b_tb is
end sync_counter_b_tb;

architecture tb of sync_counter_b_tb is
  component sync_counter is
    port (
      reset, clk, C, D : in std_logic;
      q1, q0           : out std_logic
    );
  end component;
  -- missing

  signal clk, reset, C, D : std_logic := '0';
  signal q0, q1           : std_logic;

begin
  -- missing
  testing : sync_counter
  port map
  (
    reset => reset,
    clk   => clk,
    C     => C,
    D     => D,
    q1    => q1,
    q0    => q0
  );
  process
  begin
    -- Reset aktiv
    reset <= '1';
    C     <= '0';
    D     <= '0';
    clk   <= '0';
    wait for 20 ns;

    reset <= '0';

    -- Simulationsschritte innerhalb eines Prozesses
    -- Beispiel: 5 Takte vorwärts
    C <= '1';
    D <= '0';
    for i in 1 to 5 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    -- 3 Takte rückwärts
    D <= '1';
    for i in 1 to 3 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    -- Count deaktivieren
    C <= '0';
    for i in 1 to 2 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    -- Simulation anhalten
    wait;
  end process;

end architecture;