-- DECLARAÇÃO DE BIBLIOTECAS/PACOTES
library ieee;
use ieee.std_logic_1164.all;
use work.ssd.all; -- USO DO ARQUIVO ssd

-- DECLARAÇÃO DA ENTIDADE
entity atividade7 is 
	-- Define o valor constante do clock - 50 MHz
	generic(
		f_clk: integer:= 50_000_000
	);

	-- Define as portas (auto descritivas)
	port(
		reset, pause, up, down: in bit;
		clk, mudar: in std_logic;
		ssd1, ssd2, ssd3, ssd4: out std_logic_vector(6 DOWNTO 0);
		leds: out std_logic_vector(9 DOWNTO 0)
	);
end atividade7;

-- DECLARAÇÃO DA ARQUITETURA
architecture main of atividade7 is 
	
begin 
		
	-- Processo que detecta mudança nos botões, switches e clock
	process(clk, reset, mudar, pause, up, down) 
	
		-- Seção declarativa, declarando variaveis auxiliares
		variable segundos, segundos_aux: integer range 0 to 9999 := 0;
		variable contador, contador_aux, contador_seg, count_rst: integer range 0 to f_clk'high;
	
	begin
		
		-- Exibe os numeros no display a cada atualização de clock
		ssd_numbers_int(segundos, ssd1, ssd2, ssd3, ssd4);
		
		-- IF responsavel pela alteração dos valores de segundos
			-- Utiliza-se o push buttom e dois dos switches para aumentar
			-- ou diminuir o valor de segundos, só é possivel fazer isso
			-- quando o switch pause esta ativado.
		if rising_edge(clk) and mudar = '0' and pause = '1' then
			contador := 0;
			if contador_aux < f_clk/13 then 
				contador_aux := contador_aux + 1;
			else 
				contador_aux := 0;
				-- Aumentar
				if up = '1' and down ='0' and segundos < segundos'high then
					segundos := segundos + 1;
					leds <= (others => '0');
				-- Diminuir
				elsif up = '0' and down = '1' and segundos > 0 then
					segundos := segundos - 1;
				end if;
				segundos_aux := segundos;
			end if;
		-- Codição responsavel pelo decremento da variavel segundos
			-- a cada 1 segundos com base no ciclo de clock 
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
		
		-- Condição que verifica se já chegou a 0, e então
			-- písca todos os leds a cada meio segundo 
		if rising_edge(clk) and segundos = 0 then
			if contador_seg = f_clk/2 then
				contador_seg := 0;
				leds <= not leds;
			else 
				contador_seg := contador_seg + 1;
			end if;
		end if;
		
		-- Condição responsável pelo assincronismo do reset,
			-- quando aperta-se o push buttom referente ao reset,
			-- através da variável auxiliar de segundos, atribui-se 
			-- a variavel principal de segundos e inicia-se o decre-
			-- mento novamente.
		if reset = '0' and rising_edge(clk) then
			segundos := segundos_aux;
			contador_aux := 0;
			contador := 0;
		end if;	
	end process;
end main;