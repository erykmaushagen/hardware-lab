library ieee;
  use ieee.std_logic_1164.all;

entity SR_Latch is
  port (
    S, R     : in  std_logic;
    Q, not_Q : out std_logic
  );
end entity;

architecture Behavioral of SR_Latch is

  -- verwende or NOR-Gatter als Baustein aus Übugn 02
  component norgate is
    port (
      input1     : in  std_logic;
      input2     : in  std_logic;
      nor_result : out std_logic
    );
  end component;
  -- temorale Signale für die Verbindung der Gatter
  signal tmp1 : std_logic;
  signal tmp2 : std_logic;

begin
  -- Instanziierung der NOR-Gatter
  upper_nor: norgate
    port map (
      input1     => S,
      input2     => tmp2,
      nor_result => tmp1
    );

  lower_or: norgate
    port map (
      input1     => R,
      input2     => tmp1,
      nor_result => tmp2
    );
  -- Ausgabezuweisungen
  Q     <= tmp2;
  not_Q <= tmp1;

end architecture;

