library IEEE;
use IEEE.Std_logic_1164.all;

entity piso_register is
  port (
    pinput : in std_logic_vector(3 downto 0);
    Clk    : in std_logic;
    clear  : in std_logic;
    write  : in std_logic; -- write auf 1: es kann geschrieben werden. 
    sout   : out std_logic
  );
end entity;

architecture behavioral of piso_register is
  component DFlipFlop is
    port (
      D     : in std_logic;
      Clk   : in std_logic;
      reset : in std_logic;
      Q     : out std_logic
    );
  end component;

  -- ob paralle geschrieben oder seriel geschoben wird ist hier als 21mux implementiert 
  component mux21 is
    port (
      i1  : in std_logic;
      i2  : in std_logic;
      sel : in std_logic;
      y   : out std_logic
    );
  end component;
  -- missing
  signal q0, q1, q2     : std_logic;
  signal d0, d1, d2, d3 : std_logic;

begin

  -- and-gatter für write und p1
  mux0 : mux21
  port map
  (
    i1  => q0,
    i2  => pinput(0),
    sel => write,
    y   => d0
  );

  -- erster flipflop
  DFlipFlop_0 : DFlipFlop
  port map
  (
    D     => d0,
    Clk   => Clk,
    reset => clear,
    Q     => q0
  );

  -- mux für zweiten flipflop
  mux1 : mux21
  port map
  (
    i1  => q0,
    i2  => pinput(1),
    sel => write,
    y   => d1
  );
  -- zweiter flipflop
  DFlipFlop_1 : DFlipFlop
  port map
  (
    D     => d1,
    Clk   => Clk,
    reset => clear,
    Q     => q1
  );

  -- mux für dritten flipflop
  mux2 : mux21
  port map
  (
    i1  => q1,
    i2  => pinput(2),
    sel => write,
    y   => d2
  );
  -- dritter flipflop
  DFlipFlop_2 : DFlipFlop
  port map
  (
    D     => d2,
    Clk   => Clk,
    reset => clear,
    Q     => q2
  );

  -- mux für vierten flipflop
  mux3 : mux21
  port map
  (
    i1  => q2,
    i2  => pinput(3),
    sel => write,
    y   => d3
  );
  -- vierter flipflop
  DFlipFlop_3 : DFlipFlop
  port map
  (
    D     => d3,
    Clk   => Clk,
    reset => clear,
    Q     => sout
  );

end architecture;
