//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/05/09 21:05:07
// Design Name: 
// Module Name: tb_key_led_v2_00
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
`timescale 1ns / 1ps
module tb_key_led_v2_00 #(
    
   )(
    
);
//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
parameter WD_INFO = 4;
parameter WD_LED  = 4;
parameter NB_DLY  = 200; // value : 1s 
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
reg [ 1-1:0] r_sys_clk   = 0;
reg [ 1-1:0] r_rst_n     = 0;
reg [WD_INFO-1:0] r_info_data = 0;
wire [WD_LED-1:0] w_led_row;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
always  #5 r_sys_clk = ~r_sys_clk;
initial #100 r_rst_n = 1'b1;
initial #10000 $stop();
always 
    begin
        #100 r_info_data = r_info_data + 1;
        #10;
        #100 if(r_info_data > 7) r_info_data = 0;
        #10;
    end
//*********************************************
//module and task to build part of system
//---------------------------------------------
led_driv#(
    .WD_INFO     ( WD_INFO ),
    .WD_LED      ( WD_LED  ),
    .NB_DLY      ( NB_DLY  )
)u_led_driv(
    .i_sys_clk   ( r_sys_clk   ),
    .i_rst_n     ( r_rst_n     ),
    .i_info_data ( r_info_data ),
    .o_led_row   ( w_led_row   )
);

//*********************************************
//assertion and output file
//---------------------------------------------
property pr_rst_n;
    @(posedge r_sys_clk) !r_rst_n |-> (##1 w_led_row == 4'hf);
endproperty
a_rst_n: assert property(pr_rst_n) else $display("error of rst_n");
c_rst_n: cover property(pr_rst_n) $display("normal of rst_n");



endmodule