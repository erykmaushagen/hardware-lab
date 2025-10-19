

entity nicht is
    generic (delay: TIME := 10 ns); 
    port (e : in BIT := '0'; a : out BIT); 
end nicht; 

architecture behavior of nicht is
    signal tmp : BIT; 
    begin
        tmp <= NOT e; 
        a <= tmp after delay;
    end behavior; 