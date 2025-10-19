

-- Komponente wird durch Parameter konfiguriert
-- Wert kann zur Laufzeit nicht verändert werden
-- Nomenklatur: generic (identifier–list : type [:=expression][;...]);


-- BEISPIEL 2 (1.2.1):
-- Erstellung ALU benötigt Inverter (mit verschiedenen Verzögerungswerten)
-- bei jeder Instanziierung der Komponente kann Parameter 'delay' neuer WErt zugewiesen werden
-- Voreinstellung des Wertes: 10 ns

entity nicht is 
    generic(delay: TIME := 10 ns);
    port(e: in BIT := '0';
        a: out BIT);
end nicht; 

architecture behavior of nicht is
    signal tmp : BIT; -- interne Signalleitung innerhalb Architektur
    begin  
        tmp <= NOT e; 
        a <= tmp after delay;
end behavior;