library IEEE;
use IEEE.Std_logic_1164.all;

entity piso_register_tb is
end piso_register_tb;

architecture test of piso_register_tb is
  component piso_register is
    port (
      pinput : in std_logic_vector(3 downto 0);
      Clk    : in std_logic;
      clear  : in std_logic;
      write  : in std_logic; -- wird gesetzt wenn geschrieben werden kann
      sout   : out std_logic
    );
  end component;

  signal pinput : std_logic_vector(3 downto 0);
  signal Clk    : std_logic;
  signal clear  : std_logic;
  signal write  : std_logic;
  signal sout   : std_logic;

begin

  ps : piso_register
  port map
    (pinput, Clk, clear, write, sout);

  process begin
    -- pinput <= "1100";
    -- -- SIPO initialisieren indem man es zurueck setzt
    -- Clk   <= '0';
    -- clear <= '0';
    -- write <= '0';
    -- wait for 10 ns;
    -- Clk   <= '1';
    -- clear <= '1';
    -- write <= '0';
    -- wait for 10 ns;
    -- Clk   <= '0';
    -- clear <= '0';
    -- write <= '0';
    -- wait for 10 ns;
    -- --Uebergebe die Bitsequenz 1100 
    -- pinput <= "1100";
    -- Clk    <= '0';
    -- clear  <= '0';
    -- write  <= '1';
    -- wait for 10 ns;
    -- Clk   <= '1';
    -- clear <= '0';
    -- -- es wurde geschrieben, am sout liegt 1 an
    -- wait for 10 ns;
    -- -- bits durchschieben

    -- Clk   <= '0';
    -- clear <= '0';
    -- write <= '0';
    -- wait for 10 ns;
    -- Clk <= '1';
    -- wait for 10 ns;
    -- Clk <= '0';
    -- wait for 10 ns;

    -- weitere Testeingaben 
    pinput <= "1010";
    clear  <= '1';
    wait for 10 ns;

    clear <= '0';

    -- Parallel laden
    write <= '1';
    clk   <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns; -- Jetzt wird "1010" übernommen

    write <= '0';

    -- Jetzt shiften – jedes Mal mit steigender Flanke
    for i in 0 to 3 loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns; -- bei jeder steigenden Flanke kommt 1 Bit raus
    end loop;

    wait;

    wait;
  end process;
end test;
