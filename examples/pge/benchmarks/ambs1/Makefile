ambs1_gen.pir: ambs1.pg
	../../../../parrot ../../../../compilers/pge/pgc.pir ambs1.pg > ambs1_gen.pir

run: ambs1_gen.pir
	perl mktestcase > test
	cat test
	../../../../parrot main.pir < test
