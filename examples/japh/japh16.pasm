# $Id$

# see 'examples/compilers/Makefile' for instructions to generate japhc.$(SO)

# a JapH compiler japhc.so compiles this program:
    set S6, "pJ pa pP pH pn e "
# into executable bytecode and runs it
    # load compiler
    loadlib P0, "japhc"
    # get compiler
    compreg P1, "JaPH_Compiler"
    # compile program
    compile P0, P1, S6
    # run program
    tailcall P0
