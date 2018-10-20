
//------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_in_wire_en_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


`ifdef mgc_in_wire_en_v1
`else
`define mgc_in_wire_en_v1
module mgc_in_wire_en_v1 (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output [width-1:0] d;
  output             lz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;

endmodule
`endif


//------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_in_wire_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


`ifdef mgc_in_wire_v1
`else
`define mgc_in_wire_v1
module mgc_in_wire_v1 (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] d;
  input  [width-1:0] z;

  wire   [width-1:0] d;

  assign d = z;

endmodule
`endif


//------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_out_stdreg_en_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


`ifdef mgc_out_stdreg_en_v1
`else
`define mgc_out_stdreg_en_v1
module mgc_out_stdreg_en_v1 (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  input  [width-1:0] d;
  output             lz;
  output [width-1:0] z;

  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;

endmodule
`endif



//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.0c/745553 Production Release
//  HLS Date:       Wed Oct 11 16:38:17 PDT 2017
// 
//  Generated by:   Fitkit@DESKTOP-NJUNEBJ
//  Generated date: Mon Oct 30 13:39:51 2017
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen
// ------------------------------------------------------------------


`ifdef Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen
`else
`define Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen
module Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen (
  we, d, q, adr, adr_d, d_d, we_d, q_d, ram_rw_A_internal_RMASK_B_d
);
  output we;
  output [31:0] d;
  input [31:0] q;
  output [8:0] adr;
  input [8:0] adr_d;
  input [31:0] d_d;
  input we_d;
  output [31:0] q_d;
  input ram_rw_A_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (we_d);
  assign d = (d_d);
  assign q_d = q;
  assign adr = (adr_d);
endmodule
`endif

// ------------------------------------------------------------------
//  Design Unit:    filter_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


`ifdef filter_core_core_fsm
`else
`define filter_core_core_fsm
module filter_core_core_fsm (
  clk, rst, fsm_output
);
  input clk;
  input rst;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;


  // FSM State Type Declaration for filter_core_core_fsm_1
  parameter
    core_rlp_C_0 = 2'd0,
    core_rlp_C_1 = 2'd1,
    main_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : filter_core_core_fsm_1
    case (state_var)
      core_rlp_C_1 : begin
        fsm_output = 4'b10;
        state_var_NS = main_C_0;
      end
      main_C_0 : begin
        fsm_output = 4'b100;
        state_var_NS = main_C_1;
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 4'b1;
        state_var_NS = core_rlp_C_1;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= core_rlp_C_0;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule
`endif

// ------------------------------------------------------------------
//  Design Unit:    filter_core
// ------------------------------------------------------------------


`ifdef filter_core
`else
`define filter_core
module filter_core (
  clk, rst, in_data_rsc_z, in_data_rsc_lz, in_data_vld_rsc_z, out_data_rsc_z, out_data_rsc_lz,
      mcu_data_rsci_adr_d, mcu_data_rsci_d_d, mcu_data_rsci_we_d, mcu_data_rsci_q_d,
      mcu_data_rsci_ram_rw_A_internal_RMASK_B_d
);
  input clk;
  input rst;
  input [2:0] in_data_rsc_z;
  output in_data_rsc_lz;
  input in_data_vld_rsc_z;
  output [2:0] out_data_rsc_z;
  output out_data_rsc_lz;
  output [8:0] mcu_data_rsci_adr_d;
  output [31:0] mcu_data_rsci_d_d;
  output mcu_data_rsci_we_d;
  input [31:0] mcu_data_rsci_q_d;
  output mcu_data_rsci_ram_rw_A_internal_RMASK_B_d;


  // Interconnect Declarations
  reg in_data_rsci_ld;
  wire [2:0] in_data_rsci_d;
  wire in_data_vld_rsci_d;
  reg out_data_rsci_ld;
  reg [2:0] out_data_rsci_d;
  wire [3:0] fsm_output;
  wire if_if_if_and_tmp;
  reg mcu_ready_sva;
  reg asn_itm;
  reg else_asn_itm_1;
  wire and_9_cse;
  wire and_13_cse;
  wire reg_out_data_out_data_and_cse;

  wire[0:0] or_8_nl;

  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire_en_v1 #(.rscid(32'sd1),
  .width(32'sd3)) in_data_rsci (
      .ld(in_data_rsci_ld),
      .d(in_data_rsci_d),
      .lz(in_data_rsc_lz),
      .z(in_data_rsc_z)
    );
  mgc_in_wire_v1 #(.rscid(32'sd2),
  .width(32'sd1)) in_data_vld_rsci (
      .d(in_data_vld_rsci_d),
      .z(in_data_vld_rsc_z)
    );
  mgc_out_stdreg_en_v1 #(.rscid(32'sd3),
  .width(32'sd3)) out_data_rsci (
      .ld(out_data_rsci_ld),
      .d(out_data_rsci_d),
      .lz(out_data_rsc_lz),
      .z(out_data_rsc_z)
    );
  filter_core_core_fsm filter_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output)
    );
  assign reg_out_data_out_data_and_cse = else_asn_itm_1 & asn_itm & (fsm_output[3]);
  assign if_if_if_and_tmp = (mcu_data_rsci_q_d==32'b00000000000000000000000000000001);
  assign and_9_cse = (~ mcu_ready_sva) & (fsm_output[3]);
  assign and_13_cse = (~ mcu_ready_sva) & if_if_if_and_tmp & (fsm_output[2]);
  assign or_8_nl = and_9_cse | (fsm_output[1]) | and_13_cse;
  assign mcu_data_rsci_adr_d = {5'b0 , (or_8_nl) , 3'b0};
  assign mcu_data_rsci_d_d = {30'b0 , and_13_cse , 1'b0};
  assign mcu_data_rsci_we_d = and_13_cse;
  assign mcu_data_rsci_ram_rw_A_internal_RMASK_B_d = and_9_cse | (fsm_output[1]);
  always @(posedge clk) begin
    if ( rst ) begin
      out_data_rsci_d <= 3'b0;
    end
    else if ( reg_out_data_out_data_and_cse ) begin
      out_data_rsci_d <= in_data_rsci_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      out_data_rsci_ld <= 1'b0;
      in_data_rsci_ld <= 1'b0;
    end
    else begin
      out_data_rsci_ld <= reg_out_data_out_data_and_cse;
      in_data_rsci_ld <= mcu_ready_sva & in_data_vld_rsci_d & (fsm_output[2]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      mcu_ready_sva <= 1'b0;
    end
    else if ( fsm_output[2] ) begin
      mcu_ready_sva <= if_if_if_and_tmp | mcu_ready_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      asn_itm <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      asn_itm <= mcu_ready_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      else_asn_itm_1 <= 1'b0;
    end
    else if ( mcu_ready_sva ) begin
      else_asn_itm_1 <= in_data_vld_rsci_d;
    end
  end
endmodule
`endif

