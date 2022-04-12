`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 22/04/02 23:09:18
// Design Name: 
// Module Name: tb_key_led
// Project Name: 
// Target Devices: ZYNQ7010 & XAUG
// Tool Versions: 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision: 0.01 
// Revision 0.01 - File Created
// Additional Comments: support clk rst_n data column/row
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_key_led #(
    parameter VERSION = 0
    )( );
//*********************************************
//function to math and logic
//---------------------------------------------


//*********************************************
//localparam to converation and calculate
//---------------------------------------------
//_list_para_//
localparam WD_KEY = 3;
localparam WD_LED = 3;
localparam WD_SET = 6;
localparam PR_CLK = 100;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
//_list_port_//
reg [ 1-1 :0]  i_sys_clk = 0;
reg [ 1-1 :0]  i_rst_n = 0;
reg [ WD_KEY-1 :0]  i_key_cloumn_n = 0;
reg [ WD_SET-1 :0]  i_led_data = 0;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
//_list_logic_//
// logic to i_sys_clk 
always
begin
    #5
    i_sys_clk = ~i_sys_clk;
end
// logic to i_rst_n 
always
begin
    #100
    i_rst_n = 1'b1;
    #100000
    i_rst_n = 1'b0;
    #100
    $stop();
end
// logic to i_key_cloumn_n 
always
begin
    repeat(10)@(posedge i_sys_clk);
    if(i_key_cloumn_n == 0)
    begin
        i_key_cloumn_n = 1;
    end
    else
    begin
        i_key_cloumn_n = i_key_cloumn_n << 1;
    end
end
// logic to i_led_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_led_data = {$random()%(2 << (WD_SET))};
end
//*********************************************
//module and task to build part of system
//---------------------------------------------
//_list_module_//
key_led #(
    .WD_KEY(WD_KEY),
    .WD_LED(WD_LED),
    .WD_SET(WD_SET),
    .PR_CLK(PR_CLK)
    )u_key_led(
    .i_sys_clk(i_sys_clk),
    .i_rst_n(i_rst_n),
    .i_key_cloumn_n(~i_key_cloumn_n),
    .i_led_data(i_led_data)
);
//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------
//_list_ila_//

endmodule
