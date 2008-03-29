PARROT=../../../../parrot
PGC=../../../../runtime/parrot/library/PGE/Perl6Grammar.pbc
RM=rm -f

ambs1_gen.pir: ambs1.pg
	$(PARROT) $(PGC) ambs1.pg > ambs1_gen.pir || $(RM) ambs1_gen.pir

run: ambs1_gen.pir
	perl mktestcase > test
	cat test
	$(PARROT) main.pir < test
