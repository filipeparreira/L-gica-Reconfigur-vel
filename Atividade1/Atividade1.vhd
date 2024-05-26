-- Declaração de Bibliotecas/Pacotes
LIBRARY ieee;
USE ieee.std_logic_1164.all;


-- Entidade 
ENTITY Atividade1 IS PORT (
	a, b: IN STD_LOGIC;
	outNOTa, outNOTb, outOR, outAND, 
		outNAND, outNOR, outXNOR, outXOR: OUT STD_LOGIC
);
END Atividade1;

-- ARQUITETURA
ARCHITECTURE arq_AT1 OF Atividade1 IS
	BEGIN
		outNOTa <= NOT a;
		outNOTb <= NOT b;
		outOR <= a OR b;
		outAND <= a AND b;
		outNAND <= a NAND b;
		outNOR <= a NOR b;
		outXNOR <= a XNOR b;
		outXOR <= a XOR b;
	END arq_AT1;
 