// ------------------------------------------------------------------
//  Design Unit:    filter
// ------------------------------------------------------------------


`ifdef filter
`else
`define filter
module filter (
  clk, rst, in_data_rsc_z, in_data_rsc_lz, in_data_vld_rsc_z, out_data_rsc_z, out_data_rsc_lz,
      mcu_data_rsc_adr, mcu_data_rsc_q, mcu_data_rsc_d, mcu_data_rsc_we
);
  input clk;
  input rst;
  input [2:0] in_data_rsc_z;
  output in_data_rsc_lz;
  input in_data_vld_rsc_z;
  output [2:0] out_data_rsc_z;
  output out_data_rsc_lz;
  output [8:0] mcu_data_rsc_adr;
  input [31:0] mcu_data_rsc_q;
  output [31:0] mcu_data_rsc_d;
  output mcu_data_rsc_we;


  // Interconnect Declarations
  wire [8:0] mcu_data_rsci_adr_d;
  wire [31:0] mcu_data_rsci_d_d;
  wire mcu_data_rsci_we_d;
  wire [31:0] mcu_data_rsci_q_d;
  wire mcu_data_rsci_ram_rw_A_internal_RMASK_B_d;


  // Interconnect Declarations for Component Instantiations 
  Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen mcu_data_rsci (
      .we(mcu_data_rsc_we),
      .d(mcu_data_rsc_d),
      .q(mcu_data_rsc_q),
      .adr(mcu_data_rsc_adr),
      .adr_d(mcu_data_rsci_adr_d),
      .d_d(mcu_data_rsci_d_d),
      .we_d(mcu_data_rsci_we_d),
      .q_d(mcu_data_rsci_q_d),
      .ram_rw_A_internal_RMASK_B_d(mcu_data_rsci_ram_rw_A_internal_RMASK_B_d)
    );
  filter_core filter_core_inst (
      .clk(clk),
      .rst(rst),
      .in_data_rsc_z(in_data_rsc_z),
      .in_data_rsc_lz(in_data_rsc_lz),
      .in_data_vld_rsc_z(in_data_vld_rsc_z),
      .out_data_rsc_z(out_data_rsc_z),
      .out_data_rsc_lz(out_data_rsc_lz),
      .mcu_data_rsci_adr_d(mcu_data_rsci_adr_d),
      .mcu_data_rsci_d_d(mcu_data_rsci_d_d),
      .mcu_data_rsci_we_d(mcu_data_rsci_we_d),
      .mcu_data_rsci_q_d(mcu_data_rsci_q_d),
      .mcu_data_rsci_ram_rw_A_internal_RMASK_B_d(mcu_data_rsci_ram_rw_A_internal_RMASK_B_d)
    );
endmodule
`endif



