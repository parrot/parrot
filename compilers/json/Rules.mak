compilers/json/JSON.pbc : \
    $(LIBRARY_DIR)/PGE.pbc \
    $(LIBRARY_DIR)/PGE/Util.pbc \
    $(LIBRARY_DIR)/TGE.pbc \
    compilers/json/JSON/grammar.pbc \
    compilers/json/JSON/pge2pir.pbc \
    compilers/json/JSON.pir
	$(PARROT) -o $@ compilers/json/JSON.pir

compilers/json/JSON/grammar.pir : compilers/json/JSON/grammar.pg \
    $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc --output=$@ compilers/json/JSON/grammar.pg

compilers/json/JSON/pge2pir.pir : compilers/json/JSON/pge2pir.tg \
    $(LIBRARY_DIR)/TGE.pbc
	$(PARROT) compilers/tge/tgc.pir --output=$@ compilers/json/JSON/pge2pir.tg
