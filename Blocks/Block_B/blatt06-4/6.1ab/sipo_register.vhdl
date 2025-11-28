library ieee;
use ieee.std_logic_1164.all;

-- ein serieler Input, 8 bit parallel Output

entity sipo_register is
  port (
    serial_in, clear, clock : in std_logic;
    Q                       : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of sipo_register is
  component DFlipFlop is
    port (
      d, clk, reset : in std_logic;
      Q             : out std_logic
    );
  end component;

  signal q0_out : std_logic;
  signal q1_out : std_logic;
  signal q2_out : std_logic;
  signal q3_out : std_logic;

begin
  -- instanziierung des ersten flipflops
  DFF1 : DFlipFlop
  port map
  (
    d     => serial_in,
    clk   => clock,
    reset => clear,
    Q     => q0_out
  );
  -- instanziierung des zweiten flipflops
  DFF2 : DFlipFlop
  port map
  (
    d     => q0_out,
    clk   => clock,
    reset => clear,
    Q     => q1_out
  );
  -- instanziierung des dritten flipflops
  DFF3 : DFlipFlop
  port map
  (
    d     => q1_out,
    clk   => clock,
    reset => clear,
    Q     => q2_out
  );
  -- instanziierung des vierten flipflops
  DFF4 : DFlipFlop
  port map
  (
    d     => q2_out,
    clk   => clock,
    reset => clear,
    Q     => q3_out
  );

  Q(0) <= q0_out;
  Q(1) <= q1_out;
  Q(2) <= q2_out;
  Q(3) <= q3_out;

end architecture;
