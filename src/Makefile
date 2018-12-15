BASE = ../../../
FCMAKE = C:/Program Files/FITkit/bin/fcmake.exe
FKFLASH = C:/Program Files/FITkit/bin/fkflash.exe
FKTERM = C:/Program Files/FITkit/bin/fkterm.exe
FKTEST = C:/Program Files/FITkit/bin/fktest.exe
PROJECT = project.xml
OUTPUTPREFIX = med_filtr
FPGACHIP = xc3s50
FPGASPEEDGRADE = 4
FPGAPACKAGE = pq208

all: dependencycheck build/med_filtr_f1xx.hex build/med_filtr_f2xx.hex build/med_filtr.bin

#MCU part
#=====================================================================
HEXFILE_F1XX = build/med_filtr_f1xx.hex
HEXFILE_F2XX = build/med_filtr_f2xx.hex

build/mcu/main_swhw_f1xx.o: mcu/main_swhw.c
	$(comp_tpl_f1xx)

build/mcu/main_swhw_f2xx.o: mcu/main_swhw.c
	$(comp_tpl_f2xx)

OBJFILES_F1XX = build/mcu/main_swhw_f1xx.o
OBJFILES_F2XX = build/mcu/main_swhw_f2xx.o

#FPGA part
#=====================================================================
BINFILE = build/med_filtr.bin
HDLFILES  = ../../../fpga/units/clkgen/clkgen_config.vhd
HDLFILES += ../../../fpga/units/clkgen/clkgen.vhd
HDLFILES += ../../../fpga/units/math/math_pack.vhd
HDLFILES += ../../../fpga/ctrls/spi/spi_adc_entity.vhd
HDLFILES += ../../../fpga/ctrls/spi/spi_adc.vhd
HDLFILES += ../../../fpga/ctrls/spi/spi_adc_autoincr.vhd
HDLFILES += ../../../fpga/ctrls/spi/spi_reg.vhd
HDLFILES += ../../../fpga/ctrls/spi/spi_ctrl.vhd
HDLFILES += ../../../fpga/chips/fpga_xc3s50.vhd
HDLFILES += ../../../fpga/chips/architecture_pc/arch_pc_ifc.vhd
HDLFILES += ../../../fpga/chips/architecture_pc/tlv_pc_ifc.vhd
HDLFILES += ../../../fpga/ctrls/vga/vga_config.vhd
HDLFILES += ../../../fpga/ctrls/vga/vga_ctrl.vhd
HDLFILES += fpga/src_genpix/concat_rtl.v
HDLFILES += fpga/src_video/concat_rtl.v
HDLFILES += fpga/src_filter/concat_rtl.v
HDLFILES += fpga/top_level.vhd

build/med_filtr.bin: build/fpga/med_filtr.par.ncd build/fpga/med_filtr.pcf

PKGS_LIST = ../../../fpga/units/clkgen/package.xml
PKGS_LIST += ../../../fpga/units/math/package.xml
PKGS_LIST += ../../../fpga/ctrls/spi/package.xml
PKGS_LIST += ../../../fpga/chips/architecture_pc/package.xml
PKGS_LIST += ../../../fpga/ctrls/vga/package.xml

include $(BASE)/base/Makefile.inc
