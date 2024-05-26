LIBRARY ieee;
USE ieee.std_logic_1164;
USE work.min_max_pkg.all;

ENTITY atividade6 is 
	port(entrada1, entrada2, entrada3, entrada4: in integer range 0 to 30;
			min, max: out integer range 0 to 30);
end;

architecture main of atividade6 is 
begin 
	min_max(entrada1, entrada2, entrada3, entrada4, min, max);
end;