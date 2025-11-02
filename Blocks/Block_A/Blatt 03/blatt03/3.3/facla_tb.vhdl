library ieee;
use ieee.std_logic_1164.all;

entity facla_tb is
end facla_tb;

architecture test of facla_tb is
  component facla
    port (
        a : in std_logic;
        b : in std_logic;
        cin : in std_logic;
        g : out std_logic;
        p : out std_logic;
        sum : out std_logic
    );
  end component;
signal a_test, b_test, cin_test, g_test, p_test, sum_test : std_logic;

begin
  facla_tester : facla port map (a => a_test, b => b_test, cin => cin_test, g => g_test, 
    p => p_test, sum => sum_test);

  process begin

    a_test <= '0';
    b_test <= '1';
    cin_test <= '1'; -- erwartet: sum = 0; g = 0; p = 1
    wait for 10 ns; 
    
    assert false report "End of test";
    
    wait;
  end process;
  end test;