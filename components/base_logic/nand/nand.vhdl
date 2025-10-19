
use WORK.und_2; 
use WORK.nicht; 

entity nand_2 is 
    port(i1, i2: in BIT; o : inout BIT); 
end nand_2;  

architecture structure of nand_2 is
    signal intern : BIT;

    component und_2
        port(e1, e2: in BIT; a : out BIT);
    end component; 

    component inverter 
        generic(delay: TIME := 10 ns);
        port(e: in BIT; a: out BIT); 
    end component; 

    begin
    U0: und_2 -- Instanz von Komponente und_2
        port map(e1 => i1, e2 => i2, a => intern);
    U1: inverter 
        generic map(20 ns) -- kein Semikolon!
        port map (e => intern, a => o);

    end structure;