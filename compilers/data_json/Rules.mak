runtime/parrot/languages/data_json/data_json.pbc: compilers/data_json/data_json.pbc
	$(MKPATH) runtime/parrot/languages/data_json
	$(CP) compilers/data_json/data_json.pbc $@

runtime/parrot/languages/JSON/JSON.pir: compilers/data_json/JSON.nqp $(NQP_RX)
	$(MKPATH) runtime/parrot/languages/JSON
	$(NQP_RX) --target=pir compilers/data_json/JSON.nqp > $@

compilers/data_json/data_json.pbc : \
    $(LIBRARY_DIR)/PGE.pbc \
    $(LIBRARY_DIR)/PGE/Util.pbc \
    $(LIBRARY_DIR)/TGE.pbc \
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
	$(PARROT) compilers/tge/tgc.pbc --output=$@ compilers/data_json/data_json/pge2pir.tg
