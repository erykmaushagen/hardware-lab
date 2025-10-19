

-- UND-Gatter

entity und_2 is 
    port(e1, e2: in BIT; 
        a : out BIT);
end und_2; 

architecture bahvior of und_2 is
begin 
    a <= e1 AND e2; 
end; 