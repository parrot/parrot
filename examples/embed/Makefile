# Copyright (C) 2009, Parrot Foundation.
## $Id$

# To build this example with an installed parrot:
#
# PATH=/parrot_install_directory/bin:$PATH
# make

# This assumes a posix environment with sh style shell.
# May need changes with other shells or other make tools.
# For MSVC use see nmake -f Makefile.msvc (may not be up-to-date)

CC = $(shell parrot_config cc)
CCFLAGS = $(shell parrot_config ccflags)
CCWARN = $(shell parrot_config ccwarn)
LD = $(shell parrot_config ld)
LD_OUT = $(shell parrot_config ld_out)
LINKFLAGS = $(shell parrot_config inst_libparrot_linkflags) $(shell parrot_config rpath_lib)
O = $(shell parrot_config o)
EXE = $(shell parrot_config exe)

VERSIONDIR = $(shell parrot_config versiondir)
INCLUDEDIR = $(shell parrot_config includedir)$(VERSIONDIR)
LIBDIR = $(shell parrot_config libdir)$(VERSIONDIR)
CONFIG = $(LIBDIR)/parrot_config

all: cotorra$(EXE)

#-----------------------------------------------------------------------

cotorra$(O): cotorra.c
	$(CC) $(CCFLAGS) $(CCWARN) -c -I $(INCLUDEDIR) cotorra.c

cotorra$(EXE): cotorra$(O)
	$(LD) $(LD_OUT)cotorra$(EXE) cotorra$(O) $(CONFIG)$(O) $(LINKFLAGS)

#-----------------------------------------------------------------------

clean:
	rm -f cotorra$(EXE) cotorra$(O)
