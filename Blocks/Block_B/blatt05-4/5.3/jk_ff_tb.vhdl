library ieee;
  use ieee.std_logic_1164.all;

entity jk_ff_tb is
end entity;

architecture testbench of jk_ff_tb is

  component JK_FlipFlop is
    port (
      J, K, clk, reset : in  std_logic;
      Q                : out std_logic
    );
  end component;

  -- signaldeklaration mit defaultwerten
  signal J, K, clk, reset : std_logic := '0';
  signal Q                : std_logic;

begin

  -- Instanziere das zu testende JK-Flip-Flop
  jk_ff_inst: JK_FlipFlop
    port map (
      J     => J,
      K     => K,
      clk   => clk,
      reset => reset,
      Q     => Q
    );

  -- Taktprozess der den Takt generiert und parallel zum Testprozess läuft
  clk_process: process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  -- Testprozess der die Eingangsvariablen setzt
  testing: process
  begin

    -- J,K = 0,0  (Halten)
    J <= '0';
    K <= '0';
    wait for 25 ns;

    -- J,K = 0,1 (Reset)
    J <= '0';
    K <= '1';
    wait for 25 ns;

    -- J,K = 1,0 (Set)
    J <= '1';
    K <= '0';
    wait for 25 ns;

    -- J,K = 1,1 (Toggle)
    J <= '1';
    K <= '1';
    wait for 25 ns;

    -- noch ein Toggle
    J <= '1';
    K <= '1';
    wait for 25 ns;

    -- Reset
    reset <= '1';
    wait for 20 ns;

    wait;
  end process;

end architecture;

