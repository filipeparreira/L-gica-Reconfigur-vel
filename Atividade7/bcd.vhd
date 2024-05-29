library ieee;
use ieee.std_logic_1164;

package bcd is
	function conversor (numero: integer range 0 to 9) return std_logic_vector(6 downto 0);
end package;

package body bcd is 
	function converor (numero: integer range 0 to 9) return std_logic_vector(6 downto 0) is 
	begin 
		case numero is 
			when 0 => 
				return "1111110";
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
				return "0011111";
			when 7 =>
				return "1110000";
			when 8 =>
				return "1111111";
			when 9 =>
				return "1110011";
			when others =>
				return "1110111";
	end conversor;
end bcd;