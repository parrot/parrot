PARROT = ../..
CFLAGS = -I $(PARROT)/include

p6ge.so: p6ge_parse.o p6ge_gen.o p6ge_parsep5.o
	$(CC) -shared -fpic p6ge_parse.o p6ge_gen.o p6ge_parsep5.o -o p6ge.so

p6ge_gen.o: p6ge_gen.c p6ge.h
p6ge_parse.o: p6ge_parse.c p6ge.h
p6ge_parsep5.o: p6ge_parsep5.c p6ge.h
