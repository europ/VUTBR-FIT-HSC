# Makefile pro preklad programu
#
# Autor: Jan Korenek <korenek@fit.vutbr.cz>
# Datum: 4.11.2007


program: program.c cpu.c cpu.h common.h
	gcc -pg -Wall --pedantic -o program program.c cpu.c


clean:
	@rm -rfv program gmon.out
