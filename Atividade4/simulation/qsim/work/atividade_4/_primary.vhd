library verilog;
use verilog.vl_types.all;
entity atividade_4 is
    port(
        sel             : in     vl_logic_vector(3 downto 0);
        saida           : out    vl_logic_vector(7 downto 0);
        entradas        : in     vl_logic_vector(127 downto 0)
    );
end atividade_4;
