

-- BASIC Aufbau: 
-- entity and_2 is
--     generic -- Parameter der Komponente (keine elektr. Signale)

--     port -- E-/Ausgänge der Komponente (elektr. Anschlüsse d.h. Signale)
-- begin --statements: Funktions- und Prozessdefinitionen

-- end and_2;

-- BEISPIEL 1 (1.2.1): 
-- UND-Gatter mit Eingängen('e1', 'e2') und Ausgang 'a'
entity und_2 is -- Name der Komponente und Anzahl der Eingänge
    port (e1, e2: in BIT; 
    a: out BIT); 
end und_2; 

architecture behavior of und_2 is
    begin 
    a <= e1 AND e2; -- AND ist Library-Fuktion + '<=' ist Zuweisung
    end behavior; 