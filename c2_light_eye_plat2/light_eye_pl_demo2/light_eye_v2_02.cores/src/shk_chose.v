`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/10 22:07:37
// Design Name: 
// Module Name: shk_chose
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
module shk_chose #(
    //shake bus
    parameter WD_SHK_SYNC = 16,
    parameter WD_SHK_DLAY = 15
   )(
    //shake slaver
    input                       s_shk_0_wvalid,
    input    [WD_SHK_SYNC-1:0]  s_shk_0_smosi ,
    input    [WD_SHK_DLAY-1:0]  s_shk_0_dmosi ,
    output                      s_shk_0_wready,
    output   [WD_SHK_SYNC-1:0]  s_shk_0_smiso ,
    output   [WD_SHK_DLAY-1:0]  s_shk_0_dmiso ,
    //shake master
    output                       m_shk_0_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_0_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_0_dmosi ,
    input                        m_shk_0_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_0_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_0_dmiso ,
    //shake master
    output                       m_shk_1_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_1_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_1_dmosi ,
    input                        m_shk_1_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_1_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_1_dmiso ,
    //shake master
    output                       m_shk_2_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_2_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_2_dmosi ,
    input                        m_shk_2_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_2_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_2_dmiso ,
    //shake master
    output                       m_shk_3_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_3_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_3_dmosi ,
    input                        m_shk_3_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_3_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_3_dmiso ,
    //shake master
    output                       m_shk_4_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_4_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_4_dmosi ,
    input                        m_shk_4_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_4_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_4_dmiso ,
    //shake master
    output                       m_shk_5_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_5_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_5_dmosi ,
    input                        m_shk_5_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_5_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_5_dmiso ,
    //shake master
    output                       m_shk_6_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_6_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_6_dmosi ,
    input                        m_shk_6_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_6_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_6_dmiso ,
    //shake master
    output                       m_shk_7_wvalid,
    output   [WD_SHK_SYNC-1:0]   m_shk_7_smosi ,
    output   [WD_SHK_DLAY-1:0]   m_shk_7_dmosi ,
    input                        m_shk_7_wready,
    input    [WD_SHK_SYNC-1:0]   m_shk_7_smiso ,
    input    [WD_SHK_DLAY-1:0]   m_shk_7_dmiso 
    
);
//slaver back 
assign s_shk_0_wready = (s_shk_0_smosi[0]) ? m_shk_0_wready : 
                        (s_shk_0_smosi[1]) ? m_shk_1_wready :
                        (s_shk_0_dmosi[2]) ? m_shk_2_wready :
                        (s_shk_0_dmosi[3]) ? m_shk_3_wready :
                        (s_shk_0_smosi[4]) ? m_shk_4_wready : 
                        (s_shk_0_smosi[5]) ? m_shk_5_wready :
                        (s_shk_0_dmosi[6]) ? m_shk_6_wready :
                        (s_shk_0_dmosi[7]) ? m_shk_7_wready : 1'b0;
                        
assign s_shk_0_smiso  = (s_shk_0_smosi[0]) ? m_shk_0_smiso  : 
                        (s_shk_0_smosi[1]) ? m_shk_1_smiso  :
                        (s_shk_0_dmosi[2]) ? m_shk_2_smiso  :
                        (s_shk_0_dmosi[3]) ? m_shk_3_smiso  :
                        (s_shk_0_smosi[4]) ? m_shk_4_smiso  : 
                        (s_shk_0_smosi[5]) ? m_shk_5_smiso  :
                        (s_shk_0_dmosi[6]) ? m_shk_6_smiso  :
                        (s_shk_0_dmosi[7]) ? m_shk_7_smiso  : 1'b0;
                        
assign s_shk_0_dmiso  = (s_shk_0_smosi[0]) ? m_shk_0_dmiso  : 
                        (s_shk_0_smosi[1]) ? m_shk_1_dmiso  :
                        (s_shk_0_dmosi[2]) ? m_shk_2_dmiso  :
                        (s_shk_0_dmosi[3]) ? m_shk_3_dmiso  :
                        (s_shk_0_smosi[4]) ? m_shk_4_dmiso  : 
                        (s_shk_0_smosi[5]) ? m_shk_5_dmiso  :
                        (s_shk_0_dmosi[6]) ? m_shk_6_dmiso  :
                        (s_shk_0_dmosi[7]) ? m_shk_7_dmiso  : 1'b0;
                        

//master recv 
assign m_shk_0_wvalid = s_shk_0_wvalid;
assign m_shk_0_smosi  = s_shk_0_smosi ;
assign m_shk_0_dmosi  = s_shk_0_dmosi ;

assign m_shk_1_wvalid = s_shk_0_wvalid;
assign m_shk_1_smosi  = s_shk_0_smosi ;
assign m_shk_1_dmosi  = s_shk_0_dmosi ;

assign m_shk_2_wvalid = s_shk_0_wvalid;
assign m_shk_2_smosi  = s_shk_0_smosi ;
assign m_shk_2_dmosi  = s_shk_0_dmosi ;

assign m_shk_3_wvalid = s_shk_0_wvalid;
assign m_shk_3_smosi  = s_shk_0_smosi ;
assign m_shk_3_dmosi  = s_shk_0_dmosi ;

assign m_shk_4_wvalid = s_shk_0_wvalid;
assign m_shk_4_smosi  = s_shk_0_smosi ;
assign m_shk_4_dmosi  = s_shk_0_dmosi ;

assign m_shk_5_wvalid = s_shk_0_wvalid;
assign m_shk_5_smosi  = s_shk_0_smosi ;
assign m_shk_5_dmosi  = s_shk_0_dmosi ;

assign m_shk_6_wvalid = s_shk_0_wvalid;
assign m_shk_6_smosi  = s_shk_0_smosi ;
assign m_shk_6_dmosi  = s_shk_0_dmosi ;

assign m_shk_7_wvalid = s_shk_0_wvalid;
assign m_shk_7_smosi  = s_shk_0_smosi ;
assign m_shk_7_dmosi  = s_shk_0_dmosi ;

assign m_shk_8_wvalid = s_shk_0_wvalid;
assign m_shk_8_smosi  = s_shk_0_smosi ;
assign m_shk_8_dmosi  = s_shk_0_dmosi ;


endmodule
