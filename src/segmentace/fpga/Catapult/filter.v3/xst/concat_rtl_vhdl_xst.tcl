# Environment variable settings
global env
set CATAPULT_HOME "C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home"
if { [file exists concat_rtl_vhdl_proj.xise] } {
   project open concat_rtl_vhdl_proj
} else {
   project new concat_rtl_vhdl_proj
   project set family SPARTAN3
   # project set package 3s50tq144
   project set speed -4
   lib_vhdl new work
   xfile add ../concat_rtl.vhdl -lib_vhdl work -include_global
   xfile add C:/Fitkit/apps/vga/segmentace/fpga/Catapult/filter.v3/xst/concat_rtl_vhdl_xst.ucf
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
