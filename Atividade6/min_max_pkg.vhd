-- Declaração de Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaração do Pacote
PACKAGE min_max_pkg IS 
	-- Declarando o tipo personalizado, que é um vetor de unsigned de tamanho variado 
	type vetor_inteiros is array (NATURAL range<>) of unsigned(5 downto 0);
	
	-- Declaração do PROCEDURE
	PROCEDURE min_max (signal entrada1, entrada2, entrada3, entrada4: in unsigned(5 downto 0);
							signal min, max: out unsigned(5 downto 0));
	-- procedure min_max (signal vetor_entrada : in vetor_inteiros, signal min, max: out INTEGER);
end min_max_pkg;

-- Declaração do Corpo do Pacote, onde fica o código propriamente dito.
package body min_max_pkg is 
	-- Especificação do PROCEDURE
	procedure min_max (signal entrada1, entrada2, entrada3, entrada4: in unsigned(5 downto 0);
							signal min, max: out unsigned(5 downto 0)) is 
	
		-- Seção de declaraçaõ de variaveis 
		VARIABLE minAux, maxAux: unsigned(5 downto 0);
		variable vetor_entrada: vetor_inteiros(3 DOWNTO 0);
	begin 
		-- Atribuição dos valores de entrada
		vetor_entrada(0) := entrada1;
		vetor_entrada(1) := entrada2;
		vetor_entrada(2) := entrada3;
		vetor_entrada(3) := entrada4;	
		
		-- Inicio do algoritmo de busca dos valores
		-- Atribuo as variaveis minimo e maximo o primeiro valor do vetor
		minAux := vetor_entrada(0);  
		maxAux := vetor_entrada(0);
		
		-- É um laço de repetição que verifica todo o vetor de entrada.
		for i in vetor_entrada'range loop
		
			-- Verifica se o valor atual é maior ou então menor que o valor atribuido 
				-- inicialmente/anteriormente. Caso seja, atribuice ao menor ou maior 
				-- valor encontrado até então.
			if vetor_entrada(i) > maxAux then 
				maxAux := vetor_entrada(i);
			elsif vetor_entrada(i) < minAux then 
				minAux := vetor_entrada(i);
			end if; 
		end loop;
		
		-- Ao fim do loop é encontrado os valores menor e maior de todo o vetor
			-- e atribuido aos sinais de saída
		min <= minAux;
		max <= maxAux;
	end min_max;
end min_max_pkg;
			
				
	