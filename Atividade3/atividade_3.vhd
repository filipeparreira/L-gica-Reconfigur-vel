LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY atividade_3 IS PORT (
	ssd_in_1, ssd_in_2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ssd_out_1, ssd_out_2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END atividade_3;

ARCHITECTURE main OF atividade_3 IS

	BEGIN 
	
		WITH ssd_in_1 SELECT 
			ssd_out_1 <= "1000000" WHEN "0000",
							"1111001" WHEN "0001",
							"0100100" WHEN "0010",
							"0110000" WHEN "0011",
							"0011001" WHEN "0100",
							"0010010" WHEN "0101",
							"0000010" WHEN "0110",
							"1111000" WHEN "0111",
							"0000000" WHEN "1000",
							"0010000" WHEN "1001",
							"0000110" WHEN others;
			WITH ssd_in_2 SELECT 
			ssd_out_2 <= "1000000" WHEN "0000",
							"1111001" WHEN "0001",
							"0100100" WHEN "0010",
							"0110000" WHEN "0011",
							"0011001" WHEN "0100",
							"0010010" WHEN "0101",
							"0000010" WHEN "0110",
							"1111000" WHEN "0111",
							"0000000" WHEN "1000",
							"0010000" WHEN "1001",
							"0000110" WHEN others;
END ARCHITECTURE;

