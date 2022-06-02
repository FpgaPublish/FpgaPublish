`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/22 20:45:42
// Design Name: 
// Module Name: key_led_top
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


module key_led_top(
    input           i_clk_port,
    input  [3:0]    i_key_row,
    output [3:0]    o_led_row
    );
wire i_clk_buf;
wire i_sys_clk;
wire i_rst_n;
BUFG u_bufg(
    .O(i_clk_buf),
    .I(i_clk_port)
    );
clk_wiz_0 u_clk_wiz_0(
    // Clock out ports
    .clk_out1(i_sys_clk), // output clk_out1
    // Status and control signals
    .locked(i_rst_n),     // output locked
    // Clock in ports
    .clk_in1(i_clk_buf) // input clk_in1
);      
key_led_blck_0 u_key_led_blck_0 (
  .i_sys_clk   (i_sys_clk   ),        // input wire i_sys_clk
  .i_rst_n     (i_rst_n     ),            // input wire i_rst_n
  .i_key_row   (i_key_row   ),        // input wire [3 : 0] i_key_row
  .i_info0_data(4'd0),  // input wire [3 : 0] i_info0_data
  .i_info1_data(4'd1),  // input wire [3 : 0] i_info1_data
  .i_info2_data(4'd2),  // input wire [3 : 0] i_info2_data
  .i_info3_data(4'd3),  // input wire [3 : 0] i_info3_data
  .o_led_row   (o_led_row   )        // output wire [3 : 0] o_led_row
);
endmodule
