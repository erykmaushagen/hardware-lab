library ieee;
  use ieee.std_logic_1164.all;

  -- ein serieler Input, 8 bit parallel Output

entity sipo_register is
  port (
    serial_in, clear, clock : in  std_logic;
    Q                       : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of sipo_register is
  component DFlipFlop is
    port (
      d, clk, reset : in  std_logic;
      Q             : out std_logic
    );
  end component;

begin
  -- instanziierung des ersten flipflops
  DFF1: DFlipFlop
    port map (
      d     => serial_in,
      clk   => clock,
      reset => clear,
      Q     => Q(1)
    );
  -- instanziierung des zweiten flipflops
  DFF2: DFlipFlop
    port map (
      d     => Q(1),
      clk   => clock,
      reset => clear,
      Q     => Q(2)
    );
  -- instanziierung des dritten flipflops
  DFF3: DFlipFlop
    port map (
      d     => Q(2),
      clk   => clock,
      reset => clear,
      Q     => Q(3)
    );
  -- instanziierung des vierten flipflops
  DFF4: DFlipFlop
    port map (
      d     => Q(3),
      clk   => clock,
      reset => clear,
      Q     => ouQ(4)
    );

end architecture;

