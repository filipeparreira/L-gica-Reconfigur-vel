----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------
entity atividade8 is
    port(
        standby, clk, rst, teste: in std_logic;
		  sem1, sem2: out std_logic_vector(2 downto 0);
		  zeros: out std_logic_vector(3 downto 0));
end entity;
----------------------------------------------------------
architecture main of atividade8 is

    -- Declarações relativas à máquina de estados:
    type state is (VerdeVermelho, AmareloVermelho, VermelhoVerde, VermelhoAmarelo, StandbyAceso, StandbyApagado);
    signal pr_state, nx_state: state;

    -- Declarações relativas ao tempo:
    constant T1: natural := 100_000_000; -- 2 segundos
    constant T2: natural := 50_000_000; -- 1 segundo
	constant T3: natural := 250_000_000; -- 5 segundos 
	constant T4: natural := 100_000_000; -- 2 segundos
    constant tmax: natural := T3-1; -- Atribui tempo máximo a maior variavel em tamanho
    signal t: natural range 0 to tmax; -- Variavel de tempo
    
begin
	-- Definição dos LEDs não utilizados como 0
	zeros <= "0000";

    -- Timer
    process (clk, rst)
    begin
		if rst = '0' then
			t <= 0;
        elsif rising_edge(clk) then
            if pr_state /= nx_state then
                t <= 0;
            elsif t /= tmax then
                t <= t + 1;
            end if;
        end if;
    end process;
    
    -- Registrador de estados:
    process (clk, rst, teste)
    begin
		-- Se o reset for pressionado, volta ao estado inicial
		if rst = '0' then
			pr_state <= VerdeVermelho;
		-- Se o botão de standby for precionado, vai para o ciclo de standby
		elsif standby = '0' then
			pr_state <= StandbyAceso;
        elsif rising_edge(clk) then
            pr_state <= nx_state;
        end if;
    end process;

    -- Lógica da máquina:
    process(all)
    begin
        case pr_state is
			
			-- Caso Inicial, verde de um sinal e o vermelho do outro fica aceso durante
				-- 2 segundos
            when VerdeVermelho =>
                sem1 <= "001";
					sem2 <= "100";
					-- Nestas condições de 'teste = 1', ele divide o tempo analizado por 2 
						-- deixando o funcionamento mais rapido
					if teste = '1' then
						if t >= (T1/2)-1 then -- Ou t = T1 - 1
							nx_state <= AmareloVermelho;
						else
							nx_state <= VerdeVermelho;
						end if;
					else 
						if t >= T1-1 then -- Ou t = T1 - 1
							nx_state <= AmareloVermelho;
						else
							nx_state <= VerdeVermelho;
						end if;

					end if;
			
			-- Amarelo de um sinal e vermelho do outro fica aceso durante 1 segundo
				-- neste caso o vermelho permanece aceso, ficando aceso por 3 segundos total
            when AmareloVermelho =>
                sem1 <= "010";
				sem2 <= "100";
				
				if teste = '1' then
					if t >= (T2/2)-1 then -- Ou t = T2 - 1
							nx_state <= VermelhoVerde;
						else
							nx_state <= AmareloVermelho;
						end if;
				else
						if t >= T2-1 then -- Ou t = T2 - 1
							nx_state <= VermelhoVerde;
						else
							nx_state <= AmareloVermelho;
						end if;
				end if;

			-- Vermelho de um sinal e o verde do outro fica aceso por 5 segundos
            when VermelhoVerde =>
                sem1 <= "100";
				sem2 <= "001";
				if teste = '1' then
					if t >= (T3/2)-1 then
							nx_state <= VermelhoAmarelo;
						else
							nx_state <= VermelhoVerde;
						end if;
				else 
						if t >= (T3)-1 then
							nx_state <= VermelhoAmarelo;
						else
							nx_state <= VermelhoVerde;
						end if;
				end if;

			-- A transição de amarelo para vermelho também ocorre em segundo,
				-- neste caso, o vermelho de um sinal fica aceso por 6 segundos total.
				-- Este é considerado o ultimo estado, voltando então para o estado inicial.
            when VermelhoAmarelo =>
                sem1 <= "100";
				sem2 <= "010";
				
				if teste = '1' then
					if t >= (T2/2)-1 then
							nx_state <= VerdeVermelho;
						else
							nx_state <= VermelhoAmarelo;
					end if;
				else 
					if t >= T2-1 then
						nx_state <= VerdeVermelho;
					else
						nx_state <= VermelhoAmarelo;
					end if;
				end if;

			-- Estado de standby, deixa as luzes "amarelas" acesas durante 2 segundos
				-- e apagadas durante 1, os estados abaixo ficam em um loop, não interagindo
				-- com os outros estados
            when StandbyAceso =>
                sem1 <= "010";
					sem2 <= "010";
                if t >= T1-1 then
                    nx_state <= StandbyApagado;
                else
                    nx_state <= StandbyAceso;
                end if;
            when StandbyApagado =>
                sem1 <= "000";					 
					sem2 <= "000";
                if t >= T2-1 then
                    nx_state <= StandbyAceso;
                else
                    nx_state <= StandbyApagado;
                end if;
            when others =>
        end case;
    end process;
    
end architecture;