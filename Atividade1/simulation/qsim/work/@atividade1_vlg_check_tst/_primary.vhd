library verilog;
use verilog.vl_types.all;
entity Atividade1_vlg_check_tst is
    port(
        outAND          : in     vl_logic;
        outNAND         : in     vl_logic;
        outNOR          : in     vl_logic;
        outNOTa         : in     vl_logic;
        outNOTb         : in     vl_logic;
        outOR           : in     vl_logic;
        outXNOR         : in     vl_logic;
        outXOR          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Atividade1_vlg_check_tst;
