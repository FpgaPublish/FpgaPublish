//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/08/07 13:07:18
// Design Name: 
// Module Name: tb_light_eye_v2_13
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
`include "tb_class.sv"
`timescale 1ps / 1ps
module tb_light_eye_v2_13 #(
    
   )(
    
);
//SYS BUS
reg SYS_clock  = 0;
reg SYS_resetn = 0;
//
SV_MMCM mmcm;
initial mmcm = new();
always 
begin
    #(mmcm.gen_clk(100))
    SYS_clock <= mmcm.SYS_clock;
end
always 
begin
    #(mmcm.gen_rst(100))
    SYS_resetn <= mmcm.SYS_resetn;
end

//SHK master
parameter WD_SHK_SYNC = 16;
parameter WD_SHK_DLAY = 15;
reg                       SHK_wvalid = 0;
reg    [WD_SHK_SYNC-1:0]  SHK_smosi  = 0;
reg    [WD_SHK_DLAY-1:0]  SHK_dmosi  = 0;
wire                      SHK_wready;
wire   [WD_SHK_SYNC-1:0]  SHK_smiso ;
wire   [WD_SHK_DLAY-1:0]  SHK_dmiso ;
//SHK class
SV_SHK_M shk_m;
initial shk_m = new();
always @(posedge SYS_clock)
begin
    shk_m.gen_m_wvalid(SHK_wready);
    shk_m.gen_m_dmosi();
    shk_m.gen_m_smosi();
    SHK_wvalid <= shk_m.m_shk_wvalid;
    SHK_smosi  <= shk_m.m_shk_smosi ;
    SHK_dmosi  <= shk_m.m_shk_dmosi ;
end

//BRAM slaver
parameter WD_BRAM_DAT = 32;
parameter WD_BRAM_WEN = 4 ;
wire   [WD_BRAM_DAT-1:0]  BRAM_addr;
wire                      BRAM_clk ;
wire   [WD_BRAM_DAT-1:0]  BRAM_din ;
wire   [WD_BRAM_DAT-1:0]  BRAM_dout;
wire                      BRAM_en  ;
wire                      BRAM_rst ;
wire   [WD_BRAM_WEN-1:0]  BRAM_we  ;
// blk_mem_gen_0 u_blk_mem_gen_0 (
//     .clka (BRAM_clk   ),      // input wire clka
//     .ena  (BRAM_en    ),      // input wire ena
//     .wea  (BRAM_we[0] ),      // input wire [0 : 0] wea
//     .addra(BRAM_addr  ),      // input wire [10 : 0] addra
//     .dina (BRAM_din   ),      // input wire [31 : 0] dina
//     .douta(BRAM_dout  )       // output wire [31 : 0] douta
// );
assign BRAM_dout = BRAM_din + BRAM_addr;

//ADD module
gray_driv#(
    .NB_VER            ( 0  ),
    .WD_SHK_SYNC       ( WD_SHK_SYNC ),
    .WD_SHK_DLAY       ( WD_SHK_DLAY ),
    .WD_BRAM_DAT       ( WD_BRAM_DAT ),
    .WD_BRAM_WEN       ( WD_BRAM_WEN ),
    .WD_ERR_INFO       ( 4  )
)u_gray_driv(
    .s_sys_a_clock     ( SYS_clock     ),
    .s_sys_a_resetn    ( SYS_resetn    ),
    .s_shk_gray_wvalid ( SHK_wvalid ),
    .s_shk_gray_smosi  ( SHK_smosi  ),
    .s_shk_gray_dmosi  ( SHK_dmosi  ),
    .s_shk_gray_wready ( SHK_wready ),
    .s_shk_gray_smiso  ( SHK_smiso  ),
    .s_shk_gray_dmiso  ( SHK_dmiso  ),
    .m_bram_gray_addr  ( BRAM_addr  ),
    .m_bram_gray_clk   ( BRAM_clk   ),
    .m_bram_gray_din   ( BRAM_din   ),
    .m_bram_gray_dout  ( BRAM_dout  ),
    .m_bram_gray_en    ( BRAM_en    ),
    .m_bram_gray_rst   ( BRAM_rst   ),
    .m_bram_gray_we    ( BRAM_we    ),
    .s_err_gray_info1  (  'b0  ),
    .m_err_gray_info1  (       )
);


endmodule