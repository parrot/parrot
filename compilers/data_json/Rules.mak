compilers/data_json/data_json.pbc : \
    runtime/parrot/library/PGE.pbc \
    runtime/parrot/library/PGE/Util.pbc \
    runtime/parrot/library/TGE.pbc \
    compilers/data_json/data_json/grammar.pir \
    compilers/data_json/data_json/pge2pir.pir

compilers/data_json/data_json/grammar.pir : $(PARROT) \
    compilers/data_json/data_json/grammar.pg \
    $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc --output=$@ compilers/data_json/data_json/grammar.pg

compilers/data_json/data_json/pge2pir.pir : $(PARROT) \
    compilers/data_json/data_json/pge2pir.tg \
    compilers/tge/tgc.pbc
	$(PARROT) compilers/tge/tgc.pbc --output=$@ compilers/data_json/pge2pir.tg
