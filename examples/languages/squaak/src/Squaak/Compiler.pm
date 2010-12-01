#! nqp
# Copyright (C) 2010, Parrot Foundation.
class Squaak::Compiler is HLL::Compiler;

INIT {
    Squaak::Compiler.language('Squaak');
    Squaak::Compiler.parsegrammar(Squaak::Grammar);
    Squaak::Compiler.parseactions(Squaak::Actions);
    Squaak::Compiler.commandline_banner("Squaak for Parrot VM.\n");
    Squaak::Compiler.commandline_prompt('> ');
}
