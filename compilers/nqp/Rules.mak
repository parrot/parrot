compilers/nqp/nqp.pbc : $(PARROT) $(NQP_SOURCES) \
    $(LIBRARY_DIR)/PCT.pbc \
    $(LIBRARY_DIR)/PGE.pbc

compilers/nqp/src/Grammar_gen.pir : $(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pir compilers/nqp/src/Grammar.pg $(LIBRARY_DIR)/PCT/HLLCompiler.pbc
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pir --output=$@ compilers/nqp/src/Grammar.pg

# Developer target to regnerate bootstrap. Unused?
nqp-boot: \
    compilers/nqp/bootstrap/nqp.pir \
    compilers/nqp/bootstrap/gen_actions.pir

compilers/nqp/bootstrap/gen_actions.pir : $(PARROT) \
    compilers/nqp/nqp.pbc \
    compilers/nqp/bootstrap/actions.pm
	$(PARROT) compilers/nqp/nqp.pbc --output=$@ --target=pir \
	    compilers/nqp/bootstrap/actions.pm

compilers/nqp/bootstrap/nqp.pbc : $(LIBRARY)/PCT.pbc
