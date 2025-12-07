library ieee;
  use ieee.std_logic_1164.all;

entity add_shift is
  port (
    p_in_1, p_in_2 : in  std_logic_vector(3 downto 0); -- 2-mal: 4 Bit Eingänge
    parallel_out   : out std_logic_vector(7 downto 0)  -- 8 Bit Ausgang
  );
end entity;

architecture behavioral of add_shift is

  -- ************** Zustände **************
  type Zustand is (start, check, add, shift, check_finish); -- Zustände des endlichen Automaten

  signal aktuellerZ, naechsterZ : Zustand; -- Signale für den aktuellen und nächsten Zustand

  -- ************** PIPO Schieberegister  **************
  component PIPO is -- Parallel In Parallel Out
    port (
      initial_in   :     std_logic_vector(7 downto 0); -- Initialwert für das Register
      parallel_in  : in  std_logic_vector(7 downto 0); -- Paralleler Eingang
      Clock, Clear : in  std_logic;                    -- Steuerung: Clock = '1' bei Taktflanke, Clear = '1' zum Zurücksetzen
      parallel_out : out std_logic_vector(7 downto 0)  -- Paralleler Ausgang
    );
  end component;

  -- ************** SIPO_L Schieberegister  (verschiebt nach links) **************
  component SIPO_L is -- Serial In Parallel Out (verschiebt nach links)
    port (
      initial_in              :     std_logic_vector(7 downto 0);
      serial_in, Clock, Clear : in  std_logic;                   -- Steuerung: Clock = '1' bei Taktflanke, Clear = '1' zum Zurücksetzen
      parallel_out            : out std_logic_vector(7 downto 0) -- Paralleler Ausgang
    );
  end component;

  --************** SISO_R Schieberegister (verschiebt nach rechts) **************
  component SISO_R is -- Serial In Serial Out (verschiebt nach rechts)
    port (
      initial_in              :     std_logic_vector(7 downto 0);
      serial_in, Clock, Clear : in  std_logic; -- Steuerung: Clock = '1' bei Taktflanke, Clear = '1' zum Zurücksetzen
      serial_out              : out std_logic  -- Serieller Ausgang
    );
  end component;

  -- ************** Addierer **************
  component addierer is
    port (
      a, b    : in  std_logic_vector(7 downto 0); -- 8 Bit Eingänge
      control : in  std_logic;                    -- wenn control = '1', wird addiert, sonst bleibt Ausgang unverändert
      summe   : out std_logic_vector(7 downto 0)  -- Ergebnis der Addition
    );
  end component;

  -- ************** Signale **************
  -- Initialwerte der Register: 
  signal initial_PIPO, initial_SIPO, initial_SISO : std_logic_vector(7 downto 0);
  -- wire_PIPO_adder: Ausgang des PIPO Registers zum Addierer (von Produkt Register zum Addierer)
  -- wire_adder_PIPO: Ausgang des Addierers zum PIPO Register (zum Produkt Register vom Addierer)
  -- wire_SIPO_L_adder: Ausgang des SIPO_L Registers zum Addierer (vom Multiplikand Register zum Addierer)
  signal wire_PIPO_adder, wire_adder_PIPO, wire_SIPO_L_adder : std_logic_vector(7 downto 0);
  -- control_add: Steuersignal zum Addieren (1 = addieren, 0 = nichts; steuert 'control' Eingang des Addierers)
  -- control_save: Steuersignal zum Speichern im PIPO Register (1 = speichern, 0 = nichts; steuert 'Clock' Eingang des PIPO Registers)
  -- control_shift: Steuersignal zum Verschieben des SISO_R und SIPO_L Registers (1 = verschieben, 0 = nichts; steuert 'Clock' Eingang der SIPO_L und SISO_R Register)
  -- control_clear: Steuersignal zum Zurücksetzen aller Register (1 = zurücksetzen, 0 = nichts; steuert 'Clear' Eingang aller Register)
  signal control_add, control_save, control_shift, control_clear : std_logic; -- hier Steuerleitungen für die Register und den Addierer
  -- SISO_R_in: Serieller Eingang des SISO_R Registers (vom Multiplikator Register zum SISO_R Register)
  -- SISO_R_out: Serieller Ausgang des SISO_R Registers (vom SISO_R Register zurück zum Multiplikator Register)
  signal SISO_R_in, SISO_R_out                                   : std_logic;
  -- SIPO_L_in: Serieller Eingang des SIPO_L Registers (vom Multiplikand Register zum SIPO_L Register)
  signal SIPO_L_in : std_logic;

  signal clock : std_logic := '0';

  signal counter : integer range 0 to 4 := 0;

