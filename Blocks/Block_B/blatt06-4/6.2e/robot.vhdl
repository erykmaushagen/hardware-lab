library ieee;
  use ieee.std_logic_1164.all;

entity robot is
  port (
    pattern              : in  std_logic_vector(3 downto 0); -- das pattern das gefunden werden soll
    sensor, reset, clock : in  std_logic;                    --sensor ist der aktuell gelesene Wert
    alarm                : out std_logic
  );
end entity;

architecture rtl of robot is

  signal shiftreg : std_logic_vector(3 downto 0);

begin

  --------------------------------------------------------------------
  -- 4-Bit SISO-Schieberegister
  --------------------------------------------------------------------
  process (clock, reset)
  begin
    if reset = '1' then
      shiftreg <= (others => '0');
    elsif rising_edge(clock) then
      shiftreg <= shiftreg(2 downto 0) & sensor;
    end if;
  end process;

  --------------------------------------------------------------------
  -- Patternvergleich
  --------------------------------------------------------------------
  alarm <= '1' when shiftreg = pattern else '0';

end architecture;

-- architecture rtl of robot is
--   --missing
--   component piso_register is
--     port (
--       pinput : in  std_logic_vector(3 downto 0);
--       Clk    : in  std_logic;
--       clear  : in  std_logic;
--       write  : in  std_logic; -- write auf 1: es kann geschrieben werden
--       sout   : out std_logic
--     );
--   end component;

--   signal shiftin        : std_logic;
--   signal reload_pattern : std_logic;

-- begin
--   -- Serial In Parallel Out Register
--   pr: piso_register
--     port map (
--       pinput => pattern,
--       Clk    => clock,
--       clear  => reset,
--       write  => reload_pattern, -- wenn alarm auf 1 ist wird das pattern in das register geschrieben
--       sout   => shiftin
--     );

--   process (Clk, pinput)
--     variable counter : integer := pinput'length - 1;
--   begin
--     if (rising_edge(Clk)) then -- fuer jede steigende Taktflanke wird ein Element der Eingabesequenz abgegangen
--       if (counter >= 0) then
--         if (sensor = shiftin) then
--           counter := counter - 1;
--         else
--           counter := pinput'length - 1; -- wenn ein falsches bit gelesen wurde wird der counter zurueckgesetzt
--           clear <= '1';
--           reload_pattern <= '1'; -- pattern wird neu in das register geladen

--         end if;
--       end if;
--       if (counter = 0) then
--         alarm <= '1'; -- pattern wurde erkannt
--       end if;
--     end if;
--   end process;
-- end architecture;
