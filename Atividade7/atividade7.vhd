library ieee;
use ieee.std_logic_1164;

entity atividade7 is 
	generic(
		f_clk: integer:= 50_000_000
	);

	port(
		reset, pause, mudar, up, down, clk: in std_logic;
		ssd1, ssd2, ssd3, ssd4: out std_logic_vector(6 DOWNTO 0)
	);
end atividade7;

architecture main of atividade7 is 
	
begin 
	process(clk, reset, pause) 
		variable segundos: integer range 0 to 9999;
		variable contador: integer range 0 to f_clk'high;
	begin
		if rising_edge(clk) then 
			if contador < f_clk then 
				contador := contador + 1;

end main;