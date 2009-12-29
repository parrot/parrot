# these are private to the IMCC subsystem
IMCC_O_FILES := \
    $(IMCC_DIR)/imcparser$(O) \
    $(IMCC_DIR)/imclexer$(O) \
    $(IMCC_DIR)/imc$(O) \
    $(IMCC_DIR)/main$(O) \
    $(IMCC_DIR)/symreg$(O) \
    $(IMCC_DIR)/instructions$(O) \
    $(IMCC_DIR)/cfg$(O) \
    $(IMCC_DIR)/reg_alloc$(O) \
    $(IMCC_DIR)/sets$(O) \
    $(IMCC_DIR)/debug$(O) \
    $(IMCC_DIR)/optimizer$(O) \
    $(IMCC_DIR)/pbc$(O) \
    $(IMCC_DIR)/parser_util$(O) \
    $(IMCC_DIR)/pcc$(O)

$(IMCC_DIR)/pcc$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/imcparser.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/parser.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/instructions$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/pbc.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/pbc$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/pbc.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS) \
    $(PMC_INC_DIR)/pmc/pmc_sub.h

$(IMCC_DIR)/parser_util$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/imcparser.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/parser.h \
    $(IMCC_DIR)/pbc.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/dynext.h \
    $(INC_DIR)/embed.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS) \
    $(PMC_INC_DIR)/pmc/pmc_sub.h

$(IMCC_DIR)/imc$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/cfg$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/debug$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/imclexer$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/imcparser.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/parser.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/imcparser$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/imcparser.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/parser.h \
    $(IMCC_DIR)/pbc.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/dynext.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/main$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/imcparser.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/parser.h \
    $(IMCC_DIR)/pbc.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/embed.h \
    $(INC_DIR)/imcc.h \
    $(INC_DIR)/oplib/ops.h \
    $(INC_DIR)/runcore_api.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/optimizer$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/pbc.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/reg_alloc$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/optimizer.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/sets$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

$(IMCC_DIR)/symreg$(O) : \
    $(IMCC_DIR)/cfg.h \
    $(IMCC_DIR)/debug.h \
    $(IMCC_DIR)/imc.h \
    $(IMCC_DIR)/instructions.h \
    $(IMCC_DIR)/sets.h \
    $(IMCC_DIR)/symreg.h \
    $(IMCC_DIR)/unit.h \
    $(INC_DIR)/oplib/ops.h \
    $(PARROT_H_HEADERS)

# imcc file dependencies
#
# The .flag files are needed because we keep some derived files in SVN,
# which does not keep accurate timestamps on the files, relative to each other.
# Note that YACC or LEX may be null commands, so we must `touch` all the
# target files, instead of just the .flag files.

$(IMCC_DIR)/imcc.y.flag $(IMCC_DIR)/imcparser.c $(IMCC_DIR)/imcparser.h : $(IMCC_DIR)/imcc.y
	$(YACC) $(IMCC_DIR)/imcc.y -d -o $(IMCC_DIR)/imcparser.c
	$(PERL) $(BUILD_TOOLS_DIR)/fixup_gen_file.pl -noheaderizer $(IMCC_DIR)/imcparser.c $(IMCC_DIR)/imcc.y
	$(PERL) $(BUILD_TOOLS_DIR)/fixup_gen_file.pl -noheaderizer $(IMCC_DIR)/imcparser.h $(IMCC_DIR)/imcc.y
	$(TOUCH) $(IMCC_DIR)/imcc.y.flag $(IMCC_DIR)/imcparser.c $(IMCC_DIR)/imcparser.h

$(IMCC_DIR)/imcc.l.flag $(IMCC_DIR)/imclexer.c : $(IMCC_DIR)/imcc.l
	$(LEX) -o$(IMCC_DIR)/imclexer.c $(IMCC_DIR)/imcc.l
	$(TOUCH) $(IMCC_DIR)/imcc.l.flag $(IMCC_DIR)/imclexer.c

imcc-clean:
	$(RM_F) \
    $(IMCC_DIR)/core \
    "$(IMCC_DIR)/*$(O)" \
    $(IMCC_DIR)/imcparser.output
