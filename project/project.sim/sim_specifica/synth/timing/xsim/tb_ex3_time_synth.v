// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Feb 28 18:49:59 2023
// Host        : YOGA-ELE-2 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/eleon/Documents/universita/RL/Progetto_RL/project/project.sim/sim_specifica/synth/timing/xsim/tb_ex3_time_synth.v
// Design      : project_reti_logiche
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module choose_reg
   (done_c,
    E,
    done_c_reg_0,
    Q,
    i_start_IBUF,
    CLK,
    AR,
    D);
  output done_c;
  output [0:0]E;
  output [0:0]done_c_reg_0;
  output [1:0]Q;
  input i_start_IBUF;
  input CLK;
  input [0:0]AR;
  input [0:0]D;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire done_c;
  wire done_c_i_1_n_0;
  wire [0:0]done_c_reg_0;
  wire i_start_IBUF;
  wire \reg_out[1]_i_1_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \counter[0]_i_1 
       (.I0(\counter_reg_n_0_[1] ),
        .I1(i_start_IBUF),
        .I2(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \counter[1]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(i_start_IBUF),
        .I2(\counter_reg_n_0_[1] ),
        .O(\counter[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[1] ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \data_out[15]_i_1 
       (.I0(i_start_IBUF),
        .I1(done_c),
        .O(E));
  LUT3 #(
    .INIT(8'h20)) 
    done_c_i_1
       (.I0(i_start_IBUF),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[1] ),
        .O(done_c_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_c_reg
       (.C(CLK),
        .CE(done_c_i_1_n_0),
        .CLR(AR),
        .D(i_start_IBUF),
        .Q(done_c));
  LUT3 #(
    .INIT(8'h02)) 
    \reg_out[1]_i_1 
       (.I0(i_start_IBUF),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .O(\reg_out[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \reg_out_reg[0] 
       (.C(CLK),
        .CE(done_c_i_1_n_0),
        .CLR(AR),
        .D(D),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_out_reg[1] 
       (.C(CLK),
        .CE(\reg_out[1]_i_1_n_0 ),
        .CLR(AR),
        .D(D),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \temp[15]_i_1 
       (.I0(done_c),
        .I1(i_start_IBUF),
        .O(done_c_reg_0));
endmodule

module demux
   (o_z0_OBUF,
    o_z1_OBUF,
    o_z2_OBUF,
    o_z3_OBUF,
    done_c,
    data_ready,
    o_done_OBUF,
    D,
    AR,
    Q);
  output [7:0]o_z0_OBUF;
  output [7:0]o_z1_OBUF;
  output [7:0]o_z2_OBUF;
  output [7:0]o_z3_OBUF;
  input done_c;
  input data_ready;
  input o_done_OBUF;
  input [7:0]D;
  input [0:0]AR;
  input [1:0]Q;

  wire [0:0]AR;
  wire [7:0]D;
  wire [1:0]Q;
  wire data_ready;
  wire done_c;
  wire o_done_OBUF;
  wire [7:0]o_z0_OBUF;
  wire [7:0]o_z1_OBUF;
  wire [7:0]o_z2_OBUF;
  wire [7:0]o_z3_OBUF;
  wire [7:0]r0;
  wire r0__0;
  wire [7:0]r1;
  wire r1__0;
  wire [7:0]r2;
  wire r2__0;
  wire [7:0]r3;
  wire r3__0;
  wire [1:0]\reg ;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[0]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[0]),
        .O(o_z0_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[1]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[1]),
        .O(o_z0_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[2]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[2]),
        .O(o_z0_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[3]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[3]),
        .O(o_z0_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[4]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[4]),
        .O(o_z0_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[5]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[5]),
        .O(o_z0_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[6]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[6]),
        .O(o_z0_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0_OBUF[7]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r0[7]),
        .O(o_z0_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[0]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[0]),
        .O(o_z1_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[1]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[1]),
        .O(o_z1_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[2]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[2]),
        .O(o_z1_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[3]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[3]),
        .O(o_z1_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[4]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[4]),
        .O(o_z1_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[5]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[5]),
        .O(o_z1_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[6]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[6]),
        .O(o_z1_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1_OBUF[7]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r1[7]),
        .O(o_z1_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[0]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[0]),
        .O(o_z2_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[1]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[1]),
        .O(o_z2_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[2]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[2]),
        .O(o_z2_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[3]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[3]),
        .O(o_z2_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[4]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[4]),
        .O(o_z2_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[5]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[5]),
        .O(o_z2_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[6]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[6]),
        .O(o_z2_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2_OBUF[7]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r2[7]),
        .O(o_z2_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[0]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[0]),
        .O(o_z3_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[1]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[1]),
        .O(o_z3_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[2]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[2]),
        .O(o_z3_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[3]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[3]),
        .O(o_z3_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[4]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[4]),
        .O(o_z3_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[5]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[5]),
        .O(o_z3_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[6]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[6]),
        .O(o_z3_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3_OBUF[7]_inst_i_1 
       (.I0(o_done_OBUF),
        .I1(r3[7]),
        .O(o_z3_OBUF[7]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[0] 
       (.CLR(AR),
        .D(D[0]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[0]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[1] 
       (.CLR(AR),
        .D(D[1]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[1]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[2] 
       (.CLR(AR),
        .D(D[2]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[2]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[3] 
       (.CLR(AR),
        .D(D[3]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[3]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[4] 
       (.CLR(AR),
        .D(D[4]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[4]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[5] 
       (.CLR(AR),
        .D(D[5]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[5]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[6] 
       (.CLR(AR),
        .D(D[6]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[6]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r0_reg[7] 
       (.CLR(AR),
        .D(D[7]),
        .G(r0__0),
        .GE(1'b1),
        .Q(r0[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \r0_reg[7]_i_1 
       (.I0(done_c),
        .I1(data_ready),
        .I2(\reg [1]),
        .I3(\reg [0]),
        .O(r0__0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[0] 
       (.CLR(AR),
        .D(D[0]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[0]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[1] 
       (.CLR(AR),
        .D(D[1]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[1]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[2] 
       (.CLR(AR),
        .D(D[2]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[2]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[3] 
       (.CLR(AR),
        .D(D[3]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[3]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[4] 
       (.CLR(AR),
        .D(D[4]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[4]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[5] 
       (.CLR(AR),
        .D(D[5]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[5]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[6] 
       (.CLR(AR),
        .D(D[6]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[6]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r1_reg[7] 
       (.CLR(AR),
        .D(D[7]),
        .G(r1__0),
        .GE(1'b1),
        .Q(r1[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \r1_reg[7]_i_1 
       (.I0(done_c),
        .I1(data_ready),
        .I2(\reg [1]),
        .I3(\reg [0]),
        .O(r1__0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[0] 
       (.CLR(AR),
        .D(D[0]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[0]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[1] 
       (.CLR(AR),
        .D(D[1]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[1]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[2] 
       (.CLR(AR),
        .D(D[2]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[2]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[3] 
       (.CLR(AR),
        .D(D[3]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[3]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[4] 
       (.CLR(AR),
        .D(D[4]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[4]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[5] 
       (.CLR(AR),
        .D(D[5]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[5]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[6] 
       (.CLR(AR),
        .D(D[6]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[6]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r2_reg[7] 
       (.CLR(AR),
        .D(D[7]),
        .G(r2__0),
        .GE(1'b1),
        .Q(r2[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \r2_reg[7]_i_1 
       (.I0(done_c),
        .I1(data_ready),
        .I2(\reg [0]),
        .I3(\reg [1]),
        .O(r2__0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[0] 
       (.CLR(AR),
        .D(D[0]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[0]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[1] 
       (.CLR(AR),
        .D(D[1]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[1]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[2] 
       (.CLR(AR),
        .D(D[2]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[2]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[3] 
       (.CLR(AR),
        .D(D[3]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[3]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[4] 
       (.CLR(AR),
        .D(D[4]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[4]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[5] 
       (.CLR(AR),
        .D(D[5]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[5]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[6] 
       (.CLR(AR),
        .D(D[6]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[6]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r3_reg[7] 
       (.CLR(AR),
        .D(D[7]),
        .G(r3__0),
        .GE(1'b1),
        .Q(r3[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r3_reg[7]_i_1 
       (.I0(done_c),
        .I1(data_ready),
        .I2(\reg [1]),
        .I3(\reg [0]),
        .O(r3__0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \reg_reg[0] 
       (.CLR(1'b0),
        .D(Q[0]),
        .G(done_c),
        .GE(1'b1),
        .Q(\reg [0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \reg_reg[1] 
       (.CLR(1'b0),
        .D(Q[1]),
        .G(done_c),
        .GE(1'b1),
        .Q(\reg [1]));
endmodule

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
  wire [2:0]curr_state__0;
  wire data_ready;
  wire done_c;
  wire i_clk;
  wire i_clk_IBUF;
  wire i_clk_IBUF_BUFG;
  wire [7:0]i_mem_data;
  wire [7:0]i_mem_data_IBUF;
  wire i_rst;
  wire i_rst_IBUF;
  wire i_start;
  wire i_start_IBUF;
  wire i_w;
  wire i_w_IBUF;
  wire o_done;
  wire o_done_OBUF;
  wire [15:0]o_mem_addr;
  wire [15:0]o_mem_addr_OBUF;
  wire o_mem_en;
  wire o_mem_en_OBUF;
  wire o_mem_en_reg_i_1_n_0;
  wire o_mem_en_reg_i_2_n_0;
  wire o_mem_we;
  wire [7:0]o_z0;
  wire [7:0]o_z0_OBUF;
  wire [7:0]o_z1;
  wire [7:0]o_z1_OBUF;
  wire [7:0]o_z2;
  wire [7:0]o_z2_OBUF;
  wire [7:0]o_z3;
  wire [7:0]o_z3_OBUF;
  wire out_en_reg_i_1_n_0;
  wire out_en_reg_i_2_n_0;
  wire p_1_in;
  wire reg_map_n_2;
  wire [1:0]reg_out;
  wire reset_w;
  wire reset_w_reg_i_2_n_0;
  wire sipo_map_n_0;

initial begin
 $sdf_annotate("tb_ex3_time_synth.sdf",,,,"tool_control");
end
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h013F)) 
    \FSM_sequential_curr_state[0]_i_1 
       (.I0(i_start_IBUF),
        .I1(curr_state[1]),
        .I2(curr_state[2]),
        .I3(curr_state[0]),
        .O(curr_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h24)) 
    \FSM_sequential_curr_state[2]_i_2 
       (.I0(curr_state[0]),
        .I1(curr_state[2]),
        .I2(curr_state[1]),
        .O(curr_state__0[2]));
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
        .D(curr_state__0[2]),
        .Q(curr_state[2]));
  demux demux_map
       (.AR(i_rst_IBUF),
        .D(i_mem_data_IBUF),
        .Q(reg_out),
        .data_ready(data_ready),
        .done_c(done_c),
        .o_done_OBUF(o_done_OBUF),
        .o_z0_OBUF(o_z0_OBUF),
        .o_z1_OBUF(o_z1_OBUF),
        .o_z2_OBUF(o_z2_OBUF),
        .o_z3_OBUF(o_z3_OBUF));
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
    \i_mem_data_IBUF[0]_inst 
       (.I(i_mem_data[0]),
        .O(i_mem_data_IBUF[0]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[1]_inst 
       (.I(i_mem_data[1]),
        .O(i_mem_data_IBUF[1]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[2]_inst 
       (.I(i_mem_data[2]),
        .O(i_mem_data_IBUF[2]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[3]_inst 
       (.I(i_mem_data[3]),
        .O(i_mem_data_IBUF[3]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[4]_inst 
       (.I(i_mem_data[4]),
        .O(i_mem_data_IBUF[4]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[5]_inst 
       (.I(i_mem_data[5]),
        .O(i_mem_data_IBUF[5]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[6]_inst 
       (.I(i_mem_data[6]),
        .O(i_mem_data_IBUF[6]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \i_mem_data_IBUF[7]_inst 
       (.I(i_mem_data[7]),
        .O(i_mem_data_IBUF[7]));
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
  IBUF #(
    .CCIO_EN("TRUE")) 
    i_w_IBUF_inst
       (.I(i_w),
        .O(i_w_IBUF));
  OBUF o_done_OBUF_inst
       (.I(o_done_OBUF),
        .O(o_done));
  OBUF \o_mem_addr_OBUF[0]_inst 
       (.I(o_mem_addr_OBUF[0]),
        .O(o_mem_addr[0]));
  OBUF \o_mem_addr_OBUF[10]_inst 
       (.I(o_mem_addr_OBUF[10]),
        .O(o_mem_addr[10]));
  OBUF \o_mem_addr_OBUF[11]_inst 
       (.I(o_mem_addr_OBUF[11]),
        .O(o_mem_addr[11]));
  OBUF \o_mem_addr_OBUF[12]_inst 
       (.I(o_mem_addr_OBUF[12]),
        .O(o_mem_addr[12]));
  OBUF \o_mem_addr_OBUF[13]_inst 
       (.I(o_mem_addr_OBUF[13]),
        .O(o_mem_addr[13]));
  OBUF \o_mem_addr_OBUF[14]_inst 
       (.I(o_mem_addr_OBUF[14]),
        .O(o_mem_addr[14]));
  OBUF \o_mem_addr_OBUF[15]_inst 
       (.I(o_mem_addr_OBUF[15]),
        .O(o_mem_addr[15]));
  OBUF \o_mem_addr_OBUF[1]_inst 
       (.I(o_mem_addr_OBUF[1]),
        .O(o_mem_addr[1]));
  OBUF \o_mem_addr_OBUF[2]_inst 
       (.I(o_mem_addr_OBUF[2]),
        .O(o_mem_addr[2]));
  OBUF \o_mem_addr_OBUF[3]_inst 
       (.I(o_mem_addr_OBUF[3]),
        .O(o_mem_addr[3]));
  OBUF \o_mem_addr_OBUF[4]_inst 
       (.I(o_mem_addr_OBUF[4]),
        .O(o_mem_addr[4]));
  OBUF \o_mem_addr_OBUF[5]_inst 
       (.I(o_mem_addr_OBUF[5]),
        .O(o_mem_addr[5]));
  OBUF \o_mem_addr_OBUF[6]_inst 
       (.I(o_mem_addr_OBUF[6]),
        .O(o_mem_addr[6]));
  OBUF \o_mem_addr_OBUF[7]_inst 
       (.I(o_mem_addr_OBUF[7]),
        .O(o_mem_addr[7]));
  OBUF \o_mem_addr_OBUF[8]_inst 
       (.I(o_mem_addr_OBUF[8]),
        .O(o_mem_addr[8]));
  OBUF \o_mem_addr_OBUF[9]_inst 
       (.I(o_mem_addr_OBUF[9]),
        .O(o_mem_addr[9]));
  OBUF o_mem_en_OBUF_inst
       (.I(o_mem_en_OBUF),
        .O(o_mem_en));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    o_mem_en_reg
       (.CLR(1'b0),
        .D(o_mem_en_reg_i_1_n_0),
        .G(o_mem_en_reg_i_2_n_0),
        .GE(1'b1),
        .Q(o_mem_en_OBUF));
  LUT2 #(
    .INIT(4'h2)) 
    o_mem_en_reg_i_1
       (.I0(curr_state[1]),
        .I1(curr_state[2]),
        .O(o_mem_en_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h43)) 
    o_mem_en_reg_i_2
       (.I0(curr_state[2]),
        .I1(curr_state[0]),
        .I2(curr_state[1]),
        .O(o_mem_en_reg_i_2_n_0));
  OBUF o_mem_we_OBUF_inst
       (.I(1'b0),
        .O(o_mem_we));
  OBUF \o_z0_OBUF[0]_inst 
       (.I(o_z0_OBUF[0]),
        .O(o_z0[0]));
  OBUF \o_z0_OBUF[1]_inst 
       (.I(o_z0_OBUF[1]),
        .O(o_z0[1]));
  OBUF \o_z0_OBUF[2]_inst 
       (.I(o_z0_OBUF[2]),
        .O(o_z0[2]));
  OBUF \o_z0_OBUF[3]_inst 
       (.I(o_z0_OBUF[3]),
        .O(o_z0[3]));
  OBUF \o_z0_OBUF[4]_inst 
       (.I(o_z0_OBUF[4]),
        .O(o_z0[4]));
  OBUF \o_z0_OBUF[5]_inst 
       (.I(o_z0_OBUF[5]),
        .O(o_z0[5]));
  OBUF \o_z0_OBUF[6]_inst 
       (.I(o_z0_OBUF[6]),
        .O(o_z0[6]));
  OBUF \o_z0_OBUF[7]_inst 
       (.I(o_z0_OBUF[7]),
        .O(o_z0[7]));
  OBUF \o_z1_OBUF[0]_inst 
       (.I(o_z1_OBUF[0]),
        .O(o_z1[0]));
  OBUF \o_z1_OBUF[1]_inst 
       (.I(o_z1_OBUF[1]),
        .O(o_z1[1]));
  OBUF \o_z1_OBUF[2]_inst 
       (.I(o_z1_OBUF[2]),
        .O(o_z1[2]));
  OBUF \o_z1_OBUF[3]_inst 
       (.I(o_z1_OBUF[3]),
        .O(o_z1[3]));
  OBUF \o_z1_OBUF[4]_inst 
       (.I(o_z1_OBUF[4]),
        .O(o_z1[4]));
  OBUF \o_z1_OBUF[5]_inst 
       (.I(o_z1_OBUF[5]),
        .O(o_z1[5]));
  OBUF \o_z1_OBUF[6]_inst 
       (.I(o_z1_OBUF[6]),
        .O(o_z1[6]));
  OBUF \o_z1_OBUF[7]_inst 
       (.I(o_z1_OBUF[7]),
        .O(o_z1[7]));
  OBUF \o_z2_OBUF[0]_inst 
       (.I(o_z2_OBUF[0]),
        .O(o_z2[0]));
  OBUF \o_z2_OBUF[1]_inst 
       (.I(o_z2_OBUF[1]),
        .O(o_z2[1]));
  OBUF \o_z2_OBUF[2]_inst 
       (.I(o_z2_OBUF[2]),
        .O(o_z2[2]));
  OBUF \o_z2_OBUF[3]_inst 
       (.I(o_z2_OBUF[3]),
        .O(o_z2[3]));
  OBUF \o_z2_OBUF[4]_inst 
       (.I(o_z2_OBUF[4]),
        .O(o_z2[4]));
  OBUF \o_z2_OBUF[5]_inst 
       (.I(o_z2_OBUF[5]),
        .O(o_z2[5]));
  OBUF \o_z2_OBUF[6]_inst 
       (.I(o_z2_OBUF[6]),
        .O(o_z2[6]));
  OBUF \o_z2_OBUF[7]_inst 
       (.I(o_z2_OBUF[7]),
        .O(o_z2[7]));
  OBUF \o_z3_OBUF[0]_inst 
       (.I(o_z3_OBUF[0]),
        .O(o_z3[0]));
  OBUF \o_z3_OBUF[1]_inst 
       (.I(o_z3_OBUF[1]),
        .O(o_z3[1]));
  OBUF \o_z3_OBUF[2]_inst 
       (.I(o_z3_OBUF[2]),
        .O(o_z3[2]));
  OBUF \o_z3_OBUF[3]_inst 
       (.I(o_z3_OBUF[3]),
        .O(o_z3[3]));
  OBUF \o_z3_OBUF[4]_inst 
       (.I(o_z3_OBUF[4]),
        .O(o_z3[4]));
  OBUF \o_z3_OBUF[5]_inst 
       (.I(o_z3_OBUF[5]),
        .O(o_z3[5]));
  OBUF \o_z3_OBUF[6]_inst 
       (.I(o_z3_OBUF[6]),
        .O(o_z3[6]));
  OBUF \o_z3_OBUF[7]_inst 
       (.I(o_z3_OBUF[7]),
        .O(o_z3[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    out_en_reg
       (.CLR(1'b0),
        .D(out_en_reg_i_1_n_0),
        .G(out_en_reg_i_2_n_0),
        .GE(1'b1),
        .Q(o_done_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    out_en_reg_i_1
       (.I0(curr_state[2]),
        .I1(curr_state[1]),
        .O(out_en_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h41)) 
    out_en_reg_i_2
       (.I0(curr_state[1]),
        .I1(curr_state[2]),
        .I2(curr_state[0]),
        .O(out_en_reg_i_2_n_0));
  choose_reg reg_map
       (.AR(sipo_map_n_0),
        .CLK(i_clk_IBUF_BUFG),
        .D(i_w_IBUF),
        .E(p_1_in),
        .Q(reg_out),
        .done_c(done_c),
        .done_c_reg_0(reg_map_n_2),
        .i_start_IBUF(i_start_IBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    reset_w_reg
       (.CLR(1'b0),
        .D(reset_w),
        .G(reset_w_reg_i_2_n_0),
        .GE(1'b1),
        .Q(data_ready));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h02)) 
    reset_w_reg_i_1
       (.I0(curr_state[2]),
        .I1(curr_state[0]),
        .I2(curr_state[1]),
        .O(reset_w));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h45)) 
    reset_w_reg_i_2
       (.I0(curr_state[1]),
        .I1(curr_state[2]),
        .I2(curr_state[0]),
        .O(reset_w_reg_i_2_n_0));
  sipo sipo_map
       (.AR(sipo_map_n_0),
        .CLK(i_clk_IBUF_BUFG),
        .D(i_w_IBUF),
        .E(reg_map_n_2),
        .Q(o_mem_addr_OBUF),
        .\data_out_reg[15]_0 (p_1_in),
        .data_ready(data_ready),
        .\temp_reg[0]_0 (i_rst_IBUF));
endmodule

module sipo
   (AR,
    Q,
    data_ready,
    \temp_reg[0]_0 ,
    E,
    CLK,
    D,
    \data_out_reg[15]_0 );
  output [0:0]AR;
  output [15:0]Q;
  input data_ready;
  input [0:0]\temp_reg[0]_0 ;
  input [0:0]E;
  input CLK;
  input [0:0]D;
  input [0:0]\data_out_reg[15]_0 ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [0:0]E;
  wire [15:0]Q;
  wire [0:0]\data_out_reg[15]_0 ;
  wire data_ready;
  wire [15:1]p_2_in;
  wire [0:0]\temp_reg[0]_0 ;
  wire \temp_reg_n_0_[15] ;

  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[0] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[1]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[10] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[11]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[11] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[12]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[12] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[13]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[13] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[14]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[14] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[15]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[15] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(\temp_reg_n_0_[15] ),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[1] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[2]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[2] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[3]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[3] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[4]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[4] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[5]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[5] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[6]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[6] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[7]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[7] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[8]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[8] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[9]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[9] 
       (.C(CLK),
        .CE(\data_out_reg[15]_0 ),
        .CLR(AR),
        .D(p_2_in[10]),
        .Q(Q[9]));
  LUT2 #(
    .INIT(4'hE)) 
    \temp[15]_i_2 
       (.I0(data_ready),
        .I1(\temp_reg[0]_0 ),
        .O(AR));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D),
        .Q(p_2_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[10]),
        .Q(p_2_in[11]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[11]),
        .Q(p_2_in[12]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[12]),
        .Q(p_2_in[13]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[13]),
        .Q(p_2_in[14]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[14]),
        .Q(p_2_in[15]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[15]),
        .Q(\temp_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[1]),
        .Q(p_2_in[2]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[2]),
        .Q(p_2_in[3]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[3]),
        .Q(p_2_in[4]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[4]),
        .Q(p_2_in[5]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[5]),
        .Q(p_2_in[6]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[6]),
        .Q(p_2_in[7]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[7]),
        .Q(p_2_in[8]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[8]),
        .Q(p_2_in[9]));
  FDCE #(
    .INIT(1'b0)) 
    \temp_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_2_in[9]),
        .Q(p_2_in[10]));
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
