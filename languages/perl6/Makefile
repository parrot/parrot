compile=perl prd-perl6.pl --batch --imc
imcc=../imcc/imcc
asm=perl ../../assemble.pl

all:

test:
	perl t/*/*.t

%.pasm: %.imc
	$(imcc) $< $@

%.imc: %.p6
	$(compile) < $< > $@

%.pbc: %.pasm
	$(asm) $< > $@

.PRECIOUS: %.imc %.pasm

.PHONY: all test
