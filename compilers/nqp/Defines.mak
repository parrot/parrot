NQP_LIB_PBCS = compilers/nqp/nqp.pbc

NQP_SOURCES = \
    compilers/nqp/nqp.pir \
    compilers/nqp/src/Grammar.pg \
    compilers/nqp/src/Grammar/Actions.pir \
    compilers/nqp/src/builtins.pir \
    compilers/nqp/src/Grammar_gen.pir

NQP_CLEANUPS = \
    nqp.pbc \
    src/Grammar_gen.pir \
    bootstrap/gen_actions.pir \
    bootstrap/nqp.pbc
