`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/27 21:49:17
// Design Name: 
// Module Name: key_led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: use led to show data
// 
// Dependencies: 
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module key_led#(
    parameter WD_KEY = 3,
    parameter WD_LED = 3,
    parameter WD_SET = 6,
    parameter PR_CLK = 100
    )(
    input   i_sys_clk,
    input   i_rst_n,

    input   [WD_KEY-1:0]  i_key_cloumn_n, //low_trig
    input   [WD_SET-1:0]  i_led_data, //0|=> off led 1|=> on led
    output  [WD_KEY-1:0]  o_led_cloumn //low driv
    );
//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
localparam STATE_DLY = 32'd3000_000_000 * PR_CLK / 1000; //s
localparam DV_GLINT = 25; //2^n
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
wire w_key_start;
wire w_key_stop;
wire w_key_finish;

reg [31:0] cnt_dly; //count to delay
reg [WD_LED-1:0] r_led_driv;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
assign w_key_start  = i_key_cloumn_n[0];
assign w_key_stop   = i_key_cloumn_n[1];
assign w_key_finish = i_key_cloumn_n[2];

//>>>>state machine<<<<//
//state name
localparam IDLE  = 4'd0;
localparam START = 4'd1;
localparam GLINT = 4'd2;
localparam HIGH  = 4'd3;
localparam LOW   = 4'd4;
localparam WAIT  = 4'd5;
//state varible
reg [3:0] cstate = IDLE;

//state logic
always @(posedge i_sys_clk)
    if(!i_rst_n)
    begin
       cstate <= IDLE;
    end
    else if(!w_key_start)
    begin
        cstate <= IDLE;
    end
    else if(!w_key_stop)
    begin
        cstate <= cstate;
    end
    else if(!w_key_finish)
    begin
        cstate <= WAIT;
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
            START : if(cnt_dly == STATE_DLY - 1) //wheter goto next state
                begin  
                    if(1) //which state to go
                    begin
                        cstate <= GLINT;
                    end
                end
            GLINT : if(cnt_dly == STATE_DLY - 1) //wheter goto next state
                begin  
                    if(1) //which state to go
                    begin
                        cstate <= HIGH;
                    end
                end
            HIGH : if(cnt_dly == STATE_DLY - 1) //wheter goto next state
                begin  
                    if(1) //which state to go
                    begin
                        cstate <= LOW;
                    end
                end
            LOW : if(cnt_dly == STATE_DLY - 1) //wheter goto next state
                begin  
                    if(1) //which state to go
                    begin
                        cstate <= WAIT;
                    end
                end
            WAIT : if(cnt_dly == STATE_DLY - 1) //wheter goto next state
                begin  
                    if(1) //which state to go
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
        cnt_dly <= 1'b0;
    end
    else if(& i_key_cloumn_n == 0)
    begin
        cnt_dly <= 0;
    end
    else if(cnt_dly == STATE_DLY - 1)
    begin
        cnt_dly <= 0;
    end
    else if(1)
    begin
        cnt_dly <= cnt_dly + 1'b1;
    end
end
always@(posedge i_sys_clk)
begin
    if(!i_rst_n)
    begin
        r_led_driv <= 1'b1;
    end
    else if(1)
    begin
        case(cstate)
            START: r_led_driv   <= 1'b0;
            GLINT: r_led_driv   <= {(WD_LED){STATE_DLY[DV_GLINT]}};
            HIGH: r_led_driv    <= ~i_led_data[WD_SET-1:WD_LED];
            LOW: r_led_driv     <= ~i_led_data[WD_LED-1:0];
            default: r_led_driv <= {(WD_LED){1'b1}};
        endcase
    end
end
assign o_led_cloumn = r_led_driv;
//*********************************************
//module and task to build part of system
//---------------------------------------------

//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------


endmodule
