LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

PACKAGE min_max_pkg IS 
	type vetor_inteiros is array (NATURAL range<>) of unsigned(5 downto 0);
	PROCEDURE min_max (signal entrada1, entrada2, entrada3, entrada4: in unsigned(5 downto 0);
							signal min, max: out unsigned(5 downto 0));
	-- procedure min_max (signal vetor_entrada : in vetor_inteiros, signal min, max: out INTEGER);
end min_max_pkg;

package body min_max_pkg is 
	
	procedure min_max (signal entrada1, entrada2, entrada3, entrada4: in unsigned(5 downto 0);
							signal min, max: out unsigned(5 downto 0)) is 
	VARIABLE minAux, maxAux: unsigned(5 downto 0);
	variable vetor_entrada: vetor_inteiros(3 DOWNTO 0);
	begin 
		vetor_entrada(0) := entrada1;
		vetor_entrada(1) := entrada2;
		vetor_entrada(2) := entrada3;
		vetor_entrada(3) := entrada4;	
			
		minAux := vetor_entrada(0);
		maxAux := vetor_entrada(0);
		for i in vetor_entrada'range loop
			if vetor_entrada(i) > maxAux then 
				maxAux := vetor_entrada(i);
			elsif vetor_entrada(i) < minAux then 
				minAux := vetor_entrada(i);
			end if; 
		end loop;
		min <= minAux;
		max <= maxAux;
	end min_max;
end min_max_pkg;
			
				
	