library ieee;
use ieee.std_logic_1164.all;
use work.ssd.all;

entity atividade7 is 
	generic(
		f_clk: integer:= 50_000_000
	);

	port(
		reset, pause, mudar, up, down: in bit;
		clk: in std_logic;
		ssd1, ssd2, ssd3, ssd4: out std_logic_vector(6 DOWNTO 0)
	);
end atividade7;

architecture main of atividade7 is 
	
begin 
	
	process(clk, reset, mudar, pause, up, down) 
		variable segundos, segundos_aux: integer range 0 to 9999 := 1;
		variable contador: integer range 0 to f_clk'high;
	begin
	
		
		-- Verifica a borda de subida do clock
		if pause = '1' then
			ssd_numbers(segundos, ssd1, ssd2, ssd3, ssd4);
			if mudar = '0' and up = '1' and down = '0' then
				segundos := segundos + 10;
			elsif mudar = '0' and down = '1' and up = '0' then
				if segundos < 0 or segundos = 0 then
					segundos := segundos - 10;
				end if;
			end if;
		/*
		elsif rising_edge(clk) and reset then
			segundos := segundos_aux;
		
		elsif rising_edge(clk) and pause then 
			-- Enquanto o contador for menor que o clock (conta 1 segundo)
			if contador < f_clk then 
				contador := contador + 1;
			-- Completou 1 segundo
			elsif segundos = 0 then
				segundos := 0;
				contador:= 0;
				ssd_numbers(segundos, ssd1, ssd2, ssd3, ssd4);
			else
				segundos := segundos - 1;
				ssd_numbers(segundos, ssd1, ssd2, ssd3, ssd4);
				contador := 0;				
			end if;
		*/
		end if;
	end process;
end main;