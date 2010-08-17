$(LIBRARY_DIR)/PGE.pbc: $(PARROT) \
    compilers/pge/PGE.pir \
    compilers/pge/PGE/Exp.pir \
    compilers/pge/PGE/Match.pir \
    compilers/pge/PGE/Regex.pir \
    compilers/pge/PGE/Perl6Regex.pir \
    compilers/pge/PGE/OPTable.pir \
    compilers/pge/PGE/P5Regex.pir \
    compilers/pge/PGE/builtins.pg \
    $(LIBRARY_DIR)/PCT/HLLCompiler.pbc
	$(PERL) -e "" > compilers/pge/PGE/builtins_gen.pir
	$(PARROT) -o $@ compilers/pge/PGE.pir
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pir --output=compilers/pge/PGE/builtins_gen.pir compilers/pge/PGE/builtins.pg
	$(PARROT) -o $@ compilers/pge/PGE.pir

