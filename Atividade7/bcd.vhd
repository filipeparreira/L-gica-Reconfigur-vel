library ieee;
use ieee.std_logic_1164.all;

package bcd is
	procedure conversor(variable input: in integer range 0 to 9;
								signal saida: out std_logic_vector(6 downto 0));
end package;

package body bcd is 
	 procedure conversor(variable input: in integer range 0 to 9;
								signal saida: out std_logic_vector(6 downto 0)) is 
		begin 
			case input is 
				when 0 => 
					saida <= "1111110";
				when 1 =>
					saida <= "0110000";
				when 2 => 
					saida <= "1101101";
				when 3 =>
					saida <= "1111001";
				when 4 => 
					saida <= "0110011";
				when 5 =>
					saida <= "1011011";
				when 6 =>
					saida <= "1011111";
				when 7 =>
					saida <= "1110000";
				when 8 =>
					saida <= "1111111";
				when 9 =>
					saida <= "1111011";
				when others =>
					saida <= "1110111"; -- Valor de retorno padrão
			end case;
		end procedure conversor;
end package body bcd;
