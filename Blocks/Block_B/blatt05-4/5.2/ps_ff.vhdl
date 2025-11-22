library ieee;
  use ieee.std_logic_1164.all;

entity ps_ff is
  port (
    d, clk   : in  std_logic;
    Q, not_Q : out std_logic
  );
end entity;

architecture behavioral of ps_ff is

  -- verwende D-Latch als Baustein
  component D_Latch is
    port (
      D, clk   : in  std_logic;
      Q, not_Q : out std_logic
    );
  end component;
  --  verwende NOT-Gatter als Baustein
  component not_gate is
    port (
      input1     : in  std_logic;
      not_output : out std_logic
    );
  end component;

  signal clk_not : std_logic;
  signal n_1     : std_logic;

begin

  -- Instanziierung des NOT-Gatters
  clk_inverter: not_gate
    port map (
      input1     => clk,
      not_output => clk_not
    );
  -- Instanziierung des linken D-Latch
  d_latch_left: D_Latch
    port map (
      D     => d,
      clk   => clk_not,
      Q     => n_1,
      not_Q => open
    );

  -- Instanziierung des rechten D-Latch
  d_latch_right: D_Latch
    port map (
      D     => n_1,
      clk   => clk,
      Q     => Q,
      not_Q => not_Q
    );

end architecture;

