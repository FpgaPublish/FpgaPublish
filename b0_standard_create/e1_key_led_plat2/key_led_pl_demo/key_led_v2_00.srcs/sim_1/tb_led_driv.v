`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 22/04/21 22:52:41
// Design Name: 
// Module Name: tb_led_driv
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
module tb_led_driv #(
    parameter VERSION = 0
    )( );
//*********************************************
//function to math and logic
//---------------------------------------------


//*********************************************
//localparam to converation and calculate
//---------------------------------------------
//_list_para_//
localparam WD_INFO = 4;
localparam WD_LED = 4;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
//_list_port_//
reg [ 1-1 :0]  i_sys_clk = 0;
reg [ 1-1 :0]  i_rst_n = 0;
reg [ WD_INFO-1 :0]  i_info_data = 0;
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
// logic to i_info_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info_data = {$random()%(2 << (WD_INFO))};
end
//*********************************************
//module and task to build part of system
//---------------------------------------------
//_list_module_//
led_driv #(
    .WD_INFO(WD_INFO),
    .WD_LED(WD_LED)
    )u_led_driv(
    .i_sys_clk(i_sys_clk),
    .i_rst_n(i_rst_n),
    .i_info_data(i_info_data)
);
//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------
//_list_ila_//

endmodule
