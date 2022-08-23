`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/06 00:07:25
// Design Name: 
// Module Name: light_eye_top
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


module light_eye_top(
    input   clk_in1_0
    );

//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
localparam WD_BRAM_DAT = 32;
localparam WD_BRAM_WEN = 4;

localparam WD_SHK_DLY = 15;
localparam WD_SHK_SYC = 16;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
//BRAM interface
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_0_addr;
wire                    BRAM_PORTB_0_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_0_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_0_dout;
wire                    BRAM_PORTB_0_en  ;
wire                    BRAM_PORTB_0_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_0_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_1_addr;
wire                    BRAM_PORTB_1_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_1_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_1_dout;
wire                    BRAM_PORTB_1_en  ;
wire                    BRAM_PORTB_1_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_1_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_2_addr;
wire                    BRAM_PORTB_2_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_2_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_2_dout;
wire                    BRAM_PORTB_2_en  ;
wire                    BRAM_PORTB_2_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_2_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_3_addr;
wire                    BRAM_PORTB_3_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_3_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_3_dout;
wire                    BRAM_PORTB_3_en  ;
wire                    BRAM_PORTB_3_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_3_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_4_addr;
wire                    BRAM_PORTB_4_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_4_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_4_dout;
wire                    BRAM_PORTB_4_en  ;
wire                    BRAM_PORTB_4_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_4_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_5_addr;
wire                    BRAM_PORTB_5_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_5_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_5_dout;
wire                    BRAM_PORTB_5_en  ;
wire                    BRAM_PORTB_5_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_5_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_6_addr;
wire                    BRAM_PORTB_6_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_6_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_6_dout;
wire                    BRAM_PORTB_6_en  ;
wire                    BRAM_PORTB_6_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_6_we  ;

wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_7_addr;
wire                    BRAM_PORTB_7_clk ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_7_din ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_7_dout;
wire                    BRAM_PORTB_7_en  ;
wire                    BRAM_PORTB_7_rst ;
wire  [WD_BRAM_DAT-1:0] BRAM_PORTB_7_we  ;

wire  [WD_SHK_DLY-1:0]  SHK_ctrl_0_dmiso ;
wire  [WD_SHK_DLY-1:0]  SHK_ctrl_0_dmosi ;
wire  [WD_SHK_SYC-1:0]  SHK_ctrl_0_smiso ;
wire  [WD_SHK_SYC-1:0]  SHK_ctrl_0_smosi ;
wire                    SHK_ctrl_0_wready;
wire                    SHK_ctrl_0_wvalid;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------

//*********************************************
//module and task to build part of system
//---------------------------------------------
light_eye_v2_2_wrapper u_light_eye_v2_2_wrapper(
    .BRAM_PORTB_0_addr   ( BRAM_PORTB_0_addr   ),
    .BRAM_PORTB_0_clk    ( BRAM_PORTB_0_clk    ),
    .BRAM_PORTB_0_din    ( BRAM_PORTB_0_din    ),
    .BRAM_PORTB_0_dout   ( BRAM_PORTB_0_dout   ),
    .BRAM_PORTB_0_en     ( BRAM_PORTB_0_en     ),
    .BRAM_PORTB_0_rst    ( BRAM_PORTB_0_rst    ),
    .BRAM_PORTB_0_we     ( BRAM_PORTB_0_we     ),
    .BRAM_PORTB_1_addr   ( BRAM_PORTB_1_addr   ),
    .BRAM_PORTB_1_clk    ( BRAM_PORTB_1_clk    ),
    .BRAM_PORTB_1_din    ( BRAM_PORTB_1_din    ),
    .BRAM_PORTB_1_dout   ( BRAM_PORTB_1_dout   ),
    .BRAM_PORTB_1_en     ( BRAM_PORTB_1_en     ),
    .BRAM_PORTB_1_rst    ( BRAM_PORTB_1_rst    ),
    .BRAM_PORTB_1_we     ( BRAM_PORTB_1_we     ),
    .BRAM_PORTB_2_addr   ( BRAM_PORTB_2_addr   ),
    .BRAM_PORTB_2_clk    ( BRAM_PORTB_2_clk    ),
    .BRAM_PORTB_2_din    ( BRAM_PORTB_2_din    ),
    .BRAM_PORTB_2_dout   ( BRAM_PORTB_2_dout   ),
    .BRAM_PORTB_2_en     ( BRAM_PORTB_2_en     ),
    .BRAM_PORTB_2_rst    ( BRAM_PORTB_2_rst    ),
    .BRAM_PORTB_2_we     ( BRAM_PORTB_2_we     ),
    .BRAM_PORTB_3_addr   ( BRAM_PORTB_3_addr   ),
    .BRAM_PORTB_3_clk    ( BRAM_PORTB_3_clk    ),
    .BRAM_PORTB_3_din    ( BRAM_PORTB_3_din    ),
    .BRAM_PORTB_3_dout   ( BRAM_PORTB_3_dout   ),
    .BRAM_PORTB_3_en     ( BRAM_PORTB_3_en     ),
    .BRAM_PORTB_3_rst    ( BRAM_PORTB_3_rst    ),
    .BRAM_PORTB_3_we     ( BRAM_PORTB_3_we     ),
    .BRAM_PORTB_4_addr   ( BRAM_PORTB_4_addr   ),
    .BRAM_PORTB_4_clk    ( BRAM_PORTB_4_clk    ),
    .BRAM_PORTB_4_din    ( BRAM_PORTB_4_din    ),
    .BRAM_PORTB_4_dout   ( BRAM_PORTB_4_dout   ),
    .BRAM_PORTB_4_en     ( BRAM_PORTB_4_en     ),
    .BRAM_PORTB_4_rst    ( BRAM_PORTB_4_rst    ),
    .BRAM_PORTB_4_we     ( BRAM_PORTB_4_we     ),
    .BRAM_PORTB_5_addr   ( BRAM_PORTB_5_addr   ),
    .BRAM_PORTB_5_clk    ( BRAM_PORTB_5_clk    ),
    .BRAM_PORTB_5_din    ( BRAM_PORTB_5_din    ),
    .BRAM_PORTB_5_dout   ( BRAM_PORTB_5_dout   ),
    .BRAM_PORTB_5_en     ( BRAM_PORTB_5_en     ),
    .BRAM_PORTB_5_rst    ( BRAM_PORTB_5_rst    ),
    .BRAM_PORTB_5_we     ( BRAM_PORTB_5_we     ),
    .BRAM_PORTB_6_addr   ( BRAM_PORTB_6_addr   ),
    .BRAM_PORTB_6_clk    ( BRAM_PORTB_6_clk    ),
    .BRAM_PORTB_6_din    ( BRAM_PORTB_6_din    ),
    .BRAM_PORTB_6_dout   ( BRAM_PORTB_6_dout   ),
    .BRAM_PORTB_6_en     ( BRAM_PORTB_6_en     ),
    .BRAM_PORTB_6_rst    ( BRAM_PORTB_6_rst    ),
    .BRAM_PORTB_6_we     ( BRAM_PORTB_6_we     ),
    .BRAM_PORTB_7_addr   ( BRAM_PORTB_7_addr   ),
    .BRAM_PORTB_7_clk    ( BRAM_PORTB_7_clk    ),
    .BRAM_PORTB_7_din    ( BRAM_PORTB_7_din    ),
    .BRAM_PORTB_7_dout   ( BRAM_PORTB_7_dout   ),
    .BRAM_PORTB_7_en     ( BRAM_PORTB_7_en     ),
    .BRAM_PORTB_7_rst    ( BRAM_PORTB_7_rst    ),
    .BRAM_PORTB_7_we     ( BRAM_PORTB_7_we     ),
    .m_shk_ctrl_0_dmiso  ( SHK_ctrl_0_dmiso    ),
    .m_shk_ctrl_0_dmosi  ( SHK_ctrl_0_dmosi    ),
    .m_shk_ctrl_0_smiso  ( SHK_ctrl_0_smiso    ),
    .m_shk_ctrl_0_smosi  ( SHK_ctrl_0_smosi    ),
    .m_shk_ctrl_0_wready ( SHK_ctrl_0_wready   ),
    .m_shk_ctrl_0_wvalid ( SHK_ctrl_0_wvalid   )
);
//
light_eye_hardware_wrapper u_light_eye_hardware_wrapper(
    .clk_in1_0          ( clk_in1_0          ),
    .m_bram_gray_0_addr ( BRAM_PORTB_0_addr ),
    .m_bram_gray_0_clk  ( BRAM_PORTB_0_clk  ),
    .m_bram_gray_0_din  ( BRAM_PORTB_0_din  ),
    .m_bram_gray_0_dout ( BRAM_PORTB_0_dout ),
    .m_bram_gray_0_en   ( BRAM_PORTB_0_en   ),
    .m_bram_gray_0_rst  ( BRAM_PORTB_0_rst  ),
    .m_bram_gray_0_we   ( BRAM_PORTB_0_we   ),
    .m_bram_gray_1_addr ( BRAM_PORTB_1_addr ),
    .m_bram_gray_1_clk  ( BRAM_PORTB_1_clk  ),
    .m_bram_gray_1_din  ( BRAM_PORTB_1_din  ),
    .m_bram_gray_1_dout ( BRAM_PORTB_1_dout ),
    .m_bram_gray_1_en   ( BRAM_PORTB_1_en   ),
    .m_bram_gray_1_rst  ( BRAM_PORTB_1_rst  ),
    .m_bram_gray_1_we   ( BRAM_PORTB_1_we   ),
    .m_bram_gray_2_addr ( BRAM_PORTB_2_addr ),
    .m_bram_gray_2_clk  ( BRAM_PORTB_2_clk  ),
    .m_bram_gray_2_din  ( BRAM_PORTB_2_din  ),
    .m_bram_gray_2_dout ( BRAM_PORTB_2_dout ),
    .m_bram_gray_2_en   ( BRAM_PORTB_2_en   ),
    .m_bram_gray_2_rst  ( BRAM_PORTB_2_rst  ),
    .m_bram_gray_2_we   ( BRAM_PORTB_2_we   ),
    .m_bram_gray_3_addr ( BRAM_PORTB_3_addr ),
    .m_bram_gray_3_clk  ( BRAM_PORTB_3_clk  ),
    .m_bram_gray_3_din  ( BRAM_PORTB_3_din  ),
    .m_bram_gray_3_dout ( BRAM_PORTB_3_dout ),
    .m_bram_gray_3_en   ( BRAM_PORTB_3_en   ),
    .m_bram_gray_3_rst  ( BRAM_PORTB_3_rst  ),
    .m_bram_gray_3_we   ( BRAM_PORTB_3_we   ),
    .m_bram_gray_4_addr ( BRAM_PORTB_4_addr ),
    .m_bram_gray_4_clk  ( BRAM_PORTB_4_clk  ),
    .m_bram_gray_4_din  ( BRAM_PORTB_4_din  ),
    .m_bram_gray_4_dout ( BRAM_PORTB_4_dout ),
    .m_bram_gray_4_en   ( BRAM_PORTB_4_en   ),
    .m_bram_gray_4_rst  ( BRAM_PORTB_4_rst  ),
    .m_bram_gray_4_we   ( BRAM_PORTB_4_we   ),
    .m_bram_gray_5_addr ( BRAM_PORTB_5_addr ),
    .m_bram_gray_5_clk  ( BRAM_PORTB_5_clk  ),
    .m_bram_gray_5_din  ( BRAM_PORTB_5_din  ),
    .m_bram_gray_5_dout ( BRAM_PORTB_5_dout ),
    .m_bram_gray_5_en   ( BRAM_PORTB_5_en   ),
    .m_bram_gray_5_rst  ( BRAM_PORTB_5_rst  ),
    .m_bram_gray_5_we   ( BRAM_PORTB_5_we   ),
    .m_bram_gray_6_addr ( BRAM_PORTB_6_addr ),
    .m_bram_gray_6_clk  ( BRAM_PORTB_6_clk  ),
    .m_bram_gray_6_din  ( BRAM_PORTB_6_din  ),
    .m_bram_gray_6_dout ( BRAM_PORTB_6_dout ),
    .m_bram_gray_6_en   ( BRAM_PORTB_6_en   ),
    .m_bram_gray_6_rst  ( BRAM_PORTB_6_rst  ),
    .m_bram_gray_6_we   ( BRAM_PORTB_6_we   ),
    .m_bram_gray_7_addr ( BRAM_PORTB_7_addr ),
    .m_bram_gray_7_clk  ( BRAM_PORTB_7_clk  ),
    .m_bram_gray_7_din  ( BRAM_PORTB_7_din  ),
    .m_bram_gray_7_dout ( BRAM_PORTB_7_dout ),
    .m_bram_gray_7_en   ( BRAM_PORTB_7_en   ),
    .m_bram_gray_7_rst  ( BRAM_PORTB_7_rst  ),
    .m_bram_gray_7_we   ( BRAM_PORTB_7_we   ),
    .s_shk_0_0_dmiso    ( SHK_ctrl_0_dmiso  ),
    .s_shk_0_0_dmosi    ( SHK_ctrl_0_dmosi  ),
    .s_shk_0_0_smiso    ( SHK_ctrl_0_smiso  ),
    .s_shk_0_0_smosi    ( SHK_ctrl_0_smosi  ),
    .s_shk_0_0_wready   ( SHK_ctrl_0_wready ),
    .s_shk_0_0_wvalid   ( SHK_ctrl_0_wvalid )
);

//*********************************************
//expand and plug-in part with version 
//---------------------------------------------

//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------








endmodule
