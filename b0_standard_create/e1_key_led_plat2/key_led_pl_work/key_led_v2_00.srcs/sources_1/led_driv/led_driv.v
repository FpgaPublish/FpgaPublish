`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 21:33:29
// Design Name: 
// Module Name: led_driv
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
// info0 : restart          >> light 5s
// info1 : normal           >> off 5s
// info2 : warning          >> glint 1s
// info3 : critical warning >> glint 3s
// info4 : error            >> glint still
//////////////////////////////////////////////////////////////////////////////////

module led_driv#(
    parameter WD_INFO = 4,
    parameter WD_LED  = 4,
    parameter NB_DLY  = 200 // value : 1s
    )(
    input   i_sys_clk,
    input   i_rst_n,

    input  [WD_INFO-1:0]  i_info_data,

    output [WD_LED -1:0]  o_led_row
    );
//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
localparam NB_RESTART_TIMS  = 4'd5; //5s
localparam NB_NORMAL_TIMS   = 4'd5;
localparam NB_WARNING_TIMS  = 4'd2;
localparam NB_CRITICAL_TIMS = 4'd6;
localparam NB_ERROR_TIMS    = 4'd2;

localparam FLG_LED_ON = 1'b0;
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
reg [32 -1:0] r_dly_cnt;
reg [3  -1:0] r_dly_tims;

reg [WD_LED-1:0] r_led_row;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
//>>>>state machine<<<<//
//state name
localparam IDLE     = 4'd0;
localparam START    = 4'd1;
localparam RESTART  = 4'd2;
localparam NORMAL   = 4'd3;
localparam WARNING  = 4'd4;
localparam CRITICAL = 4'd5;
localparam ERROR    = 4'd6;
localparam WAIT     = 4'd7;
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
            START: 
                begin
                    case(i_info_data)
                        4'd0: cstate <= RESTART;
                        4'd1: cstate <= NORMAL;
                        4'd2: cstate <= WARNING;
                        4'd3: cstate <= CRITICAL;
                        4'd4: cstate <= ERROR;
                        default: cstate <= START;
                    endcase
                end
            RESTART: if(r_dly_tims == NB_RESTART_TIMS - 1 && r_dly_cnt == NB_DLY - 1 && i_info_data != 4'd0)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            NORMAL: if(r_dly_tims == NB_NORMAL_TIMS - 1 && r_dly_cnt == NB_DLY - 1 && i_info_data != 4'd1)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            WARNING: if(r_dly_tims == NB_WARNING_TIMS - 1 && r_dly_cnt == NB_DLY - 1 && i_info_data != 4'd2)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            CRITICAL: if(r_dly_tims == NB_CRITICAL_TIMS - 1 && r_dly_cnt == NB_DLY - 1 && i_info_data != 4'd3)
                begin
                    if(1)
                    begin
                        cstate <= WAIT;
                    end
                end
            ERROR: if(r_dly_tims == NB_ERROR_TIMS - 1 && r_dly_cnt == NB_DLY - 1)
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
    else if(r_dly_cnt == NB_DLY - 1)
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
        r_dly_tims <= 1'b0;
    end
    else if(cstate == START)
    begin
        r_dly_tims <= 1'b0;
    end
    else if(r_dly_cnt == NB_DLY - 1'b1)
    begin
        r_dly_tims <= r_dly_tims + 1'b1;
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_led_row <= {(WD_LED){~FLG_LED_ON}};
    end
    else if(cstate == IDLE)
    begin
        r_led_row <={(WD_LED){~FLG_LED_ON}};
    end
    else 
        case(cstate)
            RESTART:  
                begin
                    r_led_row <= {(WD_LED){FLG_LED_ON}};
                end
            NORMAL:
                begin
                    r_led_row <= {(WD_LED){~FLG_LED_ON}};
                end
            WARNING,CRITICAL,ERROR: 
                begin
                    if(r_dly_tims % 2 == 0)
                        begin
                            r_led_row <= {(WD_LED){FLG_LED_ON}};
                        end
                    else 
                        begin
                            r_led_row <= {(WD_LED){~FLG_LED_ON}};
                        end
                end
            default: 
                begin
                    r_led_row <= {(WD_LED){~FLG_LED_ON}};
                end
        endcase
end
//
assign o_led_row = r_led_row;
//*********************************************
//module and task to build part of system
//---------------------------------------------

//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------

endmodule
