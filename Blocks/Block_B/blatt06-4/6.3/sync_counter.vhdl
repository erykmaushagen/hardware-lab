library ieee;
  use ieee.std_logic_1164.all;

entity sync_counter is
  port (
    reset, clk, C, D : in  std_logic;
    q1, q0           : out std_logic
  );
end entity;

architecture bh of sync_counter is
  component jk_flipflop is
    port (
      j, k, clk, reset : in  std_logic;
      Q                : out std_logic
    );
  end component;
  -- missing
  signal z0             : std_logic;
  signal z1             : std_logic;
  signal j0, k0, j1, k1 : std_logic;

begin

  j1 <= C and (not D) and z0;
  k1 <= (not z0) and C and D;
  j0 <= C and ((not D) or z1);
  k0 <= C and (D or (not z1));

  -- first flipflop
  JK_FF_0: jk_flipflop
    port map (
      j     => j0,
      k     => k0,
      clk   => clk,
      reset => reset,
      Q     => z0
    );

  -- second flipflop
  JK_FF_1: jk_flipflop
    port map (
      j     => j1,
      k     => k1,
      clk   => clk,
      reset => reset,
      Q     => z1
    );
  q0 <= z0;
  q1 <= z1;

end architecture;

