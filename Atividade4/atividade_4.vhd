-- Declaração de Biblioteca/Pacote
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY atividade_4 IS 
	-- Constantes
	GENERIC (N: INTEGER := 4; --Quantidade de Bits de Selecao 
	M: INTEGER := 8); --Tamanho de cada entrada
	
	-- Portas Entradas, Saida e Selecao
	PORT (sel: in INTEGER range 0 to 2**N-1;
			saida: out STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			--saida: buffer STD_LOGIC_VECTOR(M-1 DOWNTO 0); -- Mudada para teste em placa 
			entradas: in STD_LOGIC_VECTOR(((2**N) * M) - 1 DOWNTO 0));
			-- ssd_out_0, ssd_out_1, ssd_out_2,ssd_out_3, ssd_out_4, ssd_out_5: out STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY; 

-- Arquitetura 
ARCHITECTURE main OF atividade_4 IS
BEGIN 
	gen: for i in saida'range GENERATE 
		saida(i) <= entradas((sel*M) + i);
	END GENERATE;
	
-- Implementacao na placa 
/* Para manter o comentario de bloco, e necessario VHDL 2008
	--Quando a quantidade de entradas for 4 (N = 2 e M = 2)
	--Exibir as saídas nos SSDs
	--Entrada 1 
	WITH entradas(1 DOWNTO 0) SELECT
		ssd_out_0 <=   "1000000" WHEN "00",
							"1111001" WHEN "01",
							"0100100" WHEN "10",
							"0110000" WHEN "11",
							"0000110" WHEN others;
   --Entrada 2
	WITH entradas(3 DOWNTO 2) SELECT
		ssd_out_1 <=   "1000000" WHEN "00",
							"1111001" WHEN "01",
							"0100100" WHEN "10",
							"0110000" WHEN "11",
							"0000110" WHEN others;
   --Entrada 3
	WITH entradas(5 DOWNTO 4) SELECT
		ssd_out_2 <=   "1000000" WHEN "00",
							"1111001" WHEN "01",
							"0100100" WHEN "10",
							"0110000" WHEN "11",
							"0000110" WHEN others;	
	
	--Entrada 4
	WITH entradas(7 DOWNTO 6) SELECT
		ssd_out_3 <=   "1000000" WHEN "00",
							"1111001" WHEN "01",
							"0100100" WHEN "10",
							"0110000" WHEN "11",
							"0000110" WHEN others;
							
	ssd_out_4 <= "1111110";
	
	--WITH saida SELECT
		--ssd_out_5 <= "1000000" WHEN "00",
		--					"1111001" WHEN "01",
		--					"0100100" WHEN "10",
		--					"0110000" WHEN "11",
		--					"0000110" WHEN others;
							
*/
END ARCHITECTURE;