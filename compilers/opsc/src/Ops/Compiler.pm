#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Ops::Compiler is HLL::Compiler;

INIT {
    Ops::Compiler.language('Ops');
    Ops::Compiler.parsegrammar(Ops::Compiler::Grammar);
    Ops::Compiler.parseactions(Ops::Compiler::Actions);
}

method set_oplib($oplib) {
    $Ops::Compiler::Actions::OPLIB := $oplib;
}

# vim: ft=perl6 expandtab shiftwidth=4:
