//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Fri Apr  8 21:37:16 2022
//Host        : SWORD running 64-bit major release  (build 9200)
//Command     : generate_target bd1_platform_wrapper.bd
//Design      : bd1_platform_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd1_platform_wrapper
   (i_key_cloumn_n_0,
    i_rst_n_0,
    o_led_cloumn_0);
  input [2:0]i_key_cloumn_n_0;
  input i_rst_n_0;
  output [2:0]o_led_cloumn_0;

  wire [2:0]i_key_cloumn_n_0;
  wire i_rst_n_0;
  wire [2:0]o_led_cloumn_0;

  bd1_platform bd1_platform_i
       (.i_key_cloumn_n_0(i_key_cloumn_n_0),
        .i_rst_n_0(i_rst_n_0),
        .o_led_cloumn_0(o_led_cloumn_0));
endmodule
