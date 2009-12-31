DATA_JSON_LIB_PBCS = compilers/data_json/data_json.pbc

compilers/data_json/data_json.pbc : $(PARROT) \
    compilers/data_json/data_json/grammar.pbc \
    compilers/data_json/data_json/pge2pir.pbc \
    compilers/data_json/data_json.pir

compilers/data_json/data_json/grammar.pir : compilers/data_json/data_json/grammar.pg $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc $(LIBRARY_DIR)/PCT/HLLCompiler.pbc
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc --output=$@ compilers/data_json/data_json/grammar.pg

compilers/data_json/data_json/pge2pir.pir : compilers/data_json/data_json/pge2pir.tg $(PARROT) compilers/tge/tgc.pbc
	$(PARROT) compilers/tge/tgc.pbc --output=$@ compilers/data_json/pge2pir.tg
