# $Id$
# Convenient makefile for assembling files.

PERL=perl    # Usually overidden by main Makefile

.SUFFIXES: .pbc .pasm

clean:
	rm -f *.pbc mops.c mops.o mops

.pasm.pbc:
	../../parrot -o $@ $<
