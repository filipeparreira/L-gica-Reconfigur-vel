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
		variable segundos, segundos_aux: integer range 0 to 9999 := 9999;
		variable contador: integer range 0 to f_clk'high;
	begin
		ssd_numbers(segundos, ssd1, ssd2, ssd3, ssd4);
		if reset = '0' then
			segundos := segundos'high;
		elsif rising_edge(clk) and pause = '0' then
			if contador < f_clk then 
				contador := contador + 1;
			else 
				contador := 0;
				segundos := segundos - 1;				
				if segundos < 0 or segundos = 0 then
					segundos := 9999;
					contador := 0;
				end if;
			end if;
		elsif rising_edge(clk) and (up = '1' or down = '1') then
			if up = '1' and down = '0' and mudar = '0' then
				segundos := segundos + 10;
				if segundos > segundos'high then
					segundos := segundos'high;
				end if;
			elsif up = '0' and down = '1' and mudar = '0' then 
				segundos := segundos - 10;
				if segundos < 0 or segundos = 0 then 
					segundos := 0;
				end if;
			end if;
		end if;
	end process;
end main;