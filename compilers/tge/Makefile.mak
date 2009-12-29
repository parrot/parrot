
TGE_LIB_PBCS := $(LIBRARY_DIR)/TGE.pbc

$(LIBRARY_DIR)/TGE.pbc:  \
    compilers/tge/TGE.pir \
    compilers/tge/TGE/Rule.pir \
    compilers/tge/TGE/Parser.pir \
    compilers/tge/TGE/Grammar.pir \
    compilers/tge/TGE/Compiler.pir \
    compilers/tge/TGE/Tree.pir
	$(PARROT) -o $@ compilers/tge/TGE.pir

compilers/tge/TGE/Parser.pir: $(PARROT) \
    compilers/tge/TGE/Parser.pg \
    $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc --output=$@ compilers/tge/TGE/Parser.pg
