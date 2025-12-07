library ieee;
  use ieee.std_logic_1164.all;

  --Three blocks are provided in this template(block_1, block_2 and block_3), 
  --you can complete the design of this multiplier by connecting these blocks,
  --or you can also design your own block based on your implementation.

entity parallel_mult is
  port (
    x, y : in  std_logic_vector(3 downto 0);
    z    : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of parallel_mult is
  signal --missing;
  component block_1
    port (
      andgate_in_1 : in  std_logic;
      andgate_in_2 : in  std_logic;
      andgate_out  : out std_logic
    );
  end component;

  component block_2
    port (
      a, b, c, cin : in  std_logic;
      cout, sum    : out std_logic
    );
  end component;

  component block_3
    port (
      a, b, c   : in  std_logic;
      cout, sum : out std_logic
    );
  end component;

begin
  row_0_0: block_?
    port map --missing;
    row_0_1: block_? port map --missing;
    row_0_2: block_? port map --missing;
    row_0_3: block_? port map --missing;
    row_1_0: block_? port map --missing;
    row_1_1: block_? port map --missing;
    row_1_2: block_? port map --missing;
    row_1_3: block_? port map --missing;
    row_2_0: block_? port map --missing;
    row_2_1: block_? port map --missing;
    row_2_2: block_? port map --missing;
    row_2_3: block_? port map --missing;
    row_3_0: block_? port map --missing; 
    row_3_1: block_? port map --missing;
    row_3_2: block_? port map --missing;
    row_3_3: block_? port map --missing;
    z(0) <= --missing;
    z(1) <= --missing;
    z(2) <= --missing;
    z(3) <= --missing;
    z(4) <= --missing;
    z(5) <= --missing;
    z(6) <= --missing;
    z(7) <= --missing;
  end ;

  --first block
  library ieee;
    use ieee.std_logic_1164.all;

  entity block_1 is
    port (
      andgate_in_1 : in  std_logic;
      andgate_in_2 : in  std_logic;
      andgate_out  : out std_logic
    );
  end entity;

  architecture rtl of block_1 is
  begin
    andgate_out <= andgate_in_1 and andgate_in_2;
  end architecture;

  --second block.
  library ieee;
    use ieee.std_logic_1164.all;

  entity block_2 is
    port (
      a, b, c, cin : in  std_logic;
      cout, sum    : out std_logic
    );
  end entity;

  architecture rtl of block_2 is
    signal d : std_logic;
  begin
    d    <= b and c;
    cout <= (a and d) or (a and cin) or (d and cin);
    sum  <= a xor d xor cin;
  end architecture;

  --third block.
  library ieee;
    use ieee.std_logic_1164.all;

  entity block_3 is
    port (
      a, b, c   : in  std_logic;
      cout, sum : out std_logic
    );
  end entity;

  architecture rtl of block_3 is
    signal d : std_logic;
  begin
    d    <= b and c;
    sum  <= a xor d;
    cout <= a and d;
  end architecture;

