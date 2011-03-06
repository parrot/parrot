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

$(LIBRARY_DIR)/LLVM.pbc : \
	$(LIBRARY_DIR)/llvm_lib.pir			\
	$(LIBRARY_DIR)/LLVM.pir				\
	$(LIBRARY_DIR)/LLVM/Module.pir
	$(PARROT) -o $@ $(LIBRARY_DIR)/llvm_lib.pir

$(LIBRARY_DIR)/LLVM.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM.pm

$(LIBRARY_DIR)/LLVM/Module.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Module.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Module.pm


