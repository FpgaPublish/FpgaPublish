//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/08/07 12:38:25
// Design Name: 
// Module Name: tb_class
// Project Name: 
// Target Devices: ZYNQ7010 & XAUG
// Tool Versions: 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision: 0.01 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//sim mmcm
class SV_MMCM;
    //init
    bit SYS_clock ;
    bit SYS_resetn;
    bit phs_flg;

    function new();
        SYS_clock  = 0;
        SYS_resetn = 0;
        phs_flg    = 0;
    endfunction //new()
    //driv
    function integer gen_clk(input integer fre = 100,input integer phs = 0);
        if(phs_flg == 0)
            begin
                phs_flg = 1;
                return (1000_000 / fre * phs / 360);
            end
        else 
            begin
                SYS_clock = ~SYS_clock;
                return (1000_000 / fre / 2);
            end
    endfunction
    function integer gen_rst(input integer low = 100);
        SYS_resetn = 1;
        return low;
    endfunction
endclass //SV_MMCM

//sim master shake
class SV_SHK_M;
    bit      m_shk_wvalid;
    integer  m_shk_smosi ;
    integer  m_shk_dmosi ;

    function new();
        m_shk_wvalid = 0;
        m_shk_smosi  = 0;
        m_shk_dmosi  = 0;

    endfunction //new()
    function gen_m_wvalid(input bit s_shk_wready = 0);
        if(!s_shk_wready)
        begin
            m_shk_wvalid = 1;
        end
        else 
        begin
            m_shk_wvalid = 0;
        end
        
    endfunction
    function gen_m_smosi(input string mode = "RANDOM", input integer max = 100);
        case(mode)
        "RANDOM":
            begin
                if(m_shk_wvalid == 0)
                begin
                    m_shk_smosi = {$random % max};
                end
            end
        default: 
            begin
                m_shk_smosi = max;
            end
        endcase
    endfunction
    function gen_m_dmosi(input string mode = "RANDOM", input integer max = 100);
        case(mode)
        "RANDOM":
            begin
                if(m_shk_wvalid == 0)
                begin
                    m_shk_dmosi = {$random % max};
                end
            end
        default: 
            begin
                m_shk_dmosi = max;
            end
        endcase
    endfunction
    
endclass //SV_SHK_M

//sim slaver shake
