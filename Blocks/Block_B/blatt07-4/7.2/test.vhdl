library ieee;
  use ieee.std_logic_1164.all;

entity PIPO is
  port (
    initial_in   :     std_logic_vector(7 downto 0);
    parallel_in  : in  std_logic_vector(7 downto 0);
    Clock, Clear : in  std_logic;
    parallel_out : out std_logic_vector(7 downto 0)
  );
end entity;

architecture behavioral of PIPO is
begin
  process (Clock)
  begin
    if (Clock'event and Clock = '1') then
      if (Clear = '1') then -- Zurücksetzen, wenn Clear = '1'
        parallel_out <= initial_in; -- 
      else
        parallel_out <= parallel_in; -- Laden des parallelen Eingangs
      end if;
    end if;
  end process;
end architecture;
