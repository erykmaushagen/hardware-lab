library ieee;
  use ieee.std_logic_1164.all;

entity test_PIPO is
end entity;

architecture rtl of test_PIPO is

  component PIPO
    port (
      initial_in   :     std_logic_vector(7 downto 0);
      parallel_in  : in  std_logic_vector(7 downto 0);
      Clock, Clear : in  std_logic;
      parallel_out : out std_logic_vector(7 downto 0)
    );
  end component;

  signal initial_in   : std_logic_vector(7 downto 0) := (others => '0');
  signal parallel_in  : std_logic_vector(7 downto 0) := (others => '0');
  signal Clock        : std_logic                    := '0';
  signal Clear        : std_logic                    := '0';
  signal parallel_out : std_logic_vector(7 downto 0);

begin
  uut: PIPO
    port map (
      initial_in   => initial_in,
      parallel_in  => parallel_in,
      Clock        => Clock,
      Clear        => Clear,
      parallel_out => parallel_out
    );

  -- Clock generation
  clock_process: process
  begin
    while true loop
      Clock <= '0';
      wait for 5 ns;
      Clock <= '1';
      wait for 5 ns;
    end loop;
  end process;

  -- Test process
  test_process: process
  begin
    -- Test case 1: Load initial value
    initial_in <= "10101010";
    Clear <= '1';
    wait for 10 ns;
    Clear <= '0';
    wait for 10 ns;

    -- Test case 2: Load new parallel value
    parallel_in <= "11001100";
    wait for 10 ns;

    -- Test case 3: Load another parallel value
    parallel_in <= "11110000";
    wait for 10 ns;

    wait;
  end process;

end architecture;
