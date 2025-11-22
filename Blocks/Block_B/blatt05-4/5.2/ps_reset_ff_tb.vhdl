library ieee;
  use ieee.std_logic_1164.all;

entity ps_ff_tb is
end entity;

architecture testbench of ps_ff_tb is

  -- Baustein-Deklaration
  component ps_ff is
    port (
      d, clk, r : in  std_logic;
      Q, not_Q  : out std_logic
    );
  end component;

  -- Signaldeklaration
  signal d, clk, r : std_logic;
  signal Q, not_Q  : std_logic;

begin
  -- Instanziere das zu testende PS-D-Flip-Flop mit Reset
  ps_ff_inst: ps_ff
    port map (
      d     => d,
      r     => r,
      clk   => clk,
      Q     => Q,
      not_Q => not_Q
    );

  -- Testprozess
  process
  begin

    -- Initialwerte
    d <= '0';
    clk <= '0';
    wait for 10 ns;

    -- zu testende Kombinationen von d und clk
    d <= '1';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;

    d <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;

    d <= '1';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;

    -- Teste Reset
    r <= '1';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';

    wait;
  end process;
  --missing
end architecture;
