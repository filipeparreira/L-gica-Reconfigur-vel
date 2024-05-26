library verilog;
use verilog.vl_types.all;
entity atividade_4_vlg_sample_tst is
    port(
        entradas        : in     vl_logic_vector(127 downto 0);
        sel             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end atividade_4_vlg_sample_tst;
