#!/bin/sh

DIR=projekt
SRC=src/segmentace

rm --force --recursive $DIR.zip $DIR

mkdir --verbose --parents $DIR/mcu $DIR/fpga/src_filter $DIR/build

echo

cp --verbose $SRC/mcu/main_sw.c   $DIR/mcu
cp --verbose $SRC/mcu/main_swhw.c $DIR/mcu

cp --verbose $SRC/fpga/src_filter/filter.cpp     $DIR/fpga/src_filter
cp --verbose $SRC/fpga/src_filter/directives.tcl $DIR/fpga/src_filter

cp --verbose $SRC/build/med_filtr.bin $DIR/build

cp --verbose doc/doc.pdf $DIR/report.pdf

echo

tree --noreport $DIR

echo

echo "ZIP:"
zip --recurse-paths --verbose $DIR.zip $DIR

rm --force --recursive $DIR
