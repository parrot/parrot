compilers/pirc/src/piremit$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/src/piremit.c \
        compilers/pirc/src/piremit.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pircompiler.h \
        compilers/pirc/src/pirerr.h \
        compilers/pirc/src/bcgen.h \
        compilers/pirc/src/pirdefines.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/piryy.h \
        $(INC_DIR)/embed.h \
        $(INC_DIR)/oplib/ops.h

compilers/pirc/src/pirparser$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/src/pirparser.c \
        compilers/pirc/src/pircompiler.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pirdefines.h \
        compilers/pirc/src/pirparser.h \
        compilers/pirc/src/piryy.h \
        compilers/pirc/src/pirlexer.h \
        compilers/pirc/src/pirerr.h \
        compilers/pirc/src/pirop.h \
        compilers/pirc/src/pirpcc.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/bcgen.h \
        $(INC_DIR)/oplib/ops.h \
        $(INC_DIR)/embed.h

compilers/pirc/src/pirerr$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/src/pirerr.c \
        compilers/pirc/src/pircompiler.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pirdefines.h \
        compilers/pirc/src/pirparser.h \
        compilers/pirc/src/piryy.h \
        compilers/pirc/src/pirlexer.h \
        compilers/pirc/src/pirerr.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/bcgen.h \
        $(INC_DIR)/embed.h

compilers/pirc/src/bcgen$(O) :  \
  compilers/pirc/src/bcgen.c \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/bcgen.h \
  $(PARROT_H_HEADERS) \
  $(INC_DIR)/embed.h \
  include/pmc/pmc_sub.h \
  include/pmc/pmc_namespace.h

compilers/pirc/src/pirregalloc$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/src/pirregalloc.c \
        compilers/pirc/src/pircompiler.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pirdefines.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/bcgen.h \
        $(INC_DIR)/embed.h

compilers/pirc/heredoc/heredocmain$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/heredoc/heredocmain.c  \

compilers/pirc/macro/macrolexer$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/macro/macrolexer.c  \
        compilers/pirc/macro/macro.h  \
        compilers/pirc/macro/lexer.h  \
        compilers/pirc/macro/macroparser.h

compilers/pirc/macro/macroparser$(O) : $(PARROT_H_HEADERS) \
        compilers/pirc/macro/macroparser.c  \
        compilers/pirc/macro/macro.h  \
        compilers/pirc/macro/lexer.h  \
        compilers/pirc/macro/macroparser.h \
        compilers/pirc/macro/macrolexer.h

compilers/pirc/src/hdocprep$(O) : $(PARROT_H_HEADERS) \
        $(INC_DIR)/embed.h compilers/pirc/src/pirheredoc.h \
        compilers/pirc/src/hdocprep.c

compilers/pirc/src/main$(O) : \
        $(PARROT_H_HEADERS) \
        $(INC_DIR)/embed.h \
        compilers/pirc/src/main.c \
        compilers/pirc/src/bcgen.h \
        compilers/pirc/src/pirparser.h \
        compilers/pirc/src/pircompiler.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirdefines.h \
        compilers/pirc/src/piremit.h \
        compilers/pirc/src/piryy.h \
        compilers/pirc/src/pirlexer.h \
        compilers/pirc/src/pirheredoc.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pircapi.h

compilers/pirc/src/pircapi$(O) : \
        $(PARROT_H_HEADERS) \
        compilers/pirc/src/pircapi.c \
        compilers/pirc/src/bcgen.h \
        compilers/pirc/src/pircompiler.h \
        compilers/pirc/src/pirparser.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirdefines.h \
        compilers/pirc/src/piremit.h \
        compilers/pirc/src/piryy.h \
        compilers/pirc/src/pirlexer.h \
        compilers/pirc/src/pircapi.h \
        $(INC_DIR)/embed.h

