## XXX does not cover .includes of core .pasm files

$(LIBRARY_DIR)/PCT.pbc : $(PARROT) compilers/pct/PCT.pir \
    $(LIBRARY_DIR)/PCT/Grammar.pbc $(LIBRARY_DIR)/PCT/PAST.pbc
	$(PARROT) -o $@ compilers/pct/PCT.pir

$(LIBRARY_DIR)/PCT/PAST.pbc : compilers/pct/src/PAST.pir $(PARROT) $(PBC_MERGE) \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc \
    compilers/pct/src/PCT/Node.pbc \
    compilers/pct/src/PAST/Nodes.pbc \
    compilers/pct/src/PAST/Compiler.pbc \
    compilers/pct/src/PAST/NewCompiler.pbc \
    compilers/pct/src/POST/Nodes.pbc \
    compilers/pct/src/POST/Compiler.pbc \
    compilers/pct/src/POST/PBCCompiler.pbc \
    compilers/pct/src/POST/VanillaAllocator.pbc
	$(PBC_MERGE) -o $@ \
	compilers/pct/src/PCT/Node.pbc \
	compilers/pct/src/PAST/Nodes.pbc \
	compilers/pct/src/PAST/Compiler.pbc \
	compilers/pct/src/PAST/NewCompiler.pbc \
	compilers/pct/src/POST/Nodes.pbc \
	compilers/pct/src/POST/Compiler.pbc \
	compilers/pct/src/POST/PBCCompiler.pbc \
	compilers/pct/src/POST/VanillaAllocator.pbc

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

compilers/pct/src/PAST/Compiler.pbc : compilers/pct/src/PAST/Compiler.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/PAST/Compiler.pir

compilers/pct/src/PAST/NewCompiler.pbc : compilers/pct/src/PAST/NewCompiler.pir $(PARROT)
	$(PARROT) -o $@ compilers/pct/src/PAST/NewCompiler.pir

compilers/pct/src/POST/Compiler.pbc : $(PARROT) \
		compilers/pct/src/POST/Compiler.pir
	$(PARROT) -o $@ compilers/pct/src/POST/Compiler.pir

compilers/pct/src/POST/PBCCompiler.pbc : $(PARROT) \
		compilers/pct/src/POST/PBCCompiler.pir
	$(PARROT) -o $@ compilers/pct/src/POST/PBCCompiler.pir

compilers/pct/src/POST/VanillaAllocator.pbc : $(PARROT) \
		compilers/pct/src/POST/VanillaAllocator.pir
	$(PARROT) -o $@ compilers/pct/src/POST/VanillaAllocator.pir

compilers/pct/src/POST/Nodes.pbc : $(PARROT) \
		compilers/pct/src/POST/Nodes.pir \
		compilers/pct/src/POST/Node.pir \
		compilers/pct/src/POST/Call.pir \
		compilers/pct/src/POST/Constant.pir \
		compilers/pct/src/POST/File.pir \
		compilers/pct/src/POST/Key.pir \
		compilers/pct/src/POST/Label.pir \
		compilers/pct/src/POST/Op.pir \
		compilers/pct/src/POST/Ops.pir \
		compilers/pct/src/POST/Register.pir \
		compilers/pct/src/POST/String.pir \
		compilers/pct/src/POST/Sub.pir \
		compilers/pct/src/POST/Value.pir
	$(PARROT) -o $@ \
		compilers/pct/src/POST/Nodes.pir

compilers/pct/src/PAST/Nodes.pbc : $(PARROT) \
		compilers/pct/src/PAST/Nodes.pir \
		compilers/pct/src/PAST/Block.pir \
		compilers/pct/src/PAST/Control.pir \
		compilers/pct/src/PAST/Node.pir \
		compilers/pct/src/PAST/Op.pir \
		compilers/pct/src/PAST/Stmt.pir \
		compilers/pct/src/PAST/Stmts.pir \
		compilers/pct/src/PAST/Val.pir \
		compilers/pct/src/PAST/Var.pir \
		compilers/pct/src/PAST/VarList.pir
	$(PARROT) -o $@ \
		compilers/pct/src/PAST/Nodes.pir

# It should be special "bootstrap-pct" target
bootstrap-pct: $(NQP_RX)
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Compiler.pir compilers/pct/src/POST/Compiler.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/PBCCompiler.pir compilers/pct/src/POST/PBCCompiler.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/VanillaAllocator.pir compilers/pct/src/POST/VanillaAllocator.pm

	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Call.pir compilers/pct/src/POST/Call.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Constant.pir compilers/pct/src/POST/Constant.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/File.pir compilers/pct/src/POST/File.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Key.pir compilers/pct/src/POST/Key.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Label.pir compilers/pct/src/POST/Label.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Op.pir compilers/pct/src/POST/Op.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Ops.pir compilers/pct/src/POST/Ops.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Register.pir compilers/pct/src/POST/Register.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/String.pir compilers/pct/src/POST/String.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Sub.pir compilers/pct/src/POST/Sub.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/POST/Value.pir compilers/pct/src/POST/Value.pm

	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Compiler.pir compilers/pct/src/PAST/Compiler.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/NewCompiler.pir compilers/pct/src/PAST/NewCompiler.pm

	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Block.pir compilers/pct/src/PAST/Block.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Control.pir compilers/pct/src/PAST/Control.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Node.pir compilers/pct/src/PAST/Node.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Op.pir compilers/pct/src/PAST/Op.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Stmt.pir compilers/pct/src/PAST/Stmt.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Stmts.pir compilers/pct/src/PAST/Stmts.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Val.pir compilers/pct/src/PAST/Val.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/Var.pir compilers/pct/src/PAST/Var.pm
	$(NQP_RX) --target=pir -o compilers/pct/src/PAST/VarList.pir compilers/pct/src/PAST/VarList.pm
