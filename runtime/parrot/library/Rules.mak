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
	$(LIBRARY_DIR)/LLVM/Opaque.pir 		\
	$(LIBRARY_DIR)/LLVM/BasicBlock.pir 	\
	$(LIBRARY_DIR)/LLVM/Builder.pir 	\
	$(LIBRARY_DIR)/LLVM/Constant.pir 	\
	$(LIBRARY_DIR)/LLVM/Context.pir 	\
	$(LIBRARY_DIR)/LLVM/Function.pir 	\
	$(LIBRARY_DIR)/LLVM/Module.pir		\
	$(LIBRARY_DIR)/LLVM/PassManager.pir	\
	$(LIBRARY_DIR)/LLVM/Type.pir		\
	$(LIBRARY_DIR)/LLVM/Value.pir
	$(PARROT) -o $@ $(LIBRARY_DIR)/llvm_lib.pir

$(LIBRARY_DIR)/LLVM.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM.pm

$(LIBRARY_DIR)/LLVM/Opaque.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Opaque.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Opaque.pm

$(LIBRARY_DIR)/LLVM/BasicBlock.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/BasicBlock.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/BasicBlock.pm

$(LIBRARY_DIR)/LLVM/Builder.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Builder.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Builder.pm

$(LIBRARY_DIR)/LLVM/Constant.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Constant.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Constant.pm

$(LIBRARY_DIR)/LLVM/Context.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Context.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Context.pm

$(LIBRARY_DIR)/LLVM/Function.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Function.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Function.pm

$(LIBRARY_DIR)/LLVM/Module.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Module.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Module.pm

$(LIBRARY_DIR)/LLVM/PassManager.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/PassManager.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/PassManager.pm

$(LIBRARY_DIR)/LLVM/Type.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Type.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Type.pm

$(LIBRARY_DIR)/LLVM/Value.pir: $(NQP_RX) $(LIBRARY_DIR)/LLVM/Value.pm
	$(NQP_RX) --target=pir --output=$@ $(LIBRARY_DIR)/LLVM/Value.pm


