library ieee;
use ieee.std_logic_1164.all;

entity robot is 
    port(
        pattern : in std_logic_vector(3 downto 0); -- das pattern das gefunden werden soll
        sensor, reset, clock : in std_logic; --sensor ist der aktuell gelesene Wert
        alarm : out std_logic
    );
end robot;

architecture rtl of robot is
 --missing
begin
--missing
end rtl;

