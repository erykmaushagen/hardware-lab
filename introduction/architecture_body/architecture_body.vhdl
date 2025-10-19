-- Verwende die folgende Komponente
entity beispiel is -- Defintion der Komponente
  port (
    a, b : in BIT;
    y1, y2, y3, y4, y5, y6 : out BIT
  );
end beispiel;

-- ******** CONCURENT SIGNAL ASSIGNMENT ********
-- Anweisung, mit der eine Zuweisung auf ein Signal vorgenommen wird
architecture arch1 of beispiel is
begin
  --einfaches UND-Gatter
  y1 <= a AND b; 
end arch1 ;

-- ******** CONCURRENT ASSSIGNMENT ********
-- Rückmeldungen werden in ein Programm eingebunden, machen zur Laufzeit auf mögliche 
-- Fehlerzustände oder Ereignisse aufmerksam
architecture arch2 of beispiel is
begin 
  -- Beispiel: Fehlermeldung, wenn beide Eingänge '1' sind 
  assert NOT (a = '1' and b = '1')
    report "Fehler: Beide Eingänge sind 1!"
    severity warning; 
  y2 <= a XOR b;
end arch2; 

-- ******** BLOCK ********
-- kapselt lokale Logik (in Block lokale Signale, Konstanten etc.)
architecture arch3 of beispiel is
begin
  logik_block : block
    signal tmp : BIT; 
  begin
    tmp <= a AND b;
    y3 <= NOT tmp; 
  end block logik_block; 
end arch3;

-- ******** CONCURRENT PROCEDURE CALL ********
-- Aufruf einer Prozedur(Unterprogramm) bspw. in Architekuturdesign definiert
-- Prozedur kann Logik kapseln und wiederverwendbar machen
architecture arch4 of beispiel is
  -- Prozedurdefinition
  procedure invertiere (
    signal x : in BIT;
    signal y : out BIT
  ) is
  begin
    y <= NOT x;
  end procedure;
begin
  -- Prozeduraufruf als Concurrent Statement
  invertiere(a, y4);
end arch4;


-- ******** COMPONENT INSTANTIATION ********
-- einbinden anderer Unterkomponenten (bspw. andere Entities)
-- Unterkomponente: 
entity und_gatter is 
 port(x, y: in BIT; z: out BIT); 
end und_gatter; 

architecture behavior of und_gatter is
  begin 
  z <= x AND y; 
end behavior;
-- Hauptarchitektur
architecture arch5 of beispiel is
  component und_gatter 
    port(x,y: in BIT; z : out BIT); 
  end component; 
  begin 
    u1: und_gatter port map(a, b, y5); -- <instanz-label> : <component_name> port map (
    -- <port_name1> => <signal1>, <port_name2> => <signal2>, ...  ); 
  end arch5;

-- ******** PROCESS ********
-- verbindet parallele mit sequentieller Ebene
-- Prozes ist sequentiell, wird aber parallel zu anderen Porzessen oder Concurrent Statments ausgeführt
architecture arch6 of beispiel is
  begin
    process(a, b)
      variable tmp : BIT; 
    begin 
      tmp :=  a XOR b; 
      y6 <= tmp;
    end process; 
  end arch6;
  -- => innerhalb des Prozesses laufen Anweisungen nacheinander (sequentiell),
  --    aber im gesamten Prozess wird parallel zu anderen Prozessen oder Zuweisungen ausgeführt
