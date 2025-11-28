library ieee;
use ieee.std_logic_1164.all;

entity sync_counter is
    port(
        reset, clk, C, D : in std_logic;
        q1, q0 : out std_logic
    );
end sync_counter;

architecture bh of sync_counter is
    component jk_flipflop is
        port(
            j,k, clk, reset : in std_logic;
            Q : out std_logic
        );
    end component;
-- missing
    begin
        j1 <= C and (not D) and z0;
-- missing
end bh;

