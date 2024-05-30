library ieee;
use ieee.std_logic_1164;
use work.bcd.all;

package ssd is 
	procedure ssd_numbers(segundos: in integer range 0 to 9999;
									out1, out2, out3, out4: out std_logic_vector(6 downto 0));
end ssd;

package body ssd is
	procedure ssd_numbers(segundos: in integer range 0 to 9999;
									out1, out2, out3, out4: out std_logic_vector(6 downto 0)) is 
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
	  
	  out1 := conversor(unidade);
	  out2 := conversor(dezena);
	  out3 := conversor(centena);
	  out4 := converor(milhar);
	end ssd_numbers;
end ssd;