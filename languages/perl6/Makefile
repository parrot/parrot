compile=perl -I../../lib prd-perl6.pl --batch --imc
imcc=../imcc/imcc
asm=perl ../../assemble.pl

all: imcc

test:
	for t in t/compiler/*.t; do perl -I../../lib $$t; done

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
