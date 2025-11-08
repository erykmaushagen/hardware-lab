LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
--the 4:1 multiplexer to be designed consists of four 3-bit inputs, i.e., i0, i1, i2 and i3.
--sel is a 2-bit select signal.
--y is the output.

ENTITY mux41 IS
    PORT (
        i0 : IN std_logic_vector(2 DOWNTO 0); 
        i1 : IN std_logic_vector(2 DOWNTO 0);
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        );
END mux41;

ARCHITECTURE rtl OF mux41 IS
--you can add more components you need
--you can also increase the number of inputs, e.g., the "and" gate below is extended to a 3-input gate.
    COMPONENT or_gate IS
        PORT ( 
            input1 : in std_logic;
            input2 : in std_logic;
            input3 : in std_logic;
            input4 : in std_logic;
            or_result : out std_logic
        );
    END COMPONENT;
    COMPONENT not_gate IS 
        PORT(
            input1 : in std_logic; 
            output1 : out std_logic
        );
    END COMPONENT;
    COMPONENT and_gate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			input3 : IN std_logic;
            and_output : OUT std_logic);
    END COMPONENT;

--you can define more signals here if you need, e.g.,:
    signal not_sel : std_logic_vector(1 DOWNTO 0); 
    signal and_1 : std_logic_vector(2 DOWNTO 0);
    signal and_2 : std_logic_vector(2 DOWNTO 0);
    signal and_3 : std_logic_vector(2 DOWNTO 0);
    signal and_4 : std_logic_vector(2 DOWNTO 0);
BEGIN



--bitwise operation for each logic gate because the input signals are multilple-bit signals.
--please complete the implementation based on the schema you designed.
    -- instanziere das NOT-Gatter: 
    not_assignment : for i in 0 to 1 generate
        not_output : not_gate  port map(input1 => sel(i), output1 => not_sel(i));
    end generate not_assignment;

    and_gate_assignment : for i in 0 to 2 generate
        and_output1: and_gate port map(input1 => i0(i), input2 => not_sel(1), input3 => not_sel(0), and_output => and_1(i)); -- erste and-connection
        and_output2: and_gate port map(input1 => i1(i), input2 => not_sel(1), input3 => sel(0), and_output => and_2(i)); -- zweite and-connection
        and_output3: and_gate port map(input1 => i2(i), input2 => sel(1), input3 => not_sel(0), and_output => and_3(i)); -- dritte and-connection
        and_output4: and_gate port map(input1 => i3(i), input2 => sel(1), input3 => sel(0), and_output => and_4(i)); -- vierte and-connection
    end generate and_gate_assignment;
   
   --missing
   -- hier werden die weiteren Komponenten verschaltet

   -- instanziere das OR-Gatter:
   or_gate_assignment : for i in 0 to 2 generate
        or_output : or_gate  port map(input1 => and_1(i), input2 => and_2(i), input3 => and_3(i), input4 => and_4(i), or_result => y(i));
   end generate or_gate_assignment;



END rtl;

