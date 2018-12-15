#!/bin/bash


# constants
DIR="gprof" # output directory
GF="--flat-profile --brief" # gprof flags


# colors
NC="\033[0m" # No Color
RED_B="\033[1;31m" # Bold Red
RED_R="\033[0;31m" # Regular Red
GREEN_B="\033[1;32m" # Bold Red
GREEN_R="\033[0;32m" # Regular Red


# option check
if [ $# -ne 1 ]; then
  printf "Usage:\n\t./profile.sh <option>\nOptions:\n\t--separate\n\t--summarized\n"
  exit 1
fi


# option type check
if [ "$1" != "--separate" ] && [ "$1" != "--summarized" ]; then
  echo -e "${RED_B}ERROR${RED_R}: wrong option '${1}'${NC}"
  printf "Usage:\n\t./profile.sh <option>\nOptions:\n\t--separate\n\t--summarized\n"
  exit 1
fi


# clearing profiling directory
echo -e "${RED_B}CLEANING${RED_R}: directory '${DIR}'${NC}"
rm -rfv $DIR
rm -fv gmon.sum
mkdir -v $DIR


# clean build with '#define PROFILE' enabled
make clean
echo -e "${RED_B}ENABLED${RED_R}: '#define PROFILE' (uncommented)${NC}"
sed -i "s/\/\/\s*\(#define\ PROFILE\)/\1/" cpu.c
make


# profiling
for i in {1..10}
do
  echo -e "${GREEN_B}PROFILING${GREEN_R}: gprof #${i}${NC}"

  ./program > ${DIR}/program.${i}.out

  # check
  if [ -s ${DIR}/program.${i}.out ]; then
    echo -e "${RED_B}ERROR${RED_R}: ${DIR}/program.${i}.out is NOT empty${NC}"
    exit 1
  fi

  # profiling
  if [ "$1" == "--separate" ]; then # separate profiling

    gprof $GF program gmon.out > ${DIR}/gprof.${i}.out

  elif [ "$1" == "--summarized" ]; then # summarized profiling

    if [ $i -eq 1 ]; then
      cp gmon.out gmon.sum
    else
      gprof -s program gmon.out gmon.sum
    fi

    if [ $i -eq 10 ]; then
      gprof $GF program gmon.sum > ${DIR}/gprof.sum.out
    fi
  fi

  # discard output file
  rm -f ${DIR}/program.${i}.out
done


# clean build with '#define PROFILE' disabled
make clean
echo -e "${RED_B}DISABLED${RED_R}: '#define PROFILE' (commented)${NC}"
sed -i "s/\/\/\ \(#define\ PROFILE\)/\/\/\ \1/" cpu.c
make


# successful termination
exit 0
