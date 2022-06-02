`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:09:49
// Design Name: 
// Module Name: axu2cg_top
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


module axu2cg_top(
    input       i_clk_port,
    
    input  [3:0] i_key_port,
    output [3:0] o_led_port
    );

//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------

//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
wire i_sys_clk;
wire i_sys_clk_bufg;
wire i_rst_n  ;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------

//*********************************************
//module and task to build part of system
//---------------------------------------------
BUFG BUFG_inst (
    .O(i_sys_clk_bufg), // 1-bit output: Clock output
    .I(i_clk_port)  // 1-bit input: Clock input
);

clk_wiz_0 u_clk_wiz_0
   (
    // Clock out ports
    .clk_out1(i_sys_clk),     // output clk_out1
    // Status and control signals
    .locked(i_rst_n),         // output locked
    // Clock in ports
    .clk_in1(i_sys_clk_bufg));      // input clk_in1

key_led_blck#(
    .WD_KEY       ( 4 ),
    .WD_LED       ( 4 ),
    .WD_INFO      ( 4 ),
    .MD_PRESS     ( 1'b0 ),
    .MD_LIGHT     ( 1'b0 ),
    .NB_DLY       ( 32'd1000_000_000 ),
    .NB_FAST      ( 5'd24 ),
    .NB_SLOW      ( 5'd26 )
)u_key_led_blck(
    .i_sys_clk    ( i_sys_clk    ),
    .i_rst_n      ( i_rst_n      ),
    .i_key_row    ( i_key_port    ),
    .i_info0_data ( 4'd0 ),
    .i_info1_data ( 4'd1 ),
    .i_info2_data ( 4'd2 ),
    .i_info3_data ( 4'd3 ),
    .i_info4_data ( 4'd4 ),
    .i_info5_data ( 4'd5 ),
    .i_info6_data ( 4'd6 ),
    .o_led_row    ( o_led_port    )
);

//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------

endmodule
