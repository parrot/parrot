NQP_LIB_PBCS = compilers/nqp/nqp.pbc

NQP_SOURCES = \
    compilers/nqp/nqp.pir \
    compilers/nqp/src/Grammar.pg \
    compilers/nqp/src/Grammar/Actions.pir \
    compilers/nqp/src/builtins.pir \
    compilers/nqp/src/Grammar_gen.pir

NQP_CLEANUPS = \
    compilers/nqp/nqp.pbc \
    compilers/nqp/src/Grammar_gen.pir \
    compilers/nqp/bootstrap/gen_actions.pir \
    compilers/nqp/bootstrap/nqp.pbc
