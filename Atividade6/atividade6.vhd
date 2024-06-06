-- Declaração Bibliotecas/Pacotes
LIBRARY ieee;
USE ieee.std_logic_1164;
use ieee.numeric_std.all;
USE work.min_max_pkg.all;

-- Declaração Entidade
ENTITY atividade6 is 
	-- Os quatro valores de entrada que, para uma melhor visualização, 
	-- variam entre 0 e 32 (5 bits). E os dois valores de saída que tem o mesmo range.
	port(-- vetor_entradas: in vetor_inteiros(3);
			entrada1, entrada2, entrada3, entrada4: in unsigned(5 downto 0);
			min, max: out unsigned(5 downto 0));
end;

-- Declaração da arquitetura
architecture main of atividade6 is 
begin 
	-- Chamada do PROCEDURE, inserindo como paramentros todas as portas
	--min_max(vetor_entradas, min, max);
	min_max(entrada1, entrada2, entrada3, entrada4, min, max);
end;