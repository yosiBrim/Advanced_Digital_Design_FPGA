// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sun Aug 10 15:50:27 2025
// Host        : ELEC-403-103 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               Z:/VHDL2/lab_28/project_1/project_1.sim/sim_1/impl/timing/xsim/Top_level_time_impl.v
// Design      : Top_level
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Counters
   (TC2_reg_0,
    TC10_reg_0,
    ADV,
    CLK_IBUF_BUFG,
    CE,
    SEL,
    RESET_IBUF);
  output TC2_reg_0;
  output TC10_reg_0;
  output ADV;
  input CLK_IBUF_BUFG;
  input CE;
  input SEL;
  input RESET_IBUF;

  wire ADV;
  wire CE;
  wire CLK_IBUF_BUFG;
  wire \Q_10Seconds[0]_i_1_n_0 ;
  wire \Q_10Seconds[3]_i_1_n_0 ;
  wire \Q_10Seconds[3]_i_3_n_0 ;
  wire [3:0]Q_10Seconds_reg;
  wire [1:0]Q_2Seconds;
  wire \Q_2Seconds[0]_i_1_n_0 ;
  wire \Q_2Seconds[1]_i_1_n_0 ;
  wire RESET_IBUF;
  wire SEL;
  wire TC10_i_1_n_0;
  wire TC10_reg_0;
  wire TC2_i_1_n_0;
  wire TC2_reg_0;
  wire [3:1]plusOp;

  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_STATE[1]_i_2 
       (.I0(TC2_reg_0),
        .I1(SEL),
        .I2(TC10_reg_0),
        .O(ADV));
  LUT1 #(
    .INIT(2'h1)) 
    \Q_10Seconds[0]_i_1 
       (.I0(Q_10Seconds_reg[0]),
        .O(\Q_10Seconds[0]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \Q_10Seconds[1]_i_1 
       (.I0(Q_10Seconds_reg[0]),
        .I1(Q_10Seconds_reg[1]),
        .O(plusOp[1]));
  (* \PinAttr:I1:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \Q_10Seconds[2]_i_1 
       (.I0(Q_10Seconds_reg[0]),
        .I1(Q_10Seconds_reg[1]),
        .I2(Q_10Seconds_reg[2]),
        .O(plusOp[2]));
  LUT3 #(
    .INIT(8'hBA)) 
    \Q_10Seconds[3]_i_1 
       (.I0(RESET_IBUF),
        .I1(\Q_10Seconds[3]_i_3_n_0 ),
        .I2(CE),
        .O(\Q_10Seconds[3]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "193" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \Q_10Seconds[3]_i_2 
       (.I0(Q_10Seconds_reg[1]),
        .I1(Q_10Seconds_reg[0]),
        .I2(Q_10Seconds_reg[2]),
        .I3(Q_10Seconds_reg[3]),
        .O(plusOp[3]));
  (* \PinAttr:I3:HOLD_DETOUR  = "193" *) 
  LUT5 #(
    .INIT(32'h00005557)) 
    \Q_10Seconds[3]_i_3 
       (.I0(Q_10Seconds_reg[3]),
        .I1(Q_10Seconds_reg[2]),
        .I2(Q_10Seconds_reg[0]),
        .I3(Q_10Seconds_reg[1]),
        .I4(SEL),
        .O(\Q_10Seconds[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_10Seconds_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(\Q_10Seconds[0]_i_1_n_0 ),
        .Q(Q_10Seconds_reg[0]),
        .R(\Q_10Seconds[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_10Seconds_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(plusOp[1]),
        .Q(Q_10Seconds_reg[1]),
        .R(\Q_10Seconds[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_10Seconds_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(plusOp[2]),
        .Q(Q_10Seconds_reg[2]),
        .R(\Q_10Seconds[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_10Seconds_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(plusOp[3]),
        .Q(Q_10Seconds_reg[3]),
        .R(\Q_10Seconds[3]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "185" *) 
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00005508)) 
    \Q_2Seconds[0]_i_1 
       (.I0(CE),
        .I1(SEL),
        .I2(Q_2Seconds[1]),
        .I3(Q_2Seconds[0]),
        .I4(RESET_IBUF),
        .O(\Q_2Seconds[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \Q_2Seconds[1]_i_1 
       (.I0(CE),
        .I1(Q_2Seconds[1]),
        .I2(RESET_IBUF),
        .O(\Q_2Seconds[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_2Seconds_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_2Seconds[0]_i_1_n_0 ),
        .Q(Q_2Seconds[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Q_2Seconds_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_2Seconds[1]_i_1_n_0 ),
        .Q(Q_2Seconds[1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000A3A)) 
    TC10_i_1
       (.I0(TC10_reg_0),
        .I1(SEL),
        .I2(CE),
        .I3(\Q_10Seconds[3]_i_3_n_0 ),
        .I4(RESET_IBUF),
        .O(TC10_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TC10_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(TC10_i_1_n_0),
        .Q(TC10_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000EEE22222)) 
    TC2_i_1
       (.I0(TC2_reg_0),
        .I1(CE),
        .I2(Q_2Seconds[0]),
        .I3(Q_2Seconds[1]),
        .I4(SEL),
        .I5(RESET_IBUF),
        .O(TC2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TC2_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(TC2_i_1_n_0),
        .Q(TC2_reg_0),
        .R(1'b0));
endmodule

module State_machine
   (SEL,
    LIGHT_OBUF,
    CLK_IBUF_BUFG,
    \LIGHT_reg[2]_0 ,
    \LIGHT_reg[2]_1 ,
    CE,
    ADV,
    RESET_IBUF,
    \LIGHT_OBUF[1]_repN_alias );
  output SEL;
  output [4:0]LIGHT_OBUF;
  input CLK_IBUF_BUFG;
  input \LIGHT_reg[2]_0 ;
  input \LIGHT_reg[2]_1 ;
  input CE;
  input ADV;
  input RESET_IBUF;
  output \LIGHT_OBUF[1]_repN_alias ;

  wire ADV;
  wire CE;
  wire CLK_IBUF_BUFG;
  wire \FSM_sequential_STATE[1]_i_1_n_0 ;
  wire \LIGHT[0]_i_1_n_0 ;
  wire \LIGHT[1]_i_1_n_0 ;
  wire \LIGHT[2]_i_1_n_0 ;
  wire \LIGHT[3]_i_1_n_0 ;
  wire \LIGHT[4]_i_1_n_0 ;
  wire [4:0]LIGHT_OBUF;
  wire \LIGHT_OBUF[1]_repN ;
  wire \LIGHT_reg[2]_0 ;
  wire \LIGHT_reg[2]_1 ;
  wire RESET_IBUF;
  wire SEL;
  wire SEL_i_1_n_0;
  wire [1:1]STATE;

  assign \LIGHT_OBUF[1]_repN_alias  = \LIGHT_OBUF[1]_repN ;
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \FSM_sequential_STATE[1]_i_1 
       (.I0(STATE),
        .I1(CE),
        .I2(ADV),
        .I3(LIGHT_OBUF[1]),
        .I4(RESET_IBUF),
        .O(\FSM_sequential_STATE[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s1:01,s2:10,s3:11,s0:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_STATE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_STATE[1]_i_1_n_0 ),
        .Q(STATE),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h22244424)) 
    \LIGHT[0]_i_1 
       (.I0(LIGHT_OBUF[1]),
        .I1(STATE),
        .I2(\LIGHT_reg[2]_1 ),
        .I3(SEL),
        .I4(\LIGHT_reg[2]_0 ),
        .O(\LIGHT[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000006A666AAA)) 
    \LIGHT[1]_i_1 
       (.I0(LIGHT_OBUF[1]),
        .I1(CE),
        .I2(\LIGHT_reg[2]_0 ),
        .I3(SEL),
        .I4(\LIGHT_reg[2]_1 ),
        .I5(RESET_IBUF),
        .O(\LIGHT[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h9A955555)) 
    \LIGHT[2]_i_1 
       (.I0(STATE),
        .I1(\LIGHT_reg[2]_0 ),
        .I2(SEL),
        .I3(\LIGHT_reg[2]_1 ),
        .I4(LIGHT_OBUF[1]),
        .O(\LIGHT[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h88811181)) 
    \LIGHT[3]_i_1 
       (.I0(LIGHT_OBUF[1]),
        .I1(STATE),
        .I2(\LIGHT_reg[2]_1 ),
        .I3(SEL),
        .I4(\LIGHT_reg[2]_0 ),
        .O(\LIGHT[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h757FEFEA)) 
    \LIGHT[4]_i_1 
       (.I0(LIGHT_OBUF[1]),
        .I1(\LIGHT_reg[2]_0 ),
        .I2(SEL),
        .I3(\LIGHT_reg[2]_1 ),
        .I4(STATE),
        .O(\LIGHT[4]_i_1_n_0 ));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \LIGHT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(\LIGHT[0]_i_1_n_0 ),
        .Q(LIGHT_OBUF[0]),
        .R(RESET_IBUF));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT CRITICAL_CELL_OPT" *) 
  (* PHYS_OPT_SKIPPED = "CRITICAL_CELL_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \LIGHT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\LIGHT[1]_i_1_n_0 ),
        .Q(LIGHT_OBUF[1]),
        .R(1'b0));
  (* ORIG_CELL_NAME = "LIGHT_reg[1]" *) 
  (* PHYS_OPT_MODIFIED = "CRITICAL_CELL_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \LIGHT_reg[1]_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\LIGHT[1]_i_1_n_0 ),
        .Q(\LIGHT_OBUF[1]_repN ),
        .R(1'b0));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT" *) 
  FDSE #(
    .INIT(1'b1)) 
    \LIGHT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(\LIGHT[2]_i_1_n_0 ),
        .Q(LIGHT_OBUF[2]),
        .S(RESET_IBUF));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT" *) 
  FDSE #(
    .INIT(1'b1)) 
    \LIGHT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(\LIGHT[3]_i_1_n_0 ),
        .Q(LIGHT_OBUF[3]),
        .S(RESET_IBUF));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \LIGHT_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(CE),
        .D(\LIGHT[4]_i_1_n_0 ),
        .Q(LIGHT_OBUF[4]),
        .R(RESET_IBUF));
  LUT5 #(
    .INIT(32'h00002EE2)) 
    SEL_i_1
       (.I0(SEL),
        .I1(CE),
        .I2(ADV),
        .I3(LIGHT_OBUF[1]),
        .I4(RESET_IBUF),
        .O(SEL_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    SEL_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SEL_i_1_n_0),
        .Q(SEL),
        .R(1'b0));
endmodule

module Time_Base
   (CE,
    CLK_IBUF_BUFG,
    RESET_IBUF);
  output CE;
  input CLK_IBUF_BUFG;
  input RESET_IBUF;

  wire CE;
  wire CLK_IBUF_BUFG;
  wire \Q[0]_i_1_n_0 ;
  wire \Q[0]_i_3_n_0 ;
  wire [26:0]Q_reg;
  wire \Q_reg[0]_i_2_n_0 ;
  wire \Q_reg[0]_i_2_n_4 ;
  wire \Q_reg[0]_i_2_n_5 ;
  wire \Q_reg[0]_i_2_n_6 ;
  wire \Q_reg[0]_i_2_n_7 ;
  wire \Q_reg[12]_i_1_n_0 ;
  wire \Q_reg[12]_i_1_n_4 ;
  wire \Q_reg[12]_i_1_n_5 ;
  wire \Q_reg[12]_i_1_n_6 ;
  wire \Q_reg[12]_i_1_n_7 ;
  wire \Q_reg[16]_i_1_n_0 ;
  wire \Q_reg[16]_i_1_n_4 ;
  wire \Q_reg[16]_i_1_n_5 ;
  wire \Q_reg[16]_i_1_n_6 ;
  wire \Q_reg[16]_i_1_n_7 ;
  wire \Q_reg[20]_i_1_n_0 ;
  wire \Q_reg[20]_i_1_n_4 ;
  wire \Q_reg[20]_i_1_n_5 ;
  wire \Q_reg[20]_i_1_n_6 ;
  wire \Q_reg[20]_i_1_n_7 ;
  wire \Q_reg[24]_i_1_n_5 ;
  wire \Q_reg[24]_i_1_n_6 ;
  wire \Q_reg[24]_i_1_n_7 ;
  wire \Q_reg[4]_i_1_n_0 ;
  wire \Q_reg[4]_i_1_n_4 ;
  wire \Q_reg[4]_i_1_n_5 ;
  wire \Q_reg[4]_i_1_n_6 ;
  wire \Q_reg[4]_i_1_n_7 ;
  wire \Q_reg[8]_i_1_n_0 ;
  wire \Q_reg[8]_i_1_n_4 ;
  wire \Q_reg[8]_i_1_n_5 ;
  wire \Q_reg[8]_i_1_n_6 ;
  wire \Q_reg[8]_i_1_n_7 ;
  wire RESET_IBUF;
  wire TC_TimeBase_i_1_n_0;
  wire ltOp;
  wire ltOp_carry__0_i_1_n_0;
  wire ltOp_carry__0_i_2_n_0;
  wire ltOp_carry__0_i_3_n_0;
  wire ltOp_carry__0_i_4_n_0;
  wire ltOp_carry__0_n_0;
  wire ltOp_carry__1_i_1_n_0;
  wire ltOp_carry__1_i_2_n_0;
  wire ltOp_carry__1_i_3_n_0;
  wire ltOp_carry__1_i_4_n_0;
  wire ltOp_carry__1_n_0;
  wire ltOp_carry__2_i_1_n_0;
  wire ltOp_carry__2_i_2_n_0;
  wire ltOp_carry_i_1_n_0;
  wire ltOp_carry_i_2_n_0;
  wire ltOp_carry_i_3_n_0;
  wire ltOp_carry_i_4_n_0;
  wire ltOp_carry_i_5_n_0;
  wire ltOp_carry_i_6_n_0;
  wire ltOp_carry_n_0;
  wire [2:0]\NLW_Q_reg[0]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_Q_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Q_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Q_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Q_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_Q_reg[24]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_Q_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Q_reg[8]_i_1_CO_UNCONNECTED ;
  wire [2:0]NLW_ltOp_carry_CO_UNCONNECTED;
  wire [3:0]NLW_ltOp_carry_O_UNCONNECTED;
  wire [2:0]NLW_ltOp_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_ltOp_carry__0_O_UNCONNECTED;
  wire [2:0]NLW_ltOp_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_ltOp_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_ltOp_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_ltOp_carry__2_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'hB)) 
    \Q[0]_i_1 
       (.I0(RESET_IBUF),
        .I1(ltOp),
        .O(\Q[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \Q[0]_i_3 
       (.I0(Q_reg[0]),
        .O(\Q[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[0]_i_2_n_7 ),
        .Q(Q_reg[0]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\Q_reg[0]_i_2_n_0 ,\NLW_Q_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\Q_reg[0]_i_2_n_4 ,\Q_reg[0]_i_2_n_5 ,\Q_reg[0]_i_2_n_6 ,\Q_reg[0]_i_2_n_7 }),
        .S({Q_reg[3:1],\Q[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[8]_i_1_n_5 ),
        .Q(Q_reg[10]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[8]_i_1_n_4 ),
        .Q(Q_reg[11]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[12]_i_1_n_7 ),
        .Q(Q_reg[12]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[12]_i_1 
       (.CI(\Q_reg[8]_i_1_n_0 ),
        .CO({\Q_reg[12]_i_1_n_0 ,\NLW_Q_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\Q_reg[12]_i_1_n_4 ,\Q_reg[12]_i_1_n_5 ,\Q_reg[12]_i_1_n_6 ,\Q_reg[12]_i_1_n_7 }),
        .S(Q_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[12]_i_1_n_6 ),
        .Q(Q_reg[13]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[12]_i_1_n_5 ),
        .Q(Q_reg[14]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[12]_i_1_n_4 ),
        .Q(Q_reg[15]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[16]_i_1_n_7 ),
        .Q(Q_reg[16]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[16]_i_1 
       (.CI(\Q_reg[12]_i_1_n_0 ),
        .CO({\Q_reg[16]_i_1_n_0 ,\NLW_Q_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\Q_reg[16]_i_1_n_4 ,\Q_reg[16]_i_1_n_5 ,\Q_reg[16]_i_1_n_6 ,\Q_reg[16]_i_1_n_7 }),
        .S(Q_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[16]_i_1_n_6 ),
        .Q(Q_reg[17]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[16]_i_1_n_5 ),
        .Q(Q_reg[18]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[16]_i_1_n_4 ),
        .Q(Q_reg[19]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[0]_i_2_n_6 ),
        .Q(Q_reg[1]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[20]_i_1_n_7 ),
        .Q(Q_reg[20]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[20]_i_1 
       (.CI(\Q_reg[16]_i_1_n_0 ),
        .CO({\Q_reg[20]_i_1_n_0 ,\NLW_Q_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\Q_reg[20]_i_1_n_4 ,\Q_reg[20]_i_1_n_5 ,\Q_reg[20]_i_1_n_6 ,\Q_reg[20]_i_1_n_7 }),
        .S(Q_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[20]_i_1_n_6 ),
        .Q(Q_reg[21]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[20]_i_1_n_5 ),
        .Q(Q_reg[22]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[20]_i_1_n_4 ),
        .Q(Q_reg[23]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[24]_i_1_n_7 ),
        .Q(Q_reg[24]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[24]_i_1 
       (.CI(\Q_reg[20]_i_1_n_0 ),
        .CO(\NLW_Q_reg[24]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_Q_reg[24]_i_1_O_UNCONNECTED [3],\Q_reg[24]_i_1_n_5 ,\Q_reg[24]_i_1_n_6 ,\Q_reg[24]_i_1_n_7 }),
        .S({1'b0,Q_reg[26:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[24]_i_1_n_6 ),
        .Q(Q_reg[25]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[24]_i_1_n_5 ),
        .Q(Q_reg[26]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[0]_i_2_n_5 ),
        .Q(Q_reg[2]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[0]_i_2_n_4 ),
        .Q(Q_reg[3]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[4]_i_1_n_7 ),
        .Q(Q_reg[4]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[4]_i_1 
       (.CI(\Q_reg[0]_i_2_n_0 ),
        .CO({\Q_reg[4]_i_1_n_0 ,\NLW_Q_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\Q_reg[4]_i_1_n_4 ,\Q_reg[4]_i_1_n_5 ,\Q_reg[4]_i_1_n_6 ,\Q_reg[4]_i_1_n_7 }),
        .S(Q_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[4]_i_1_n_6 ),
        .Q(Q_reg[5]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[4]_i_1_n_5 ),
        .Q(Q_reg[6]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[4]_i_1_n_4 ),
        .Q(Q_reg[7]),
        .R(\Q[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[8]_i_1_n_7 ),
        .Q(Q_reg[8]),
        .R(\Q[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Q_reg[8]_i_1 
       (.CI(\Q_reg[4]_i_1_n_0 ),
        .CO({\Q_reg[8]_i_1_n_0 ,\NLW_Q_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\Q_reg[8]_i_1_n_4 ,\Q_reg[8]_i_1_n_5 ,\Q_reg[8]_i_1_n_6 ,\Q_reg[8]_i_1_n_7 }),
        .S(Q_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q_reg[8]_i_1_n_6 ),
        .Q(Q_reg[9]),
        .R(\Q[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    TC_TimeBase_i_1
       (.I0(RESET_IBUF),
        .I1(ltOp),
        .O(TC_TimeBase_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TC_TimeBase_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(TC_TimeBase_i_1_n_0),
        .Q(CE),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 ltOp_carry
       (.CI(1'b0),
        .CO({ltOp_carry_n_0,NLW_ltOp_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,ltOp_carry_i_1_n_0,ltOp_carry_i_2_n_0}),
        .O(NLW_ltOp_carry_O_UNCONNECTED[3:0]),
        .S({ltOp_carry_i_3_n_0,ltOp_carry_i_4_n_0,ltOp_carry_i_5_n_0,ltOp_carry_i_6_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 ltOp_carry__0
       (.CI(ltOp_carry_n_0),
        .CO({ltOp_carry__0_n_0,NLW_ltOp_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ltOp_carry__0_O_UNCONNECTED[3:0]),
        .S({ltOp_carry__0_i_1_n_0,ltOp_carry__0_i_2_n_0,ltOp_carry__0_i_3_n_0,ltOp_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__0_i_1
       (.I0(Q_reg[14]),
        .I1(Q_reg[15]),
        .O(ltOp_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__0_i_2
       (.I0(Q_reg[12]),
        .I1(Q_reg[13]),
        .O(ltOp_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__0_i_3
       (.I0(Q_reg[10]),
        .I1(Q_reg[11]),
        .O(ltOp_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__0_i_4
       (.I0(Q_reg[8]),
        .I1(Q_reg[9]),
        .O(ltOp_carry__0_i_4_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 ltOp_carry__1
       (.CI(ltOp_carry__0_n_0),
        .CO({ltOp_carry__1_n_0,NLW_ltOp_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ltOp_carry__1_O_UNCONNECTED[3:0]),
        .S({ltOp_carry__1_i_1_n_0,ltOp_carry__1_i_2_n_0,ltOp_carry__1_i_3_n_0,ltOp_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__1_i_1
       (.I0(Q_reg[22]),
        .I1(Q_reg[23]),
        .O(ltOp_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__1_i_2
       (.I0(Q_reg[20]),
        .I1(Q_reg[21]),
        .O(ltOp_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__1_i_3
       (.I0(Q_reg[18]),
        .I1(Q_reg[19]),
        .O(ltOp_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__1_i_4
       (.I0(Q_reg[16]),
        .I1(Q_reg[17]),
        .O(ltOp_carry__1_i_4_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 ltOp_carry__2
       (.CI(ltOp_carry__1_n_0),
        .CO({NLW_ltOp_carry__2_CO_UNCONNECTED[3:2],ltOp,NLW_ltOp_carry__2_CO_UNCONNECTED[0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ltOp_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,ltOp_carry__2_i_1_n_0,ltOp_carry__2_i_2_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ltOp_carry__2_i_1
       (.I0(Q_reg[26]),
        .O(ltOp_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry__2_i_2
       (.I0(Q_reg[24]),
        .I1(Q_reg[25]),
        .O(ltOp_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ltOp_carry_i_1
       (.I0(Q_reg[3]),
        .O(ltOp_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry_i_2
       (.I0(Q_reg[0]),
        .I1(Q_reg[1]),
        .O(ltOp_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry_i_3
       (.I0(Q_reg[6]),
        .I1(Q_reg[7]),
        .O(ltOp_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ltOp_carry_i_4
       (.I0(Q_reg[4]),
        .I1(Q_reg[5]),
        .O(ltOp_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ltOp_carry_i_5
       (.I0(Q_reg[3]),
        .I1(Q_reg[2]),
        .O(ltOp_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ltOp_carry_i_6
       (.I0(Q_reg[0]),
        .I1(Q_reg[1]),
        .O(ltOp_carry_i_6_n_0));
endmodule

(* ECO_CHECKSUM = "867c8808" *) 
(* NotValidForBitStream *)
module Top_level
   (CLK,
    RESET,
    LIGHT);
  input CLK;
  input RESET;
  output [4:0]LIGHT;

  wire ADV;
  wire CE;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire L1_n_0;
  wire L1_n_1;
  wire [4:0]LIGHT;
  wire [4:0]LIGHT_OBUF;
  wire \LIGHT_OBUF[1]_repN_alias ;
  wire RESET;
  wire RESET_IBUF;
  wire SEL;

initial begin
 $sdf_annotate("Top_level_time_impl.sdf",,,,"tool_control");
end
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  State_machine L0
       (.ADV(ADV),
        .CE(CE),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .LIGHT_OBUF(LIGHT_OBUF),
        .\LIGHT_OBUF[1]_repN_alias (\LIGHT_OBUF[1]_repN_alias ),
        .\LIGHT_reg[2]_0 (L1_n_0),
        .\LIGHT_reg[2]_1 (L1_n_1),
        .RESET_IBUF(RESET_IBUF),
        .SEL(SEL));
  Counters L1
       (.ADV(ADV),
        .CE(CE),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .RESET_IBUF(RESET_IBUF),
        .SEL(SEL),
        .TC10_reg_0(L1_n_1),
        .TC2_reg_0(L1_n_0));
  Time_Base L2
       (.CE(CE),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .RESET_IBUF(RESET_IBUF));
  OBUF \LIGHT_OBUF[0]_inst 
       (.I(LIGHT_OBUF[0]),
        .O(LIGHT[0]));
  OBUF \LIGHT_OBUF[1]_inst 
       (.I(\LIGHT_OBUF[1]_repN_alias ),
        .O(LIGHT[1]));
  OBUF \LIGHT_OBUF[2]_inst 
       (.I(LIGHT_OBUF[2]),
        .O(LIGHT[2]));
  OBUF \LIGHT_OBUF[3]_inst 
       (.I(LIGHT_OBUF[3]),
        .O(LIGHT[3]));
  OBUF \LIGHT_OBUF[4]_inst 
       (.I(LIGHT_OBUF[4]),
        .O(LIGHT[4]));
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
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
