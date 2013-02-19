$(LIBRARY_DIR)/TGE.pbc:  \
    $(LIBRARY_DIR)/PGE.pbc \
    $(LIBRARY_DIR)/PGE/Util.pbc \
    $(LIBRARY_DIR)/P6object.pbc \
    compilers/tge/TGE.pir \
    compilers/tge/TGE/Rule.pir \
    compilers/tge/TGE/Parser.pir \
    compilers/tge/TGE/Grammar.pir \
    compilers/tge/TGE/Compiler.pir \
    compilers/tge/TGE/Tree.pir
	$(PARROT) -o $@ compilers/tge/TGE.pir
	$(ADDGENERATED) "$@" "[main]"

compilers/tge/tgc.pbc : compilers/tge/tgc.pir $(LIBRARY_DIR)/TGE.pbc $(LIBRARY_DIR)/Getopt/Obj.pbc
	$(PARROT) -o $@ compilers/tge/tgc.pir
	$(ADDGENERATED) "$@" "[main]"

compilers/tge/TGE/Parser.pir: $(PARROT) \
    compilers/tge/TGE/Parser.pg \
    $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc 
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pbc --output=$@ compilers/tge/TGE/Parser.pg
	$(ADDGENERATED) "$@" "[tge]"

# Local variables:
#   mode: makefile
# End:
# vim: ft=make:
