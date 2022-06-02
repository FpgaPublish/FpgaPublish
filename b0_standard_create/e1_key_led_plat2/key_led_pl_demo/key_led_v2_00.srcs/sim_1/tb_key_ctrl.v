`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 22/05/03 17:52:54
// Design Name: 
// Module Name: tb_key_ctrl
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
module tb_key_ctrl #(
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
localparam WD_MODE = 4;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
//_list_port_//
reg [ 1-1 :0]  i_sys_clk = 0;
reg [ 1-1 :0]  i_rst_n = 0;
reg [ WD_KEY-1 :0]  i_key_row = 0;
reg [ WD_MODE-1 :0]  i_mode_data = 0;
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
// logic to i_mode_data 
always
begin
    repeat(10)@(posedge i_sys_clk);
    i_mode_data = {$random()%(2 << (WD_MODE))};
end
//*********************************************
//module and task to build part of system
//---------------------------------------------
//_list_module_//
key_ctrl #(
    .WD_KEY(WD_KEY),
    .WD_MODE(WD_MODE)
    )u_key_ctrl(
    .i_sys_clk(i_sys_clk),
    .i_rst_n(i_rst_n),
    .i_key_row(i_key_row),
    .i_mode_data(i_mode_data)
);
initial
begin
    $dumpfile ("u_key_ctrl_22_05_03_17_52_54.vcd");
    $dumpvars;
end
//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------
//_list_ila_//

endmodule
