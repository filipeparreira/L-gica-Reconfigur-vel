library ieee;
use ieee.std_logic_1164.all;
use work.bcd.all;

package ssd is 
	procedure ssd_numbers(segundos: in integer range 0 to 9999;
									signal out1, out2, out3, out4: out std_logic_vector(6 downto 0));
end ssd;

package body ssd is
	procedure ssd_numbers(variable segundos: in integer range 0 to 9999;
									signal out1, out2, out3, out4: out std_logic_vector(6 downto 0)) is 
		variable temp: integer range 0 to 9999;
		variable milhar, centena, dezena, unidade: integer range 0 to 9;
   begin
	  temp := segundos;
	  
	  -- Extraindo os dígitos das casas decimais
	  milhar := temp / 1000;        -- Dígito dos milhares
	  temp := temp mod 1000;
	  
	  centena := temp / 100;         -- Dígito das centenas
	  temp := temp mod 100;
	  
	  dezena := temp / 10;          -- Dígito das dezenas
	  temp := temp mod 10;
	  
	  unidade := temp;               -- Dígito das unidades
	  
	  conversor(unidade, out1);
	  conversor(dezena, out2);
	  conversor(centena, out3);
	  conversor(milhar, out4);
	end ssd_numbers;
end ssd;