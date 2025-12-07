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
  signal res_0_0, res_0_1, res_0_2, res_0_3 : std_logic;
  signal res_1_0, res_1_1, res_1_2, res_1_3 : std_logic_vector(1 downto 0);
  signal res_2_0, res_2_1, res_2_2, res_2_3 : std_logic_vector(1 downto 0);
  signal res_3_0, res_3_1, res_3_2, res_3_3 : std_logic_vector(1 downto 0);

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
  row_0_0: block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(0), andgate_out => res_0_0);
  row_0_1: block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(1), andgate_out => res_0_1);
  row_0_2: block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(2), andgate_out => res_0_2);
  row_0_3: block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(3), andgate_out => res_0_3);
  row_1_0: block_3 port map (a => res_0_1, b => x(0), c => y(1), cout => res_1_0(1), sum => res_1_0(0));
  row_1_1: block_2 port map (a => res_0_2, b => x(1), c => y(1), cin => res_1_0(1), cout => res_1_1(1), sum => res_1_1(0));
  row_1_2: block_2 port map (a => res_0_3, b => x(2), c => y(1), cin => res_1_1(1), cout => res_1_2(1), sum => res_1_2(0));
  row_1_3: block_3 port map (a => res_1_2(1), b => x(3), c => y(1), cout => res_1_3(1), sum => res_1_3(0));
  row_2_0: block_3 port map (a => res_1_1(0), b => x(0), c => y(2), cout => res_2_0(1), sum => res_2_0(0));
  row_2_1: block_2 port map (a => res_1_2(0), b => x(1), c => y(2), cin => res_2_0(1), cout => res_2_1(1), sum => res_2_1(0));
  row_2_2: block_2 port map (a => res_1_3(0), b => x(2), c => y(2), cin => res_2_1(1), cout => res_2_2(1), sum => res_2_2(0));
  row_2_3: block_2 port map (a => res_1_3(1), b => x(3), c => y(2), cin => res_2_2(1), cout => res_2_3(1), sum => res_2_3(0));
  row_3_0: block_3 port map (a => res_2_1(0), b => x(0), c => y(3), cout => res_3_0(1), sum => res_3_0(0));
  row_3_1: block_2 port map (a => res_2_2(0), b => x(1), c => y(3), cin => res_3_0(1), cout => res_3_1(1), sum => res_3_1(0));
  row_3_2: block_2 port map (a => res_2_3(0), b => x(2), c => y(3), cin => res_3_1(1), cout => res_3_2(1), sum => res_3_2(0));
  row_3_3: block_3 port map (a => res_2_3(1), b => x(3), c => y(3), cout => res_3_3(1), sum => res_3_3(0));
  z(0) <= res_0_0;
  z(1) <= res_1_0(0);
  z(2) <= res_2_0(0);
  z(3) <= res_3_0(0);
  z(4) <= res_3_1(0);
  z(5) <= res_3_2(0);
  z(6) <= res_3_3(0);
  z(7) <= res_3_3(1);
end architecture;

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

