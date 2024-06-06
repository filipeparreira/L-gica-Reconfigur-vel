-- Declaração Bibliotecas/Pacotes
LIBRARY ieee;
USE ieee.std_logic_1164;
USE work.min_max_pkg.all;

-- Declaração Entidade
ENTITY atividade6 is 
	-- Os quatro valores de entrada que, para uma melhor visualização, 
	-- variam entre 0 e 30. E os dois valores de saída que tem o mesmo range.
	port(-- vetor_entradas: in vetor_inteiros(3);
			entrada1, entrada2, entrada3, entrada4: in integer range 0 to 30;
			min, max: out integer range 0 to 30);
end;

-- Declaração da arquitetura
architecture main of atividade6 is 
begin 
	-- Chamada do PROCEDURE, inserindo como paramentros todas as portas
	--min_max(vetor_entradas, min, max);
	min_max(entrada1, entrada2, entrada3, entrada4, min, max);
end;