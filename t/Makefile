# $Id$
# Convenient makefile for assembling files.

.SUFFIXES: .pbc .pasm

clean:
	rm -f *.pbc test1.c test1.o test1

.pasm.pbc:
	perl -I.. ../assemble.pl $< > $@
