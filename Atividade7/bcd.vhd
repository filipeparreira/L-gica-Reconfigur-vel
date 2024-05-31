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
					saida <= "1000000";
				when 1 =>
					saida <= "1111001";
				when 2 => 
					--saida <= "1101101";
					saida <= "0100100";
				when 3 =>
					--saida <= "1111001";
					saida <= "0110000";
				when 4 => 
					--saida <= "0110011";
					saida <= "0011001";
				when 5 =>
					--saida <= "1011011";
					saida <= "0010010";
				when 6 =>
					--saida <= "1011111";
					saida <= "0000010";
				when 7 =>
					--saida <= "1110000";
					saida <= "1111000";
				when 8 =>
					--saida <= "1111111";
					saida <= "0000000";
				when 9 =>
					--saida <= "1111011";
					saida <= "0010000";
				when others =>
					--saida <= "1001111"; -- Valor de retorno padrão
					saida <= "0110000";
			end case;
		end procedure conversor;
end package body bcd;
