# $Id$
# Convenient makefile for assembling files.

.SUFFIXES: .pbc .pasm

clean:
	rm -f *.pbc mops.c mops.o mops

.pasm.pbc:
	perl -I../.. ../../assemble.pl $< > $@
