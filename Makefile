O = .o

H_FILES = config.h exceptions.h io.h op.h register.h string.h events.h interpreter.h memory.h parrot.h stacks.h bytecode.h global_setup.h

O_FILES = global_setup$(O) interpreter$(O) parrot$(O) register$(O) basic_opcodes$(O) memory$(O) bytecode$(O) string$(O) strnative$(O)

C_FLAGS = -Wall -g -o $@

LIBS = -lm

CC = gcc $(C_FLAGS)

all : $(O_FILES) test_prog

test_prog: test_main$(O) $(O_FILES)
	gcc -o test_prog $(O_FILES) test_main$(O) $(LIBS)

test_main$(O): $(H_FILES)

global_setup$(O): $(H_FILES)

string$(O): $(H_FILES)

strnative$(O): $(H_FILES)

interp_guts.h: opcode_table build_interp_starter.pl
	perl build_interp_starter.pl

interpreter$(O): interpreter.c $(H_FILES) interp_guts.h

memory$(O): $(H_FILES)

bytecode$(O): $(H_FILES)

parrot$(O): $(H_FILES)

register$(O): $(H_FILES)

basic_opcodes$(O): $(H_FILES) basic_opcodes.c

basic_opcodes.c: basic_opcodes.ops process_opfunc.pl interp_guts.h
	perl process_opfunc.pl basic_opcodes.ops

op.h: opcode_table make_op_header.pl
	perl make_op_header.pl opcode_table > op.h

config.h: Configure.pl config.h.in
	perl Configure.pl

clean:
	rm -f *$(O) *.s basic_opcodes.c interp_guts.h op.h test_prog config.h

test:
	perl assemble.pl t/test.pasm  > t/test.pbc
	./test_prog t/test.pbc > t/test.out
	perl assemble.pl t/test2.pasm > t/test2.pbc
	./test_prog t/test2.pbc > t/test2.out
	perl assemble.pl t/test3.pasm > t/test3.pbc
	./test_prog t/test3.pbc > t/test3.out
	perl assemble.pl t/euclid.pasm > t/euclid.pbc
	./test_prog t/euclid.pbc > t/euclid.out
