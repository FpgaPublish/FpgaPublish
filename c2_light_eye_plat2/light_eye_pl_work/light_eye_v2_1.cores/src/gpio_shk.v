`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/07/31 18:12:40
// Design Name: 
// Module Name: gpio_shk
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


module gpio_shk#(
    parameter WD_GPIO = 32,
    parameter WD_SYNC = 16,
    parameter WD_DLAY = 15
    )(
    //input       s_sys_base_clock,
    //input       s_sys_base_resetn,
// gpio
    input   [WD_GPIO-1:0]    s_gpio_shk_tri_o,
    output  [WD_GPIO-1:0]    s_gpio_shk_tri_i,
//shk
    output                   m_shk_ctrl_wvalid,
    output  [WD_SYNC-1:0]    m_shk_ctrl_smosi ,
    output  [WD_DLAY-1:0]    m_shk_ctrl_dmosi ,
    input                    m_shk_ctrl_wready,
    input   [WD_SYNC-1:0]    m_shk_ctrl_smiso ,
    input   [WD_DLAY-1:0]    m_shk_ctrl_dmiso 
    );
//connect 
assign m_shk_ctrl_wvalid = s_gpio_shk_tri_o[0];
assign m_shk_ctrl_smosi  = s_gpio_shk_tri_o[WD_SYNC:1];
assign m_shk_ctrl_dmosi  = s_gpio_shk_tri_o[WD_DLAY+WD_SYNC:WD_SYNC+1];

assign s_gpio_shk_tri_i[0]                         = m_shk_ctrl_wready;
assign s_gpio_shk_tri_i[WD_SYNC:1]                 = m_shk_ctrl_smiso;
assign s_gpio_shk_tri_i[WD_DLAY+WD_SYNC:WD_SYNC+1] = m_shk_ctrl_dmiso;

endmodule
