library ieee;
  use ieee.std_logic_1164.all;

entity ps_ff_tb is
end entity;

architecture testbench of ps_ff_tb is

  -- Baustein-Deklaration
  component ps_ff is
    port (
      d, clk   : in  std_logic;
      Q, not_Q : out std_logic
    );
  end component;

  -- Signaldeklaration
  signal d_tb, clk_tb   : std_logic;
  signal Q_tb, not_Q_tb : std_logic;

begin
  -- Instanziere das zu testende PS-Flip-Flop
  ps_ff_inst: ps_ff
    port map (
      d     => d_tb,
      clk   => clk_tb,
      Q     => Q_tb,
      not_Q => not_Q_tb
    );

  -- Testprozess
  process
  begin
    -- Initialwerte
    d_tb <= '0';
    clk_tb <= '0';
    wait for 10 ns;

    -- zu testende Kombinationen von d und clk
    d_tb <= '1';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns;
    clk_tb <= '0';
    wait for 10 ns;

    d_tb <= '0';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns;
    clk_tb <= '0';
    wait for 10 ns;

    d_tb <= '1';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns;
    clk_tb <= '0';
    wait for 10 ns;

    wait;
  end process;
  --missing
end architecture;
