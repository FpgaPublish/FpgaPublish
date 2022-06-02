`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/21 22:00:35
// Design Name: 
// Module Name: key_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 0: triger
// 1: state switch
//////////////////////////////////////////////////////////////////////////////////

module key_ctrl#(
    parameter WD_KEY  = 3,
    parameter WD_MODE = 4,
    parameter NB_DLY_KEY = 100_0  //1s
    )(
    input   i_sys_clk,
    input   i_rst_n,

    input  [WD_KEY  -1:0] i_key_row,
    input  [WD_MODE -1:0] i_mode_data,

    output [WD_KEY  -1:0] o_digit_signal
    );
//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
localparam NB_TRIG   = 0;
localparam NB_SWITCH = 1;

localparam FLG_KEY_PRESS = 0;
localparam NB_DLY_TIM = 20;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
reg [WD_KEY -1:0] r_digit_signal;
reg [31       :0] r_dly_cnt;
reg [WD_KEY -1:0] r_key_tmp;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
//>>>>state machine<<<<//
//state name
localparam IDLE   =  4'd0;
localparam START  =  4'd1;
localparam TRIG   =  4'd2;
localparam SWITCH =  4'd3;
localparam WAIT   =  4'd4;
//state varible
reg [3:0] cstate = IDLE;

//state logic
always @(posedge i_sys_clk)
    if(!i_rst_n)
    begin
       cstate <= IDLE;
    end
    else
    begin
        case(cstate)
            IDLE : if(1) //wheter goto next state
                begin  
                    if(1) //which state to go
                    begin
                        cstate <= START;
                    end
                end
            START: if(i_key_row != {(WD_KEY){~FLG_KEY_PRESS}})
                begin
                    if(i_mode_data == NB_TRIG)
                    begin
                        cstate <= TRIG;
                    end
                    else if(i_mode_data == NB_SWITCH)
                    begin
                        cstate <= SWITCH;
                    end
                end
            TRIG: if(r_dly_cnt == NB_DLY_KEY - 1)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            SWITCH: if(r_dly_cnt == NB_DLY_KEY - 1)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            WAIT:
                begin
                    if(1)
                    begin
                        cstate <= IDLE;
                    end
                end
            default: cstate <= IDLE;
        endcase
    end

//<<<<end state>>>>//
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_dly_cnt <= 1'b0;
    end
    else if(cstate == START)
    begin
        r_dly_cnt <= 1'b0;
    end
    else 
    begin
        r_dly_cnt <= r_dly_cnt + 1'b1;
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_key_tmp <= 1'b0;
    end
    else if(cstate == START)
    begin
        if(i_key_row != {(WD_KEY){~FLG_KEY_PRESS}})
        begin
            r_key_tmp <= i_key_row;
        end
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_digit_signal <= {(WD_KEY){~FLG_KEY_PRESS}};
    end
    else if(cstate == TRIG)
    begin
        if(r_dly_cnt == NB_DLY_TIM - 1)
        begin
            r_digit_signal <= r_key_tmp ^ {(WD_KEY){FLG_KEY_PRESS}};
        end
        else 
        begin
            r_digit_signal <= 1'b0;
        end
    end
    else if(cstate == SWITCH)
    begin
        SWITCH_SIGNAL;
    end
end
//
assign o_digit_signal = r_digit_signal;
//*********************************************
//module and task to build part of system
//---------------------------------------------
task SWITCH_SIGNAL;
    integer i;
    for(i = 0; i < WD_KEY; i = i + 1)
    begin: T_SWITCH
        if(r_key_tmp[i] == FLG_KEY_PRESS && r_dly_cnt == NB_DLY_TIM - 1)
        begin
            r_digit_signal <= ~r_digit_signal;
        end
    end
endtask
//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------

endmodule
