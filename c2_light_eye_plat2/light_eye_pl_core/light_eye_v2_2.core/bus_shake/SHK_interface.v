module SHK_interface#(
    parameter WD_SHK_SYNC = 16,
    parameter WD_SHK_DLAY = 15,

    parameter WD_ERR_INFO = 4
    )(
    //shake master
    output                      m_shk_name_wvalid,
    output  [WD_SHK_SYNC-1:0]   m_shk_name_smosi ,
    output  [WD_SHK_DLAY-1:0]   m_shk_name_dmosi ,
    input                       m_shk_name_wready,
    input   [WD_SHK_SYNC-1:0]   m_shk_name_smiso ,
    input   [WD_SHK_DLAY-1:0]   m_shk_name_dmiso ,

    //shake slaver
    input                       s_shk_name_wvalid,
    input   [WD_SHK_SYNC-1:0]   s_shk_name_smosi ,
    input   [WD_SHK_DLAY-1:0]   s_shk_name_dmosi ,
    output                      s_shk_name_wready,
    output  [WD_SHK_SYNC-1:0]   s_shk_name_smiso ,
    output  [WD_SHK_DLAY-1:0]   s_shk_name_dmiso ,

    //err master
    input   [WD_ERR_INFO-1:0]   s_err_name_info1,
    output  [WD_ERR_INFO-1:0]   m_err_name_info1
);

wire                    SHK_name_0_wvalid;
wire [WD_SHK_SYNC-1:0]  SHK_name_0_smosi ;
wire [WD_SHK_DLAY-1:0]  SHK_name_0_dmosi ;
wire                    SHK_name_0_wready;
wire [WD_SHK_SYNC-1:0]  SHK_name_0_smiso ;
wire [WD_SHK_DLAY-1:0]  SHK_name_0_dmiso ;


endmodule