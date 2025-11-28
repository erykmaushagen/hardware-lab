library ieee;
use ieee.std_logic_1164.all;

-- ein serieler Input, 8 bit parallel Output
entity sipo_register is
    port(
        serial_in, clear, clock : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end sipo_register;

architecture rtl of sipo_register is
    component DFlipFlop is 
        port (
            d, clk, reset: in std_logic;
            Q : out std_logic
        );
    end component;

    -- 
begin

    --
    
end rtl;

