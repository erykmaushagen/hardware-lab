
library ieee;
  use ieee.std_logic_1164.all;

entity test_add_shift is
end entity test_add_shift;

architecture rtl of test_add_shift is 

  component add_shift
    port (
      p_in_1 : in std_logic_vector(3 downto 0);
      p_in_2 : in std_logic_vector(3 downto 0);
      p_out  : out std_logic_vector(7 downto 0)
    );
  end component;
  
  signal p_in_1 : std_logic_vector(3 downto 0);
  signal p_in_2 : std_logic_vector(3 downto 0);
  signal p_out  : std_logic_vector(7 downto 0);

begin
    uut: add_shift
    port map (
      p_in_1 => p_in_1,
      p_in_2 => p_in_2,
      p_out  => p_out
    );
    process
  begin 

    -- identical test cases as in parallel_mult_tb.vhdl
    x <= "1010";
    y <= "1101";
    wait for 10 ns; -- expected z = "10000010"

    x <= "1010";
    y <= "0111";
    wait for 10 ns; -- expected z = "1000110"

    x <= "1001";
    y <= "1101";
    wait for 10 ns; -- expected z = "1001000"

    x <= "1001";
    y <= "0111";
    wait for 10 ns; -- expected z = "0111111"

    wait;
  end process;
end architecture;