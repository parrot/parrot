PIRC_O_FILES = \
    compilers/pirc/src/main$(O) \
    compilers/pirc/src/pirparser$(O) \
    compilers/pirc/src/pirlexer$(O) \
    compilers/pirc/src/pircompunit$(O) \
    compilers/pirc/src/pircompiler$(O) \
    compilers/pirc/src/pirsymbol$(O) \
    compilers/pirc/src/piremit$(O) \
    compilers/pirc/src/hdocprep$(O) \
    compilers/pirc/src/pirmacro$(O) \
    compilers/pirc/src/pirregalloc$(O) \
    compilers/pirc/src/bcgen$(O) \
    compilers/pirc/src/pirpcc$(O) \
    compilers/pirc/src/pirerr$(O) \
    compilers/pirc/src/pircapi$(O) \
    compilers/pirc/src/pirop$(O)

PIRC_CLEANUPS = $(PIRC_O_FILES) "compilers/pirc/t/*.pir" ./pirc$(EXE)
