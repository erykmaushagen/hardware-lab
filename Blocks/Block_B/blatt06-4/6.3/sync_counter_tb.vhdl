library ieee;
use ieee.std_logic_1164.all;

entity sync_counter_tb is
end sync_counter_tb;

architecture tb of sync_counter_tb is
    component sync_counter is
        port(
            reset, clk, C, D : in std_logic;
            q1, q0 : out std_logic
        );
    end component;
-- missing
    begin
        -- missing
        process begin
	-- missing
        end process;
end tb;

