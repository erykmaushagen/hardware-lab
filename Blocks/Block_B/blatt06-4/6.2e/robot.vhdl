library ieee;
use ieee.std_logic_1164.all;

entity robot is
  port (
    pattern              : in std_logic_vector(3 downto 0); -- das pattern das gefunden werden soll
    sensor, reset, clock : in std_logic; --sensor ist der aktuell gelesene Wert
    alarm                : out std_logic
  );
end entity;

architecture rtl of robot is

  signal shiftreg    : std_logic_vector(3 downto 0);
  signal pattern_cmp : std_logic_vector(3 downto 0);

begin
  -- reverse logik
  pattern_cmp <= pattern(0) & pattern(1) & pattern(2) & pattern(3);
  -- 4-Bit SISO-Schieberegister
  process (clock, reset)
  begin
    if reset = '1' then
      shiftreg <= (others => '0');
    elsif rising_edge(clock) then
      shiftreg <= shiftreg(2 downto 0) & sensor; -- aktuelle 4-Bit Maske relativ con sensor aus
    end if;
  end process;

  -- Patternvergleich der unser output determiniert
  alarm <= '1' when shiftreg = pattern_cmp else
    '0';

end architecture;