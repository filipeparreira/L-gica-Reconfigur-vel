library ieee;
use ieee.std_logic_1164.all;

package bcd is
	function conversor(input: integer) return std_logic_vector(6 downto 0);
end package;

package body bcd is 
	 function conversor(input: integer) return std_logic_vector(6 downto 0) is 
	variable num: std_logic_vector(6 downto 0);
	begin 
		case input is 
			when 0 => 
				num := "1111110";
				return num;
			when 1 =>
				return "0110000";
			when 2 => 
				return "1101101";
			when 3 =>
				return "1111001";
			when 4 => 
				return "0110011";
			when 5 =>
				return "1011011";
			when 6 =>
				return "1011111";
			when 7 =>
				return "1110000";
			when 8 =>
				return "1111111";
			when 9 =>
				return "1111011";
			when others =>
				return "0000000"; -- Valor de retorno padrão
		end case;
	end function conversor;
end package body bcd;
