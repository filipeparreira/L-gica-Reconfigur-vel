library verilog;
use verilog.vl_types.all;
entity Atividade1 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        outNOTa         : out    vl_logic;
        outNOTb         : out    vl_logic;
        outOR           : out    vl_logic;
        outAND          : out    vl_logic;
        outNAND         : out    vl_logic;
        outNOR          : out    vl_logic;
        outXNOR         : out    vl_logic;
        outXOR          : out    vl_logic
    );
end Atividade1;
