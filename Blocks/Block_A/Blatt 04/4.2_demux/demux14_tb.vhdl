library ieee;
use ieee.std_logic_1164.all;

entity demux14_tb is
end demux14_tb;

architecture testbench of demux14_tb is
  --missing
  component demux14
    port (
      I_n : in std_logic_vector(2 downto 0);
      sel : in std_logic_vector(1 downto 0);
      Y0  : out std_logic_vector(2 downto 0);
      Y1  : out std_logic_vector(2 downto 0);
      Y2  : out std_logic_vector(2 downto 0);
      Y3  : out std_logic_vector(2 downto 0)
    );
  end component;

  -- Signale für Test-input: 
  signal I_n : std_logic_vector(2 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal Y0  : std_logic_vector(2 downto 0);
  signal Y1  : std_logic_vector(2 downto 0);
  signal Y2  : std_logic_vector(2 downto 0);
  signal Y3  : std_logic_vector(2 downto 0);

begin
  demultiplex : demux14
  port map
  (
    I_n => I_n,
    sel => sel,
    Y0  => Y0,
    Y1  => Y1,
    Y2  => Y2,
    Y3  => Y3
  );
  process begin
    --setting the input value for In 
    I_n <= "101";

    -- switching which input is propagated
    sel <= "00";
    wait for 10 ns;
    sel <= "01";
    wait for 10 ns;
    sel <= "10";
    wait for 10 ns;
    sel <= "11";
    wait for 10 ns;
    sel <= "10";
    wait for 10 ns;
    sel <= "11";
    wait for 10 ns;
    wait;
  end process;

end testbench;