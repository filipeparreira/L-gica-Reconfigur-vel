-- Declaração de Bibliotecas e Pacotes
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY atividade_2 IS PORT(
	-- Entradas
	p, m, f, c : IN STD_LOGIC;
	-- Saída
	sirene : OUT STD_LOGIC
);
END atividade_2;

-- Arquitetura
ARCHITECTURE main OF atividade_2 IS 

	BEGIN 
	-- Saída recebe expressão lógica otimizada
	sirene <= (m AND (NOT c)) OR (p AND m) OR (f AND m); 
	
END main;