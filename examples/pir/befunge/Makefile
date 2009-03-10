# Copyright (C) 2002-2009, Parrot Foundation.
#

# Setup of some commands
PARROT     = ../../../parrot
PERL       = /usr/bin/perl
RM_F       = $(PERL) -MExtUtils::Command -e rm_f

default: all

help :
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "  build:             Create befunge.pbc"
	@echo "                     This is the default."
	@echo ""
	@echo "  test:              run the test suite,"
	@echo ""
	@echo "  clean:             clean up temporary files"
	@echo ""
	@echo "  realclean:         clean up generated files"
	@echo ""
	@echo "  help:              print this help message"

all: build

build: befunge.pbc

befunge.pbc: befunge.pir debug.pir flow.pir io.pir load.pir maths.pir stack.pir
	$(PARROT) -o befunge.pbc befunge.pir

test: befunge.pbc
	$(PERL) t/harness

clean:
	$(RM_F) core \
    "*.pbc" \
    "*~"

# Local variables:
#   mode: makefile
# End:
# vim: ft=make:
