## XXX does not cover .includes of core .pasm files

$(LIBRARY_DIR)/PCT.pbc : $(PARROT) compilers/pct/PCT.pir \
    $(LIBRARY_DIR)/PCT/Grammar.pbc $(LIBRARY_DIR)/PCT/PAST.pbc
	$(PARROT) -o $@ compilers/pct/PCT.pir

$(LIBRARY_DIR)/PCT/PAST.pbc : compilers/pct/src/PAST.pir $(PARROT) $(PBC_MERGE) \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc \
    compilers/pct/src/PCT/Node.pbc \
    compilers/pct/src/PAST/Node.pbc \
    compilers/pct/src/PAST/Compiler.pbc \
    compilers/pct/src/POST/Node.pbc \
    compilers/pct/src/POST/Compiler.pbc
	$(PBC_MERGE) -o $@ \
	compilers/pct/src/PCT/Node.pbc \
	compilers/pct/src/PAST/Node.pbc \
	compilers/pct/src/PAST/Compiler.pbc \
	compilers/pct/src/POST/Node.pbc \
	compilers/pct/src/POST/Compiler.pbc

$(LIBRARY_DIR)/PCT/Grammar.pbc : compilers/pct/src/PCT/Grammar.pir $(PARROT) \
    $(LIBRARY_DIR)/PGE.pbc $(LIBRARY_DIR)/PGE/Util.pbc
	$(PARROT) -o $@ compilers/pct/src/PCT/Grammar.pir

$(LIBRARY_DIR)/PCT/HLLCompiler.pbc : compilers/pct/src/PCT/HLLCompiler.pir \
    $(PARROT) \
    $(LIBRARY_DIR)/PGE/Dumper.pbc \
    $(LIBRARY_DIR)/P6object.pbc \
    $(LIBRARY_DIR)/Parrot/Exception.pbc \
    $(LIBRARY_DIR)/config.pir \
    $(LIBRARY_DIR)/Getopt/Obj.pbc \
    $(LIBRARY_DIR)/dumper.pbc \
    $(LIBRARY_DIR)/PCT/Dumper.pbc
	$(PARROT) -o $@ compilers/pct/src/PCT/HLLCompiler.pir

$(LIBRARY_DIR)/PCT/Dumper.pbc : compilers/pct/src/PCT/Dumper.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/PCT/Dumper.pir

compilers/pct/src/PCT/Node.pbc : compilers/pct/src/PCT/Node.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/PCT/Node.pir

compilers/pct/src/PAST/Node.pbc : compilers/pct/src/PAST/Node.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/PAST/Node.pir

compilers/pct/src/PAST/Compiler.pbc : compilers/pct/src/PAST/Compiler.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/PAST/Compiler.pir

compilers/pct/src/POST/Compiler.pbc : compilers/pct/src/POST/Compiler.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/POST/Compiler.pir

compilers/pct/src/POST/Node.pbc : $(PARROT) \
		compilers/pct/src/POST/Node.pir \
		compilers/pct/src/POST/Call.pir
	$(PARROT) -o $@ \
		compilers/pct/src/POST/Node.pir \
		compilers/pct/src/POST/Call.pir

# It should be special "bootstrap-pct" target
bootstrap-pct:
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Call.pir compilers/pct/src/POST/Call.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Constant.pir compilers/pct/src/POST/Constant.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/File.pir compilers/pct/src/POST/File.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Key.pir compilers/pct/src/POST/Key.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Label.pir compilers/pct/src/POST/Label.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Register.pir compilers/pct/src/POST/Register.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/String.pir compilers/pct/src/POST/String.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Sub.pir compilers/pct/src/POST/Sub.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Value.pir compilers/pct/src/POST/Value.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/VanillaAllocator.pir compilers/pct/src/POST/VanillaAllocator.pm

