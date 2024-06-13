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
		ssd1, ssd2, ssd3, ssd4: out std_logic_vector(6 DOWNTO 0);
		leds: out std_logic_vector(9 DOWNTO 0)
	);
end atividade7;

architecture main of atividade7 is 
	
begin 
	
	process(clk, reset, mudar, pause, up, down) 
		variable segundos, segundos_aux: integer range 0 to 9999 := 0;
		variable contador, contador_aux, contador_seg, count_rst: integer range 0 to f_clk'high;
	begin
		
		ssd_numbers_int(segundos, ssd1, ssd2, ssd3, ssd4);
		
		
		if rising_edge(clk) and mudar = '0' and pause = '1' then
			contador := 0;
			if contador_aux < f_clk/13 then 
				contador_aux := contador_aux + 1;
			else 
				contador_aux := 0;
				if up = '1' and down ='0' and segundos < segundos'high then
					segundos := segundos + 1;
					leds <= (others => '0');
				elsif up = '0' and down = '1' and segundos > 0 then
					segundos := segundos - 1;
				end if;
				segundos_aux := segundos;
			end if;
		elsif rising_edge(clk) and pause = '0' then
			contador_aux := 0;
			if contador = f_clk and segundos > 0 then 
				segundos := segundos - 1;
				contador := 0;
				leds <= (others => '0');
			else 
				contador := contador + 1;
			end if;			
		end if;
		
		if rising_edge(clk) and segundos = 0 then
			if contador_seg = f_clk/2 then
				contador_seg := 0;
				leds <= not leds;
			else 
				contador_seg := contador_seg + 1;
			end if;
		end if;
		
		
		if reset = '0' and rising_edge(clk) then
			segundos := segundos_aux;
			contador_aux := 0;
			contador := 0;
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