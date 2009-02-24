# Copyright (C) 2009, Parrot Foundation.
## $Id$

# To build this example in a parrot development environment:

# PATH=/parrot_directory:$PATH
# export LD_RUN_PATH=/parrot_directory/blib/lib
# make

# This assumes a posix environment with sh style shell,
# may need changes with other shells or other make tools.

CC = `parrot_config cc`
CCFLAGS = `parrot_config ccflags`
LD = `parrot_config ld`
LD_OUT = `parrot_config ld_out`
LDFLAGS = `parrot_config libparrot_ldflags`
O = `parrot_config o`
EXE = `parrot_config exe`
INCLUDEDIR = `parrot_config prefix`/include

all: lorito

#-----------------------------------------------------------------------

lorito$(O): lorito.c
	$(CC) $(CCFLAGS) -c -I $(INCLUDEDIR) lorito.c

lorito$(EXE): lorito$(O)
	$(LD) $(LD_OUT)lorito$(EXE) lorito$(O) $(LDFLAGS)

#-----------------------------------------------------------------------

clean:
	rm -f lorito$(EXE) lorito$(O)
