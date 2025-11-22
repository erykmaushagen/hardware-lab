library ieee;
  use ieee.std_logic_1164.all;

entity D_Latch_tb is
end entity;

architecture testbench of D_Latch_tb is

  -- definiere die zu testende D-Latch Komponente
  component D_Latch is
    port (
      D, clk   : in  std_logic;
      Q, not_Q : out std_logic
    );
  end component;

  -- Signale für die Eingänge und Ausgänge der D-Latch
  signal d     : std_logic;
  signal clk   : std_logic;
  signal q     : std_logic;
  signal not_q : std_logic;

begin

  -- istanziere die zu testende D-Latch
  d_latch_inst: D_Latch
    port map (
      D     => d,
      clk   => clk,
      Q     => q,
      not_Q => not_q
    );

  process
  begin
    clk <= '1';
    d <= '0';
    wait for 10 ns;
    clk <= '0';
    d <= '0';
    wait for 10 ns;
    clk <= '1';
    d <= '0';
    wait for 10 ns;
    clk <= '0';
    d <= '1';
    wait for 10 ns;
    clk <= '1';
    d <= '1';
    wait for 10 ns;
    clk <= '0';
    d <= '0';
    wait for 10 ns;
    wait;
  end process;
end architecture;
