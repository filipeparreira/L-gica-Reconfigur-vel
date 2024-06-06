LIBRARY ieee;
USE ieee.std_logic_1164;
USE work.min_max_pkg.all;

ENTITY atividade5 is 
	port(vetor_entradas: in vetor_inteiros(3);
			min, max: out integer);
end;

architecture main of atividade5 is 
begin 
	min_max(vetor_entradas, min, max);
end;