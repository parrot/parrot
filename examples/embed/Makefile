# Copyright (C) 2009, Parrot Foundation.
## $Id$

# To build this example in a parrot development environment:

# PATH=/parrot_directory:$PATH
# export LD_RUN_PATH=/parrot_directory/blib/lib
# make

# This assumes a posix environment with sh style shell.
# May need changes with other shells or other make tools.
# For MSVC use nmake -f Makefile.msvc

CC = $(shell parrot_config cc)
CCFLAGS = $(shell parrot_config ccflags)
LD = $(shell parrot_config ld)
LD_OUT = $(shell parrot_config ld_out)
LDFLAGS = $(shell parrot_config libparrot_ldflags)
O = $(shell parrot_config o)
EXE = $(shell parrot_config exe)
INCLUDEDIR = $(shell parrot_config prefix)/include

all: lorito$(EXE)

#-----------------------------------------------------------------------

lorito$(O): lorito.c
	$(CC) $(CCFLAGS) -c -I $(INCLUDEDIR) lorito.c

lorito$(EXE): lorito$(O)
	$(LD) $(LD_OUT)lorito$(EXE) lorito$(O) $(LDFLAGS)

#-----------------------------------------------------------------------

clean:
	rm -f lorito$(EXE) lorito$(O)
