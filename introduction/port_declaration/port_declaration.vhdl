


-- PORT = Ein/- Ausgägne der Komponente (Signale)
-- Nomenklatur: port (identifier–list : [in|out|inout|buﬀer] type [:=expression][;...]);
-- 'expression' definiert Anfangswert eines Signals

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity counter is
    Port (
        clk    : in  std_logic;                        -- Eingang: Takt
        rst_n  : in  std_logic := '1';                 -- Eingang: Reset (active low) mit Defaultwert '1'
        enable : in  std_logic := '0';                 -- Eingang: Enable mit Defaultwert '0'
        count  : out std_logic_vector(3 downto 0) := (others => '0')  -- Ausgang: 4-Bit Zähler initialisiert auf "0000"
    );
end counter;

architecture Behavioral of counter is
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count <= (others => '0');  -- Reset auf 0
        elsif rising_edge(clk) then
            if enable = '1' then
                count <= std_logic_vector(unsigned(count) + 1); -- Zähler hochzählen
            end if;
        end if;
    end process;
end Behavioral;