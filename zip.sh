#!/bin/sh

# colors
NC="\033[0m" # No Color
GREEN_B="\033[1;32m" # Bold Green

# variables
DIR=projekt
SRC=src/segmentace
WD=$(pwd)



rm --force --recursive $DIR.zip $DIR

mkdir --verbose --parents $DIR/mcu $DIR/fpga/src_filter $DIR/build

echo

cp --verbose $SRC/mcu/main_sw.c   $DIR/mcu
cp --verbose $SRC/mcu/main_swhw.c $DIR/mcu

cp --verbose $SRC/fpga/src_filter/filter.h       $DIR/fpga/src_filter
cp --verbose $SRC/fpga/src_filter/filter.cpp     $DIR/fpga/src_filter
cp --verbose $SRC/fpga/src_filter/directives.tcl $DIR/fpga/src_filter

cp --verbose $SRC/build/med_filtr.bin $DIR/build

cp --verbose doc/doc.pdf $DIR/report.pdf

echo

tree --noreport $DIR

echo

echo "ZIP:"
cd $DIR && zip --recurse-paths --verbose $WD/$DIR.zip * && cd $WD

rm --force --recursive $DIR

echo

echo "${GREEN_B}Done${NC}"
exit 0
