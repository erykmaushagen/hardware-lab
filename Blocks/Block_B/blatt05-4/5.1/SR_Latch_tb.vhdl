library ieee;
use ieee.std_logic_1164.all;

entity SR_Latch_tb is
end entity;

architecture testbench of SR_Latch_tb is

  --missing
  component SR_Latch is
    port (
      S, R     : in std_logic;
      Q, not_Q : out std_logic
    );
  end component;

  signal S     : std_logic;
  signal R     : std_logic;
  signal Q     : std_logic;
  signal not_Q : std_logic;
begin
  -- instanziere die zu testende SR-Latch
  lr_latch_inst : SR_Latch
  port map
  (
    S     => S,
    R     => R,
    Q     => Q,
    not_Q => not_Q
  );

  --missing
  process
  begin
    -- vorgegebene Testsequenz
    S <= '1'; -- set
    R <= '0';
    wait for 10 ns;
    S <= '0'; --reset
    R <= '1';
    wait for 10 ns;
    S <= '0'; -- hold
    R <= '0';
    wait for 10 ns;
    S <= '1'; -- invalid
    R <= '1';
    wait for 10 ns;

    -- 5.1.1b Testsequenz: 

    -- Reset
    S <= '0';
    R <= '1';
    wait for 10 ns;
    S <= '0';
    R <= '0';
    wait for 5 ns;

    -- Andere Reihenfolge: Reset kurz, dann Set kurz
    S <= '0';
    R <= '1';
    wait for 5 ns;
    S <= '1';
    R <= '0';
    wait for 5 ns;
    S <= '0';
    R <= '0';
    wait for 10 ns;

    -- Stress: sehr kurze Pulse und nochmal invalid
    S <= '1';
    R <= '0';
    wait for 1 ns;
    S <= '0';
    R <= '1';
    wait for 5 ns;
    S <= '1';
    R <= '1';
    wait for 5 ns;
    S <= '0';
    R <= '1';
    wait for 10 ns;
    S <= '0';
    R <= '';
    wait for 10 ns;

    -- Invalid: beide '1' (bei NOR-Latch problematisch)
    S <= '1';
    R <= '1';
    wait for 1 ns;
    -- führt zu: "./sr_latch_tb:info: simulation stopped @107ns by --stop-delta=5000\n

    -- Release schnell in 0/0 => Ausgang kann je nach Gate-Verzögerungen verschieden enden also Q=0 oder Q=1
    -- abhängig davon, welches NOR-Gate zuletzt "gearbeitet" hat
    S <= '0';
    R <= '0';
    wait for 10 ns;

    wait;
  end process;
end architecture;
