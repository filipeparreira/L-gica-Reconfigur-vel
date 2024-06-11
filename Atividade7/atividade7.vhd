library ieee;
use ieee.std_logic_1164.all;
use work.ssd.all;

entity atividade7 is 
	generic(
		f_clk: integer:= 50_000_000
	);

	port(
		reset, pause, up, down: in bit;
		clk, mudar: in std_logic;
		ssd1, ssd2, ssd3, ssd4: out std_logic_vector(6 DOWNTO 0)
	);
end atividade7;

architecture main of atividade7 is 
	
begin 
	
	process(clk, reset, mudar, pause, up, down) 
		variable segundos, segundos_aux: integer := 0;
		variable contador: integer range 0 to f_clk'high;
	begin
		
		ssd_numbers_int(segundos, ssd1, ssd2, ssd3, ssd4);
		
		if  reset = '0' then
			--segundos := segundos_aux
		elsif rising_edge(clk) and mudar = '0' and pause = '1' then
			if contador < f_clk/13 then 
				contador := contador + 1;
			else 
				contador := 0;
				if up = '1' and down ='0' then
					segundos := segundos + 1;
					if segundos > segundos'high then
						segundos := segundos'high;
					end if;
				elsif up = '0' and down = '1' then
					segundos := segundos - 1;
					if segundos < 0 or segundos = 0 then
						segundos := 0;
					end if;
				end if;
				segundos_aux := segundos;
			end if;
		
		elsif rising_edge(clk) and pause = '0' then
			if contador = f_clk and segundos > 0 then 
				segundos := segundos - 1;
				contador := 0;
			else 
				contador := contador + 1;
			end if;			
		end if;
		
		/*
		if reset = '0' then
			segundos := segundos_aux;
		elsif mudar = '0' and rising_edge(clk) and pause = '1' then
			if contador < f_clk/13 then 
				contador := contador + 1;
			else 
				contador := 0;
				if up = '1' and down ='0' then
					segundos := segundos + 1;
					if segundos > segundos'high then
						segundos := segundos'high;
					end if;
				elsif up = '0' and down = '1' then
					segundos := segundos - 1;
					if segundos < 0 or segundos = 0 then
						segundos := 0;
					end if;
				end if;
				segundos_aux := segundos;
			end if;
		elsif rising_edge(clk) and pause = '0' then
			if contador = f_clk and segundos > 0 then
				segundos := segundos - 1;
				contador := 0;
			else 
				contador := contador + 1;
			end if;	
		end if;
		*/
		
	end process;
end main;