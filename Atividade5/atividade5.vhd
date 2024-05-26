-- Declaração de Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declaração Entidade
ENTITY atividade5 IS
    GENERIC (
		  -- Constante de Frequencia de clock (Hz)	
        f_clk: integer := 50_000_000); 
    PORT (
        clk: in STD_LOGIC;
        ledS: out STD_LOGIC_VECTOR(9 DOWNTO 0);
		  enable, set_velocidade1, set_velocidade2, set_velocidade3, set_velocidade4, set_velocidade5, reset: in STD_LOGIC);
END ENTITY;

-- Declaração Arquitetura
ARCHITECTURE main OF atividade5 IS
    CONSTANT tempo_piscar: INTEGER := f_clk/2; -- Meio segundo
BEGIN
	
    PROCESS(clk, enable, reset)
        VARIABLE contador: integer RANGE 0 TO f_clk'high; -- Variável contadora
		  VARIABLE contador_leds: integer RANGE 0 TO 10 := 0;
		  VARIABLE contador_leds_apaga: integer RANGE 0 TO 10 := 0;
		  VARIABLE velocidade: integer RANGE 1 TO 20;
    BEGIN
	 
			-- Resetar: Apaga todos os leds e reseta o loop 
			IF reset = '0' THEN
				contador_leds := 0;
				contador_leds_apaga := 0;
				leds <= (others => '0');
				
			-- Com enable ativo e borda de subida do clock 
			ELSIF rising_edge(clk) and enable = '1' THEN 
				
				-- Incrementa a variavel contador, enquanto ela for menor que uma parcela do clock 
				-- Essa parcela é alterada, de acordo com a variavel velocidade, quanto menor a parcela mais rápido
					-- vai ser a velocidade do loop
				IF contador < (tempo_piscar / velocidade) THEN 
					contador := contador + 1;
				
				-- Quando o contador atinge o valor da parcela do clock é verificado se todos os leds acenderam
				-- então ele recomeça o loop apagando os leds
				ELSIF contador_leds = 10 THEN
					leds(contador_leds_apaga) <= '0';
					contador := 0;
					contador_leds_apaga := contador_leds_apaga + 1;
					IF contador_leds_apaga = 10 THEN
						contador_leds := 0;
						contador_leds_apaga := 0;
					END IF;
				
				-- Controla, verificando se o led atual e o proximo led esta aceso, se sim, é aceso o led atual
				ELSIF not leds(contador_leds) and not leds(contador_leds + 1) THEN 
					leds(contador_leds) <= '1';
					contador := 0;
					contador_leds := contador_leds + 1;
				END IF;
				
				-- Por meio da ativação dos switches é definido o valor da variavel velocidade, em caso de mais 
					-- de um switch estar aceso, ele seta a velocidade do primeiro switch da esquerda para a direita
				IF set_velocidade1 THEN 
					velocidade := 4;
				ELSIF set_velocidade2 THEN 
					velocidade := 8;
				ELSIF set_velocidade3 THEN 
					velocidade := 12;
				ELSIF set_velocidade4 THEN 
					velocidade := 16;
				ELSIF set_velocidade5 THEN
					velocidade := 20;
				ELSE 
					velocidade := 2;
				END IF;			
			
			-- Verifica se o switch de enable esta ativo, se sim, ele apaga os leds e reseta o loop
			ELSIF rising_edge(clk) and enable = '0' THEN 
				leds <= (others => '0');
				contador_leds := 0;
				contador_leds_apaga := 0;
			END IF;
		    
    end process;

END ARCHITECTURE;