begin
  multiplikand_register: SIPO_L
    port map (initial_SIPO, SIPO_L_in, control_shift, control_clear, wire_SIPO_L_adder);
  multiplikator_register: SISO_R
    port map (initial_SISO, SISO_R_in, control_shift, control_clear, SISO_R_out);
  produkt_register: PIPO
    port map (initial_PIPO, wire_adder_PIPO, control_save, control_clear, wire_PIPO_adder);

  addierwerk: addierer
    port map (wire_PIPO_adder, wire_SIPO_L_adder, control_add, wire_adder_PIPO);

  -- Implemierung des Automaten für den Add-Shift Adder (fehlt)
  -- ************** HIER ERFOLGT DIE IMPLEMENTIERUNG DES AUTOMATEN **************
  -- ************** HIER ERFOLGT DIE IMPLEMENTIERUNG DES AUTOMATEN **************

  -- Taktgenerierung (wird später in Testbench ausgelagert)
  clock <= not clock after 10 ns;

  -- Ein einzelner Prozess für den gesamten Automaten
  process
  begin

    wait until rising_edge(clock);
    -- Standardwerte für Steuerleitungen
    control_add <= '0';
    control_save <= '0';
    control_shift <= '0';
    control_clear <= '0';
    SIPO_L_in <= '0';
    SISO_R_in <= '0';

    case aktuellerZ is
      when start =>
        control_clear <= '1';
        initial_PIPO <= "00000000";
        initial_SIPO <= "0000" & p_in_1;
        initial_SISO <= "0000" & p_in_2;
        counter <= 0;
        naechsterZ <= check;

      when check =>
        if SISO_R_out = '1' then
          naechsterZ <= add;
        else
          naechsterZ <= shift;
        end if;

      when add =>
        control_add <= '1';
        control_save <= '1';
        naechsterZ <= shift;

      when shift =>
        control_shift <= '1';
        SIPO_L_in <= '0';
        SISO_R_in <= '0';
        counter <= counter + 1; -- Counter inkrementieren!
        naechsterZ <= check_finish;

      when check_finish =>
        if counter >= 4 then
          naechsterZ <= start;
        else
          naechsterZ <= check;
        end if;

    end case;

    -- Zustandsübergang
    aktuellerZ <= naechsterZ;

  end process;

  parallel_out <= wire_PIPO_adder; -- Ausgang des PIPO Registers als Ausgang des Add-Shift Adders
end architecture;

--  BIS HIER HIN BITTE

-- Implementierung eines addierers auf Basis eines ripple-carry-adders, jedoch angepasst an die Aufgabe
library ieee;
  use ieee.std_logic_1164.all;

entity addierer is
  port (
    a, b    : in  std_logic_vector(7 downto 0);
    control : in  std_logic;
    summe   : out std_logic_vector(7 downto 0)
  );
end entity;

architecture behavioral of addierer is

  --Der rca von Blatt 3
  component rca is
    port (
      a    : in  std_logic_vector(7 downto 0);
      b    : in  std_logic_vector(7 downto 0);
      cout : out std_logic;
      sum  : out std_logic_vector(7 downto 0)
    );
  end component;

  signal s_out : std_logic_vector(7 downto 0);

begin

  ripple: rca
    port map (a => a, b => b, sum => s_out);

  process (control)
  begin
    if (control'event and control = '1') then
      summe <= s_out;
    end if;
  end process;

end architecture;

-- Implementierung eines PIPO Schieberegisters
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

-- Implementierung eines SIPO Schieberegisters, welches nach links verschiebt
library ieee;
  use ieee.std_logic_1164.all;

entity SIPO_L is
  port (
    initial_in              :     std_logic_vector(7 downto 0);
    serial_in, Clock, Clear : in  std_logic;
    parallel_out            : out std_logic_vector(7 downto 0)
  );
end entity;

architecture behavioral of SIPO_L is

  signal s_out : std_logic_vector(7 downto 0);

begin
  process (Clock)
  begin
    if (Clock'event and Clock = '1') then
      if (Clear = '1') then -- Zurücksetzen, wenn Clear = '1'
        s_out <= initial_in;
      else
        for i in 7 downto 1 loop -- Verschieben nach links
          s_out(i) <= s_out(i - 1);
        end loop;
        s_out(0) <= serial_in; -- Neuestes Bit am LSB einfügen
      end if;

    end if;

  end process;
  parallel_out <= s_out;

end architecture;

-- Implementierung eines SIPO Schieberegisters, welches nach rechts verschiebt
library ieee;
  use ieee.std_logic_1164.all;

entity SISO_R is
  port (
    initial_in              :     std_logic_vector(7 downto 0);
    serial_in, Clock, Clear : in  std_logic;
    serial_out              : out std_logic
  );
end entity;

architecture behavioral of SISO_R is

  signal s_out : std_logic_vector(7 downto 0);

begin
  process (Clock)
  begin
    if (Clock'event and Clock = '1') then
      if (Clear = '1') then
        s_out <= initial_in;
      else
        for i in 0 to 6 loop
          s_out(i) <= s_out(i + 1);
        end loop;
        s_out(7) <= serial_in;
      end if;
    end if;
  end process;

  serial_out <= s_out(0);

end architecture;
