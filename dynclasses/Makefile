#
# sample Makefile
#

all: foo.so subproxy.so

.SUFFIXES: .pmc .c .so
# preserve .c if needed
#.PRECIOUS: foo.c subproxy.c

%.c  : %.pmc
	perl ../classes/pmc2c.pl $<

%.so : %.c
	$(CC) -shared -g -o $@  \
	-I../include -I../classes -L../blib/lib -lparrot $<
	cp $@ ../runtime/parrot/dynext/$@

clean :
	rm -f *.c *.h *.so

realclean: clean

distclean: clean

cvsclean: clean
