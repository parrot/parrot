PERL=perl

all :
	$(PERL) "-MFile::Copy=cp" -e 'cp q|parrot.pasm|, q|pc.pasm|'
	$(PERL) gentable.pl pc.pasm
	$(PERL) ../../assemble.pl pc.pasm > pc.pbc

clean :
	rm -f core
	rm -f *.o *.imc
	rm -f parser.h parser.output
	rm -f lexer.c parser.c
	rm -f x
