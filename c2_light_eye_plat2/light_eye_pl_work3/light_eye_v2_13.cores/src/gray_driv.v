`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/06 21:40:09
// Design Name: 
// Module Name: gray_driv
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
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
module gray_driv #(
    parameter NB_VER = 0 ,//normal
    
    parameter WD_SHK_SYNC = 16,
    parameter WD_SHK_DLAY = 15,

    parameter WD_BRAM_DAT = 32,
    parameter WD_BRAM_WEN = 4 ,

    parameter WD_ERR_INFO = 4
   )(
    input           s_sys_a_clock  ,  
    input           s_sys_a_resetn ,  
    //shake slaver
    input                       s_shk_gray_wvalid,
    input    [WD_SHK_SYNC-1:0]  s_shk_gray_smosi ,
    input    [WD_SHK_DLAY-1:0]  s_shk_gray_dmosi ,
    output                      s_shk_gray_wready,
    output   [WD_SHK_SYNC-1:0]  s_shk_gray_smiso ,
    output   [WD_SHK_DLAY-1:0]  s_shk_gray_dmiso ,

    //bram master
    output   [WD_BRAM_DAT-1:0]  m_bram_gray_addr,
    output                      m_bram_gray_clk ,
    output   [WD_BRAM_DAT-1:0]  m_bram_gray_din ,
    input    [WD_BRAM_DAT-1:0]  m_bram_gray_dout,
    output                      m_bram_gray_en  ,
    output                      m_bram_gray_rst ,
    output   [WD_BRAM_WEN-1:0]  m_bram_gray_we  ,
    //error bus
    input    [WD_ERR_INFO-1:0]  s_err_gray_info1,
    output   [WD_ERR_INFO-1:0]  m_err_gray_info1
);
//*********************************************
//function to math and logic
//---------------------------------------------

//*********************************************
//localparam to converation and calculate
//---------------------------------------------
localparam WD_SIZE_MAX   = 10 ; //BRAM max size width at 1k
localparam WD_SIZE_UNIT  = 10; //unit width 
localparam WD_RGB_888    = 8 ; //RGB 8bit every

localparam NB_READ_STEP  = 4'd3 ; //BRAM ready latch number
localparam NB_WRITE_STEP = 4'd3 ; //BRAM write latch number
localparam NB_GRAY_STEP  = 4'd10; //GRAY calculate time
//*********************************************
//register and wire to time sequence and combine
//---------------------------------------------
reg [WD_BRAM_DAT-1:0] r_bram_gray_addr = 0;
reg [WD_BRAM_DAT-1:0] r_bram_gray_din  = 0;
reg                   r_bram_gray_en   = 0;
reg                   r_bram_gray_rst  = 0;
reg [WD_BRAM_WEN-1:0] r_bram_gray_we   = 0;

reg [3:0] r_read_step_cnt  = 0;  
reg [3:0] r_write_step_cnt = 0; 
reg [3:0] r_gray_step_cnt  = 0;

reg [WD_SIZE_MAX-1:0]   r_gray_size_tmp  = 0; //RGB888 as a pixel,and 1k pixel == 1 tmp
reg [WD_BRAM_DAT-1:0]   r_gray_color_tmp = 0;
reg [WD_RGB_888+2 -1:0] r_gray_sum_tmp   = 0; //RGB888 sum
reg [WD_RGB_888   -1:0] r_gray_data_tmp  = 0; //RGB gray value

reg                    r_shk_gray_wready = 0;
reg [WD_SHK_SYNC-1:0]  r_shk_gray_smiso  = 0;
reg [WD_SHK_DLAY-1:0]  r_shk_gray_dmiso  = 0;
//*********************************************
//always and assign to drive logic and connect
//---------------------------------------------
//>>>>state machine<<<<//
//state name
localparam IDLE  = 4'd0;
localparam START = 4'd1;
localparam SIZE  = 4'd2;
localparam READ  = 4'd3;
localparam GRAY  = 4'd4;
localparam WRITE = 4'd5;
localparam WAIT  = 4'd6;
//state variable
reg [3:0] cstate = IDLE;

//state logic
always @(posedge s_sys_a_clock)
    if(!s_sys_a_resetn)
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
            START: if(s_shk_gray_wvalid)
                begin
                    if(1)
                        begin
                            cstate <= SIZE;
                        end
                end
            SIZE: 
                begin
                    if(s_shk_gray_smosi == 0) //no size
                        begin
                            cstate <= WAIT;
                        end
                    else if(s_shk_gray_smosi > {1'b1,{(WD_SIZE_MAX-1){1'b0}}}) //size over range
                        begin
                            cstate <= WAIT;
                        end
                    else if(1)
                        begin
                            cstate <= READ;
                        end
                end
            READ: if(r_read_step_cnt == NB_READ_STEP - 1'b1)
                begin
                    if(1)
                        begin
                            cstate <= GRAY;
                        end
                end
            GRAY: if(r_gray_step_cnt == NB_GRAY_STEP - 1'b1)
                begin
                    if(1)
                        begin
                            cstate <= WRITE;
                        end
                end
            WRITE: if(r_write_step_cnt == NB_WRITE_STEP - 1'b1)
                begin
                    if(r_gray_size_tmp  == r_bram_gray_addr[WD_BRAM_DAT-1:WD_SIZE_UNIT] + 1 //when (n - 1) unit write 
                    && r_bram_gray_addr[WD_SIZE_UNIT-1:0] == {WD_SIZE_UNIT{1'b1}}) //when last data is write  ok
                        begin
                            cstate <= WAIT;
                        end
                    else 
                        begin
                            cstate <= READ;
                        end
                end
            default: cstate <= IDLE;
        endcase
    end

//<<<<end state>>>>//
//data protect
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE) //
    begin
        r_gray_size_tmp <= 1'b0;
    end
    else if(cstate == SIZE)
    begin
        r_gray_size_tmp <= s_shk_gray_smosi;
    end
end
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE) //state IDLE reset
    begin
        r_gray_color_tmp <= 1'b0;
    end
    else if(cstate == READ)
    begin
        r_gray_color_tmp <= m_bram_gray_dout;
    end
end
//state step count
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE || cstate == GRAY) //
    begin
        r_read_step_cnt <= 1'b0;
    end
    else if(cstate == READ)
    begin
        r_read_step_cnt <= r_read_step_cnt + 1'b1;
    end
end
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE || cstate == WRITE) //
    begin
        r_gray_step_cnt <= 1'b0;
    end
    else if(cstate == GRAY)
    begin
        r_gray_step_cnt <= r_gray_step_cnt + 1'b1;
    end
end
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE || cstate == READ) //
    begin
        r_write_step_cnt <= 1'b0;
    end
    else if(cstate == WRITE)
    begin
        r_write_step_cnt <= r_write_step_cnt + 1'b1;
    end
end
//BRAM ctrl stream
always@(posedge s_sys_a_clock)
begin
    if(1) //update in one cycle
    begin
        r_bram_gray_en  <= 1'b1;
        r_bram_gray_rst <= 1'b0;
    end
end

always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE || cstate == READ) //state IDLE reset
    begin
        r_bram_gray_we <= {WD_BRAM_WEN{1'b0}};
    end
    else if(cstate == WRITE)
    begin
        if(r_write_step_cnt == 1'b0)
            begin
                r_bram_gray_en <= {WD_BRAM_WEN{1'b1}};
            end
        else if(r_write_step_cnt == NB_WRITE_STEP - 1'b1)
            begin
                r_bram_gray_en <= {WD_BRAM_WEN{1'b0}};
            end
    end
end
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE || cstate == START) //state IDLE reset
    begin
        r_bram_gray_addr <= 1'b0;
    end
    else if(cstate == WRITE)
    begin
        if(r_write_step_cnt == NB_WRITE_STEP - 1'b1) //write ok and update 
        begin
            r_bram_gray_addr <= r_bram_gray_addr + 1'b1;
        end
    end
end
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE) //state IDLE reset
    begin
        r_bram_gray_din <= 1'b0;
    end
    else if(cstate == GRAY && r_gray_step_cnt == NB_GRAY_STEP - 1'b1)
    begin
        r_bram_gray_din <= {r_gray_data_tmp,r_gray_color_tmp[WD_RGB_888*3-1:0]}; // put gray value to [31:24] data;
    end
end
//gray calculate
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE) //state IDLE reset
    begin
        r_gray_sum_tmp <= 1'b0;
    end
    else if(cstate == GRAY)
    begin
        case(r_gray_step_cnt)
            0: r_gray_sum_tmp <= r_gray_color_tmp[WD_RGB_888-1:0] + r_gray_color_tmp[WD_RGB_888 * 2-1:WD_RGB_888];
            1: r_gray_sum_tmp <= r_gray_sum_tmp + r_gray_color_tmp[WD_RGB_888 * 3 - 1:WD_RGB_888  * 2];
            default: r_gray_sum_tmp <= r_gray_sum_tmp;
        endcase
    end
end
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE) //state IDLE reset
    begin
        r_gray_data_tmp <= 1'b0;
    end
    else if(cstate == GRAY)
    begin
        if(r_gray_step_cnt >= 2)
            begin
                r_gray_data_tmp <= r_gray_sum_tmp / 2'd3; //10 bit div 2 bit , use LUT 
            end
    end
end
// shake control
always@(posedge s_sys_a_clock)
begin
    if(cstate == IDLE) //state IDLE reset
    begin
        r_shk_gray_wready <= 1'b0;
    end
    else if(cstate == WAIT)
    begin
        r_shk_gray_wready <= 1'b1;
    end
end
always@(posedge s_sys_a_clock)
begin
    if(1) //update in one cycle
    begin
        r_shk_gray_dmiso <= 1'b0;
        r_shk_gray_smiso <= 1'b0;
    end
end
//connect to output
assign m_bram_gray_addr = r_bram_gray_addr;
assign m_bram_gray_clk  = s_sys_a_clock   ;
assign m_bram_gray_din  = r_bram_gray_din ;
assign m_bram_gray_en   = r_bram_gray_en  ;
assign m_bram_gray_rst  = r_bram_gray_rst ;
assign m_bram_gray_we   = r_bram_gray_we  ;

assign s_shk_gray_wready = r_shk_gray_wready;
assign s_shk_gray_smiso  = r_shk_gray_smiso ;
assign s_shk_gray_dmiso  = r_shk_gray_dmiso ;

assign m_err_gray_info1 = s_err_gray_info1; //not report error
//*********************************************
//module and task to build part of system
//---------------------------------------------

//*********************************************
//expand and plug-in part with version 
//---------------------------------------------

//*********************************************
//ila and vio to debug and monitor
//---------------------------------------------
// ila_15 u_ila (
//     .probe0 (r_bram_gray_addr),
//     .probe1 (r_bram_gray_din ),
//     .probe2 (r_bram_gray_en  ),
//     .probe3 (r_bram_gray_rst ),
//     .probe4 (r_bram_gray_we  ),
//     .probe5 (r_read_step_cnt ),
//     .probe6 (r_write_step_cnt),
//     .probe7 (r_gray_step_cnt ),
//     .probe8 (r_gray_size_tmp ),
//     .probe9 (r_gray_color_tmp),
//     .probe10(r_gray_sum_tmp  ),
//     .probe11(r_gray_data_tmp ),
//     .probe12(r_shk_gray_wready),
//     .probe13(r_shk_gray_smiso ),
//     .probe14(r_shk_gray_dmiso )
// );

endmodule