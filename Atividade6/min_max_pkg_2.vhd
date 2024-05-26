PACKAGE min_max_pkg IS 
	type vetor_inteiros is array (NATURAL range<>) of INTEGER range 0 to 30;
	PROCEDURE min_max (signal entrada1, entrada2, entrada3, entrada4: in integer range 0 to 30;
							signal min, max: out INTEGER range 0 to 30);
end min_max_pkg;

package body min_max_pkg is 
	procedure min_max (signal entrada1, entrada2, entrada3, entrada4: in integer range 0 to 30;
							signal min, max: out INTEGER range 0 to 30) is 
	VARIABLE minAux, maxAux: INTEGER range 0 to 30;
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
			
				
	