compilers/pirc/src/pircompiler$(O) : \
        compilers/pirc/src/pircompiler.c \
        compilers/pirc/src/pircompiler.h \
        $(PARROT_H_HEADERS) \
        compilers/pirc/src/piryy.h \
        compilers/pirc/src/pirmacro.h \
        compilers/pirc/src/pirregalloc.h \
        compilers/pirc/src/pirerr.h \
        compilers/pirc/src/bcgen.h \
        compilers/pirc/src/pircompunit.h \
        compilers/pirc/src/pirsymbol.h \
        compilers/pirc/src/pirdefines.h \
        $(INC_DIR)/embed.h

compilers/pirc/src/pircompunit$(O) : $(PARROT_H_HEADERS) \
  compilers/pirc/src/pircompunit.c \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/piryy.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/pirpcc.h \
  compilers/pirc/src/pirerr.h \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/pirop.h \
  compilers/pirc/src/bcgen.h \
  $(INC_DIR)/oplib/ops.h \
  $(INC_DIR)/dynext.h \
  $(INC_DIR)/embed.h

compilers/pirc/src/pirlexer$(O) : $(PARROT_H_HEADERS) \
  compilers/pirc/src/pirlexer.c \
  compilers/pirc/src/pirparser.h \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/pirerr.h \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/piryy.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/bcgen.h \
  $(INC_DIR)/embed.h

compilers/pirc/src/pirmacro$(O) : $(PARROT_H_HEADERS) \
  compilers/pirc/src/pirmacro.c \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/bcgen.h \
  $(INC_DIR)/embed.h

compilers/pirc/src/pirop$(O) : $(PARROT_H_HEADERS) \
  compilers/pirc/src/pirop.c \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pirop.h \
  compilers/pirc/src/pirerr.h \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/piryy.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/bcgen.h \
  $(INC_DIR)/embed.h

compilers/pirc/src/pirpcc$(O) : $(PARROT_H_HEADERS) \
  compilers/pirc/src/pirpcc.c \
  compilers/pirc/src/pirpcc.h \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pirerr.h \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/piryy.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/bcgen.h \
  $(INC_DIR)/oplib/ops.h \
  $(INC_DIR)/embed.h

compilers/pirc/src/pirsymbol$(O) : $(PARROT_H_HEADERS) \
  compilers/pirc/src/pirsymbol.c \
  compilers/pirc/src/pircompiler.h \
  compilers/pirc/src/pirsymbol.h \
  compilers/pirc/src/piryy.h \
  compilers/pirc/src/pirerr.h \
  compilers/pirc/src/pircompunit.h \
  compilers/pirc/src/pirdefines.h \
  compilers/pirc/src/pirregalloc.h \
  compilers/pirc/src/pirmacro.h \
  compilers/pirc/src/bcgen.h \
  $(INC_DIR)/embed.h

# the all here is too broad, but the separate pirc.exe is going away soonish.
pirc$(EXE): $(PIRC_O_FILES) all
	$(LINK) $(LD_OUT) $@ \
	    $(PIRC_O_FILES) \
	    $(RPATH_BLIB) $(ALL_PARROT_LIBS) $(C_LIBS) $(LINKFLAGS) $(LINK_DYNAMIC)
#IF(win32):	if exist $@.manifest mt.exe -nologo -manifest $@.manifest -outputresource:$@;1

compilers/pirc/src/pir.y.flag compilers/pirc/src/pirparser.c compilers/pirc/src/pirparser.h : compilers/pirc/src/pir.y
	$(YACC) compilers/pirc/src/pir.y -d -o compilers/pirc/src/pirparser.c
	$(TOUCH) compilers/pirc/src/pir.y.flag compilers/pirc/src/pirparser.c compilers/pirc/src/pirparser.h

compilers/pirc/src/pir.l.flag compilers/pirc/src/pirlexer.c : compilers/pirc/src/pir.l
	$(LEX) -o compilers/pirc/src/pirlexer.c compilers/pirc/src/pir.l
	$(TOUCH) compilers/pirc/src/pir.l.flag compilers/pirc/src/pirlexer.c

# XXX This should eventually be combined with the standard parrot test suite.
pirc-test: all
	$(PERL) compilers/pirc/t/harness
