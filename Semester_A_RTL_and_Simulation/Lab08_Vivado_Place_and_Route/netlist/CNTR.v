//
// Verilog description for cell CNTR, 
// 01/02/17 19:26:39
//
// Precision RTL Synthesis, 64-bit 2015.1.6//


module CNTR ( CLK, RESET, Q, TC ) ;

    input CLK ;
    input RESET ;
    output [3:0]Q ;
    output TC ;

    wire [3:0]Q_1_0;
    wire CLK_int;
    wire RESET_int, \inc_d(0)  , nx37142z1, nx52268z1, nx53265z1, nx54262z1, nx4
         ;



    OBUF TC_obuf (.O (TC), .I (nx37142z1)) ;
    OBUF \Q_obuf(0)  (.O (Q[0]), .I (Q_1_0[0])) ;
    OBUF \Q_obuf(1)  (.O (Q[1]), .I (Q_1_0[1])) ;
    OBUF \Q_obuf(2)  (.O (Q[2]), .I (Q_1_0[2])) ;
    OBUF \Q_obuf(3)  (.O (Q[3]), .I (Q_1_0[3])) ;
    IBUF RESET_ibuf (.O (RESET_int), .I (RESET)) ;
    INV ix51271z1315 (.O (\inc_d(0)  ), .I (Q_1_0[0])) ;
    LUT4 ix37142z34082 (.O (nx37142z1), .I0 (Q_1_0[3]), .I1 (Q_1_0[2]), .I2 (
         Q_1_0[1]), .I3 (Q_1_0[0])) ;
         defparam ix37142z34082.INIT = 16'h8000;
    LUT2 ix52268z1320 (.O (nx52268z1), .I0 (Q_1_0[1]), .I1 (Q_1_0[0])) ;
         defparam ix52268z1320.INIT = 4'h6;
    (* HLUTNM = "LUT62_1_1" *)
    LUT3 ix53265z1420 (.O (nx53265z1), .I0 (Q_1_0[2]), .I1 (Q_1_0[1]), .I2 (
         Q_1_0[0])) ;
         defparam ix53265z1420.INIT = 8'h6A;
    (* HLUTNM = "LUT62_1_1" *)
    LUT4 ix54262z28620 (.O (nx54262z1), .I0 (Q_1_0[3]), .I1 (Q_1_0[2]), .I2 (
         Q_1_0[1]), .I3 (Q_1_0[0])) ;
         defparam ix54262z28620.INIT = 16'h6AAA;
    BUFGP CLK_ibuf (.O (CLK_int), .I (CLK)) ;
    VCC \reg_q(3)_I22_FD_PWR  (.P (nx4)) ;
    FDRE \reg_q(3)  (.Q (Q_1_0[3]), .C (CLK_int), .CE (nx4), .D (nx54262z1), .R (
         RESET_int)) ;
    FDRE \reg_q(2)  (.Q (Q_1_0[2]), .C (CLK_int), .CE (nx4), .D (nx53265z1), .R (
         RESET_int)) ;
    FDRE \reg_q(1)  (.Q (Q_1_0[1]), .C (CLK_int), .CE (nx4), .D (nx52268z1), .R (
         RESET_int)) ;
    FDRE \reg_q(0)  (.Q (Q_1_0[0]), .C (CLK_int), .CE (nx4), .D (\inc_d(0)  ), .R (
         RESET_int)) ;
endmodule

