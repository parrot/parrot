PERL=perl

all :
	$(PERL) "-MFile::Copy=cp" -e "cp q|parrot.pasm|, q|pc.pasm|"
	$(PERL) gentable.pl pc.pasm
	$(PERL) ../../assemble.pl pc.pasm > pc.pbc

clean :
	rm -f core
	rm -f pc.pasm
	rm -f pc.pbc
