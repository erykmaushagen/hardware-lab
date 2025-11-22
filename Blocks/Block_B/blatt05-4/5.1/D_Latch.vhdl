library ieee;
  use ieee.std_logic_1164.all;

entity D_Latch is
  port (
    D, clk   : in  std_logic;
    Q, not_Q : out std_logic
  );
end entity;

architecture Behavioral of D_Latch is

  component and_gate
    port (
      input1     : in  std_logic;
      input2     : in  std_logic;
      and_result : out std_logic
    );
  end component;

  component SR_Latch is
    port (
      S, R     : in  std_logic;
      Q, not_Q : out std_logic
    );
  end component;

  component not_gate
    port (
      input1     : in  std_logic;
      not_output : out std_logic
    );
  end component;

  signal not_D     : std_logic;
  signal and_upper : std_logic;
  signal and_lower : std_logic;

begin
  -- NOT-Gatter Instanziierung
  not_inst: not_gate
    port map (
      input1     => D,
      not_output => not_D
    );

  -- AND-Gatter Instanziierung
  and_upper_inst: and_gate
    port map (
      input1     => not_D,
      input2     => clk,
      and_result => and_upper
    );

  and_lower_inst: and_gate
    port map (
      input1     => D,
      input2     => clk,
      and_result => and_lower
    );

  -- SR-Latch Instanziierung
  sr_latch_inst: SR_Latch
    port map (
      R     => and_upper,
      S     => and_lower,
      Q     => Q,
      not_Q => not_Q
    );
  --missing
end architecture;

