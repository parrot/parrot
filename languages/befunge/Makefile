ASSEMBLE=perl ../../assemble.pl
PARROT=../../parrot

test: build
	$(PARROT) befunge.pbc test.bef

build: befunge.pasm flow.pasm io.pasm load.pasm maths.pasm stack.pasm
	$(ASSEMBLE) befunge.pasm > befunge.pbc

clean:
	rm -f core *.pbc *~

dist: clean
	rm -f befunge.tgz
	( cd .. ; tar cvf befunge.tar Befunge-93 )
	gzip ../befunge.tar
	mv ../befunge.tar.gz befunge.tgz
