// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Fri May 24 16:13:33 2019
// Host        : goharfar-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub {d:/Ashkan
//               works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Uo_ROM/Uo_ROM_stub.v}
// Design      : Uo_ROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_11,Vivado 2016.4" *)
module Uo_ROM(a, clk, spo)
/* synthesis syn_black_box black_box_pad_pin="a[5:0],clk,spo[31:0]" */;
  input [5:0]a;
  input clk;
  output [31:0]spo;
endmodule
