myperl=perl -I../../lib
compile=$(myperl) prd-perl6.pl --batch --imc
imcc=../imcc/imcc
asm=perl ../../assemble.pl

all: imcc

test:
	$(myperl) -MTest::Harness -e 'runtests(@ARGV)' t/compiler/*.t

imcc:
	cd ../imcc; $(MAKE)

%.pasm: %.imc
	$(imcc) $< $@

%.imc: %.p6
	$(compile) < $< > $@

%.pbc: %.pasm
	$(asm) $< > $@

.PRECIOUS: %.imc %.pasm

.PHONY: all test
