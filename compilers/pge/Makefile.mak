# the default target

PGE_LIB_PBCS := $(LIBRARY_DIR)/PGE.pbc

## Two-stage build that reuses builtins_gen.pir

$(LIBRARY_DIR)/PGE.pbc: $(PARROT) \
    $(LIBRARY_DIR)/PGE/Perl6Grammar.pir \
    compilers/pge/PGE.pir \
    compilers/pge/PGE/Exp.pir \
    compilers/pge/PGE/Match.pir \
    compilers/pge/PGE/Regex.pir \
    compilers/pge/PGE/Perl6Regex.pir \
    compilers/pge/PGE/OPTable.pir \
    compilers/pge/PGE/P5Regex.pir \
    compilers/pge/PGE/builtins.pg
	$(PERL) -e "" > compilers/pge/PGE/builtins_gen.pir
	$(PARROT) -o $@ compilers/pge/PGE.pir
	$(PARROT) $(LIBRARY_DIR)/PGE/Perl6Grammar.pir --output=compilers/pge/PGE/builtins_gen.pir compilers/pge/PGE/builtins.pg
	$(PARROT) -o $@ compilers/pge/PGE.pir
