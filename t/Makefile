# $Id$
# Convenient makefile for assembling files.

.SUFFIXES: .pbc .pasm

.pasm.pbc:
	perl -I.. ../assemble.pl $< > $@
