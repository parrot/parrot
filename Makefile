H_FILES = config.h exceptions.h io.h op.h register.h string.h events.h interpreter.h memory.h parrot.h stacks.h bytecode.h

O_FILES = global_setup.o interpreter.o parrot.o register.o basic_opcodes.o memory.o bytecode.o string.o strnative.o

C_FLAGS = -Wall

CC = gcc $(C_FLAGS)

all : $(O_FILES)

test_prog: test_main.o $(O_FILES)
	gcc -o test_prog $(O_FILES) test_main.o

driver.o: $(H_FILES)

global_setup.o: $(H_FILES)

string.o: $(H_FILES)

strnative.o: $(H_FILES)

interpreter.o: $(H_FILES)

memory.o: $(H_FILES)

bytecode.o: $(H_FILES)

parrot.o: $(H_FILES)

register.o: $(H_FILES)

basic_opcodes.o: $(H_FILES)
