#
# sample Makefile to create foo_pmc.so
#

all: foo_pmc.so

foo.c  : foo.pmc
	cd .. ; perl classes/pmc2c.pl dynclasses/foo.pmc

foo_pmc.so : foo.c
	cc -shared -g -o foo_pmc.so \
	-I../include -I../classes -L../blib/lib -lparrot foo.c

clean :
	rm -f foo.c foo.h foo_pmc.so

realclean: clean

distclean: clean

cvsclean: clean
