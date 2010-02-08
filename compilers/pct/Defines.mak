PCT_LIB_PBCS = \
    $(LIBRARY_DIR)/PCT.pbc \
    $(LIBRARY_DIR)/PCT/PAST.pbc \
    $(LIBRARY_DIR)/PCT/Grammar.pbc \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc \
    $(LIBRARY_DIR)/PCT/Dumper.pbc 

PCT_CLEANUPS = $(PCT_LIB_PBCS) \
	compilers/pct/src/PCT/Node.pbc \
	compilers/pct/src/PAST/Node.pbc \
	compilers/pct/src/PAST/Compiler.pbc \
	compilers/pct/src/POST/Node.pbc \
	compilers/pct/src/POST/Compiler.pbc

