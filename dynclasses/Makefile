#
# sample Makefile
#

all: foo_pmc.so subproxy_pmc.so

.SUFFIXES: .pmc .c .so
# preserve .c if needed
#.PRECIOUS: foo.c subproxy.c

%.c  : %.pmc
	cd .. ; perl classes/pmc2c.pl dynclasses/$<

%_pmc.so : %.c
	cc -shared -g -o $@  \
	-I../include -I../classes -L../blib/lib -lparrot $<

clean :
	rm -f *.c *.h *.so

realclean: clean

distclean: clean

cvsclean: clean
