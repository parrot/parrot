PERL=perl

all :
	$(PERL) "-MFile::Copy=cp" -e "cp q|parrot.pasm|, q|pc.pasm|"
	$(PERL) gentable.pl pc.pasm
	$(PERL) ../../assemble.pl -o pc.pbc pc.pasm

clean :
	rm -f core
	rm -f pc.pasm
	rm -f pc.pbc
