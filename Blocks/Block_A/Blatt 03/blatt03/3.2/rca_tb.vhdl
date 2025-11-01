library ieee;
use ieee.std_logic_1164.all;

entity rca_tb is
end rca_tb;

architecture test of rca_tb is
  component rca
    port (
      a : in std_logic_vector(7 downto 0);
      b : in std_logic_vector(7 downto 0);
      cout : out std_logic;
      sum : out std_logic_vector(7 downto 0)
    );
  end component;

signal a : std_logic_vector(7 downto 0);
signal b : std_logic_vector(7 downto 0);
signal cout : std_logic;
signal sum : std_logic_vector(7 downto 0);
begin
  -- ?
  ripplecarryadder : rca port map (a => a, b => b, cout => cout, sum => sum);

  process begin
    a <= "00000000"; -- 00
    b <= "00000001"; -- 01
    wait for 10 ns; -- '00000001' = 01 als output erwartet für 'sum'
                    -- '0' für cout

    a <= "00101101"; -- 2D
    b <= "00110001"; -- 31
    wait for 10 ns; -- '01011110' = 5E als output erwartet für 'sum'
                    -- '0' für cout

    a <= "11001010"; -- CA
    b <= "10101010"; -- AA
    wait for 10 ns; -- '01110100' = 74 als output erwartet für 'sum'
                    -- '1' für cout

    a <= "01010000"; -- 80 
    b <= "11111111"; -- FF
    wait for 10 ns; -- '01001111' = 4F als output erwartet für 'sum'
                    -- '1' für cout
    
    a <= "11111111"; -- FF
    b <= "11111111"; -- FF
    wait for 10 ns; -- '11111110' = FE als output erwartet für 'sum'
                    -- '1' für cout
    wait;
    assert false report "End of test";
  end process;
end test;
