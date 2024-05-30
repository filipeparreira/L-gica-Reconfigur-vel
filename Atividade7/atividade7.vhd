library ieee;
use ieee.std_logic_1164.all;
use work.ssd.all;

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
		-- Verifica a borda de subida do clock
		if rising_edge(clk) then 
			-- Enquanto o contador for menor que o clock (conta 1 segundo)
			if contador < f_clk then 
				contador := contador + 1;
			-- Completou 1 segundo
			elsif segundos = 9999 then
				segundos := 0;
				contador:= 0;
			else
				segundos := segundos + 1;
				ssd_numbers(segundos, ssd1, ssd2, ssd3, ssd4);
				contador := 0;				
			end if;
		end if;
	end process;
end main;