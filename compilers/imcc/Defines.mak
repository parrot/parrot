# these are private to the IMCC subsystem
IMCC_O_FILES = \
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
    compilers/imcc/pcc$(O) \
    compilers/imcc/api$(O)
