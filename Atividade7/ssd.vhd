-- DECLARAÇÃO DE BIBLIOTECAS/PACOTES
library ieee;
use ieee.std_logic_1164.all;
use work.bcd.all; -- USANDO ARQUIVO bcd.vhd


-- DECLARAÇÃO DO CONTEUDO DO PACKAGE
package ssd is
	-- DOIS PARAMETROS: 
		-- SEGUNDOS: Variavel inteira
		-- OUT1, OUT2, OUT3, OUT4: SINAL, cada display utilizado
	procedure ssd_numbers_int(segundos: in integer;
									signal out1, out2, out3, out4: out std_logic_vector(6 downto 0));
end ssd;

-- CORPO DO PACOTE
package body ssd is

	-- ESPECIFICAÇÃO LÓGICA DO PROCEDURE.
	procedure ssd_numbers_int(segundos: in integer;
									signal out1, out2, out3, out4: out std_logic_vector(6 downto 0)) is 
	-- SEÇÃO DECLARATIVA
		variable temp: integer range 0 to 9999;
		variable milhar, centena, dezena, unidade: integer range 0 to 9;
   begin
		
		-- Variavel temporaria para segundos
		temp := segundos;

		-- Extraindo os dígitos das casas decimais
		milhar := temp / 1000;        -- Dígito dos milhares
		temp := temp mod 1000;

		centena := temp / 100;         -- Dígito das centenas
		temp := temp mod 100;

		dezena := temp / 10;          -- Dígito das dezenas
		temp := temp mod 10;

		unidade := temp;               -- Dígito das unidades
		
		-- Utilizando o procedure do código bcd para converter
			-- as casas decimais obtidas
		conversor(unidade, out1);
		conversor(dezena, out2);
		conversor(centena, out3);
		conversor(milhar, out4);
	end procedure;
end ssd;