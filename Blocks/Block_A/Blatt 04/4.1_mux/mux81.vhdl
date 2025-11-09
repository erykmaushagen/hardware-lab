library IEEE;
use IEEE.std_logic_1164.all;

entity mux81 is
  port (
    i0_81  : in std_logic_vector(2 downto 0);
    i1_81  : in std_logic_vector(2 downto 0);
    i2_81  : in std_logic_vector(2 downto 0);
    i3_81  : in std_logic_vector(2 downto 0);
    i4_81  : in std_logic_vector(2 downto 0);
    i5_81  : in std_logic_vector(2 downto 0);
    i6_81  : in std_logic_vector(2 downto 0);
    i7_81  : in std_logic_vector(2 downto 0);
    sel_81 : in std_logic_vector(2 downto 0);
    y_81   : out std_logic_vector(2 downto 0));
end mux81;

architecture rtl of mux81 is

  component mux41 is
    port (
      i0  : in std_logic_vector(2 downto 0);
      i1  : in std_logic_vector(2 downto 0);
      i2  : in std_logic_vector(2 downto 0);
      i3  : in std_logic_vector(2 downto 0);
      sel : in std_logic_vector(1 downto 0);
      y   : out std_logic_vector(2 downto 0)
    );
  end component;
  -- weitere Komponenten 
  -- und Komponente
  component and_gate_2 is
    port (
      input1     : in std_logic;
      input2     : in std_logic;
      and_result : out std_logic);
  end component;
  -- 
  component or_gate_2 is
    port (
      input1    : in std_logic;
      input2    : in std_logic;
      or_result : out std_logic);
  end component;
  component not_gate is
    port (
      input1     : in std_logic;
      not_output : out std_logic
    );
  end component;

  -- Signale definieren 
  signal mult_1    : std_logic_vector(2 downto 0);
  signal mult_2    : std_logic_vector(2 downto 0);
  signal not_wire  : std_logic;
  signal and_wire1 : std_logic_vector(2 downto 0);
  signal and_wire2 : std_logic_vector(2 downto 0);

begin

  --missing;
  -- hier werden die einzelnen Komponenten verschaltet
  -- instanziere das not-gatter 
  not_output : not_gate
  port map
    (input1 => sel_81(2), not_output => not_wire);
  -- instanziere mux1 und mux2 mit s2 und s1
  -- Zwei 4:1 Multiplexer (je 3 Bit)
  mux1 : mux41
  port map
  (
    i0  => i0_81,
    i1  => i1_81,
    i2  => i2_81,
    i3  => i3_81,
    sel => sel_81(1 downto 0),
    y   => mult_1
  );

  mux2 : mux41
  port map
  (
    i0  => i4_81,
    i1  => i5_81,
    i2  => i6_81,
    i3  => i7_81,
    sel => sel_81(1 downto 0),
    y   => mult_2
  );

  -- instanziere and-gatter und das or-gatter die Signale aus mux erstellen 
  and_or_gate_assignment : for i in 0 to 2 generate
    and1 : and_gate_2
    port map
    (
      input1 => not_wire, input2 => mult_1(i), and_result => and_wire1(i)
    );
    and2 : and_gate_2
    port map
    (
      input1 => sel_81(2), input2 => mult_2(i), and_result => and_wire2(i)
    );
    or_output : or_gate_2
    port map
    (
      input1 => and_wire1(i), input2 => and_wire2(i), or_result => y_81(i)
    );
  end generate and_or_gate_assignment;

end rtl;
