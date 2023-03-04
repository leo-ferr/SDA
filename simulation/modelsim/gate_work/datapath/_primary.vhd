library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        c               : in     vl_logic_vector(28 downto 0);
        N               : out    vl_logic;
        Z               : out    vl_logic;
        Ov              : out    vl_logic;
        Cout            : out    vl_logic;
        DEBUG_0_0       : out    vl_logic;
        DEBUG_0_1       : out    vl_logic;
        DEBUG_0_2       : out    vl_logic;
        DEBUG_0_3       : out    vl_logic;
        DEBUG_0_4       : out    vl_logic;
        DEBUG_0_5       : out    vl_logic;
        DEBUG_0_6       : out    vl_logic;
        DEBUG_0_7       : out    vl_logic;
        DEBUG_1_0       : out    vl_logic;
        DEBUG_1_1       : out    vl_logic;
        DEBUG_1_2       : out    vl_logic;
        DEBUG_1_3       : out    vl_logic;
        DEBUG_1_4       : out    vl_logic;
        DEBUG_1_5       : out    vl_logic;
        DEBUG_1_6       : out    vl_logic;
        DEBUG_1_7       : out    vl_logic;
        DEBUG_2_0       : out    vl_logic;
        DEBUG_2_1       : out    vl_logic;
        DEBUG_2_2       : out    vl_logic;
        DEBUG_2_3       : out    vl_logic;
        DEBUG_2_4       : out    vl_logic;
        DEBUG_2_5       : out    vl_logic;
        DEBUG_2_6       : out    vl_logic;
        DEBUG_2_7       : out    vl_logic;
        DEBUG_3_0       : out    vl_logic;
        DEBUG_3_1       : out    vl_logic;
        DEBUG_3_2       : out    vl_logic;
        DEBUG_3_3       : out    vl_logic;
        DEBUG_3_4       : out    vl_logic;
        DEBUG_3_5       : out    vl_logic;
        DEBUG_3_6       : out    vl_logic;
        DEBUG_3_7       : out    vl_logic;
        DEBUG_4_0       : out    vl_logic;
        DEBUG_4_1       : out    vl_logic;
        DEBUG_4_2       : out    vl_logic;
        DEBUG_4_3       : out    vl_logic;
        DEBUG_4_4       : out    vl_logic;
        DEBUG_4_5       : out    vl_logic;
        DEBUG_4_6       : out    vl_logic;
        DEBUG_4_7       : out    vl_logic;
        DEBUG_5_0       : out    vl_logic;
        DEBUG_5_1       : out    vl_logic;
        DEBUG_5_2       : out    vl_logic;
        DEBUG_5_3       : out    vl_logic;
        DEBUG_5_4       : out    vl_logic;
        DEBUG_5_5       : out    vl_logic;
        DEBUG_5_6       : out    vl_logic;
        DEBUG_5_7       : out    vl_logic;
        DEBUG_6_0       : out    vl_logic;
        DEBUG_6_1       : out    vl_logic;
        DEBUG_6_2       : out    vl_logic;
        DEBUG_6_3       : out    vl_logic;
        DEBUG_6_4       : out    vl_logic;
        DEBUG_6_5       : out    vl_logic;
        DEBUG_6_6       : out    vl_logic;
        DEBUG_6_7       : out    vl_logic;
        DEBUG_7_0       : out    vl_logic;
        DEBUG_7_1       : out    vl_logic;
        DEBUG_7_2       : out    vl_logic;
        DEBUG_7_3       : out    vl_logic;
        DEBUG_7_4       : out    vl_logic;
        DEBUG_7_5       : out    vl_logic;
        DEBUG_7_6       : out    vl_logic;
        DEBUG_7_7       : out    vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end datapath;
