myperl=perl -I../../lib
compile=$(myperl) prd-perl6.pl --batch --imc
imcc=../imcc/imcc
asm=perl ../../assemble.pl

all: imcc

test:
	$(myperl) -MTest::Harness -e 'runtests(@ARGV)' t/*/*.t

imcc:
	cd ../imcc; $(MAKE)

%.pasm: %.imc
	$(imcc) $< $@

%.imc: %.p6
	$(compile) < $< > $@

%.pbc: %.pasm
	$(asm) $< > $@

clean:
	rm -f test-*.imc test-*.pasm test-*.p6 test-*.out test-*.pbc test-*.err
	rm -f a.err a.imc a.output a.pasm a.pbc
	rm -f core

distclean: clean
	rm -f Perl6grammar.pm

.PRECIOUS: %.imc %.pasm %.p6

.PHONY: all test clean distclean imcc
