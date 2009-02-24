# Copyright (C) 2009, Parrot Foundation.
## $Id$

# To build this example in a parrot development environment:

# PATH=$PATH:/parrot_directory
# export LD_RUN_PATH=/parrot_directory/blib/lib
# make

CC = `parrot_config cc`
CCFLAGS = `parrot_config ccflags`
LD = `parrot_config ld`
LDFLAGS = `parrot_config libparrot_ldflags`

all: lorito

#-----------------------------------------------------------------------

lorito.o: lorito.c
	$(CC) $(CCFLAGS) -c -I ~/parrot/include lorito.c

lorito: lorito.o
	$(LD) -o lorito lorito.o $(LDFLAGS)

#-----------------------------------------------------------------------

clean:
	rm -f lorito lorito.o
