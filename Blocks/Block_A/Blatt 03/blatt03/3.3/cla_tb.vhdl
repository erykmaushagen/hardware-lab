
library ieee;
use ieee.std_logic_1164.all;

entity cla_tb is
end cla_tb;


architecture test of cla_tb is
    component cla port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        cout : out std_logic;
        sum : out std_logic_vector(3 downto 0)
    );
    end component;

signal a_test : std_logic_vector(3 downto 0);
signal b_test : std_logic_vector(3 downto 0);
signal cin_test : std_logic;
signal cout_test : std_logic;
signal sum_test : std_logic_vector(3 downto 0);
    

begin 
    -- bilden der Instanz
    clag_tester : cla port map(
            a    => a_test,
            b    => b_test,
            cin  => cin_test,
            cout => cout_test,
            sum  => sum_test
        );
    
process begin
    a_test <= "1010"; -- A
    b_test <= "1101"; -- D
    cin_test <= '0';
    wait for 10 ns; 
    -- erwartete Ausgabe: cout = '1', sum = "0111" = 7

    a_test <= "0000"; -- 0
    b_test <= "1101"; -- D
    cin_test <= '0';
    wait for 10 ns; 
    -- erwartete Ausgabe: cout = '0', sum = "1101" = D

    a_test <= "1001"; -- 9
    b_test <= "0111"; -- 7
    cin_test <= '0';
    wait for 10 ns; 
    -- erwartete Ausgabe: cout = '1', sum = "0000" = 0

    a_test <= "1101"; -- D
    b_test <= "1011"; -- B
    cin_test <= '0';
    wait for 10 ns; 
    -- erwartete Ausgabe: cout = '1', sum = "1000" = 8

    wait;
    assert false report "End of test";
end process;
end test; 