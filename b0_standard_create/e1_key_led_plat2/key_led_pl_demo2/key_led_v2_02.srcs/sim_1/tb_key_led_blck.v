`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 22/05/16 21:02:05
// Design Name: 
// Module Name: tb_key_led_blck
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
module tb_key_led_blck #(
    parameter VERSION = 0
    )( );
//*********************************************
//function to math and logic
//---------------------------------------------


//*********************************************
//localparam to converation and calculate
//---------------------------------------------
//_list_para_//
localparam WD_KEY = 4;
localparam WD_LED = 4;
localparam WD_INFO = 4;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
//_list_port_//
reg [ 1-1 :0]  i_sys_clk = 0;
reg [ 1-1 :0]  i_rst_n = 0;
reg [ WD_KEY-1 :0]  i_key_row = 0;
reg [ WD_INFO-1 :0]  i_info0_data = 0;
reg [ WD_INFO-1 :0]  i_info1_data = 0;
reg [ WD_INFO-1 :0]  i_info2_data = 0;
reg [ WD_INFO-1 :0]  i_info3_data = 0;
reg [ WD_INFO-1 :0]  i_info4_data = 0;
reg [ WD_INFO-1 :0]  i_info5_data = 0;
reg [ WD_INFO-1 :0]  i_info6_data = 0;
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
// logic to i_key_row 
always
begin
    repeat(10)@(posedge i_sys_clk);
    if(i_key_row == 0)
    begin
        i_key_row = 1;
    end
    else
    begin
        i_key_row = i_key_row << 1;
    end
end
// logic to i_info0_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info0_data = {$random()%(2 << (WD_INFO))};
end
// logic to i_info1_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info1_data = {$random()%(2 << (WD_INFO))};
end
// logic to i_info2_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info2_data = {$random()%(2 << (WD_INFO))};
end
// logic to i_info3_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info3_data = {$random()%(2 << (WD_INFO))};
end
// logic to i_info4_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info4_data = {$random()%(2 << (WD_INFO))};
end
// logic to i_info5_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info5_data = {$random()%(2 << (WD_INFO))};
end
// logic to i_info6_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_info6_data = {$random()%(2 << (WD_INFO))};
end
//*********************************************
//module and task to build part of system
//---------------------------------------------
//_list_module_//
key_led_blck #(
    .WD_KEY(WD_KEY),
    .WD_LED(WD_LED),
    .WD_INFO(WD_INFO)
    )u_key_led_blck(
    .i_sys_clk(i_sys_clk),
    .i_rst_n(i_rst_n),
    .i_key_row(i_key_row),
    .i_info0_data(i_info0_data),
    .i_info1_data(i_info1_data),
    .i_info2_data(i_info2_data),
    .i_info3_data(i_info3_data),
    .i_info4_data(i_info4_data),
    .i_info5_data(i_info5_data),
    .i_info6_data(i_info6_data)
);
initial
begin
    $dumpfile("u_key_led_blck_22_05_16_21_02_05.vcd");
    $dumpvars;
end
//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------
//_list_ila_//

endmodule
