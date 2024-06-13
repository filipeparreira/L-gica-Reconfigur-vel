-- DECLARAÇÃO DE BIBLIOTECAS/PACOTE
library ieee;
use ieee.std_logic_1164.all;

-- DECLARAÇÃO DO PACKAGE
package bcd is
	-- PROCEDURE conversor
	procedure conversor(variable input: in integer range 0 to 9;
								signal saida: out std_logic_vector(6 downto 0));
end package;

-- SEÇÃO DO CORPO DO PACOTE
package body bcd is 
	
	-- Especificação da lógica do PROCEDURE, seus parametros são
		-- uma variável como entrada, e um sinal como saída
	procedure conversor(variable input: in integer range 0 to 9;
								signal saida: out std_logic_vector(6 downto 0)) is 
		begin 
			
			-- Analisa o valor da entrada, dependendo do valor 
				-- atribui a saída um vetor de bits que corresponde
				-- ao número inteiro contido na entrada.
			case input is 
				when 0 => 
					saida <= "1000000";
				when 1 =>
					saida <= "1111001";
				when 2 => 
					saida <= "0100100";
				when 3 =>
					saida <= "0110000";
				when 4 => 
					saida <= "0011001";
				when 5 =>
					saida <= "0010010";
				when 6 =>
					saida <= "0000010";
				when 7 =>
					saida <= "1111000";
				when 8 =>
					saida <= "0000000";
				when 9 =>
					saida <= "0010000";
				when others =>
					saida <= "0110000"; -- Valor de retorno padrão
			end case;
		end procedure conversor;
end package body bcd;
