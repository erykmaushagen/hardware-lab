library ieee;
use ieee.std_logic_1164.all;

entity ps_reset_ff is
  port (
    d, clk, r : in std_logic;
    Q, not_Q  : out std_logic
  );
end entity;

architecture behavioral of ps_reset_ff is

  -- verwende D-Latch als Baustein
  component D_Latch is
    port (
      D, clk   : in std_logic;
      Q, not_Q : out std_logic
    );
  end component;
  -- AND-Gatter definieren
  component and_gate
    port (
      input1     : in std_logic;
      input2     : in std_logic;
      and_result : out std_logic
    );
  end component;
  --  verwende NOT-Gatter als Baustein
  component not_gate is
    port (
      input1     : in std_logic;
      not_output : out std_logic
    );
  end component;

  signal clk_not : std_logic;
  signal n_1     : std_logic;
  signal not_r   : std_logic;
  signal and_1   : std_logic;
  signal and_2   : std_logic;

begin

  -- Instanziierung des AND-Gatters für Reset
  reset_inverter : not_gate
  port map
  (
    input1     => r,
    not_output => not_r
  );
  -- AND-Gatter für linken D-Latch
  and_gate_left : and_gate
  port map
  (
    input1     => d,
    input2     => not_r,
    and_result => and_1
  );
  -- Instanziierung des oberen NOT-Gatters
  clk_inverter : not_gate
  port map
  (
    input1     => clk,
    not_output => clk_not
  );
  -- Instanziierung des linken D-Latch
  d_latch_left : D_Latch
  port map
  (
    D     => and_1,
    clk   => clk_not,
    Q     => n_1,
    not_Q => open
  );
  -- AND-Gatter für rechten D-Latch
  and_gate_right : and_gate
  port map
  (
    input1     => n_1,
    input2     => not_r,
    and_result => and_2
  );

  -- Instanziierung des rechten D-Latch
  d_latch_right : D_Latch
  port map
  (
    D     => and_2,
    clk   => clk,
    Q     => Q,
    not_Q => not_Q
  );

end architecture;
