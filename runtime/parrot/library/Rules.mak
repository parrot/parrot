# Track static dependencies 

# XXX only a partial mapping.

$(LIBRARY_DIR)/PGE/Hs.pbc : \
    $(LIBRARY_DIR)/PGE.pbc

$(LIBRARY_DIR)/PGE/Glob.pbc : \
    $(LIBRARY_DIR)/PGE.pbc \
    $(LIBRARY_DIR)/PGE/Dumper.pbc

$(LIBRARY_DIR)/PGE/Perl6Grammar.pbc : \
    $(LIBRARY_DIR)/PGE.pbc \
    $(LIBRARY_DIR)/PGE/Text.pbc \
    $(LIBRARY_DIR)/PGE/Util.pbc \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc

$(LIBRARY_DIR)/Tcl/Glob.pbc : \
    $(LIBRARY_DIR)/PGE.pbc \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc

$(LIBRARY_DIR)/P6Object.pbc : \
    $(LIBRARY_DIR)/dumper.pbc
