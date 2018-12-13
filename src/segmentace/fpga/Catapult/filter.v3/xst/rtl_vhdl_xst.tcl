# Environment variable settings
global env
set CATAPULT_HOME "C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home"
if { [file exists rtl_vhdl_proj.xise] } {
   project open rtl_vhdl_proj
} else {
   project new rtl_vhdl_proj
   project set family SPARTAN3
   # project set package 3s50tq144
   project set speed -4
   lib_vhdl new mgc_hls
   lib_vhdl new mgc_ioport
   lib_vhdl new work
   lib_vhdl new Xilinx_RAMS
   xfile add $CATAPULT_HOME/pkgs/hls_pkgs/src/funcs.vhd -lib_vhdl mgc_hls -include_global
   xfile add $CATAPULT_HOME/pkgs/siflibs/mgc_ioport_comps_v11.vhd -lib_vhdl mgc_hls -include_global
   xfile add $CATAPULT_HOME/pkgs/siflibs/mgc_in_wire_en_v1.vhd -lib_vhdl mgc_hls -include_global
   xfile add $CATAPULT_HOME/pkgs/siflibs/mgc_in_wire_v1.vhd -lib_vhdl mgc_hls -include_global
   xfile add $CATAPULT_HOME/pkgs/siflibs/mgc_out_stdreg_en_v1.vhd -lib_vhdl mgc_hls -include_global
   xfile add $CATAPULT_HOME/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW.vhd -lib_vhdl work -include_global
   xfile add ../rtl.vhdl -lib_vhdl work -include_global
   xfile add C:/Fitkit/apps/vga/segmentace/fpga/Catapult/filter.v3/xst/rtl_vhdl_xst.ucf
   project set top filter
}
if { $argv == {shell} } {
   project clean
   if { $env(Xilinx_BITGEN) } {
      process run "Generate Programming File" -force rerun_all
   } else {
      process run "Implement Design" -force rerun_all
   }
}
project close
