# $Id$
# Convenient makefile for assembling files.

.SUFFIXES: .pbc .pasm

clean:
	rm *.pbc

.pasm.pbc:
	perl -I.. ../assemble.pl $< > $@
