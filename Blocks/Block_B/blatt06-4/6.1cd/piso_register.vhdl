Library IEEE;
USE IEEE.Std_logic_1164.all;

entity piso_register is
    port(
        pinput : in std_logic_vector(3 downto 0);
        Clk : in std_logic;
        clear : in std_logic;
        write : in std_logic; -- write auf 1: es kann geschrieben werden. 
        sout : out std_logic
    );
end piso_register;

architecture behavioral of piso_register is
    component DFlipFlop is
        port(
            D : in std_logic;
            Clk : in std_logic;
            reset : in std_logic;
            Q : out std_logic
        );
        end component;

        -- ob paralle geschrieben oder seriel geschoben wird ist hier als 21mux implementiert 
        component mux21 is
            port(
                i1 : IN std_logic;
                i2 : IN std_logic;
                sel : IN std_logic; 
                y : OUT std_logic
            );
            end component;
 -- missing


    begin
        
-- missing

    end behavioral;

