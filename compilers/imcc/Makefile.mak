# these are private to the IMCC subsystem
IMCC_O_FILES := \
    compilers/imcc/imcparser$(O) \
    compilers/imcc/imclexer$(O) \
    compilers/imcc/imc$(O) \
    compilers/imcc/main$(O) \
    compilers/imcc/symreg$(O) \
    compilers/imcc/instructions$(O) \
    compilers/imcc/cfg$(O) \
    compilers/imcc/reg_alloc$(O) \
    compilers/imcc/sets$(O) \
    compilers/imcc/debug$(O) \
    compilers/imcc/optimizer$(O) \
    compilers/imcc/pbc$(O) \
    compilers/imcc/parser_util$(O) \
    compilers/imcc/pcc$(O)

compilers/imcc/pcc$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/imcparser.h \
    compilers/imcc/instructions.h \
    compilers/imcc/parser.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/instructions$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/pbc.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/pbc$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/pbc.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS) \
    $(PMC_INC_DIR)/pmc/pmc_sub.h

compilers/imcc/parser_util$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/imcparser.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/parser.h \
    compilers/imcc/pbc.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/dynext.h \
    $(INC_DIR)/embed.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS) \
    $(PMC_INC_DIR)/pmc/pmc_sub.h

compilers/imcc/imc$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/cfg$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/debug$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/imclexer$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/imcparser.h \
    compilers/imcc/instructions.h \
    compilers/imcc/parser.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/imcparser$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/imcparser.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/parser.h \
    compilers/imcc/pbc.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/dynext.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/main$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/imcparser.h \
    compilers/imcc/instructions.h \
    compilers/imcc/parser.h \
    compilers/imcc/pbc.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/embed.h \
    $(INC_DIR)/imcc.h \
    $(INC_DIR)/oplib/ops.h \
    $(INC_DIR)/runcore_api.h \
    $(PARROT_H_HEADERS)

compilers/imcc/optimizer$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/pbc.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/reg_alloc$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/optimizer.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/sets$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

compilers/imcc/symreg$(O) : \
    compilers/imcc/cfg.h \
    compilers/imcc/debug.h \
    compilers/imcc/imc.h \
    compilers/imcc/instructions.h \
    compilers/imcc/sets.h \
    compilers/imcc/symreg.h \
    compilers/imcc/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

# imcc file dependencies
#
# The .flag files are needed because we keep some derived files in SVN,
# which does not keep accurate timestamps on the files, relative to each other.
# Note that YACC or LEX may be null commands, so we must `touch` all the
# target files, instead of just the .flag files.

compilers/imcc/imcc.y.flag compilers/imcc/imcparser.c compilers/imcc/imcparser.h : compilers/imcc/imcc.y
	$(YACC) compilers/imcc/imcc.y -d -o compilers/imcc/imcparser.c
	$(PERL) $(BUILD_TOOLS_DIR)/fixup_gen_file.pl -noheaderizer compilers/imcc/imcparser.c compilers/imcc/imcc.y
	$(PERL) $(BUILD_TOOLS_DIR)/fixup_gen_file.pl -noheaderizer compilers/imcc/imcparser.h compilers/imcc/imcc.y
	$(TOUCH) compilers/imcc/imcc.y.flag compilers/imcc/imcparser.c compilers/imcc/imcparser.h

compilers/imcc/imcc.l.flag compilers/imcc/imclexer.c : compilers/imcc/imcc.l
	$(LEX) -ocompilers/imcc/imclexer.c compilers/imcc/imcc.l
	$(TOUCH) compilers/imcc/imcc.l.flag compilers/imcc/imclexer.c

imcc-clean:
	$(RM_F) \
    compilers/imcc/core \
    "compilers/imcc/*$(O)" \
    compilers/imcc/imcparser.output
