O = .o

H_FILES = config.h exceptions.h io.h op.h register.h string.h events.h interpreter.h memory.h parrot.h stacks.h bytecode.h global_setup.h

O_FILES = global_setup$(O) interpreter$(O) parrot$(O) register$(O) basic_opcodes$(O) memory$(O) bytecode$(O) string$(O) strnative$(O)

C_FLAGS = -Wall -o $@


CC = gcc $(C_FLAGS)

all : $(O_FILES)

test_prog: test_main$(O) $(O_FILES)
	gcc -o test_prog $(O_FILES) test_main$(O)

test_main$(O): $(H_FILES)

global_setup$(O): $(H_FILES)

string$(O): $(H_FILES)

strnative$(O): $(H_FILES)

interp_guts.h: opcode_table
	perl build_interp_starter.pl

interpreter$(O): interpreter.c $(H_FILES) interp_guts.h

memory$(O): $(H_FILES)

bytecode$(O): $(H_FILES)

parrot$(O): $(H_FILES)

register$(O): $(H_FILES)

basic_opcodes$(O): $(H_FILES) basic_opcodes.c

basic_opcodes.c: basic_opcodes.ops
	perl process_opfunc.pl basic_opcodes.ops

op.h: opcode_table
	perl make_op_header.pl opcode_table > op.h

clean:
	rm -f *$(O) *.s basic_opcodes.c interp_guts.h op.h test_prog
