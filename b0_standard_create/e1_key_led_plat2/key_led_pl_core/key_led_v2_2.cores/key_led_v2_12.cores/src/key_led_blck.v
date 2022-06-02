`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/14 22:11:49
// Design Name: 
// Module Name: key_led_blck
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.02 - Pck IP to use
// Revision 0.01 - File Created
// Additional Comments:
// info == 0 -> slow and slow
// info == 1 -> slow and fast
// info == 2 -> fast and fast
//////////////////////////////////////////////////////////////////////////////////


module key_led_blck#(
    parameter WD_KEY = 4,
    parameter WD_LED = 4,
    parameter WD_INFO = 4,

    parameter MD_PRESS = 1'b0,
    parameter MD_LIGHT = 1'b0,

    parameter NB_DLY  = 1000_000_000, //20 * 1000 = 20000ms
    parameter NB_FAST = 24,
    parameter NB_SLOW = 26
    )(
    input i_sys_clk,
    input i_rst_n,

    input  [WD_KEY -1:0] i_key_row,
    input  [WD_INFO-1:0] i_info0_data,
    input  [WD_INFO-1:0] i_info1_data,
    input  [WD_INFO-1:0] i_info2_data,
    input  [WD_INFO-1:0] i_info3_data,
    input  [WD_INFO-1:0] i_info4_data,
    input  [WD_INFO-1:0] i_info5_data,
    input  [WD_INFO-1:0] i_info6_data,

    output [WD_LED -1:0] o_led_row
    );
//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
localparam FG_NORAML = 4'b0;
localparam FG_WARN   = 4'b1;
localparam FG_ERROR  = 4'd2;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
reg [WD_INFO-1:0]   r_info_tmp = 0;
reg [31:0]          r_dly_cnt  = 0;
reg                 r_dly_reset = 0;
reg [WD_LED -1:0]   r_led_row = 0;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
//>>>>state machine<<<<//
//state name
localparam IDLE   = 4'd0;
localparam START  = 4'd1;
localparam MODE   = 4'd2;
localparam NORMAL = 4'd3;
localparam WARN   = 4'd4;
localparam ERROR  = 4'd5;
localparam WAIT   = 4'd6;
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
            START: if(i_key_row != {(WD_KEY){~MD_PRESS}})
                begin
                    if(1)
                    begin
                        cstate <= MODE;
                    end
                end
            MODE: if(1)
                begin
                    case(r_info_tmp)
                        FG_NORAML: cstate <= NORMAL;
                        FG_WARN:   cstate <= WARN;
                        FG_ERROR:  cstate <= ERROR;
                        default:   cstate <= NORMAL;
                    endcase
                end
            NORMAL: if(r_dly_cnt == NB_DLY - 1'b1)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            WARN: if(r_dly_cnt == NB_DLY - 1'b1)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            ERROR: if(r_dly_cnt == NB_DLY - 1'b1)
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
        r_info_tmp <= 1'b0;
    end
    else if(cstate == START)
    begin
        if(i_key_row[0] == MD_PRESS)
        begin
            r_info_tmp <= i_info0_data;
        end
        else if(WD_KEY > 1 && i_key_row[1] == MD_PRESS)
        begin
            r_info_tmp <= i_info1_data;
        end
        else if(WD_KEY > 2 && i_key_row[2] == MD_PRESS)
        begin
            r_info_tmp <= i_info2_data;
        end
        else if(WD_KEY > 3 && i_key_row[3] == MD_PRESS)
        begin
            r_info_tmp <= i_info3_data;
        end
        else if(WD_KEY > 4 && i_key_row[4] == MD_PRESS)
        begin
            r_info_tmp <= i_info4_data;
        end
        else if(WD_KEY > 5 && i_key_row[5] == MD_PRESS)
        begin
            r_info_tmp <= i_info5_data;
        end
        else if(WD_KEY > 6 && i_key_row[6] == MD_PRESS)
        begin
            r_info_tmp <= i_info6_data;
        end
    end
end
always@(posedge i_sys_clk)
begin
    if(cstate == IDLE)
    begin
        r_dly_reset <= 1'b1;
    end
    else if(cstate == MODE)
    begin
        r_dly_reset <= 1'b0;
    end
end
always@(posedge i_sys_clk)
begin
    if(r_dly_reset)
    begin
        r_dly_cnt <= 1'b0;
    end
    else 
    begin
        r_dly_cnt <= r_dly_cnt + 1'b1;
    end
end
//LED diff func
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_led_row[0] <= ~MD_LIGHT;
    end
    else if(cstate == IDLE)
    begin
        r_led_row[0] <= MD_LIGHT;
    end
    else if(cstate == WARN || cstate == NORMAL || cstate == ERROR)
    begin
        r_led_row[0] <= r_dly_cnt[NB_SLOW];
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_led_row[1] <= ~MD_LIGHT;
    end
    else if(cstate == MODE)
    begin
        r_led_row[1] <= MD_LIGHT;
    end
    else if(cstate == WAIT)
    begin
        r_led_row[1] <= ~MD_LIGHT;
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_led_row[2] <= ~MD_LIGHT;
    end
    else if(cstate == IDLE)
    begin
        r_led_row[2] <= ~MD_LIGHT;
    end
    else if(cstate == NORMAL || cstate == WARN)
    begin
        r_led_row[2] <= r_dly_cnt[NB_SLOW];
    end
    else if(cstate == ERROR)
    begin
        r_led_row[2] <= r_dly_cnt[NB_FAST];
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_led_row[3] <= ~MD_LIGHT;
    end
    else if(cstate == IDLE)
    begin
        r_led_row[3] <= ~MD_LIGHT;
    end
    else if(cstate == NORMAL)
    begin
        r_led_row[3] <= r_dly_cnt[NB_SLOW];
    end
    else if(cstate == ERROR || cstate == WARN)
    begin
        r_led_row[3] <= r_dly_cnt[NB_FAST];
    end
end
assign o_led_row = r_led_row;
//*********************************************
//module and task to build part of system
//---------------------------------------------

//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------


endmodule
