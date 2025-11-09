library IEEE;
use IEEE.std_logic_1164.all;

entity demux14 is
  port (
    I_n : in std_logic_vector(2 downto 0);
    sel : in std_logic_vector(1 downto 0);
    Y0  : out std_logic_vector(2 downto 0);
    Y1  : out std_logic_vector(2 downto 0);
    Y2  : out std_logic_vector(2 downto 0);
    Y3  : out std_logic_vector(2 downto 0)
  );
end demux14;

architecture rtl of demux14 is
  --missing
  -- not-Gatter anmelden
  component not_gate is
    port (
      input1     : in std_logic;
      not_output : out std_logic
    );
  end component;
  -- and-Gatter anmelden
  component and_gate is
    port (
      input1     : in std_logic;
      input2     : in std_logic;
      input3     : in std_logic;
      and_output : out std_logic);
  end component;

  signal not_sel : std_logic_vector(1 downto 0);

begin
  -- Negierung von Steuersingale S0 und S1 einrichten 
  not_assignment : for i in 0 to 1 generate
    not_output : not_gate
    port map
      (input1 => sel(i), not_output => not_sel(i));
  end generate not_assignment;

  -- und-gatter instanzieren
  and_gate_assignment : for i in 0 to 2 generate
    and_output0 : and_gate
    port map
      (input1 => I_n(i), input2 => not_sel(1), input3 => not_sel(0), and_output => Y0(i)); -- zweite and-connection
    and_output1 : and_gate
    port map
      (input1 => I_n(i), input2 => not_sel(1), input3 => sel(0), and_output => Y1(i)); -- zweite and-connection
    and_output2 : and_gate
    port map
      (input1 => I_n(i), input2 => sel(1), input3 => not_sel(0), and_output => Y2(i)); -- dritte and-connection
    and_output3 : and_gate
    port map
      (input1 => I_n(i), input2 => sel(1), input3 => sel(0), and_output => Y3(i)); --vierte and-connection
  end generate and_gate_assignment;

end rtl;
