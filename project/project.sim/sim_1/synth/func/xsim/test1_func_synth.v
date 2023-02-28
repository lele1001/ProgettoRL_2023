// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Feb  8 14:46:37 2023
// Host        : YOGA-ELE-2 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/eleon/Documents/universita/RL/Progetto_RL/project/project.sim/sim_1/synth/func/xsim/test1_func_synth.v
// Design      : project_reti_logiche
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module project_reti_logiche
   (i_clk,
    i_rst,
    i_start,
    i_w,
    o_z0,
    o_z1,
    o_z2,
    o_z3,
    o_done,
    o_mem_addr,
    i_mem_data,
    o_mem_we,
    o_mem_en);
  input i_clk;
  input i_rst;
  input i_start;
  input i_w;
  output [7:0]o_z0;
  output [7:0]o_z1;
  output [7:0]o_z2;
  output [7:0]o_z3;
  output o_done;
  output [15:0]o_mem_addr;
  input [7:0]i_mem_data;
  output o_mem_we;
  output o_mem_en;

  wire \FSM_sequential_curr_state[2]_i_1_n_0 ;
  wire [2:0]curr_state;
  wire [1:0]curr_state__0;
  wire i_clk;
  wire i_clk_IBUF;
  wire i_clk_IBUF_BUFG;
  wire i_rst;
  wire i_rst_IBUF;
  wire i_start;
  wire i_start_IBUF;
  wire o_done;
  wire o_done_OBUF;
  wire [15:0]o_mem_addr;
  wire o_mem_en;
  wire o_mem_en_OBUF;
  wire o_mem_we;
  wire o_mem_we_OBUF;
  wire [7:0]o_z0;
  wire [7:0]o_z1;
  wire [7:0]o_z2;
  wire [7:0]o_z3;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h013F)) 
    \FSM_sequential_curr_state[0]_i_1 
       (.I0(i_start_IBUF),
        .I1(curr_state[1]),
        .I2(curr_state[2]),
        .I3(curr_state[0]),
        .O(curr_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \FSM_sequential_curr_state[1]_i_1 
       (.I0(curr_state[1]),
        .I1(curr_state[0]),
        .I2(curr_state[2]),
        .O(curr_state__0[1]));
  LUT4 #(
    .INIT(16'h5F56)) 
    \FSM_sequential_curr_state[2]_i_1 
       (.I0(curr_state[1]),
        .I1(i_start_IBUF),
        .I2(curr_state[2]),
        .I3(curr_state[0]),
        .O(\FSM_sequential_curr_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s0:000,s1:001,s4:100,s5:101,s2:010,s3:011" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state[2]_i_1_n_0 ),
        .CLR(i_rst_IBUF),
        .D(curr_state__0[0]),
        .Q(curr_state[0]));
  (* FSM_ENCODED_STATES = "s0:000,s1:001,s4:100,s5:101,s2:010,s3:011" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state[2]_i_1_n_0 ),
        .CLR(i_rst_IBUF),
        .D(curr_state__0[1]),
        .Q(curr_state[1]));
  (* FSM_ENCODED_STATES = "s0:000,s1:001,s4:100,s5:101,s2:010,s3:011" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state[2]_i_1_n_0 ),
        .CLR(i_rst_IBUF),
        .D(o_mem_en_OBUF),
        .Q(curr_state[2]));
  BUFG i_clk_IBUF_BUFG_inst
       (.I(i_clk_IBUF),
        .O(i_clk_IBUF_BUFG));
  IBUF #(
    .CCIO_EN("TRUE")) 
    i_clk_IBUF_inst
       (.I(i_clk),
        .O(i_clk_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    i_rst_IBUF_inst
       (.I(i_rst),
        .O(i_rst_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    i_start_IBUF_inst
       (.I(i_start),
        .O(i_start_IBUF));
  OBUF o_done_OBUF_inst
       (.I(o_done_OBUF),
        .O(o_done));
  LUT3 #(
    .INIT(8'h40)) 
    o_done_OBUF_inst_i_1
       (.I0(curr_state[1]),
        .I1(curr_state[0]),
        .I2(curr_state[2]),
        .O(o_done_OBUF));
  OBUF \o_mem_addr_OBUF[0]_inst 
       (.I(1'b0),
        .O(o_mem_addr[0]));
  OBUF \o_mem_addr_OBUF[10]_inst 
       (.I(1'b0),
        .O(o_mem_addr[10]));
  OBUF \o_mem_addr_OBUF[11]_inst 
       (.I(1'b0),
        .O(o_mem_addr[11]));
  OBUF \o_mem_addr_OBUF[12]_inst 
       (.I(1'b0),
        .O(o_mem_addr[12]));
  OBUF \o_mem_addr_OBUF[13]_inst 
       (.I(1'b0),
        .O(o_mem_addr[13]));
  OBUF \o_mem_addr_OBUF[14]_inst 
       (.I(1'b0),
        .O(o_mem_addr[14]));
  OBUF \o_mem_addr_OBUF[15]_inst 
       (.I(1'b0),
        .O(o_mem_addr[15]));
  OBUF \o_mem_addr_OBUF[1]_inst 
       (.I(1'b0),
        .O(o_mem_addr[1]));
  OBUF \o_mem_addr_OBUF[2]_inst 
       (.I(1'b0),
        .O(o_mem_addr[2]));
  OBUF \o_mem_addr_OBUF[3]_inst 
       (.I(1'b0),
        .O(o_mem_addr[3]));
  OBUF \o_mem_addr_OBUF[4]_inst 
       (.I(1'b0),
        .O(o_mem_addr[4]));
  OBUF \o_mem_addr_OBUF[5]_inst 
       (.I(1'b0),
        .O(o_mem_addr[5]));
  OBUF \o_mem_addr_OBUF[6]_inst 
       (.I(1'b0),
        .O(o_mem_addr[6]));
  OBUF \o_mem_addr_OBUF[7]_inst 
       (.I(1'b0),
        .O(o_mem_addr[7]));
  OBUF \o_mem_addr_OBUF[8]_inst 
       (.I(1'b0),
        .O(o_mem_addr[8]));
  OBUF \o_mem_addr_OBUF[9]_inst 
       (.I(1'b0),
        .O(o_mem_addr[9]));
  OBUF o_mem_en_OBUF_inst
       (.I(o_mem_en_OBUF),
        .O(o_mem_en));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h24)) 
    o_mem_en_OBUF_inst_i_1
       (.I0(curr_state[0]),
        .I1(curr_state[2]),
        .I2(curr_state[1]),
        .O(o_mem_en_OBUF));
  OBUF o_mem_we_OBUF_inst
       (.I(o_mem_we_OBUF),
        .O(o_mem_we));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    o_mem_we_OBUF_inst_i_1
       (.I0(curr_state[2]),
        .I1(curr_state[0]),
        .I2(curr_state[1]),
        .O(o_mem_we_OBUF));
  OBUF \o_z0_OBUF[0]_inst 
       (.I(1'b0),
        .O(o_z0[0]));
  OBUF \o_z0_OBUF[1]_inst 
       (.I(1'b0),
        .O(o_z0[1]));
  OBUF \o_z0_OBUF[2]_inst 
       (.I(1'b0),
        .O(o_z0[2]));
  OBUF \o_z0_OBUF[3]_inst 
       (.I(1'b0),
        .O(o_z0[3]));
  OBUF \o_z0_OBUF[4]_inst 
       (.I(1'b0),
        .O(o_z0[4]));
  OBUF \o_z0_OBUF[5]_inst 
       (.I(1'b0),
        .O(o_z0[5]));
  OBUF \o_z0_OBUF[6]_inst 
       (.I(1'b0),
        .O(o_z0[6]));
  OBUF \o_z0_OBUF[7]_inst 
       (.I(1'b0),
        .O(o_z0[7]));
  OBUF \o_z1_OBUF[0]_inst 
       (.I(1'b0),
        .O(o_z1[0]));
  OBUF \o_z1_OBUF[1]_inst 
       (.I(1'b0),
        .O(o_z1[1]));
  OBUF \o_z1_OBUF[2]_inst 
       (.I(1'b0),
        .O(o_z1[2]));
  OBUF \o_z1_OBUF[3]_inst 
       (.I(1'b0),
        .O(o_z1[3]));
  OBUF \o_z1_OBUF[4]_inst 
       (.I(1'b0),
        .O(o_z1[4]));
  OBUF \o_z1_OBUF[5]_inst 
       (.I(1'b0),
        .O(o_z1[5]));
  OBUF \o_z1_OBUF[6]_inst 
       (.I(1'b0),
        .O(o_z1[6]));
  OBUF \o_z1_OBUF[7]_inst 
       (.I(1'b0),
        .O(o_z1[7]));
  OBUF \o_z2_OBUF[0]_inst 
       (.I(1'b0),
        .O(o_z2[0]));
  OBUF \o_z2_OBUF[1]_inst 
       (.I(1'b0),
        .O(o_z2[1]));
  OBUF \o_z2_OBUF[2]_inst 
       (.I(1'b0),
        .O(o_z2[2]));
  OBUF \o_z2_OBUF[3]_inst 
       (.I(1'b0),
        .O(o_z2[3]));
  OBUF \o_z2_OBUF[4]_inst 
       (.I(1'b0),
        .O(o_z2[4]));
  OBUF \o_z2_OBUF[5]_inst 
       (.I(1'b0),
        .O(o_z2[5]));
  OBUF \o_z2_OBUF[6]_inst 
       (.I(1'b0),
        .O(o_z2[6]));
  OBUF \o_z2_OBUF[7]_inst 
       (.I(1'b0),
        .O(o_z2[7]));
  OBUF \o_z3_OBUF[0]_inst 
       (.I(1'b0),
        .O(o_z3[0]));
  OBUF \o_z3_OBUF[1]_inst 
       (.I(1'b0),
        .O(o_z3[1]));
  OBUF \o_z3_OBUF[2]_inst 
       (.I(1'b0),
        .O(o_z3[2]));
  OBUF \o_z3_OBUF[3]_inst 
       (.I(1'b0),
        .O(o_z3[3]));
  OBUF \o_z3_OBUF[4]_inst 
       (.I(1'b0),
        .O(o_z3[4]));
  OBUF \o_z3_OBUF[5]_inst 
       (.I(1'b0),
        .O(o_z3[5]));
  OBUF \o_z3_OBUF[6]_inst 
       (.I(1'b0),
        .O(o_z3[6]));
  OBUF \o_z3_OBUF[7]_inst 
       (.I(1'b0),
        .O(o_z3[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
